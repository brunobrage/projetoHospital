<?php

    require('configStudent.php');

    $result = $conn->query("SELECT * FROM student ORDER BY studentName");
    $data = array();
    while ( $row = $result -> fetch_assoc()){
        $data[] = $row;
    }
    echo json_encode($data);
    $conn -> close();
    return;
    ?>