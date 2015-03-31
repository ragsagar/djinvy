module.exports = ['$scope', '$stateParams', 'InventoryModel', ($scope, $stateParams, InventoryModel) ->

        $scope.errors = {}

        getTypes = ->
                InventoryModel.get_types()
                        .then((result) ->
                                $scope.types = result.data
                                )
        getTypes()

        $scope.createType = (data) ->
                InventoryModel.create_type(data)
                        .success((result) ->
                                $scope.types.push(result.data)
                                $scope.type_form.name = ''
                                )
                        .error((result) ->
                                $scope.errors.type_form = result
                                )
                return
                                
        $scope.selectItem = (item) ->
                return
        @
        ]
