<?php
    //datavase connection
    $connect = mysqli_connect("localhost", "root", "", "daisu_db");
    //check if username and password have values
    if(isset($_POST["username"]) && isset($_POST["password"])) {

        //--------------------------------------------------
        // check user had enter right username and password
        //--------------------------------------------------
        $username = mysqli_real_escape_string($connect, $_POST["username"]);

        //$password = password_hash(mysqli_real_escape_string($connect, $_POST["password"]),PASSWORD_DEFAULT);

        $password = $_POST["password"];

        //database query request
        $sql = "SELECT * FROM user WHERE username = '" . $username . "'";
       
        $result = mysqli_query($connect, $sql);

        $num_row = mysqli_num_rows($result);

        $user = array('username' => '', 'userId' => '', 'cartCount' => '0');

        if($num_row > 0) {
            $data = mysqli_fetch_array($result);

            $hash_pwd = $data['password'];
            $hash = password_verify($password, $hash_pwd);

            //check password is correct
            if($hash == 0) {
                // echo "Your password is incorrect!<br>";

            } else {
                $user['username'] = $data["username"];
                $user['userId'] = $data["userid"];

                //--------------------------------------------------
                // retreive the number of item in user shopping cart
                //--------------------------------------------------

                $sqlCount = "SELECT COUNT(itemid3) AS count FROM shoppingcart WHERE userid3 = '" . $data["userid"] . "'";
               
                $resultCount = mysqli_query($connect, $sqlCount);

                $count_num_row = mysqli_num_rows($resultCount);

                if($count_num_row > 0) {
                    $data = mysqli_fetch_array($resultCount);
                    $user['cartCount'] = $data['count'];
                }
            }
        }

        //return result of to create cookie
        echo json_encode($user, true);
    }
?>