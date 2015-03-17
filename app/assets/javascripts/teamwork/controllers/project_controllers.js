'use strict';

var projectControllers = angular.module('ProjectControllers', ['ProjectServices']);

projectControllers.controller('ProjectsIndexCtl', ['$scope', 'projectFactory',
  function ($scope, projectFactory) {
    projectFactory.projects().success(function (data) {
      $scope.projects = data;
    });
  }]);

projectControllers.controller('ProjectsAllCtl', ['$scope', 'projectFactory',
  function ($scope, projectFactory) {
    projectFactory.projects().success(function (data) {
      $scope.projects = data;
    });
  }]);
