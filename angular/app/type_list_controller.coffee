module.exports = ['$scope', '$stateParams', 'InventoryModel', ($scope, $stateParams, InventoryModel) ->

        getTypes = ->
                InventoryModel.get_types()
                        .then((result) ->
                                $scope.types = result.data
                                )
        getTypes()
                                
        $scope.selectItem = (item) ->
                return
        @
        ]
