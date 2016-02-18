var app = angular.module('Chomp', []);

app.controller('PostsController', ['$scope', '$http', function($scope, $http){
  $http.get('/posts').then(function(response){
    console.log(response.data);
    var data = response.data;
    $scope.posts = data.posts;
  });

}]);
