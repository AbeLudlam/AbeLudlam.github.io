<?php

	 //datavase connection
   $connect = mysqli_connect("localhost", "root", "", "daisu_db")
    or die ("Could not connect to server ... \n" . mysqli_error());


    //move items from shopping cart to transactionhas
    function purchaseItems($userId, $datetimecreate) {
        global $connect;

        $sql = "INSERT INTO `transactionhas` (transactionid, datetimecreate, userid, itemid, quantity)
                SELECT  null, '" . $datetimecreate . "', userid3, itemid3, quantity
                FROM `shoppingcart` 
                WHERE userid3 = '" . $userId . "'";

        $insertResult = mysqli_query($connect, $sql);

        $result = false;

        if(mysqli_affected_rows($connect) > 0) {
            $result = true;
        }

        return $result;
    }

    //clear the shopping cart of all items for a user
    function clearCart($userId) {
        global $connect;

        $sql = "DELETE FROM `shoppingcart` 
                WHERE userid3 = '" . $userId . "'";

        //execute sql query
        mysqli_query($connect, $sql);

        $result = false;

        if(mysqli_affected_rows($connect) > 0) {
            $result = true;
        }

        return $result;
    }

    //make a transaction record
    function makeTransaction($userId, $firstName, $lastName, $address, $state, $city, $zipCode, $phone, 
        $shippingMethod, $cardType, $cardNumber, $CVC, $cardMonth, $cardYear, $price) {
        global $connect;

        $timestamp = date('Y-m-d G:i:s');

        $sql = "INSERT INTO `transactionhistory`(datetimecreate, userid, firstName, lastName, address, state, city, zipCode, phone, shippingMethod, cardType, cardNumber, CVC, cardMonth, cardYear, price)  
                VALUES ('" . $timestamp . "', '" . $userId . "', '" . $firstName . "', '" . $lastName . "', '" . $address . "', '" . $state . "', '" . $city . "', '" . $zipCode . "', '" . $phone .
                "', '" . $shippingMethod . "', '" . $cardType . "', '" . $cardNumber . "', '" . $CVC . "', '" . $cardMonth . "', '" . $cardYear . "', '" . $price ."')";

        //execute sql query
        mysqli_query($connect, $sql);

        $result = array('result' => false,
                        'timestamp' => $timestamp);

        if(mysqli_affected_rows($connect) > 0) {
            $result['result'] = true;
        }
    
        return $result;
    }

    if(isset($_POST["userId"]) && isset($_POST["firstName"]) && isset($_POST["lastName"]) && isset($_POST["address"]) && isset($_POST["state"])
        && isset($_POST["city"]) && isset($_POST["zipCode"]) && isset($_POST["phone"]) && isset($_POST["shippingMethod"]) && isset($_POST["cardType"]) && isset($_POST["cardNumber"]) 
        && isset($_POST["CVC"]) && isset($_POST["cardMonth"]) && isset($_POST["cardYear"]) && isset($_POST["price"])) {

        $userId = mysqli_real_escape_string($connect, $_POST["userId"]);
        $firstName = mysqli_real_escape_string($connect, $_POST["firstName"]);
        $lastName = mysqli_real_escape_string($connect, $_POST["lastName"]);
        $address = mysqli_real_escape_string($connect, $_POST["address"]);
        $state = mysqli_real_escape_string($connect, $_POST["state"]);
        $city = mysqli_real_escape_string($connect, $_POST["city"]);
        $zipCode = mysqli_real_escape_string($connect, $_POST["zipCode"]);
        $phone = mysqli_real_escape_string($connect, $_POST["phone"]);
        $shippingMethod = mysqli_real_escape_string($connect, $_POST["shippingMethod"]);
        $cardType = mysqli_real_escape_string($connect, $_POST["cardType"]);
        $cardNumber = mysqli_real_escape_string($connect, $_POST["cardNumber"]);
        $CVC = mysqli_real_escape_string($connect, $_POST["CVC"]);
        $cardMonth = mysqli_real_escape_string($connect, $_POST["cardMonth"]);
        $cardYear = mysqli_real_escape_string($connect, $_POST["cardYear"]);
        $price = mysqli_real_escape_string($connect, $_POST["price"]);

        $resultone = makeTransaction($userId, $firstName, $lastName, $address, $state, $city, $zipCode, $phone, 
                        $shippingMethod, $cardType, $cardNumber, $CVC, $cardMonth, $cardYear, $price);

        $result = array('transaction' => 'fail', 'transactionItems' => 'fail', 'removeCart' => 'fail');

        if($resultone['result']) {
            $result['transaction'] = 'success';
        } 

        $resulttwo = purchaseItems($userId, $resultone['timestamp']);

        if($resulttwo) {
            $result['transactionItems'] = 'success';
        }

        $resultthree = clearCart($userId); 
        
        if($resultthree) {
            $result['removeCart'] = 'success';
        }  
        
        //send back list of insert or update items
        echo json_encode($result);
        
    }
?>