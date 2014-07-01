<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Tómese un Tiempo</title>

    <link rel="shortcut icon" href="assets/img/favicon.ico">
    
    <!-- styles -->
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
    <link rel="stylesheet" href="assets/css/normalize.css">
    <!--<link rel="stylesheet" href="assets/css/font-awesome.css.css"> -->
    <!-- end styles -->
</head>
<body ng-app="index" class="zero">
    <div class="container titlebox"><p>Tómese un Tiempo</p></div>
    <div class="container boxlogin">
        <div ng-controller="IndexController">
            <div class="control-group">
                <label class="control-label textlogin" for="codigo">Por favor ingrese su código</label>
                <div class="controls">
                    <input ng-model="codigo" class="inputText" type="password" placeholder="Digite el código" />
                </div>
                <div class="example"><img src="assets/img/example.png" alt=""></div>
                <div class="card"><img src="assets/img/card.png" alt=""></div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <input type="button" class="btn-me" ng-click="codeValidation()" value="Entrar"/>
                </div>
            </div>


        </div>
    </div>

    <!-- scripts -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/script.js"></script>
    <script src="assets/js/angular.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/bootstrap-dialog.js"></script>
    <script src="assets/js/pages/index.js"></script>
    <script src="assets/js/modernizr.js"></script>
    <!-- end scripts -->

</body>
</html>
