<?php    
    //datavase connection
    $connect = mysqli_connect("localhost", "root", "", "daisu_db");
    
    //check if username and password have values
    if(isset($_GET["itemId"])) {
        
        $itemid = mysqli_real_escape_string($connect, $_GET["itemId"]);

        //database query request for item
        $sqlItem = "SELECT * FROM item WHERE itemid = '" . $itemid . "'";
       
        $item_result = mysqli_query($connect, $sqlItem);
        $item_num_row = mysqli_num_rows($item_result);

        $item;

        if( $item_num_row > 0 ) {
            $data = mysqli_fetch_array($item_result);
            $item = array('itemId' => $data["itemid"], 
                    'title' => $data["productname"],
                    'brand' => $data["brand"], 
                    'price' => $data["price"], 
                    'color' => $data["color"], 
                    'url' => $data["picturelink"],
                    'description' => '');
        }

        //database query request for item description
        $sqlDesc = "SELECT * FROM detail WHERE itemid = '" . $itemid . "'";
        $desc_result = mysqli_query($connect, $sqlDesc);        
        $desc_num_row = mysqli_num_rows($desc_result);

        if($desc_num_row > 0) {
            $data = mysqli_fetch_array($desc_result);
            $arr = explode("\n", $data["itemdescription"]);
            $arr = array_map('utf8_encode', $arr);
            $item['description'] = $arr;
        }

        echo json_encode($item);
    
    }
?>