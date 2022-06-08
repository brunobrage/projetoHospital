<?php

    require('configDoctor.php');

    $doctorId = $_POST['doctorId'];
    $doctorName = $_POST['doctorName'];
    $doctorCpf = $_POST['doctorCpf'];
    $doctorCrm = $_POST['doctorCrm'];
    
    $insert = $conn->query("INSERT INTO doctors(doctorName, doctorCpf,
     doctorCrm) VALUES(
        '$doctorName',
        '$doctorCpf',
        '$doctorCrm')");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
        ?>