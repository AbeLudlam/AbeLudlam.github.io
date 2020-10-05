var main = function() {
    var vm = {
        items: ko.observableArray(),
        //detele later after items have review obj
        review: ko.observable('0'),
        searchSegment: ko.observable(false),
        searchResultNumber: ko.observable(0),
        searchInput: ko.observable(''),
        linkQuery: function(itemId) {
            var link = 'product?id=' + itemId;
            return link;
        }, 
        addToCartButton: function(item, event) {
            console.log(this);
            //get quantity element to extract quantity value
            var quantityElement = $(event.target).prev(),
                quantity = parseInt($(quantityElement).find('.text').text());

            //get userId from cookie and itemId from item
            var userId = $.cookie('userId'),
                itemId = item.itemId;

            var item = {itemId: itemId, quantity: quantity};

            //user logged in
            if(userId) {               

                //send request to add item to shopping cart
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
                if($.cookie('guestItems')) {
                    var guestItems = JSON.parse($.cookie('guestItems'));
                    var cartCount = parseInt($.cookie('cartCount'));
                    var matchItem = false;
                    
                    //update total items
                    cartCount += item.quantity;
                    $.cookie('cartCount', cartCount, {expires: 7, path: '/'});

                    //check if item already exit
                    $.each(guestItems, function(index, element) {
                        //find matching item
                        if(element.itemId === item.itemId) {
                            matchItem = true;
                            guestItems[index].quantity += item.quantity;

                            //break out of each loop
                            return false;
                        }
                    });

                    //don't find item already exit is list
                    if (matchItem === false) {
                        guestItems.push(item);
                    }

                    //update cookie for guest account
                    $.cookie('guestItems', JSON.stringify(guestItems), {expires: 7, path: '/'});
                    console.log(guestItems);
                } else {
                    var data = [item];

                    //create new cookie for guest account
                    $.cookie('guestItems', JSON.stringify(data), {expires: 7, path: '/'});
                    $.cookie('cartCount', item.quantity, {expires: 7, path: '/'});
                }
            }
        }
    };

    ko.applyBindings(vm);

    var enableFunctions = function() {
        //reload page after click link
        $('a.item').on('click', function() {
            location.reload();
        });

        //dropdown for quantity
        $('.ui.dropdown').dropdown();    

        //enable star rating
        $('#thumbnail .thirteen.column .item #rating').barrating({
            theme: 'fontawesome-stars-o',
            showSelectedRating: false,
            initialRating: 1,
            readonly: true
        });
    };

    //return query variables that in the url
    var getUrlVars = function () {
        var variables = [],
            hash,
            queryIndex = window.location.href.indexOf('#/'),
            hashes = window.location.href.slice(queryIndex + 2);

        var result = {
            method: 'thumbnail',
            data: hashes
        };

        //default search segment
        vm.searchSegment(false);

        if(hashes.indexOf('search=') >= 0) {
            //display search segment
            vm.searchSegment(true);

            hashes = hashes.split('&');

            // loop for multiple variables
            for(var i = 0; i < hashes.length; i++)
            {
                //split hashes into variable name and value
                hash = hashes[i].split('=');
                //push variable name into vars
                variables.push(hash[0]);
                //replace + with space
                hash[1] = hash[1].split('+').join(' ');
                //assign variable name with value
                variables[hash[0]] = hash[1];
            }

            //search result to search
            result = {
                method: 'search',
                data: variables
            };

            //display search input
            vm.searchInput(result.data.search);
        }

        console.log(result);

        return result;
    };

    //get query in url
    var urlQuery = getUrlVars();

    //check if 
    if(urlQuery.method === 'thumbnail') {
        if (urlQuery.data) {
            var path = urlQuery.data;  

            var element = ".item." + path.slice(0, path.indexOf('/'));
            //active the category tab
            $(element + ' .title').toggleClass('active');
            $(element + ' .content').toggleClass('active');

            //active the sub category tab
            $(element).find('a.item[data-tab="' + path +'"]').toggleClass('active');
        };
    }

    var requestServerData = function() {
        var data, 
            url,
            method = urlQuery.method;
        
        if(method === 'search') {
            url = './php/search.php';
            data = {search: urlQuery.data.search};
        } else {
            url = './php/thumbnail.php';
            data = {category: urlQuery.data};
        }

        console.log(data);

        $.get({
            url: url,
            data: data,
            success: function(data) {
                if(data) {

                    //check if method is search
                    if (method === 'search') {
                        //display number for result get from searching
                        vm.searchResultNumber(data.search_number);
                    }
                    
                    //display items
                    vm.items(data.items);
                    vm.review('0');

                    //enable function after load products
                    enableFunctions();
                }
                else {
                    console.log('cannot load data');
                }
            },
            dataType: 'json'
        });
    };

    //call search request to server for items
    requestServerData();

    //active accordion
    $('.accordion.menu').accordion();
    
};

$(document).ready(main);