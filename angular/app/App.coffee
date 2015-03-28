module = angular.module('App', ['ui.router', 'App.Authentication'])

module.config ($urlRouterProvider, $rootScope) ->

        # Default URL
        $urlRouterProvider.otherwise("/inventory")

        # Global catching of ui error for dev
        $rootScope.$on 'stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
                console.log(event, toState, toParams, fromState, fromParams, error)

module.run () ->
