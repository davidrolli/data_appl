Route::get('s', array('as' => 's', 'uses' => 's@index'));
Route::get('s/(:any)', array('as' => '', 'uses' => 's@show'));
Route::get('s/new', array('as' => 'new_', 'uses' => 's@new'));
Route::get('s/(:any)edit', array('as' => 'edit_', 'uses' => 's@edit'));
Route::post('s', 's@create');
Route::put('s/(:any)', 's@update');
Route::delete('s/(:any)', 's@destroy');
