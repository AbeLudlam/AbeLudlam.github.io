var main = function() {

    //list of all categories
    var categoryList = {
        "camping" : [
            {
                "title": "Tents",
                "data-tab": "tents",
                "url":  "https://www.rei.com/media/product/862430?size=500"
            }, 
            {
                "title": "Sleeping Bags",
                "data-tab": "sleeping-bags",
                "url": "https://www.rei.com/media/product/897547?size=230"
            },
            {
                "title": "Hammocks",
                "data-tab": "hammocks",
                "url": "https://www.rei.com/media/product/895878?size=400"
            },
            {
                "title": "Pads",
                "data-tab": "pads",
                "url": "https://www.rei.com/media/product/881907?size=500"
            },
            {
                "title": "Cook Wares",
                "data-tab": "cook-wares",
                "url": "https://www.rei.com/media/product/830777?size=230"
            },
            {
                "title": "Stoves",
                "data-tab": "stoves",
                "url": "https://www.rei.com/media/product/868190?size=230"
            },
            {
                "title": "Coolers",
                "data-tab": "coolers",
                "url": "https://www.rei.com/media/product/112628?size=230"
            }
        ],
        "accessories" : [
            {
                "title": "Binoculars",
                "data-tab": "binoculars",
                "url":  "https://www.rei.com/media/product/871931?size=230"
            }, 
            {
                "title": "Compasses",
                "data-tab": "compasses",
                "url": "https://www.rei.com/media/product/877078?size=230"
            },
            {
                "title": "Solar & Portable Power",
                "data-tab": "solar-and-portable-power",
                "url": "https://www.rei.com/media/product/880057?size=230"
            },
            {
                "title": "GPS",
                "data-tab": "GPS",
                "url": "https://www.rei.com/media/product/103709?size=230"
            },
            {
                "title": "Gear Storage & Maintenance",
                "data-tab": "gear-storage-and-maintenance",
                "url": "https://www.rei.com/media/product/380196?size=230"
            },
            {
                "title": "lightings",
                "data-tab": "coolers",
                "url": "https://www.rei.com/media/product/892056?size=500"
            },
            {
                "title": "Trekking Poles",
                "data-tab": "trekking-poles",
                "url": "https://www.rei.com/media/product/881626?size=230"
            }
        ],
        "health-and-safety" : [
            {
                "title": "Frist Aid",
                "data-tab": "first-aid",
                "url":  "https://www.rei.com/media/product/784609?size=230"
            }, 
            {
                "title": "Emergency & Survival",
                "data-tab": "emergency-and-survival",
                "url": "https://www.rei.com/media/product/867416?size=230"
            },
            {
                "title": "Sun & Bug Protections",
                "data-tab": "sun-and-bug-protections",
                "url": "https://www.rei.com/media/product/828908?size=230"
            }
        ],
        "men" : [
            {
                "title": "Footwear",
                "data-tab": "footwear",
                "url":  "https://www.rei.com/media/product/881784?size=230"
            }, 
            {
                "title": "Jackets",
                "data-tab": "jackets",
                "url": "https://www.rei.com/media/product/104718?size=230"
            },
            {
                "title": "Tops",
                "data-tab": "tops",
                "url": "https://www.rei.com/media/product/834628?size=230"
            },
            {
                "title": "Bottoms",
                "data-tab": "bottoms",
                "url": "https://www.rei.com/media/product/894352?size=230"
            }
        ],
        "women" : [
            {
                "title": "Footwear",
                "data-tab": "footwear",
                "url":"https://www.rei.com/media/product/105495?size=230"
            }, 
            {
                "title": "Jackets",
                "data-tab": "jackets",
                "url": "https://www.rei.com/media/product/104965?size=230"
            },
            {
                "title": "Tops",
                "data-tab": "tops",
                "url": "https://www.rei.com/media/product/885393?size=230"
            },
            {
                "title": "Bottoms",
                "data-tab": "bottoms",
                "url": "https://www.rei.com/media/product/874841?size=230"
            }
        ]
    };

    //return query variables that in the url
    var getUrlVars = function () {
        var variables = [],
            hash,
            queryIndex = window.location.href.indexOf('#/'),
            hashes = window.location.href.slice(queryIndex + 1).split('/');

        if (queryIndex != -1) {
            for(var i = 0; i< hashes.length; i++) {
                if(hashes[i] !== ''){
                    variables.push(hashes[i]);
                }                
            }
        }
        return variables;
    };

    var tabSelection = function(targetTab) {
        var element = '.accordion.menu .item[data-tab="' + targetTab +'"]';

        //active tab selected
        $.tab('change tab', targetTab);

        //active accordion base on tab selected
        var element = '.accordion.menu .item[data-tab="' + targetTab +'"]';
        $(element + ' .title').toggleClass('active');
        $(element + ' .content').toggleClass('active');
    }

    var loadSubCategory = function (targetTab,category) {
        //remove exiting template
        $('.thirteen.column .segment[data-tab="' + targetTab + '"]').empty();

        var template = $('<div class="ui three column stackable grid container">');

        for(var i=0; i<category.length; i++) {
            var subTemplate = '<div class="column">' +
                                '<div class="ui large image">' +
                                    '<div class="ui dimmer">' +
                                        '<div class="content">' +
                                            '<a href="thumbnail#/' + targetTab + '/' + category[i]["data-tab"]+ '" class="center">' +
                                                '<h2 class="ui inverted header">'+ category[i]["title"] +'</h2>' +
                                            '</a>' +
                                        '</div>' +
                                    '</div>' +
                                    '<img class="ui image" src="' + category[i]["url"] +'">' +
                                '</div>' +
                            '</div>';
            template.append(subTemplate);
        }

        $('.thirteen.column .segment[data-tab=' + targetTab + ']').append(template);
        //activate picture dimmer
        $('.ui.segment .thirteen.column .image').dimmer({
            on: 'hover'
        });
    };    

    //load and active tab pass from URL
    var array = getUrlVars();
    if (array.length > 0) {
        tabSelection(array[0]);
        //display category images
        loadSubCategory(array[0], categoryList[array[0]]);
    };    

    //picture link in categories got clicked
    $('.thirteen.column .column .content a').on('click', function() {
        //$('.thrteen')
        var selectTab = $(this).attr('href').slice(2);
        
        //active accordion according on picture tab clicked
        tabSelection(selectTab);        

        //display category images
        loadSubCategory(selectTab, categoryList[selectTab]);
    });
    
    //activate picture dimmer
    $('.ui.segment .thirteen.column .image').dimmer({
        on: 'hover'
    });

    //active accordion
    $('.accordion.menu').accordion();
};

$(document).ready(main);