<?php

  require('configDoctor.php');

  $doctorId = $_POST['doctorId'];
  $doctorName = $_POST['doctorName'];
  $doctorCpf = $_POST['doctorCpf'];
  $doctorCrm = $_POST['doctorCrm'];

    //do something
    $insert = $conn->query("UPDATE doctors SET 
    doctorName ='$doctorName', 
    doctorCpf ='$doctorCpf', 
    doctorCrm ='$doctorCrm' WHERE doctorId =  '$doctorId'
      ");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
 ?>