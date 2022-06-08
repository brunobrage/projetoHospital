<?php

    require('configDoctor.php');

    $result = $conn->query("SELECT * FROM doctors ORDER BY doctorName");
    $data = array();
    while ( $row = $result -> fetch_assoc()){
        $data[] = $row;
    }
    echo json_encode($data);
    $conn -> close();
    return;
    ?>