'use strict';

var storyControllers = angular.module('StoryControllers', ['StoryServices']);

storyControllers.controller('ProjectStoriesCtl', ['$scope', 'storyFactory',
  function ($scope, storyFactory) {
    $scope.story_status = function (status_id) {
      var status = '';

      switch(status_id) {
        case 0:
          status = 'submit';
          break;
        case 1:
          status = 'processing';
          break;
        case 2:
          status = 'finish';
          break;
        case 3:
          status = 'reject';
          break;
        case 9:
          status = 'done';
          break;
        default:
      }

      return status;
    };

    $scope.create_story = function () {
      if ($scope.new_story.title.trim() === '') {
        $scope.flags.title_blank = true;
        return false;
      }

      $scope.new_story.plan_start_time  = moment($scope.new_story.plan_start_time).format();
      $scope.new_story.plan_finish_time = moment($scope.new_story.plan_finish_time).format();

      storyFactory.create_story($scope.new_story).success(function (data) {
        $scope.$parent.flags.hide_story_form_modal_flag = true;
        $scope.$parent.$parent.get_tags();
        $scope.stories.push(data.story);
      });
    };

    $scope.update_story_status = function (story, status) {
      story.status = $scope.story_status(status);

      storyFactory.update_story_status(story, status)
    };
  }]);

storyControllers.controller('StoriesShowCtl', ['$scope', '$routeParams', '$window', '$location', 'storyFactory',
  function ($scope, $routeParams, $window, $location, storyFactory) {
    $scope.flags = {
      comment_error: false,
      invalid_story_progress: false,
      blank_comment: false
    };

    $scope.formatStoryDateTime = function () {
      $scope.story.plan_start_time  = moment($scope.story.plan_start_time).format('L h:mm A');
      $scope.story.plan_finish_time = moment($scope.story.plan_finish_time).format('L h:mm A');
      $scope.story.real_start_time  = moment($scope.story.real_start_time).format('L h:mm A');
      $scope.story.real_finish_time = moment($scope.story.real_finish_time).format('L h:mm A');
    };

    $scope.formatTags = function () {
      $scope.story.tags = [];

      $scope.story.story_tags.forEach(function (element) {
        $scope.story.tags.push(element.id);
      });

      $scope.story.project_tags.forEach(function (element) {
        element.text = element.name;
      });
    };

    $scope.sync_story_for_edit = function () {
      $scope.story_for_edit = angular.copy($scope.story);
      $scope.$apply();
    };

    storyFactory.get_story($routeParams.id).success(function (data) {
      $scope.story              = data.story;
      $scope.story.project      = data.project;
      $scope.story.story_tags   = data.tags;
      $scope.story.project_tags = data.project_tags;
      $scope.story.comments     = data.comments;

      $scope.formatStoryDateTime();
      $scope.formatTags();
      $scope.sync_story_for_edit();

      $scope.new_comment = {
        story_id: $scope.story.id,
        content: '',
        new_progress: $scope.story.progress
      };
    });

    $scope.update_story = function () {
      delete $scope.story_for_edit['project'];
      delete $scope.story_for_edit['project_tags'];
      delete $scope.story_for_edit['story_tags'];
      delete $scope.story_for_edit['comments'];

      $scope.story_for_edit.plan_start_time  = moment($scope.story_for_edit.plan_start_time).format();
      $scope.story_for_edit.plan_finish_time = moment($scope.story_for_edit.plan_finish_time).format();
      $scope.story_for_edit.real_start_time  = moment($scope.story_for_edit.real_start_time).format();
      $scope.story_for_edit.real_finish_time = moment($scope.story_for_edit.real_finish_time).format();

      storyFactory.update_story($scope.story_for_edit).success(function () {
        $window.location.reload();
      });
    };

    $scope.delete_story = function () {
      if (confirm('Are you sure to delete this story?')) {
        storyFactory.delete_story($scope.story).success(function () {
          $location.path('/projects/' + $scope.story.project.id).search();
        });
      }
    };

    $scope.add_comment = function () {
      $scope.flags.comment_error = false;
      $scope.flags.invalid_story_progress = false;
      $scope.flags.blank_comment = false;

      var new_progess = parseInt($scope.new_comment.new_progress);

      if (isNaN(new_progess) || new_progess < 0 || new_progess > 100) {
        $scope.flags.invalid_story_progress = true;
        $scope.flags.comment_error = true;
      }

      if ($scope.new_comment.content.trim() === '') {
        $scope.flags.blank_comment = true;
        $scope.flags.comment_error = true;
      }

      if ($scope.flags.comment_error) {
        return false;
      }

      storyFactory.add_comment($scope.new_comment).success(function () {
        $window.location.reload();
      });
    };
  }]);