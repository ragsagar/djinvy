require('ui-router')
ngModule = angular.module('app', ['ui.router'])
ngModule.config ($httpProvider, $stateProvider, $urlRouterProvider, $interpolateProvider) ->

        # Default URL
        $urlRouterProvider.otherwise("/home");

        $stateProvider
                .state 'home', {
                        url: '/home',
                        controller: 'HomeCtrl',
                        }

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


ngModule.run () ->

ngModule.controller('HomeCtrl', ($scope, InventoryModel) ->

        getItems = () ->
                InventoryModel.all()
                        .then((result) ->
                                console.log(result)
                                $scope.items = result.data
                                )
        getItems()
        
        return null
)

ngModule.service('InventoryModel', ($http) ->

        getUrl = () ->
                return '/inventory/items/'

        getUrlForId = (itemId) ->
                return getUrl() + itemId

        @.all = () ->
                return $http.get(getUrl())
                
        @
)
module.exports = ngModule
