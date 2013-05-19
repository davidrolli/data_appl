<?php

/**
 *  Here some test routes.
 */
Route::get('/', function()
{
  return("Your are on the root directory..");
});

Route::get('/lessons', function()
{
  $application = Applications::first();
//  DD($application->to_array());
  return json_encode($application->to_array());
   
});


/**
 *  Here come the productive routes.
 */
//Route::get('applications', 'applications@help');
//Route::get('applications/all', 'applications@all');
//Route::get('applications/first', 'applications@first');
//Route::get('applications/(:num)', 'applications@show');
//Route::get('applications/new', 'applications@create');

Route::get('applications', array('as' => 'index', 'uses' => 'applications@index'));
Route::get('applications/help', array('as' => 'help', 'uses' => 'applications@help'));
Route::get('applications/all', array('as' => 'all_apps', 'uses' => 'applications@all'));
Route::get('applications/first', array('as' => 'first_app', 'uses' => 'applications@first'));
Route::get('applications/(:num)', array('as' => 'show_app', 'uses' => 'applications@show'));
Route::get('applications/new', array('as' => 'new_app', 'uses' => 'applications@new'));
Route::get('applications/(:num)/edit', array('as' => 'edit_app', 'uses' => 'applications@edit'));

Route::get('applications/(:num)/data', array('as' => 'show_data_for_app', 'uses' => 'applications@rel'));

Route::post('applications', 'applications@create');
Route::put('applications/(:num)', 'applications@update');
Route::delete('applications/(:num)', 'applications@destroy');


//Route::controller(array('applications'));
Route::controller(Controller::detect());



/*
|--------------------------------------------------------------------------
| Application 404 & 500 Error Handlers
|--------------------------------------------------------------------------
|
| To centralize and simplify 404 handling, Laravel uses an awesome event
| system to retrieve the response. Feel free to modify this function to
| your tastes and the needs of your application.
|
| Similarly, we use an event to handle the display of 500 level errors
| within the application. These errors are fired when there is an
| uncaught exception thrown in the application. The exception object
| that is captured during execution is then passed to the 500 listener.
|
*/

Event::listen('404', function()
{
	return Response::error('404');
});

Event::listen('500', function($exception)
{
	return Response::error('500');
});

Event::listen('laravel.query', function($sql)
{
  var_dump($sql);
});



/*
|--------------------------------------------------------------------------
| Route Filters
|--------------------------------------------------------------------------
|
| Filters provide a convenient method for attaching functionality to your
| routes. The built-in before and after filters are called before and
| after every request to your application, and you may even create
| other filters that can be attached to individual routes.
|
| Let's walk through an example...
|
| First, define a filter:
|
|		Route::filter('filter', function()
|		{
|			return 'Filtered!';
|		});
|
| Next, attach the filter to a route:
|
|		Route::get('/', array('before' => 'filter', function()
|		{
|			return 'Hello World!';
|		}));
|
*/

Route::filter('before', function()
{
	// Do stuff before every request to your application...
});

Route::filter('after', function($response)
{
	// Do stuff after every request to your application...
});

Route::filter('csrf', function()
{
	if (Request::forged()) return Response::error('500');
});

Route::filter('auth', function()
{
	if (Auth::guest()) return Redirect::to('login');
});