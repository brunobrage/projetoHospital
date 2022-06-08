<?php

    require('configSurgery.php');

    $surgeryId = $_POST['surgeryId'];

    $delete = $conn->query("DELETE FROM surgery WHERE surgeryId =  '$surgeryId'");
        if ($delete){
            echo "Success";
        }
        $conn->close();
        return;