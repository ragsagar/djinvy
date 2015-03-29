ngModule = angular.module('app', ['ui.router'])
ngModule.config ['$httpProvider', '$stateProvider', '$urlRouterProvider', '$interpolateProvider', ($httpProvider, $stateProvider, $urlRouterProvider, $interpolateProvider) ->

        $stateProvider
                .state 'inventory_list', {
                        url: '/list',
                        controller: 'InventoryListCtrl',
                        templateUrl: '/static/angular/templates/list_inventory.html'
                        }
                .state 'inventory_list.item', {
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

ngModule.controller('InventoryListCtrl', ['$scope', 'InventoryModel', ($scope, InventoryModel) ->

        getItems = () ->
                InventoryModel.all()
                        .then((result) ->
                                $scope.items = result.data
                                )
        getItems()

        $scope.selectItem = (selected_item) ->
                for item in $scope.items
                        item.selected = false
                        item.selected = true if selected_item is item
                return

        @
])

ngModule.controller('InventoryDetailCtrl', ['$scope', '$stateParams', 'InventoryModel', ($scope, $stateParams, InventoryModel) ->
        getItem = (item_pk) ->
                InventoryModel.fetch(item_pk)
                        .then((result) ->
                                $scope.item = result.data
                                )
        getItem($stateParams.item)
        @
])
        
ngModule.service('InventoryModel', ['$http', ($http) ->

        getUrl = () ->
                return '/inventory/items/'

        getUrlForId = (itemId) ->
                return getUrl() + itemId

        @.all = () ->
                return $http.get(getUrl())

        @.fetch = (itemId) ->
                return $http.get(getUrlForId(itemId))
        @
])
module.exports = ngModule
