<?php

  require('configStudent.php');

  $studentId = $_POST['studentId'];
  $studentName = $_POST['studentName'];
  $studentCpf = $_POST['studentCpf'];
  $studentEmail = $_POST['studentEmail'];

    //do something
    $insert = $conn->query("UPDATE student SET 
    studentName ='$studentName', 
    studentCpf ='$studentCpf', 
    studentEmail ='$studentEmail' WHERE studentId =  '$studentId'
      ");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
 ?>