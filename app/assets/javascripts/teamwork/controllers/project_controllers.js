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

projectControllers.controller('ProjectsNewCtl', ['$scope', '$location', 'projectFactory',
  function ($scope, $location, projectFactory) {
    $scope.project = {
      name: '',
      description: ''
    };

    $scope.blankName = false;

    $scope.$watch('project.name', function (newValue, oldValue) {
      if (newValue != oldValue) {
        newValue === '' ? $scope.blankName = true : $scope.blankName = false;
      }
    });

    $scope.createProject = function () {
      if ($scope.project.name === '') {
        $scope.blankName = true;
        return;
      }

      projectFactory.create_project($scope.project).success(function (data) {
        $location.path('#/projects');
      });
    };
  }]);
