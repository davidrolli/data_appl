<?php

class Applications_Controller extends Base_Controller {

  public $restful = true;
  
  public function get_index()
  {
    return View::make('home.index');
  }

  public function get_help()
  {
//    return "This is 'Hier werden Sie Hilfe erhalten...";
    return View::make('home.help');
  }


  public function get_all()
  {
    $all_application = Application::all();
    return Response::json($all_application);
  }


  public function get_first()
  {
    $application = Application::first();

//    return Response::json($application->to_array());
    return Response::json($application);
  }
  
  
  public function get_show($id)
  {
    $application = Application::find((int)$id);    
    return Response::json($application);
  }
  
  
  public function get_rel($id)
  {
    $dts = Application::with('datasources')->where('id' ,'=', (int)$id)->get();

//    $d = $dts[0]->to_array();
    $d = $dts[0]->to_array();
    
    return Response::json($d['datasources']);
  }
  
    
  public function get_new()
  {
    return '[get_new...';
  }
 
  
  public function get_edit()
  {
    return '[get_edit...';
  }


  public function post_create()
  {
    return '[post_create...';
  }


  public function put_update()
  {
    return '[put_update...';
  }


  public function delete_destroy()
  {
    return '[delete_destroy...';
  }

}