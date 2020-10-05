var main = function() {

    //get userId from cookie
    var userId = $.cookie('userId');

    //load user item and save later items
    var loadCartData = function() {

        //check if user already logged in
        if(userId) {
            //user ajax to send POST request
            $.ajax({
                url:'./php/shoppingCart.php',
                method:'POST',
                data:{userId: userId, method: 'get', items: ''},
                dataType: 'json',
                cache: false,
                success:function(data) {
                    if(data) {                        
                        //display items
                        vm.cartItems(data.items);

                        vm.saveItemNumber(data.numberOfSaveItems);
                        vm.saveItems(data.saveItems);

                        enableFuntions();
                    }
                    else {
                        console.log('cannot load data');
                    }
                }
            });
        } 
        //user not login and use guest account
        else {
            if($.cookie('guestItems')) {
                var guestItems = JSON.parse($.cookie('guestItems'));

                $.ajax({
                    url:'./php/shoppingCart.php',
                    method:'POST',
                    data:{userId: '', method: 'getItemById', items: guestItems},
                    dataType: 'json',
                    cache: false,
                    success:function(data) {
                        if(data) {
                            //display items
                            vm.cartItems(data.items);

                            enableFuntions();
                        }
                        else {
                            console.log('cannot load data');
                        }
                    },
                    error: function() {
                        vm.cartItems([]);
                    }
                });
            } 
        }
    };

    //load cart items after get in shopping cart page
    loadCartData();


    //requests to server
    var shoppingCartRequest = function(data) {
        var items = [];
        items.push({itemId: data.itemId, quantity: data.quantity});

        var method = data.method;

        //user ajax to send POST request
        $.ajax({
            url:'./php/shoppingCart.php',
            method:'POST',
            data:{userId: userId, method: method, items: items},
            dataType: 'json',
            cache: false,
            success:function(data) {
                if(data) {
                    loadCartData();
                }
                else {
                    console.log('cannot load data');
                }
            }
        });
    };

    var guestChangeQty = function(targetItem, value) {
        var guestItems = JSON.parse($.cookie('guestItems'));

        //find index of itemId in guest cookie
        $.map(guestItems, function(obj, index) {
            if(obj.itemId === targetItem.itemId) {
                guestItems[index].quantity = value;

                //update cookie for guest account
                $.cookie('guestItems', JSON.stringify(guestItems), {expires: 7, path: '/'});

                loadCartData();
                return;
            }
        });
    };

    //enable all functions in shopping cart
    var enableFuntions = function() {
        //dropdown for quantity
        $('.ui.dropdown').dropdown();

        //checkout button clicked
        $('#checkOutButton').on('click', function() {
            if(userId) {
                window.location.href="checkOut.html";
            } else {
                window.location.href="login.html";
            }
        });
    };

    //Knockout js view model
    var vm = {
        userLogin: ko.observable(false),
        cartItems: ko.observableArray(),
        saveItems: ko.observableArray([]),
        ItemQty: ko.observable(10),
        subTotal: ko.observable(0),
        cartItemNumber: ko.observable(0),
        saveItemNumber: ko.observable(0),
        deleteCartItem: function() {
            var targetItem = this;

            if(vm.userLogin()) {
                var data = {itemId: targetItem['itemId'], quantity: '', method: 'delete'};
            
                // send request to delete the item
                shoppingCartRequest(data);
            } else {
                if($.cookie('guestItems')) {
                    var guestItems = JSON.parse($.cookie('guestItems'));

                    //find index of itemId in guest cookie
                    $.each(guestItems, function(index, obj) {
                        if(obj.itemId === targetItem.itemId) {
                            guestItems.splice(index, 1);

                            //update guest cart items                
                            $.cookie('guestItems', JSON.stringify(guestItems), {expires: 7, path: '/'});
                            loadCartData();
                            return false;
                        }
                    });
                }                
            }            
        },
        saveForLater: function() {
            var data = {itemId: this['itemId'], quantity: '', method: 'saveForLater'};
            
            // send request to delete the item
            shoppingCartRequest(data);
        },
        deleteSaveLater: function() {
            var data = {itemId: this['itemId'], quantity: '', method: 'deleteSaveLater'};
            
            // send request to delete the item
            shoppingCartRequest(data);
        },
        moveToCart: function() {
            var data = {itemId: this['itemId'], quantity: '1', method: 'moveToCart'};
            
            // send request to delete the item
            shoppingCartRequest(data);
        },
        changeQty: function() {
            var targetItem = this;

             $('.ui.dropdown').dropdown({
                onChange: function(value, text, $selectedItem) {
                    //check if user logged in
                    if(userId) {
                        var data = {itemId: targetItem['itemId'], quantity: text, method: 'update'};
                        
                        //send request to change selected item quantity
                        shoppingCartRequest(data);
                    } 
                    else {
                        guestChangeQty(targetItem, value);
                    }
                }
            });            
        },
        computeTotal: ko.pureComputed(function() {
            var items = vm.cartItems();
            var subTotal = 0,
                totalItems = 0;

            $.each(items, function(index, item) {
                subTotal += parseFloat(item.price) * parseInt(item.quantity);
                totalItems += parseInt(item.quantity);
            });

            //update total number of item to viewMobel
            vm.cartItemNumber(totalItems);
            //update cart item number in menu bar
            $('#itemcount').html(totalItems);

            //change number of item in cookie
            $.cookie('cartCount', totalItems, { path: '/' });

            //return the total price to display
            return '$' + subTotal.toFixed(2);
        }),
        linkQuery: function(itemId) {
            var link = 'product?id=' + itemId;
            return link;
        }
    };

    if(userId) {
        vm.userLogin(true);
    } else {
        vm.userLogin(false);
    }

    ko.applyBindings(vm);
};

$(document).ready(function() {
    //load jquery cookie before check login
    $.getScript("javascript/jquery.cookie.js", function(){
        main();
    });
});