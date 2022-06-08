<?php

    require('configStudent.php');

    $studentId = $_POST['studentId'];
    $studentName = $_POST['studentName'];
    $studentCpf = $_POST['studentCpf'];
    $studentEmail = $_POST['studentEmail'];
    
    $insert = $conn->query("INSERT INTO student(studentName, studentCpf,
     studentEmail) VALUES(
        '$studentName',
        '$studentCpf',
        '$studentEmail',)");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
        ?>