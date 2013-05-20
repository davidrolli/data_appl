<?php

class Datasource extends Eloquent {
  
  public function applications()
  {
    return $this->has_many_and_belongs_to('Application');
//    return $this->has_many_and_belongs_to('Application', 'rel_datasources_applications', 'id_applications', 'id_datasources');    
  }
  
}
