<%@ Page Language="C#" AutoEventWireup="true" CodeFile="welcome.aspx.cs" Inherits="welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="assets/js/jquery.js"></script>
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
</head>
<body>

    <iframe class="vimeo" id="player_1" src="//player.vimeo.com/video/97939674?api=1&amp;player_id=player_1" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</body>
</html>
