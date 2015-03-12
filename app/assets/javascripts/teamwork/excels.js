"use strict";
angular.module('excelsApp', [])
    .config(["$httpProvider", function (provider) {
        provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    }])
    .controller('HelpCtl', function ($scope, $http) {
        $http.get('').success(function (data) {
            $scope.engines = data;
        });
    });
$(document).on('ready page:load', function () {
    console.log('init angular app -- excel -- '+gl_lang);
    angular.bootstrap(document.body, ['excelsApp']);
});