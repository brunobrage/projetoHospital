<?php

    require('configPatient.php');

    $result = $conn->query("SELECT * FROM patient ORDER BY patientName");
    $data = array();
    while ( $row = $result -> fetch_assoc()){
        $data[] = $row;
    }
    echo json_encode($data);
    $conn -> close();
    return;
    ?>