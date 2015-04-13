var filters = angular.module('Filters', []);

filters.filter('date_time', function () {
  return function (date_time) {
    return moment(date_time).format('L h:mm A');
  };
});


filters.filter('handle_null', function () {
  return function (item) {
    return item || 'N/A';
  };
});
