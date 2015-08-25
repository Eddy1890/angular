/**
 * Created by MihocE on 8/24/2015.
 */
(function(){

    var app = angular.module('store', []);

    /* custom directives
    app.directive('productTitle', function(){
        return{

        };
    });
*/
    app.controller('StoreController', ['$http', function($http){

        var store = this;

        store.products = []; // initialize store.products before the request to fetch data is made - efficiency purposes

        $http.get('resources/products.json').success(function(data){
            store.products = data;
        });
    }]);

    app.controller('PanelController', function(){
        this.tab = 1;
        this.selectTab = function(setTab){
            this.tab = setTab;
        };
        this.isSelected = function(checkTab){
            return this.tab === checkTab;
        };
    });

    app.controller('ReviewController', function(){
        this.review = {};

        this.addReview = function(product){
            product.review.push(this.review);
            this.review = {};
        }
    });

/*    var gems = [
        {
        name: 'Dodecahedron',
        price: 2.95,
        description: '...',
        canPurchase: true,
        soldOut: true,
        specification: 'the shine is blue',
        review: [
            {
                stars: 5,
                body: 'Best gem in the world',
                author: 'Carmen Petrescu'
            }
        ],
        images: [
            {
                thumb: 'resources/images/1.jpg',
            }
        ]
        },
        {
        name: 'Pentagonal Gem',
        price: 100.59,
        description: '...',
        canPurchase: false,
        soldOut: false,
        specification: 'the shine is red',
        review: [
            {
                stars: 5,
                body: 'Best gem in the world',
                author: 'Carmen Petrescu'
            }
        ],
        images: [
            {
                thumb: 'resources/images/2.jpg',
            }
        ]
        },
        {
        name: 'Rubyinschi Gem',
        price: 4.76,
        description: '...',
        canPurchase: true,
        soldOut: false,
        specification: 'the shine is redish',
        review: [
            {
                stars: 5,
                body: 'Best gem in the world',
                author: 'Carmen Petrescu'
            }
        ],
        images: [
            {
                thumb: 'resources/images/3.jpg',
            }
        ]
        },
        {
        name: 'Rubyinschi Gem',
        price: 4.76,
        description: '...',
        canPurchase: false,
        soldOut: true,
        specification: 'the shine is gold/violet',
        review: [
            {
                stars: 5,
                body: 'Best gem in the world',
                author: 'Carmen Petrescu'
            }
        ],
        images: [
            {
                thumb: 'resources/images/4.jpg',
            }
        ]
        },
        {
        name: 'Rubyinschi Gem',
        price: 4.76,
        description: '...',
        canPurchase: false,
        soldOut: true,
        specification: 'the shine is green',
        review: [
            {
                stars: 5,
                body: 'Best gem in the world',
                author: 'Carmen Petrescu'
            }
        ],
        images: [
            {
                thumb: 'resources/images/5.jpg',
            }
        ]
        },
        {
        name: 'Rubyinschi Gem',
        price: 4.76,
        description: '...',
        canPurchase: false,
        soldOut: true,
        specification: 'the shine is pale blue',
        review: [
            {
                stars: 5,
                body: 'Best gem in the world',
                author: 'Carmen Petrescu'
            }
        ],
        images: [
            {
                thumb: 'resources/images/6.jpg',
            }
        ]
        },
        {
        name: 'Rubyinschi Gem',
        price: 4.76,
        description: '...',
        canPurchase: false,
        soldOut: true,
        specification: 'the shine is gold',
        review: [
            {
                stars: 5,
                body: 'Best gem in the world',
                author: 'Carmen Petrescu'
            },
            {
                stars: 5,
                body: 'Best gem in the world',
                author: 'Carmen Petrescu'
            }
        ],
        images: [
            {
                thumb: 'resources/images/7.jpg',
            }
        ]
        }
    ];*/

})();