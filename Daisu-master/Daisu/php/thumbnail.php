<?php
    //datavase connection
    $connect = mysqli_connect("localhost", "root", "", "daisu_db");
    //check if username and password have values
    if(isset($_GET["category"])) {

        $category = mysqli_real_escape_string($connect, $_GET["category"]);
        //$str = "tent";
        //$category = mysqli_real_escape_string($connect, $str);

        //database query request
        $sql = "SELECT * FROM `item` WHERE category = '" . $category . "'";
       
        $result = mysqli_query($connect, $sql);

        $num_row = mysqli_num_rows($result);
        
        $items = [];

        if($num_row > 0) {
            while($data = mysqli_fetch_array($result)) {
               $arr = array('itemId' => $data["itemid"], 
                            'title' => $data["productname"], 
                            'brand' => $data["brand"],
                            'price' => $data["price"], 
                            'color' => $data["color"], 
                            'url' => $data["picturelink"]);                
               array_push($items, $arr);
            }            
        }

        $returnResult = array('items' => $items);
        
        echo json_encode($returnResult, true);
    }
?>