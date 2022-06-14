<?php
/*
 * LaraClassifier - Classified Ads Web Application
 * Copyright (c) BeDigit. All Rights Reserved
 *
 *  Website: https://laraclassifier.com
 *
 * LICENSE
 * -------
 * This software is furnished under a license and may be used and copied
 * only in accordance with the terms of such license and with the inclusion
 * of the above copyright notice. If you Purchased from CodeCanyon,
 * Please read the full License from here - http://codecanyon.net/licenses/standard
 */

namespace App\Http\Middleware\InputRequest;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

trait ApiCalls
{
	/**
	 * Apply Global Inputs to the API Calls
	 *
	 * @param \Illuminate\Http\Request $request
	 * @return \Illuminate\Http\Request
	 */
	protected function addApiCallsInputs(Request $request): Request
	{
		// Exception for Install & Upgrade Routes
		if (
			str_contains(Route::currentRouteAction(), 'InstallController')
			|| str_contains(Route::currentRouteAction(), 'UpgradeController')
		) {
			return $request;
		}
		
		// Some Exceptions
		if (
			str_contains(Route::currentRouteAction(), 'Admin\LanguageController@syncFilesLines')
			|| str_contains(Route::currentRouteAction(), 'Admin\LanguageController@updateTexts')
		) {
			return $request;
		}
		
		if (strtoupper($request->method()) == 'GET') {
			return $request;
		}
		
		$countryCode = $request->filled('country_code') ? $request->input('country_code') : config('country.code');
		$languageCode = $request->filled('language_code') ? $request->input('language_code') : config('app.locale');
		
		$newInputs = [];
		
		if (!empty($countryCode)) {
			$newInputs['country_code'] = $countryCode;
		}
		if (!empty($languageCode)) {
			$newInputs['language_code'] = $languageCode;
		}
		
		// Replace the fields values
		if (!empty($newInputs)) {
			$request->merge($newInputs);
			request()->merge($newInputs);
		}
		
		return $request;
	}
}
