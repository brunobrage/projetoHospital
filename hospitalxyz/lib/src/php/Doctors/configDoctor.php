<?php

    $severname = "localhost";
    $username = "root";
    $password = "";
    $dbname ="hospital";

    $conn = new mysqli($severname, $username, $password, $dbname);

    if($conn->connect_error){
        die("Conection Failed: " . $conn->connect_error);
        return;
    }
    ?>