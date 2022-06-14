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

namespace App\Http\Controllers\Api\Post;

use App\Helpers\Search\PostQueries;
use App\Http\Controllers\Api\Post\Search\CategoryTrait;
use App\Http\Controllers\Api\Post\Search\LocationTrait;
use App\Http\Resources\EntityCollection;
use App\Models\CategoryField;
use App\Models\Post;
use Larapen\LaravelDistance\Libraries\mysql\DistanceHelper;

trait SearchTrait
{
	use CategoryTrait, LocationTrait;
	
	/**
	 * @return \Illuminate\Http\JsonResponse
	 * @throws \Psr\Container\ContainerExceptionInterface
	 * @throws \Psr\Container\NotFoundExceptionInterface
	 */
	public function getPosts()
	{
		// Create the MySQL Distance Calculation function, If doesn't exist
		if (!DistanceHelper::checkIfDistanceCalculationFunctionExists(config('settings.list.distance_calculation_formula'))) {
			DistanceHelper::createDistanceCalculationFunction(config('settings.list.distance_calculation_formula'));
		}
		
		$preSearch = [];
		$fields = collect();
		
		$options = ['search', 'sponsored', 'latest'];
		if (in_array(request()->get('op'), $options)) {
			if (request()->get('op') == 'search') {
				$searchData = $this->searchPosts($preSearch, $fields);
				$posts = $searchData['posts'];
				$count = $searchData['count'];
			} else if (request()->get('op') == 'sponsored') {
				$posts = $this->sponsoredPosts();
			} else if (request()->get('op') == 'latest') {
				$posts = $this->latestPosts();
			}
		}
		
		if (!isset($posts)) {
			$posts = $this->normalQuery();
		}
		
		$resourceCollection = new EntityCollection(class_basename($this), $posts);
		$resourceCollection = $this->respondWithCollection($resourceCollection);
		
		$data = json_decode($resourceCollection->content(), true);
		$data['extra'] = [
			'count'     => $count ?? null,
			'preSearch' => $preSearch,
			'fields'    => $fields,
		];
		
		return $this->apiResponse($data);
	}
	
	/**
	 * @return \Illuminate\Contracts\Pagination\LengthAwarePaginator
	 * @throws \Psr\Container\ContainerExceptionInterface
	 * @throws \Psr\Container\NotFoundExceptionInterface
	 */
	protected function normalQuery()
	{
		$countryCode = request()->get('country_code', config('country.code'));
		
		$posts = Post::countryOf($countryCode);
		
		if (request()->get('logged') == true) {
			if (auth('sanctum')->check()) {
				$user = auth('sanctum')->user();
				
				$posts->where('user_id', $user->id);
				
				if (request()->get('pending') == true) {
					$posts->unverified();
				} else if (request()->get('archived') == true) {
					$posts->archived();
				} else {
					$posts->verified()->unarchived()->reviewed();
				}
			} else {
				abort(401);
			}
		}
		
		$embed = explode(',', request()->get('embed'));
		
		if (in_array('country', $embed)) {
			$posts->with('country');
		}
		if (in_array('user', $embed)) {
			$posts->with('user');
		}
		if (in_array('category', $embed)) {
			$posts->with('category');
		}
		if (in_array('postType', $embed)) {
			$posts->with('postType');
		}
		if (in_array('city', $embed)) {
			$posts->with('city');
		}
		if (in_array('pictures', $embed)) {
			$posts->with('pictures');
		}
		if (in_array('latestPayment', $embed)) {
			if (in_array('package', $embed)) {
				$posts->with(['latestPayment' => function ($builder) { $builder->with(['package']); }]);
			} else {
				$posts->with('latestPayment');
			}
		}
		
		// Sorting
		$posts = $this->applySorting($posts, ['created_at']);
		
		return $posts->paginate($this->perPage);
	}
	
	/**
	 * @param $preSearch
	 * @param $fields
	 * @return array
	 * @throws \Psr\Container\ContainerExceptionInterface
	 * @throws \Psr\Container\NotFoundExceptionInterface
	 */
	protected function searchPosts(&$preSearch, &$fields)
	{
		$embed = ['user', 'category', 'postType', 'city', 'latestPayment', 'savedByLoggedUser', 'pictures'];
		request()->request->add(['embed' => implode(',', $embed)]);
		
		// Get Category
		$cat = $this->getCategory();
		if (!empty($cat)) {
			$fields = CategoryField::getFields($cat->id);
		}
		
		// Get Location (City or Administrative Division)
		$location = $this->getLocation();
		
		// PreSearch Array
		$preSearch = $location;
		$preSearch['cat'] = $cat;
		
		// Search
		return (new PostQueries($preSearch))->fetch();
	}
	
	/**
	 * @return \Illuminate\Contracts\Pagination\LengthAwarePaginator
	 * @throws \Psr\Container\ContainerExceptionInterface
	 * @throws \Psr\Container\NotFoundExceptionInterface
	 */
	protected function sponsoredPosts()
	{
		$maxItems = request()->get('maxItems', 20);
		$orderBy = request()->get('orderBy', 'random');
		if ($orderBy == 'created_at') {
			$orderBy = 'date';
		}
		
		if (!is_numeric($maxItems) || (int)$maxItems <= 0) {
			$maxItems = 20;
		}
		if (!in_array($orderBy, ['date', 'random'])) {
			$orderBy = 'random';
		}
		
		return Post::getLatestOrSponsored($maxItems, 'sponsored', $orderBy);
	}
	
	/**
	 * @return \Illuminate\Contracts\Pagination\LengthAwarePaginator
	 * @throws \Psr\Container\ContainerExceptionInterface
	 * @throws \Psr\Container\NotFoundExceptionInterface
	 */
	protected function latestPosts()
	{
		$maxItems = request()->get('maxItems', 20);
		$orderBy = request()->get('orderBy', 'random');
		if ($orderBy == 'created_at') {
			$orderBy = 'date';
		}
		
		if (!is_numeric($maxItems) || (int)$maxItems <= 0) {
			$maxItems = 20;
		}
		if (!in_array($orderBy, ['date', 'random'])) {
			$orderBy = 'random';
		}
		
		return Post::getLatestOrSponsored($maxItems, 'latest', $orderBy);
	}
}
