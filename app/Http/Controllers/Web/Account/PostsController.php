<?php
/**
 * LaraClassifier - Classified Ads Web Application
 * Copyright (c) BeDigit. All Rights Reserved
 *
 * Website: https://laraclassifier.com
 *
 * LICENSE
 * -------
 * This software is furnished under a license and may be used and copied
 * only in accordance with the terms of such license and with the inclusion
 * of the above copyright notice. If you Purchased from CodeCanyon,
 * Please read the full License from here - http://codecanyon.net/licenses/standard
 */

namespace App\Http\Controllers\Web\Account;

use App\Helpers\Date;
use App\Helpers\Search\PostQueries;
use App\Helpers\UrlGen;
use App\Http\Controllers\Web\Search\Traits\LocationTrait;
use App\Models\Package;
use App\Models\Post;
use App\Models\Category;
use App\Models\SavedSearch;
use App\Notifications\PostArchived;
use App\Notifications\PostRepublished;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Larapen\LaravelMetaTags\Facades\MetaTag;

class PostsController extends AccountBaseController
{
	use LocationTrait;
	
	private $perPage = 12;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->perPage = (is_numeric(config('settings.list.items_per_page'))) ? config('settings.list.items_per_page') : $this->perPage;
	}
	
	/**
	 * @param $pagePath
	 * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\View|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|void
	 */
	public function getPage($pagePath)
	{
		switch ($pagePath) {
			case 'my-posts':
				return $this->getMyPosts();
				break;
			case 'archived':
				return $this->getArchivedPosts($pagePath);
				break;
			case 'favourite':
				return $this->getFavouritePosts();
				break;
			case 'pending-approval':
				return $this->getPendingApprovalPosts();
				break;
			default:
				abort(404);
		}
	}
	
	/**
	 * @param $postId
	 * @return \Illuminate\Contracts\View\View|\Illuminate\Http\RedirectResponse
	 */
	public function getMyPosts($postId = null)
	{
		$pagePath = 'my-posts';
		
		// If "offline" button is clicked
		if (str_contains(url()->current(), $pagePath . '/' . $postId . '/offline')) {
			if (!is_numeric($postId) || $postId <= 0) {
				flash(t("The putting offline has failed"))->error();
				
				return back();
			}
			
			$post = Post::where('user_id', auth()->user()->id)->where('id', $postId)->first();
			if (empty($post)) {
				abort(404, t('post_not_found'));
			}
			
			if ($post->archived == 1) {
				flash(t("The listing is already offline"))->error();
				
				return back();
			}
			
			$post->archived = 1;
			$post->archived_at = Carbon::now(Date::getAppTimeZone());
			$post->archived_manually = 1;
			$post->save();
			
			if ($post->archived == 1) {
				$archivedPostsExpiration = config('settings.cron.manually_archived_listings_expiration', 180);
				
				$message = t('offline_putting_message', [
					'postTitle' => $post->title,
					'dateDel'   => Date::format($post->archived_at->addDays($archivedPostsExpiration)),
				]);
				
				flash($message)->success();
				
				// Send Confirmation Email or SMS
				if (config('settings.mail.confirmation') == 1) {
					try {
						$post->notify(new PostArchived($post, $archivedPostsExpiration));
					} catch (\Throwable $e) {
						flash($e->getMessage())->error();
					}
				}
			} else {
				flash(t("The putting offline has failed"))->error();
			}
			
			return back();
		}
		
		$data = [];
		$data['posts'] = $this->myPosts->paginate($this->perPage);
		
		// Meta Tags
		MetaTag::set('title', t('my_listings'));
		MetaTag::set('description', t('my_listings_on', ['appName' => config('settings.app.name')]));
		
		return appView('account.posts', $data);
	}
	
	/**
	 * @param $postId
	 * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\View|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
	 */
	public function getArchivedPosts($postId = null)
	{
		$pagePath = 'archived';
		
		// If "repost" button is clicked
		if (str_contains(url()->current(), $pagePath . '/' . $postId . '/repost')) {
			if (!is_numeric($postId) || $postId <= 0) {
				flash(t('the_repost_has_failed'))->error();
				
				return redirect('account/' . $pagePath);
			}
			
			$post = Post::where('user_id', auth()->user()->id)->where('id', $postId)->first();
			if (empty($post)) {
				abort(404, t('post_not_found'));
			}
			
			$postUrl = UrlGen::post($post);
			
			if ($post->archived == 0) {
				flash(t('The listing is already online'))->error();
				
				return redirect($postUrl);
			}
			
			$today = Carbon::now(Date::getAppTimeZone());
			
			$post->archived = 0;
			$post->archived_at = null;
			$post->deletion_mail_sent_at = null;
			$post->created_at = $today;
			if ($post->archived_manually != 1) {
				$post->archived_manually = 0;
			}
			
			// If the "Allow listings to be reviewed by Admins" option is activated,
			// and the listing is not linked to a valid payment,
			// and all activated packages have price > 0, then
			// - Un-approve (un-reviewed) the listing (using the "reviewed" column)
			// - Update the "updated_at" date column  to now
			if (config('settings.single.listings_review_activation')) {
				$paymentExists = false;
				if (
					isset($post->latestPayment)
					&& isset($post->latestPayment->package)
					&& !empty($post->latestPayment->package)
				) {
					$paymentExists = (
						$today->diffInDays($post->latestPayment->created_at) >= (int)$post->latestPayment->package->duration
					);
				}
				if (!$paymentExists) {
					$packagesForFree = Package::query()->where('price', 0);
					if ($packagesForFree->count() <= 0) {
						$post->reviewed = 0;
					}
				}
			}
			
			// Save the listing
			$post->save();
			
			if ($post->archived == 0) {
				flash(t('the_repost_has_done_successfully'))->success();
				
				// Send Confirmation Email or SMS
				if (config('settings.mail.confirmation') == 1) {
					try {
						$post->notify(new PostRepublished($post));
					} catch (\Throwable $e) {
						flash($e->getMessage())->error();
					}
				}
			} else {
				flash(t('the_repost_has_failed'))->error();
			}
			
			return redirect($postUrl);
		}
		
		$data = [];
		$data['posts'] = $this->archivedPosts->paginate($this->perPage);
		
		// Meta Tags
		MetaTag::set('title', t('my_archived_listings'));
		MetaTag::set('description', t('my_archived_listings_on', ['appName' => config('settings.app.name')]));
		
		return appView('account.posts', $data);
	}
	
	/**
	 * @return \Illuminate\Contracts\View\View
	 */
	public function getFavouritePosts()
	{
		$data = [];
		$data['posts'] = $this->favouritePosts->paginate($this->perPage);
		
		// Meta Tags
		MetaTag::set('title', t('my_favourite_listings'));
		MetaTag::set('description', t('my_favourite_listings_on', ['appName' => config('settings.app.name')]));
		
		return appView('account.posts', $data);
	}
	
	/**
	 * @return \Illuminate\Contracts\View\View
	 */
	public function getPendingApprovalPosts()
	{
		$data = [];
		$data['posts'] = $this->pendingPosts->paginate($this->perPage);
		
		// Meta Tags
		MetaTag::set('title', t('my_pending_approval_listings'));
		MetaTag::set('description', t('my_pending_approval_listings_on', ['appName' => config('settings.app.name')]));
		
		return appView('account.posts', $data);
	}
	
	/**
	 * @param \Illuminate\Http\Request $request
	 * @return \Illuminate\Contracts\View\View
	 * @throws \Exception
	 */
	public function getSavedSearch(Request $request)
	{
		$data = [];
		
		// Get QueryString
		$tmp = parse_url(url(request()->getRequestUri()));
		$queryString = ($tmp['query'] ?? 'false');
		$queryString = preg_replace('|\&pag[^=]*=[0-9]*|i', '', $queryString);
		
		// CATEGORIES COLLECTION
		$cats = Category::orderBy('lft')->get();
		$cats = collect($cats)->keyBy('id');
		view()->share('cats', $cats);
		
		// Search
		$savedSearch = SavedSearch::currentCountry()
			->where('user_id', auth()->user()->id)
			->orderBy('created_at', 'DESC')
			->simplePaginate($this->perPage, ['*'], 'pag');
		
		if (collect($savedSearch->getCollection())
			->keyBy('query')
			->keys()
			->contains(function ($value, $key) use ($queryString) {
				$qs1 = preg_replace('/(\s|%20)/ui', '+', $queryString);
				$qs2 = preg_replace('/(\s|\+)/ui', '%20', $queryString);
				$qs3 = preg_replace('/(\+|%20)/ui', ' ', $queryString);
				
				return ($value == $qs1 || $value == $qs2 || $value == $qs3);
			})) {
			
			parse_str($queryString, $queryArray);
			
			// QueryString vars
			$cityId = $queryArray['l'] ?? null;
			$location = $queryArray['location'] ?? null;
			$adminName = (isset($queryArray['r']) && !isset($queryArray['l'])) ? $queryArray['r'] : null;
			
			// Search
			if ($savedSearch->getCollection()->count() > 0) {
				// Pre-Search
				$preSearch = [
					'city'  => $this->getCity($cityId, $location),
					'admin' => $this->getAdmin($adminName),
				];
				
				// Search
				$data = (new PostQueries($preSearch))->fetch();
			}
		}
		$data['savedSearch'] = $savedSearch;
		
		// Meta Tags
		MetaTag::set('title', t('my_saved_search'));
		MetaTag::set('description', t('my_saved_search_on', ['appName' => config('settings.app.name')]));
		
		return appView('account.saved-search', $data);
	}
	
	/**
	 * @param $pagePath
	 * @param $id
	 * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
	 * @throws \Psr\Container\ContainerExceptionInterface
	 * @throws \Psr\Container\NotFoundExceptionInterface
	 */
	public function destroy($pagePath, $id = null)
	{
		// Get Entries ID
		$ids = [];
		if (request()->filled('entries')) {
			$ids = request()->input('entries');
		} else {
			if ((is_numeric($id) && $id > 0) || (is_string($id) && !empty($id))) {
				$ids[] = $id;
			}
		}
		$ids = implode(',', $ids);
		
		// Get API endpoint
		if ($pagePath == 'favourite') {
			$endpoint = '/savedPosts/' . $ids;
		} else if ($pagePath == 'saved-search') {
			$endpoint = '/savedSearches/' . $ids;
		} else {
			$endpoint = '/posts/' . $ids;
		}
		
		// Call API endpoint
		$data = makeApiRequest('delete', $endpoint, request()->all());
		
		// Parsing the API response
		$message = !empty(data_get($data, 'message')) ? data_get($data, 'message') : 'Unknown Error.';
		
		// HTTP Error Found
		if (!data_get($data, 'isSuccessful')) {
			return back()->withErrors(['error' => $message])->withInput();
		}
		
		// Notification Message
		if (data_get($data, 'success')) {
			flash($message)->success();
		} else {
			flash($message)->error();
		}
		
		return redirect('account/' . $pagePath);
	}
}
