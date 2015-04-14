'use strict';

var teamworkControllers = angular.module('TeamworkControllers', ['Devise']);

teamworkControllers.controller('TeamworkNavbarCtrl', ['$scope', '$window', 'Auth',
  function ($scope, $window, Auth) {
    $scope.auth = Auth;

    $scope.$on('devise:logout', function () {
      $window.location.href = "/#/users/sign_in";
    });
  }]);
