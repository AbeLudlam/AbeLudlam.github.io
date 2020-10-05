<?php

    //datavase connection
    $connect = mysqli_connect("localhost", "root", "", "daisu_db")
    or die ("Could not connect to server ... \n" . mysqli_error());

    //check if user already have item
    function check($userId, $itemId) {
        global $connect;

        $sql = "SELECT * 
                FROM `shoppingcart` 
                WHERE userid3 = '" . $userId . "' AND itemid3 = '" . $itemId ."'";

        $result = mysqli_query($connect, $sql);

        $num_row = mysqli_num_rows($result);
        
        $returnResult = array('find' => false, 'quantity' => 0);

        //item exit in user cart
        if($num_row > 0) {
            $data = mysqli_fetch_array($result);
            $returnResult = array('find' => true, 'quantity' => $data['quantity']);
        }

        return $returnResult;
    }

    function getItemById($items) {
        global $connect;

        $itemArray = [];
        $itemQuantity = [];

        for ($i = 0; $i< count($items); $i++) {
            array_push($itemArray, $items[$i]['itemId']);
            array_push($itemQuantity, $items[$i]['quantity']);
        }

        $itemIds = implode(",", $itemArray);

        $sql = "SELECT * FROM `item` WHERE `itemid` IN (" . $itemIds . ")";

        $result = mysqli_query($connect, $sql);

        $num_row = mysqli_num_rows($result);

        $shoppingCartItems = array(
                            'numberOfItems' => $num_row, 
                            'items' => '');

        $items = [];

        if($num_row > 0) {
            $index = 0;
            //loop for each item in user cart 
            while($data = mysqli_fetch_array($result)) {

                $arr = array( 'itemId' => $data["itemid"],
                            'title' => $data["productname"],
                            'brand' => $data["brand"],
                            'price' => $data["price"],
                            'color' => $data["color"],
                            'url' => $data["picturelink"],
                            'quantity' => $itemQuantity[$index]);
                $arr = array_map('utf8_encode', $arr);

                array_push($items, $arr);

                $index++;
            }
        }

        //add items to cart items
        $shoppingCartItems['items'] = $items;

        //return search result
        echo json_encode($shoppingCartItems);
    }

    //get the items list from user
    function get($userId) {
        global $connect;

        /***************************************************
        * get cart items
        ***************************************************/

        $sql = "SELECT * 
                FROM `shoppingcart` cart 
                LEFT JOIN `item` item 
                ON cart.itemid3=item.itemid 
                WHERE userid3 = '" . $userId . "'";

        $result = mysqli_query($connect, $sql);

        $num_row = mysqli_num_rows($result);

        $shoppingCartItems = array( 'userId' => $userId,
                            'numberOfItems' => $num_row, 
                            'items' => '',
                            'numberOfSaveItems' => '',
                            'saveItems' => '');

        $items = [];

        if($num_row > 0) {
            //loop for each item in user cart 
            while($data = mysqli_fetch_array($result)) {

                $arr = array( 'itemId' => $data["itemid3"],
                            'title' => $data["productname"],
                            'brand' => $data["brand"],
                            'price' => $data["price"],
                            'color' => $data["color"],
                            'url' => $data["picturelink"],
                            'quantity' => $data["quantity"]);
                $arr = array_map('utf8_encode', $arr);

                array_push($items, $arr);
            }
        }

        //add items to cart items
        $shoppingCartItems['items'] = $items;

        /***************************************************
        * get save later list
        ***************************************************/
        $sqlSaveLater = "SELECT * 
                FROM `saveforlater` save 
                LEFT JOIN `item` item 
                ON save.itemid=item.itemid 
                WHERE userid = '" . $userId . "'";

        $resultSaveLater = mysqli_query($connect, $sqlSaveLater);

        $numRowSaveLater = mysqli_num_rows($resultSaveLater);

        $shoppingCartItems['numberOfSaveItems'] = $numRowSaveLater;

        $saveItems = [];

        if($numRowSaveLater > 0) {
            //loop for each item in user cart 
            while($data = mysqli_fetch_array($resultSaveLater)) {

                $arr = array( 'itemId' => $data["itemid"],
                            'title' => $data["productname"],
                            'brand' => $data["brand"],
                            'price' => $data["price"],
                            'color' => $data["color"],
                            'url' => $data["picturelink"]);
                $arr = array_map('utf8_encode', $arr);

                array_push($saveItems, $arr);
            }
        }
        
        //add items to cart items
        $shoppingCartItems['saveItems'] = $saveItems;

        //return search result
        echo json_encode($shoppingCartItems);
    }

    //delete one already exit item
    function delete($userId, $itemId) {
        global $connect;

        $sql = "DELETE FROM `shoppingcart` 
                WHERE userid3 = '" . $userId . "' AND itemid3 = '" . $itemId ."'";

        //execute sql query
        mysqli_query($connect, $sql);

        $result = false;

        if(mysqli_affected_rows($connect) > 0) {
            $result = true;
        }

        return $result;
    }

    // add item to user cart
    function insert($userId, $itemId, $quantity) {
        global $connect;

        $sql = "INSERT INTO `shoppingcart`(userid3, itemid3, quantity) 
                VALUES ('" . $userId . "', '" . $itemId ."', '" . $quantity ."')";

        //execute sql query
        mysqli_query($connect, $sql);

        $result = false;

        if(mysqli_affected_rows($connect) > 0) {
            $result = true;
        }

        return $result;
    }

    //edit single item quantity
    function update($userId, $itemId, $quantity) {
        global $connect;
        
        $sql = "UPDATE `shoppingcart` 
                SET quantity='" . $quantity . "' WHERE userid3 = '" . $userId . "' AND itemid3 = '" . $itemId ."'";

        //execute sql query
        mysqli_query($connect, $sql);

        $result = false;

        //check number of row has affected
        if(mysqli_affected_rows($connect) > 0) {
            $result = true;
        }

        return $result;
    }

    function deleteSaveLater($userId, $itemId) {
        global $connect;

        $sql = "DELETE FROM `saveforlater` 
                WHERE userid = '" . $userId . "' AND itemid = '" . $itemId ."'";

        //execute sql query
        mysqli_query($connect, $sql);

        $result = false;

        //check number of row has affected
        if(mysqli_affected_rows($connect) > 0) {
            $result = true;
        }

        return $result;
    }

    function insertSaveLater($userId, $itemId) {
        global $connect;

        $sql = "INSERT INTO `saveforlater`(userid, itemid) 
                VALUES ('" . $userId . "', '" . $itemId ."')";

        //execute sql query
        mysqli_query($connect, $sql);

        $result = false;

        if(mysqli_affected_rows($connect) > 0) {
            $result = true;
        }

        return $result;
    }

    if(isset($_POST["userId"])) {
        $userId = mysqli_real_escape_string($connect, $_POST["userId"]);
        $method = mysqli_real_escape_string($connect, $_POST["method"]);
        $items = $_POST["items"];
        
        //check switch method to use
        switch ($method) {
            case 'getItemById':              

                getItemById($items);
                break;

            case 'get':
                //get user shopping cart list
                get($userId);
                break;

            case 'deleteSaveLater':
                $item = $items[0];

                $requestResult = deleteSaveLater($userId, $item['itemId']);

                $result = array('result' => 'fail');

                if($requestResult) {
                    $result['result'] = 'success';
                }
                
                //send back list of insert or update items
                echo json_encode($result);
                break;

            case 'moveToCart':
                    $item = $items[0];

                    //delete item on save later
                    $saveLaterResult = deleteSaveLater($userId, $item['itemId']);

                    //add item to shopping cart
                    $cartResult = insert($userId, $item['itemId'], '1');

                    $result = array('saveItem' => 'fail', 'cartItem' => 'fail');

                    if($saveLaterResult) {
                        $result['saveItem'] = 'success';
                    }

                    if($cartResult) {
                        $result['cartItem'] = 'success';
                    }
                    
                    //send back of move to cart
                    echo json_encode($result);

                break;

            case 'saveForLater':
                $item = $items[0];

                //delete item in shopping cart
                $cartResult = delete($userId, $item['itemId']);

                //add item to save later
                $saveLaterResult = insertSaveLater($userId, $item['itemId']);

                $result = array('saveItem' => 'fail', 'cartItem' => 'fail');

                if($saveLaterResult) {
                    $result['saveItem'] = 'success';
                }

                if($cartResult) {
                    $result['cartItem'] = 'success';
                }

                //send back result of save item later
                echo json_encode($result);
                
                break;

            case 'delete':
                $item = $items[0];

                $deleteResult = delete($userId, $item['itemId']);

                $result = array('result' => 'fail');

                if($deleteResult) {
                    $result['result'] = 'success';
                }
                
                //send back list of insert or update items
                echo json_encode($result);
                
                break;

            case 'insert':

                $result = [];
                //loop all the items array
                for ($i = 0; $i< count($items); $i++) {

                    $item = $items[$i];

                    $itemResult = array('itemId' => $item['itemId'], 
                                        'result' => 'fail');

                    $resultSuccess = false;

                    $checkResult = check($userId, $item['itemId']);

                    //check if user already have item
                    if($checkResult['find']) {
                        //edit exiting item quantity
                        $resultSuccess = update($userId, $item['itemId'], ($item['quantity'] + $checkResult['quantity']));
                    } 

                    //user doesn't have item in cart
                    else {
                        //add item to user cart
                        $resultSuccess = insert($userId, $item['itemId'], $item['quantity']);
                    }

                    //return success result for every items
                    if($resultSuccess) {
                        $itemResult['result'] = 'success';
                    }

                    array_push($result, $itemResult);
                }

                //send back list of insert or update items
                echo json_encode($result);
                break;

            case 'update':
                //edit exiting item quantity
                $item = $items[0];

                $updateSucc = update($userId, $item['itemId'], $item['quantity']);

                $result = array('result' => 'fail');

                if($updateSucc) {
                    $result['result'] = 'success';
                }
                
                //send back list of insert or update items
                echo json_encode($result);

                break;
            
            default:
                break;
        }
        
    }
?>