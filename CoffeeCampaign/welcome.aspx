<%@ Page Language="C#" AutoEventWireup="true" CodeFile="welcome.aspx.cs" Inherits="welcome" %>

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
<body class="zero">

<div class="row-fluid">
    <div class="container">
        
    <div class="span12 contwelcome">
        
        <div class="span4">
            <div class="welcometext">
                <h1>Bienvenido Sr.</h1>
                <h2>{{nombre}}</h2>
                <p>
                    Esperamos que este disfrutando de un buen café o un té en su nueva taza. </br> </br>
                    Mientras se toma un tiempo, lo invitamos a conocernos
                </p>
            </div>
        </div>

        <div class="span8">
            <div class="videoWrapper">
                <iframe class="vimeo" id="player_1" src="//player.vimeo.com/video/97939674?api=1&amp;player_id=player_1" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
            </div>
        </div>
    </div>
        
    </div>





    <!--
        <div class="span5">
            <div class="welcometext">
                <h1>Bienvenido Sr.</h1>
                <h2>{{nombre}}</h2>
                <p>
                    Esperamos que este disfrutando de un buen café o un té en su nueva taza. </br>
                    Mientras se toma un tiempo, lo invitamos a conocernos
                </p>
            </div>
        </div>

        <div class="span7">
            <div class="videoWrapper">
                <iframe class="vimeo" id="player_1" src="//player.vimeo.com/video/99371686?api=1&amp;player_id=player_1" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
            </div>
        </div>
    </div>
    -->



    
    
</div>
    

    



<!-- scripts -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/script.js"></script>
    <script src="assets/js/angular.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/bootstrap-dialog.js"></script>
    <script src="assets/js/pages/index.js"></script>
    <script src="assets/js/modernizr.js"></script>
    <script src="assets/js/froogaloop.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('iframe.vimeo').each(function () {
                Froogaloop(this).addEvent('ready', ready);
            });

            function ready(playerID) {
                Froogaloop(playerID).addEvent('play', play);
                Froogaloop(playerID).addEvent('finish', onFinish);
                Froogaloop(playerID).api('play');
            }

            function play(playerID) {
                //alert(playerID + " is playing!!!");
            }

            

            function onFinish(playerID) {
                document.location.href = "contenido.html";
            }
        });  
    </script>
 <!-- end scripts -->

</body>
</html>
