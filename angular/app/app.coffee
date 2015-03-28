angular = require('angular')
ngModule = angular.module('app', ['ui.router'])

ngModule.config ($urlRouterProvider, $rootScope) ->

        # Default URL
        $urlRouterProvider.otherwise("/");


        # Global catching of ui error for dev
        $rootScope.$on 'stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
                console.log(event, toState, toParams, fromState, fromParams, error)

ngModule.run () ->

