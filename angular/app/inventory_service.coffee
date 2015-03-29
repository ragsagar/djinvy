module.exports = ['$http', ($http) ->

        getUrl = ->
                return '/inventory/items/'

        getUrlForId = (itemId) ->
                return getUrl() + itemId

        @.all = ->
                return $http.get(getUrl())

        @.fetch = (itemId) ->
                return $http.get(getUrlForId(itemId))

        @.create = (data) ->
                return $http.post(getUrl(), data)
        @
        ]
