module.exports = ['$modal', '$rootScope', ($modal, $rootScope) ->
        assignCurrentUser = (user) ->
                $rootScope.currentUser = user
                user

        () ->
                instance = $modal.open {
                        templateUrl: '/static/angular/templates/login_modal_template.html',
                        controller: 'LoginModalCtrl',
                        controllerAs: 'LoginModalCtrl',
                        }
                instance.result.then assignCurrentUser
]
