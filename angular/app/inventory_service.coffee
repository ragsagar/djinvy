module.exports = ['$http', ($http) ->

        getItemsUrl = ->
                return '/inventory/items/'

        getItemsUrlForId = (itemId) ->
                return getItemsUrl() + itemId

        getTypesUrl = ->
                return '/inventory/types/'

        getManufacturersUrl = ->
                return '/inventory/manufacturers/'

        getTypesUrlForId = (itemId) ->
                return getTypesUrl() + itemId

        @.all = ->
                return $http.get(getItemsUrl())

        @.fetch = (itemId) ->
                return $http.get(getItemsUrlForId(itemId))

        @.create = (data) ->
                return $http.post(getItemsUrl(), data)

        @.get_types = ->
                return $http.get(getTypesUrl())

        @.create_type = (data) ->
                return $http.post(getTypesUrl(), data)

        @.get_manufacturers = ->
                return $http.get(getManufacturersUrl())
        @
        ]
