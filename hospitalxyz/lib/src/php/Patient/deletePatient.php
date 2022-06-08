<?php

    require('configPatient.php');

    $patientId = $_POST['patientId'];

    $delete = $conn->query("DELETE FROM patient WHERE patientId =  '$patientId'");
        if ($delete){
            echo "Success";
        }
        $conn->close();
        return;