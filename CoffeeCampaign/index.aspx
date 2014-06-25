<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/angular.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/bootstrap-dialog.js"></script>
    <script src="assets/js/pages/index.js"></script>
</head>
<body ng-app="index">
    <div class="container">
        <div class="form-horizontal" ng-controller="IndexController">
            <div class="control-group">
                <label class="control-label" for="codigo"><span style="color: #cc0000;">*</span>Digite el código:</label>
                <div class="controls">
                    <input ng-model="codigo" type="text" placeholder="Digite el código" />
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <input type="button" class="btn btn-default" ng-click="codeValidation()" value="Aceptar"/>
                </div>
            </div>


        </div>
    </div>
</body>
</html>
