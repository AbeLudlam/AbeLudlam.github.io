var main = function () {


    //return id of item
    var getUrlId = function () {
        var queryIndex = window.location.href.indexOf('?'),
            id = window.location.href.slice(queryIndex + 1);

            //remove "id="
            id = id.slice(id.indexOf('=')+1);

        return id;
    };

    var quantity = 0,
        itemId = getUrlId();

    var displayProduct = function(data) {
        $('#title').html(data.title);
        $('#image').attr("src",data.url.slice(0,-3) + "500");
        $('#price').html('$' + data.price);
        $('#color').html(data.color);

        //empty description
        $('#description').empty();

        //display description detail
        $.each(data.description, function(index, value) {
            var detail = $('<li>' + value + '</li>');
            $('#description').append(detail);
        });
    };

    //send request to product.php for item detail
    var loadItemDetail = function() {       

        $.get({
            url: './php/product.php',
            data: {itemId: itemId},
            success: function(data) {
                if(data) {
                    //display items
                    displayProduct(data);
                }
                else {
                    console.log('cannot load data');
                }
            },
            dataType: 'json'
        });
    };
    loadItemDetail();

    //dropdown for quantity
    $('.ui.dropdown').dropdown();


    //add to cart button clicked
    $('#addToCartButton').on('click', function() {

        //get userId from cookie
        var userId = $.cookie('userId');
        var quantity = parseInt($('#quantity-dropdown .text').text());

        var item = {itemId: itemId, quantity: quantity};



        //user logged in
        if(userId) {

            $.ajax({
                url:'./php/shoppingcart.php',
                method:'POST',
                data:{userId: userId, method: 'insert', items: [item]},
                dataType: 'json',
                cache: false,
                success:function(data) {
                    if(data) {
                        //display the item had add to cart
                        console.log(data);
                    }
                    else {
                        console.log('cannot load data');
                    }
                }
            });
        }

        // guest user
        else {
            //guest cookie already exit
            if($.cookie('guest')) {
                var guestAccount = JSON.parse($.cookie('guest'));
                var matchItem = false;

                console.log(guestAccount);
                
                //update total items
                guestAccount.cartItemCount += item.quantity;

                //check if item already exit
                $.each(guestAccount.items, function(index, element) {
                    //find matching item
                    if(element.itemId === item.itemId) {
                        matchItem = true;
                        guestAccount.items[index].quantity += item.quantity;

                        //break out of each loop
                        return false;
                    }
                });

                //don't find item already exit is list
                if (matchItem === false) {
                    guestAccount.items.push(item);
                }

                //update cookie for guest account
                $.cookie('guest', JSON.stringify(guestAccount), {expires: 7, path: '/'});
                
            } else {
                var data = {
                    cartItemCount: item.quantity,
                    items: [item]
                }

                //create new cookie for guest account
                $.cookie('guest', JSON.stringify(data), {expires: 7, path: '/'});
            }
        }
        
    });
};

$(document).ready(function() {
    //load jquery cookie before check login
    $.getScript("javascript/jquery.cookie.js", function(){
        main();
    });
});