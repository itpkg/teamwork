'use strict';

var projectControllers = angular.module('projectControllers', []);

projectControllers.controller('ProjectsIndexCtl', ['$scope', '$http',
  function ($scope, $http) {
    $scope.projects = [
      {users: 2, stories: 3, description: 'ds: Ruby is awesome!', name: 'Ruby'},
      {users: 2, stories: 3, description: 'ds: Rails is awesome!', name: 'Rails'},
      {users: 2, stories: 3, description: 'ds: JavaScript is awesome!', name: 'JavaScript'}
    ];
  }]);

projectControllers.controller('ProjectsAllCtl', ['$scope', '$http',
  function ($scope, $http) {
    $scope.projects = [
      {users: 2, stories: 3, name: 'Ruby'},
      {users: 2, stories: 3, name: 'Rails'},
      {users: 2, stories: 3, name: 'JavaScript'}
    ];
  }]);
