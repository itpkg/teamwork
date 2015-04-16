'use strict';

var projectControllers = angular.module('ProjectControllers', ['ProjectServices']);

projectControllers.controller('ProjectsIndexCtl', ['$scope', 'projectFactory',
  function ($scope, projectFactory) {
    projectFactory.projects().success(function (data) {
      $scope.projects = data;
    });
  }]);

projectControllers.controller('ProjectsListCtl', ['$scope', 'projectFactory',
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

    $scope.blank_name = false;

    $scope.$watch('project.name', function (newValue, oldValue) {
      if (newValue != oldValue) {
        newValue === '' ? $scope.blank_name = true : $scope.blank_name = false;
      }
    });

    $scope.createProject = function () {
      if ($scope.project.name === '') {
        $scope.blank_name = true;
        return;
      }

      projectFactory.create_project($scope.project).success(function (data) {
        $location.path('/projects/' + data.project.id).search();
      });
    };
  }]);

projectControllers.controller('ProjectsShowCtl', ['$scope', '$routeParams', '$window', '$location', 'projectFactory',
  function ($scope, $routeParams, $window, $location, projectFactory) {
    $scope.hide_info    = $routeParams.hide_info;
    $scope.hide_stories = $routeParams.hide_stories;
    $scope.hide_members = $routeParams.hide_members;

    $scope.current_datetime = function() {
      return moment().format('L h:mm A');
    };

    $scope.flags = {
      hide_story_form_modal_flag: false,
      title_blank: false
    };

    $scope.new_story = {
      title: '',
      point: 1,
      tags: '',
      plan_start_time: $scope.current_datetime(),
      plan_finish_time: $scope.current_datetime(),
      description: ''
    };

    $scope.new_members = [];

    projectFactory.get_project($routeParams.id).success(function (data) {
      $scope.project = data.project;
      $scope.stories = data.stories;
      $scope.members = data.members;
      $scope.users   = data.users;
      $scope.tags    = data.tags;
      $scope.project_copy = angular.copy($scope.project);
      $scope.new_story.project_id = $scope.project.id;
    });

    $scope.get_tags = function () {
      projectFactory.get_tags($routeParams.id).success(function (data) {
        $scope.tags = data.tags;
      });
    };

    $scope.reset_new_story = function () {
      $scope.new_story = {
        title: '',
        point: 1,
        tags: '',
        plan_start_time: $scope.current_datetime(),
        plan_finish_time: $scope.current_datetime(),
        description: '',
        project_id: $scope.project.id
      };

      $scope.flags.title_blank = false;
      $scope.flags.hide_story_form_modal_flag = false;
      $scope.$apply();
    };

    $scope.update_project = function () {
      if ($scope.project_copy.name === '') {
        alert('Project name cannot be blank!');
        return false;
      }

      projectFactory.update_project($scope.project_copy).success(function () {
        $window.location.reload();
      });
    };

    $scope.delete_project = function () {
      if (confirm('Are you sure to delete this project?')) {
        projectFactory.delete_project($scope.project).success(function () {
          $location.path('#/projects');
        });
      }
    };

    $scope.add_this_user = function (id) {
      var index = $scope.new_members.indexOf(id);

      if (index === -1) {
        $scope.new_members.push(id);
      } else {
        $scope.new_members.splice(index, 1);
      }
    };

    $scope.add_members = function () {
      projectFactory.add_members($scope.project, $scope.new_members).success(function () {
        $window.location.reload();
      });
    };

    $scope.remove_member = function (member) {
      if (confirm('Are you sure to remove this member from this project?')) {
        projectFactory.remove_member($scope.project, member).success(function () {
          var index = $scope.members.indexOf(member);
          $scope.members.splice(index, 1);
          $scope.users.push(member);
        });
      }
    };
  }]);

projectControllers.controller('ProjectsEditCtl', ['$scope', '$routeParams', '$location', 'projectFactory',
  function ($scope, $routeParams, $location, projectFactory) {
    projectFactory.get_project($routeParams.id).success(function (data) {
      $scope.project = data.project;
      $scope.project_for_edit = angular.copy($scope.project)
    });

    $scope.update_project = function () {
      projectFactory.update_project($scope.project_for_edit).success(function () {
        $location.path('/projects/' + $scope.project.id).search();
      });
    };
  }]);
