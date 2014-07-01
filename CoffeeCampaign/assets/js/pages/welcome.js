var app = angular.module('welcome', []);

app.controller('WelcomeController', function ($scope, $http) {
    $scope.codigo = QueryString.code;
        $http({
            method: 'POST', url: "welcome.aspx/getNombre", contentType: 'application/json; charset=utf-8', data: { code: $scope.codigo }
        }).success(function (data, status) {
            if (data.d !== "fail") {
                $scope.nombre = data.d;
            } else {
                $scope.nombre = "Estimado";
            }
            
        });

});