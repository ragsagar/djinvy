module.exports = ['$scope', '$state', 'InventoryModel', ($scope, $state, InventoryModel) ->
        $scope.errors = {}

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
                        .success((result) ->
                                $state.go('inventory.list')
                                )
                        .error (result) ->
                                $scope.errors = result
                                
                return

        $scope.cancel = () ->
                $state.go('inventory.list')
                
        @
        ]
