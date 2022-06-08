<?php

  require('configPatient.php');

  $patientId = $_POST['patientId'];
  $patientName = $_POST['patientName'];
  $patientCpf = $_POST['patientCpf'];
  $patientEmail = $_POST['patientEmail'];

    //do something
    $insert = $conn->query("UPDATE patient SET 
    patientName ='$patientName', 
    patientCpf ='$patientCpf', 
    patientEmail ='$patientEmail' WHERE patientId =  '$patientId'
      ");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
 ?>