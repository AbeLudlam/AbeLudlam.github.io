<?php
    //datavase connection
    $connect = mysqli_connect("localhost", "root", "", "daisu_db");
    //check if username and password have values
    if(isset($_POST["firstName"]) && isset($_POST["lastName"]) && isset($_POST["username"]) && isset($_POST["email"]) && isset($_POST["password"])) {
        $firstName = mysqli_real_escape_string($connect, $_POST["firstName"]);
        $middleName = mysqli_real_escape_string($connect, $_POST["middleName"]);
        $lastName = mysqli_real_escape_string($connect, $_POST["lastName"]);
        $username = mysqli_real_escape_string($connect, $_POST["username"]);
        $email = mysqli_real_escape_string($connect, $_POST["email"]);
        $password = mysqli_real_escape_string($connect, $_POST["password"]);

        $sqlCheckUsername = $sql = "SELECT * FROM user WHERE username = '" . $username . "'";

        $result = mysqli_query($connect, $sql);

        $num_row = mysqli_num_rows($result);

        if($num_row === 0) {
            $encrypted_pass = password_hash($password, PASSWORD_DEFAULT);

            //database query request
            $sql = "INSERT INTO `user` (`userID`, `firstName`, `middleName`, `lastName`, `username`, `email`, `password`) VALUES (NULL,
                        '" . $firstName . "',
                        '" . $middleName . "',
                        '" . $lastName . "', 
                        '" . $username . "', 
                        '" . $email . "', 
                        '" . $encrypted_pass . "')";
                        
            if(mysqli_query($connect, $sql)) {
                echo "success";
            } else {
                echo "can't insert account";
            }
        } else {
            echo "failure";
        }
    }
?>