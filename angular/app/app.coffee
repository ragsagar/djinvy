ngModule = angular.module('app', ['ui.router', 'ngAnimate'])
ngModule.config ['$httpProvider', '$stateProvider', '$urlRouterProvider', '$interpolateProvider', ($httpProvider, $stateProvider, $urlRouterProvider, $interpolateProvider) ->

        $stateProvider
                .state 'inventory', {
                        url: '/items',
                        abstract: true,
                        template: '<div ui-view class="slide"></div>'
                        }
                .state 'inventory.list', {
                        url: '/list',
                        controller: 'InventoryListCtrl',
                        templateUrl: '/static/angular/templates/list_inventory.html'
                        }
                .state 'inventory.create', {
                        url: '/create',
                        controller: 'CreateInventoryCtrl',
                        templateUrl: '/static/angular/templates/inventory_create_form.html',
                        }
                .state 'inventory.detail', {
                        url: '/:item',
                        controller: 'InventoryDetailCtrl',
                        templateUrl: '/static/angular/templates/inventory_item.html',
                        }
                .state 'types', {
                        url: '/types',
                        abstract: true,
                        template: '<div ui-view></div>'
                        }
                .state 'types.list', {
                        url: '/list',
                        controller: 'TypeListCtrl',
                        templateUrl: '/static/angular/templates/list_types.html',
                        }
        # Default URL
        $urlRouterProvider.otherwise("/items/list");

        # Changing the template symbol to not conflic with django
        $interpolateProvider.startSymbol('<[');
        $interpolateProvider.endSymbol(']>');


        # Required for csrf check
        $httpProvider.defaults.xsrfCookieName = 'csrftoken';
        $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
        $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

        
        # Global catching of ui error for dev
        # $rootScope.$on 'stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
                # console.log(event, toState, toParams, fromState, fromParams, error)
]

ngModule.run () ->

ngModule.controller('InventoryListCtrl', require('./inventory_list_controller.coffee'))
ngModule.controller('InventoryDetailCtrl', require('./inventory_detail_controller.coffee'))
ngModule.controller('CreateInventoryCtrl', require('./create_inventory_controller.coffee'))
ngModule.controller('TypeListCtrl', require('./type_list_controller.coffee'))
        
ngModule.service('InventoryModel', require('./inventory_service.coffee'))
module.exports = ngModule
