module.exports = ['$scope', 'InventoryModel', ($scope, InventoryModel) ->

        getItems = () ->
                InventoryModel.all()
                        .then((result) ->
                                $scope.items = result.data
                                )
        getItems()

        $scope.selectItem = (selected_item) ->
                for item in $scope.items
                        item.selected = false
                        item.selected = true if selected_item is item
                return

        @
        ]
