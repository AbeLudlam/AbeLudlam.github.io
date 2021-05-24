var main = function() {
    'use strict';

    var insertGuestCartItems = function(data) {
        var userId = $.cookie('userId');

        //send request to add item to shopping cart
        $.ajax({
            url:'./php/shoppingcart.php',
            method:'POST',
            data:{userId: userId, method: 'insert', items: data},
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
    };

    var locationAfterLog = function() {
        //go back to home page
        var preUrl = document.referrer;
        preUrl = preUrl.slice(preUrl.lastIndexOf('/') + 1);

        if(preUrl.indexOf('signup') >= 0 || preUrl.indexOf('login') >= 0) {
            //go to home page
            window.location.href="index.html";
        } else {
            //go to previous page
            window.location.href=preUrl;
        }
    };
    
    //login error validation
    $('#login-form').form({
        fields: {
            username: {
                identifier  : 'username',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please enter your username'
                    }
                ]
            },
            password: {
                identifier  : 'password',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please enter your password'
                    },
                    {
                        type   : 'length[6]',
                        prompt : 'Your password must be at least 6 characters'
                    }
                ]
            }
        }, 
        onSuccess: function(event){
            var username = $('#username').val(),
                password = $('#password').val(),
                $list = $("<ul>").addClass("list");

            $.ajax({
                url:'./php/login.php',
                method:'POST',
                data:{username:username, password:password},
                cache: false,
                dataType: 'json',
                success:function(data) {
                    if(data.username !== '') {
                        console.log("got data from server");
                        
                        //set cookie for each json data respond
                        $.each(data, function(key, value) {
                            //set cookie for each key and value retreive from server
                            $.cookie(key, value, {expires: 7, path: '/'});
                        });

                        $.when().then(function() {
                            var guestItems = $.cookie('guestItems');
                            if(guestItems && guestItems !== '[]') {
                                var items = JSON.parse($.cookie('guestItems'));                                
                                
                                insertGuestCartItems(items);

                                //remove guestItems
                                $.removeCookie('guestItems', { path: '/' });
                            }
                        }).done(function() {
                            locationAfterLog();
                            console.log('done');                            
                        });
                    }
                    else {
                        $('.ui.form').toggleClass("success error");
                        $('.error .list').remove();
                        $list.append($("<li>").text("Wrong username or password"));
                        $list.hide();
                        $('.ui.error.message').append($list);
                        $list.fadeIn();
                    }
                }
            });
            return false;
        },
        onFailure: function() {
            console.log('failure');
            $('.error .list').hide().fadeIn();
            return false;
        }
    });

    //login button pressed
    $('#loginButton').on('click',function() {
        $('#login-form').form('validate form');
    });

};
$(document).ready(function() {
    //load jquery cookie before check login
    $.getScript("javascript/jquery.cookie.js", function(){
        main();
    });
});