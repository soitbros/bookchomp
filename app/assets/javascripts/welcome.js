var app = angular.module('Testy', []);

app.controller('PostsController', ['$scope', '$http', function($scope, $http){
  $http.get('/posts').then(function(response){
    var data = response.data;
    $scope.posts = data.posts;
  });

  // $scope.newPost = {};

  // $scope.createPost = function(){
  //   $http.post('/posts', {post: $scope.newPost}).then(function(response){
  //     var data = response.data;
  //     $scope.posts.push( data );
  //   });
  // };

}]);
