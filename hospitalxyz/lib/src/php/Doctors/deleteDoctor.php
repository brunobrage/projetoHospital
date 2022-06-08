<?php

    require('configDoctor.php');

    $doctorId = $_POST['doctorId'];

    $delete = $conn->query("DELETE FROM doctor WHERE doctorId =  '$doctorId'");
        if ($delete){
            echo "Success";
        }
        $conn->close();
        return;