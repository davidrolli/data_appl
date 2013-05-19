<?php

  // Set default timezone
  date_default_timezone_set('Europe/Zurich');
   
  try {
    // Create (connect to) SQLite database in file
    //D:\wwwroot\barprol\work\data_appl\database
//    $conn = new PDO('/barprol/work/data_appl/database/data_appl.sqlite3');
//    $conn = new PDO('D:\wwwroot\barprol\work\data_appl\database\data_appl.sqlite3');
    $conn = new PDO('sqlite:D:\wwwroot\barprol\work\data_appl\database\data_appl.sqlite3');
    var_dump($conn);
  
    // Set errormode to exceptions
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    var_dump($conn);

    $result = $conn->query('SELECT id, bezeichnung_kurz FROM applications');
    
    var_dump($result);
    
    foreach ($result as $m) {
      print $m['id'] . "\t";
      print $m['bezeichnung_kurz'] . "\t";
    }
    
    // Close file db connection
    $conn = null;    
  }
  catch(PDOException $e)
  {
    echo $e->getMessage();
  }    
   
?>