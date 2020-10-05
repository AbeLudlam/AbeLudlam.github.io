<?php
    //datavase connection
    $connect = mysqli_connect("localhost", "root", "", "daisu_db");
    //check if username and password have values
    if(isset($_GET["search"])) {
        $searchInput = mysqli_real_escape_string($connect, $_GET["search"]);

        //replace search input space (' ') with percent ('%')
        $findChar = ' ';
        while($pos = strpos($searchInput,$findChar)) {
            $searchInput[$pos] = '%';
        }        

        //database query request
        $sql = "SELECT * FROM `item` WHERE productname LIKE '%" . $searchInput . "%'";
        
        //add extra search query for individual words
        $searchArray = explode('%', $searchInput);
        foreach ($searchArray as $value) {
            $sql .= " OR productname LIKE '%" . $value . "%'";
        }
       
        $result = mysqli_query($connect, $sql);

        $num_row = mysqli_num_rows($result);

        $items = [];

        if($num_row > 0) {
            //put all result into array
            while($data = mysqli_fetch_array($result)) {
                $arr = array( 'itemId' => $data["itemid"],                            
                            'title' => $data["productname"], 
                            'brand' => $data["brand"],
                            'price' => $data["price"], 
                            'color' => $data["color"], 
                            'url' => $data["picturelink"]);
                $arr = array_map('utf8_encode', $arr);

                array_push($items, $arr);
            }            
        } 
        
        $searchResult = array('search_number' => $num_row, 'items' => $items);

        //return search result
        echo json_encode($searchResult);
    }
?>