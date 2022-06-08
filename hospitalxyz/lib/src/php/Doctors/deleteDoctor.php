<?php

    require('configDoctor.php');

    $doctorId = $_POST['doctorId'];

    $delete = $conn->query("DELETE FROM doctors WHERE doctorId =  '$doctorId'");
        if ($delete){
            echo "Success";
        }
        $conn->close();
        return;