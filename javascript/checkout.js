var main = function() {

    var taxPercent = 8;

    //Knockout js view model
    var vm = {
        orderTab: ko.observable('shippingAddress'),
        cartItems: ko.observableArray([]),
        firstName: ko.observable(''),
        lastName: ko.observable(''),
        address: ko.observable(''),
        city: ko.observable(''),
        zipCode: ko.observable(''),
        state: ko.observable(''),
        phone: ko.observable(''),
        shippingMethod: ko.observable(''),
        shippingPrice: ko.observable(0),
        cartItemNumber: ko.observable(0),
        taxTotal: ko.observable(0),
        subTotal: ko.observable(0),
        cardType: ko.observable(''),
        cardNumber: ko.observable(''),
        cardCVC: ko.observable(''),
        cardMonth: ko.observable(''),
        cardYear: ko.observable(''),
        paymentMethod: ko.pureComputed(function() {
            return vm.cardType() + ' ending in: ' + vm.cardNumber().slice(-4);
        }),
        cardExpireDate: ko.pureComputed(function() {
            return 'expire data(MM/YYYY): ' + vm.cardMonth() + '/' + vm.cardYear();
        }),
        computeFullname: ko.pureComputed(function() {
            var fullName = vm.firstName() + ' ' + vm.lastName();
            return fullName;
        }),
        computeAddress: ko.pureComputed(function() {
            var city = vm.city() + ' ' + vm.state() + vm.zipCode();
            return city;
        }),
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
            vm.subTotal(subTotal.toFixed(2));

            //return the total price to display
            return '$' + subTotal.toFixed(2);
        }),
        computeTax: ko.pureComputed(function() {
            var tax = parseFloat(vm.subTotal()) * taxPercent / 100;

            vm.taxTotal(tax.toFixed(2));
            return '$' + tax.toFixed(2);
        }),
        orderTotal: ko.pureComputed(function() {
            var orderTotal = parseFloat(vm.subTotal()) + parseFloat(vm.taxTotal()) + parseFloat(vm.shippingPrice());

            return '$' + orderTotal.toFixed(2);
        })
    }

    ko.applyBindings(vm);

    //enable all functions in shopping cart
    var enableFuntions = function() {
        $('.ui.steps').find('.step').on('click', function() {
            var tab = $(this).data('tab');
            
            if(tab === 'confirmOrder') {
                $('#continueButton').html('Place Your Order');
                $('.ui.steps').find('.step').tab('change tab', 'confirmOrder');
            } else {
                $('#continueButton').html('Continue');
            }
            

            vm.orderTab(tab)
        });
    };

    $('.field #stateDropdown').dropdown();

    $('.ui.radio.checkbox').checkbox({
        onChange: function() {
            var checkbox = $('.ui.radio.checkbox.checked input').data('value');
            vm.shippingPrice(parseFloat(checkbox).toFixed(2));
        }
    });

    $('#continueButton').on('click', function() {
        var tab = vm.orderTab();
        if(tab === 'shippingAddress') {
            $('#addressForm').form('validate form');
        } else if (tab === 'paymentMethod'){
            $('#paymentForm').form('validate form');
        } else {
            var price = parseFloat(vm.subTotal()) + parseFloat(vm.taxTotal()) + parseFloat(vm.shippingPrice());
            price = price.toFixed(2);

            var data = {
                userId: $.cookie('userId'),
                firstName: vm.firstName(),
                lastName: vm.lastName(),
                address: vm.address(),
                city: vm.city(),
                zipCode: vm.zipCode(),
                state: vm.state(),
                phone: vm.phone(),
                shippingMethod: vm.shippingMethod(),
                cardType: vm.cardType(),
                cardNumber: vm.cardNumber(),
                CVC: vm.cardCVC(),
                cardMonth: vm.cardMonth(),
                cardYear: vm.cardYear(),
                price: price
            }

            //user ajax to send POST request
            $.ajax({
                url:'./php/transaction.php',
                method:'POST',
                data: data,
                dataType: 'json',
                cache: false,
                success:function(data) {
                    if(data) {
                        console.log(data);
                        window.location.href="orderCompleted.html";
                    }
                    else {
                        console.log('cannot load data');
                    }
                }
            });

            
        }
        
    });

    $('.three.step .step.button').tab();

    $('.ui.selection.dropdown').dropdown();

    //shipping address validation
    $('#addressForm').form({
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
            address: {
                identifier  : 'address',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please enter your address'
                    }
                ]
            },
            state: {
                identifier  : 'state',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please selection the State'
                    }
                ]
            },
            city: {
                identifier  : 'city',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please enter your city'
                    }
                ]
            },
            zipCode: {
                identifier  : 'zipCode',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please enter your zip code'
                    }
                ]
            },
            phone: {
                identifier  : 'phone',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please enter your phone number'
                    }
                ]
            }
        },
        onSuccess: function(event) {
            var shippingType = $('.ui.radio.checkbox.checked').find('label').text();
            vm.shippingMethod(shippingType.slice(0,shippingType.indexOf('$')-1));

            vm.state($(this).form('get value', 'state'));

            vm.orderTab('paymentMethod');

            $('#addressStepButton').addClass('completed');
            $('#billingStepButton').removeClass('disabled');

            $('.ui.steps').find('.step').tab('change tab', 'paymentMethod');

            return false;
        },
        onFailure: function () {
            console.log(' address fail');
            return false;
        }
    });

    //payment validation
    $('#paymentForm').form({
        fields: {
            cardType: {
                identifier  : 'cardType',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please selection your card'
                    }
                ]
            },
            cardNumber: {
                identifier  : 'cardNumber',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please enter your card number'
                    }
                ]
            },
            cardCVC: {
                identifier  : 'cardCVC',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please enter your CVC in the back of the card'
                    }
                ]
            },
            cardMonth: {
                identifier  : 'cardMonth',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please select your card expiration month'
                    }
                ]
            },
            cardYear: {
                identifier  : 'cardYear',
                rules: [
                    {
                        type   : 'empty',
                        prompt : 'Please enter your card expiration year'
                    }
                ]
            }
        },
        onSuccess: function(event) {

            var cardType = $(this).form('get value', 'cardType');
            vm.cardType(cardType);

            var cardMonth = $(this).form('get value', 'cardMonth');
            vm.cardMonth(cardMonth);

            vm.orderTab('placeOrder');

            $('#continueButton').html('Place Your Order');
            

            $('#billingStepButton').addClass('completed');
            $('#confirmOrder').removeClass('disabled');          
            
            $('.ui.steps').find('.step').tab('change tab', 'confirmOrder');
            return false;
        },
        onFailure: function () {
            console.log(' payment fail');
            return false;
        }
    });

    var loadCartData = function() {
        var userId = $.cookie('userId');
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
                    var checkbox = $('.ui.radio.checkbox.checked input').data('value');

                    vm.shippingPrice(parseFloat(checkbox).toFixed(2));

                    enableFuntions();
                }
                else {
                    console.log('cannot load data');
                }
            }
        });
    }

    loadCartData();
};

$(document).ready(function() {
    //load jquery cookie before check login
    $.getScript("javascript/jquery.cookie.js", function(){
        main();
    });
});