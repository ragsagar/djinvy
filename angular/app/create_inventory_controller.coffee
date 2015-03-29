module.exports = ['$scope', '$state', 'InventoryModel', ($scope, $state, InventoryModel) ->

        $scope.submitForm = (item)->
                InventoryModel.create(item)
                        .then((result) ->
                                console.log(result)
                                $state.go('inventory_list')
                                )
                return
        @
        ]
