<?php

class Datasources_Controller extends Base_Controller {

  public $restful = true;
  
	public function get_index()
	{
    return Response::json($all_application);    
	}

}