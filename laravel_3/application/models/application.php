<?php

class Application extends Eloquent {

  public function datasources()
  {
    return $this->has_many_and_belongs_to('Datasource');   
  }

}
