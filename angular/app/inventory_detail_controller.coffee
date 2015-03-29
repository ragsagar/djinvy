 module.exports = ['$scope', '$stateParams', 'InventoryModel', ($scope, $stateParams, InventoryModel) ->
        getItem = (item_pk) ->
                InventoryModel.fetch(item_pk)
                        .then((result) ->
                                $scope.item = result.data
                                )
        getItem($stateParams.item)
        @
        ]
