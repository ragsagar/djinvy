module.exports = ['$scope', 'LoginApi', ($scope, LoginApi) ->
        $scope.cancel = $scope.dismiss

        $scope.submit = (username, password) ->
                LoginApi.login(username, password)
                        .success((user) ->
                                $scope.$close user
                                return
                                )
                        .error((response) ->
                                $scope.errors = response
                                return
                                )
                return
        @
]
