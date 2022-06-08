<?php

    require('configPatient.php');

    $patientId = $_POST['patientId'];
    $patientName = $_POST['patientName'];
    $patientCpf = $_POST['patientCpf'];
    $patientEmail = $_POST['patientEmail'];
    
    $insert = $conn->query("INSERT INTO patient(patientName, patientCpf,
     patientEmail) VALUES(
        '$patientName',
        '$patientCpf',
        '$patientEmail',)");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
        ?>