var main = function() {
    'use strict';
    
    //login error validation
    $('.ui.form').form({
        fields: {
            firstName: {
                identifier  : 'firstName',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please enter your first name'
                    }
                ]
            },
            lastName: {
                identifier  : 'lastName',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please enter your last name'
                    }
                ]
            },
            username: {
                identifier  : 'username',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please enter your username'
                    }
                ]
            },
            email: {
                identifier  : 'email',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please enter your email'
                    },
                    {
                        type   : 'email',
                        prompt : 'Please enter a valid e-mail'
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
            },
            passwordConfirm: {
                identifier  : 'passwordConfirm',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please enter your confirm password'
                    },
                     {
                        type   : 'match[password]',
                        prompt : 'Your password is not match'
                    }
                ]
            },
            term: {
                identifier  : 'term',
                rules: [
                    {
                        type   : 'checked',
                        prompt : 'You must agree to the terms and conditions'
                    }
                ]
            }
        },
        onSuccess: function(event) {
            console.log("button pressed");
            var firstName = $('#firstName').val(),
                middleName = $('#middleName').val(),
                lastName = $('#lastName').val(),
                username = $('#username').val(),
                email = $('#email').val(),
                password = $('#password').val(),
                $list = $("<ul>").addClass("list");

            $.ajax({
                url:'./php/signup.php',
                method:'POST',
                data:{firstName:firstName, middleName:middleName, lastName:lastName, username:username, email:email, password:password},
                cache: false,
                success:function(data) {
                    if(data) {
                        if (data === 'failure') {
                            $('.ui.negative.message').slideDown(400);
                            $('.ui.negative.message').delay(2000).fadeOut();
                        } else if (data === 'success') {
                            $('.ui.success.message').slideDown(400);
                            $('.ui.success.message').delay(4000).fadeOut();
                        
                            setTimeout(function () {
                                $.ajax({
                                    url:'./php/login.php',
                                    method:'POST',
                                    data:{username:username, password:password},
                                    cache: false,
                                    dataType: 'json',
                                    success:function(data) {
                                        if(data.username !== '') {
                                            
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
                                                window.location.href="index.html";
                                                console.log('done');                            
                                            });
                                        }
                                    }
                                });
                            }, 2000);                        
                        } else {
                            console.log('cannot create new account');
                        }
                        
                    } 
                    else {
                        $('.ui.form').toggleClass("success error");
                        $('.error .list').remove();
                        $list.append($("<li>").text("Can't create an account"));
                        $list.hide();
                        $('.ui.error.message').append($list);
                        $list.fadeIn();
                    }
                }
            });
            return false;
        },
        onFailure: function () {
            console.log("failure");
            return false;
        }
    });


};
$(document).ready(function() {
    //load jquery cookie before check login
    $.getScript("javascript/jquery.cookie.js", function(){
        main();
    });
});