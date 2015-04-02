module.exports = ['$http', ($http) ->

        @.login = (username, password) ->
                data = username: username, password: password
                $http.post('/inventory/auth/login', data)

        @.getUser = () ->
                $http.get('/inventory/auth/user')
        
        @

        ]
