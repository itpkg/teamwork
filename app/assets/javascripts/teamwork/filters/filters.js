var filters = angular.module('Filters', []);

filters.filter('date_time', function () {
  return function (date_time) {
    return moment(date_time).format('L h:mm A');
  };
});

filters.filter('start_time', function () {
  return function (date_time) {
    return date_time == undefined ? 'Not Started' : moment(date_time).format('L h:mm A');
  };
});

filters.filter('finish_time', function () {
  return function (date_time) {
    return date_time == undefined ? 'Not Finished' : moment(date_time).format('L h:mm A');
  };
});

filters.filter('handle_null', function () {
  return function (item) {
    return item || 'N/A';
  };
});
