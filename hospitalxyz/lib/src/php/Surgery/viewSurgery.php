<?php

    require('configSurgery.php');

    $result = $conn->query("SELECT * FROM surgery ORDER BY surgeryName");
    $data = array();
    while ( $row = $result -> fetch_assoc()){
        $data[] = $row;
    }
    echo json_encode($data);
    $conn -> close();
    return;
    ?>