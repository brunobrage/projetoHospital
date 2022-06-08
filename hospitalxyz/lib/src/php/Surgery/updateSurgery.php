<?php

  require('configSurgery.php');

  $surgeryId = $_POST['surgeryId'];
  $surgeryName = $_POST['surgeryName'];
  $doctorName = $_POST['doctorName'];
  $patientName = $_POST['patientName'];

    //do something
    $insert = $conn->query("UPDATE surgery SET 
    surgeryName ='$surgeryName', 
    doctorName ='$doctorName', 
    patientName ='$patientName' WHERE surgeryId =  '$surgeryId'
      ");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
 ?>