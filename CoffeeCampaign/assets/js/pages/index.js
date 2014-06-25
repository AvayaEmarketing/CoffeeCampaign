var app = angular.module('index', []);

app.controller('IndexController', function ($scope, $http) {
    
    $scope.codeValidation = function () {
        $http({
            method: 'POST', url: "index.aspx/codeValidation", contentType: 'application/json; charset=utf-8', data: { code: $scope.codigo }
        }).success(function (data, status) {
            if (data.d === "ok") {
                document.location.href = "welcome.aspx?code=" + $scope.codigo;
            } else {
                message("Código no registrado, por favor verifiquelo", "Atención", "danger");
            }
        });
    };

});




