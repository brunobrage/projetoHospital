<?php

    require('configStudent.php');

    $studentId = $_POST['studentId'];

    $delete = $conn->query("DELETE FROM student WHERE studentId =  '$studentId'");
        if ($delete){
            echo "Success";
        }
        $conn->close();
        return;