var main = function () {
    'use strict';

    //functions for menu after load
    // to prevent asynchronous
    var activeMenuFunctions = function() {
        $('a.item').on('click', function() {
            location.reload();
        });

        //enable user-menu dropdown
        $('.ui.pointing.dropdown').dropdown({
            on: 'hover',
            transition: 'fade down',
            action: 'nothing'
        });

        //enable popup on menubar
        $('.menu-popup').popup({
            hoverable: true,
            position: 'bottom left',
            delay: {
                show: 200,
                hide: 400
            }
        });

        //prevent form to reload page
        $('#search-form').submit(function(e) {
            e.preventDefault();
            var path = window.location.pathname;
            path = path.slice(path.lastIndexOf('/')+1);

            var searchInput = $('#search-input').val();
            //console.log(window);
            if(searchInput === '') {
                console.log('no input');
            } else {
                //convert search into url query
                var query = searchInput.split(' ').join('+');

                //go to search page with url query
                window.location = 'thumbnail#/search=' + query;                

                //reload page if location at thumbnail
                if(path === 'thumbnail') {
                    window.location.reload();
                }
            }
        });

        //logout button clicked
        $('#logout-button').on('click', function() {
            $.removeCookie('username', { path: '/' });
            $.removeCookie('userId', { path: '/' });
            $.removeCookie('cartCount', { path: '/' });

            //go back to home page
            window.location.href="index.html";
        });
    };

    //check if user have already logged in
    var checkLogin = function () {
        //get username from cookie
        var username = $.cookie('username'),
            data;

        //check if user logged in
        if(username) {
            data = '<div class="ui pointing dropdown link item user-menu" id="user-menu">' +
                '<img class="ui circular image" src="image/jenny.jpg">' +
                '<div class="menu">' +
                    '<div class="item">' +
                        '<div class="ui grid">' +
                            '<div class="six wide column">' +
                                '<img class="ui circular image" src="image/jenny.jpg">' +
                            '</div>' +
                            '<div class="ten middle aligned wide column">' +
                                '<h2 class="ui header"> '+ username +'</h2>' +
                                '<a href="myAccount.html" class="myAccount">' +
                                    '<div class="ui blue button">My Account</div>' +
                                '</a>' +
                    '</div></div></div>' +
                    '<div class="divider"></div>' +
                    '<div class="item">' +
                        '<div class="ui large right floated button" id="logout-button">Logout</div>' +
                    '</div></div></div>';
        } else {
            data = '<a href="signup.html" class="item signin">' +
                        '<div class="ui primary button">Sign Up</div>' +
                    '</a>' +
                    '<a href="login.html" class="item signin">' +
                        '<div class="ui button">Login</div>' +
                    '</a>';
        }

        //display buttons when user login or not login
        $('#userMenu').append(data);

        //active menu functions
        activeMenuFunctions();
    };

    //load user menu from menubar.html
    $('#master-menu').load('menubar.html', function( response, status, xhr ) {
        if ( status == "error" ) {
            var msg = "Sorry but there was an error: ";
            $( "#error" ).html( msg + xhr.status + " " + xhr.statusText );
        } else {

            //load jquery cookie before check login
            $.getScript("javascript/jquery.cookie.js", function(){
                //display cart item count
                var cartCount = $.cookie('cartCount');
                if(cartCount) {
                    $('#itemcount').html(cartCount);
                } else {
                    $('#itemcount').html('0');
                }
                

                //execute check user login
                checkLogin();
            });
            
        }
    });
};

$(document).ready(main);