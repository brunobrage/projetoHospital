<?php

    require('configDoctor.php');

    $doctorId = $_POST['doctorId'];
    $doctorName = $_POST['doctorName'];
    $doctorCpf = $_POST['doctorCpf'];
    $doctorEmail = $_POST['doctorEmail'];
    
    $insert = $conn->query("INSERT INTO doctor(doctorName, doctorCpf,
     doctorEmail) VALUES(
        '$doctorName',
        '$doctorCpf',
        '$doctorEmail',)");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
        ?>