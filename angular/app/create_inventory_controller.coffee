module.exports = ['$scope', '$state', 'InventoryModel', ($scope, $state, InventoryModel) ->

        getTypes = ->
                InventoryModel.get_types()
                        .then((result) ->
                                $scope.types = result.data
                                )
        getTypes()

        getManufacturers = ->
                InventoryModel.get_manufacturers()
                        .then((result) ->
                                $scope.manufacturers = result.data
                                )
        getManufacturers()
        
        $scope.submitForm = (item)->
                InventoryModel.create(item)
                        .then((result) ->
                                console.log(result)
                                $state.go('inventory.list')
                                )
                return
        @
        ]
