ngModule = angular.module('app', ['ui.router', 'ngAnimate', 'ui.bootstrap'])
ngModule.config ['$httpProvider', '$stateProvider', '$urlRouterProvider', '$interpolateProvider', ($httpProvider, $stateProvider, $urlRouterProvider, $interpolateProvider) ->

        $stateProvider
                .state 'inventory', {
                        url: '/items',
                        abstract: true,
                        template: '<div ui-view class="slide"></div>'
                        data : requireLogin: true,
                        }
                .state 'inventory.list', {
                        url: '/list',
                        controller: 'InventoryListCtrl',
                        templateUrl: '/static/angular/templates/inventory.list.html',
                        }
                .state 'inventory.grid', {
                        url: '/grid',
                        templateUrl: '/static/angular/templates/inventory.list.grid.html',
                        controller: 'InventoryListCtrl',
                        }
                .state 'inventory.create', {
                        url: '/create',
                        controller: 'CreateInventoryCtrl',
                        templateUrl: '/static/angular/templates/inventory.create.html',
                        }
                .state 'inventory.detail', {
                        url: '/:item',
                        controller: 'InventoryDetailCtrl',
                        templateUrl: '/static/angular/templates/inventory.detail.html',
                        }
                .state 'types', {
                        url: '/types',
                        abstract: true,
                        template: '<div ui-view></div>'
                        data: requireLogin: false,
                        }
                .state 'types.list', {
                        url: '/list',
                        controller: 'TypeListCtrl',
                        templateUrl: '/static/angular/templates/types.list.html',
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

ngModule.run ['$rootScope', '$state', 'LoginModal', ($rootScope, $state, LoginModal) ->
        $rootScope.$on('$stateChangeStart', (event, toState, toParams) ->
                requireLogin = toState.data.requireLogin
                if requireLogin and not $rootScope.currentUser?
                        event.preventDefault
                        LoginModal()
                                .then(() ->
                                        $state.go toState.name, toParams
                                ).catch(() ->
                                        $state.go 'types.list'
                                )
                return
                )
        return
        ]
                        

ngModule.controller('InventoryListCtrl', require('./inventory_list_controller.coffee'))
ngModule.controller('InventoryDetailCtrl', require('./inventory_detail_controller.coffee'))
ngModule.controller('CreateInventoryCtrl', require('./create_inventory_controller.coffee'))
ngModule.controller('TypeListCtrl', require('./type_list_controller.coffee'))
ngModule.controller('LoginModalCtrl', require('./login_modal_controller.coffee'))
        
ngModule.service('InventoryModel', require('./inventory_service.coffee'))
ngModule.service('LoginModal', require('./login_service.coffee'))
ngModule.service('LoginApi', require('./login_api_service.coffee'))
module.exports = ngModule
