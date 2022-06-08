<?php

    require('configSurgery.php');

    $surgeryId = $_POST['surgeryId'];
    $surgeryName = $_POST['surgeryName'];
    $doctorName = $_POST['doctorName'];
    $patientName = $_POST['patientName'];
    
    $insert = $conn->query("INSERT INTO surgery(surgeryName, doctorName,
     patientName) VALUES(
        '$surgeryName',
        '$doctorName',
        '$patientName',)");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
        ?>