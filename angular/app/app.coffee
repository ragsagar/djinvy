ngModule = angular.module('app', ['ui.router', 'ngAnimate'])
ngModule.config ['$httpProvider', '$stateProvider', '$urlRouterProvider', '$interpolateProvider', ($httpProvider, $stateProvider, $urlRouterProvider, $interpolateProvider) ->

        $stateProvider
                .state 'inventory_list', {
                        url: '/list',
                        controller: 'InventoryListCtrl',
                        templateUrl: '/static/angular/templates/list_inventory.html'
                        }
                .state 'create_inventory', {
                        url: '/create',
                        controller: 'CreateInventoryCtrl',
                        templateUrl: '/static/angular/templates/inventory_create_form.html',
                        }
                .state 'inventory_item', {
                        url: '/:item',
                        controller: 'InventoryDetailCtrl',
                        templateUrl: '/static/angular/templates/inventory_item.html',
                        }
        # Default URL
        $urlRouterProvider.otherwise("/list");

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
        
ngModule.service('InventoryModel', require('./inventory_service.coffee'))
module.exports = ngModule
