module.exports = ['$scope', '$state', 'InventoryModel', ($scope, $state, InventoryModel) ->

        getItems = () ->
                InventoryModel.all()
                        .then((result) ->
                                $scope.items = result.data
                                )
        getItems()


        $scope.selectItem = (selected_item) ->
                $state.go('inventory.detail', {item: selected_item.pk})
                return

        @
        ]
