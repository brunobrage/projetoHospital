<?php

  require('configDoctor.php');

  $doctorId = $_POST['doctorId'];
  $doctorName = $_POST['doctorName'];
  $doctorCpf = $_POST['doctorCpf'];
  $doctorEmail = $_POST['doctorEmail'];

    //do something
    $insert = $conn->query("UPDATE doctor SET 
    doctorName ='$doctorName', 
    doctorCpf ='$doctorCpf', 
    doctorEmail ='$doctorEmail' WHERE doctorId =  '$doctorId'
      ");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
 ?>