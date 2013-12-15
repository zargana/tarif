<?php
session_start();

//oturumAcildi session değişkeni daha önce oluşturulmuş mu? oluşturulmuşsa değeri 1 yapılmış mı?
//bu bize daha önce üye girişinin yapılıp yapılmadığını belirtir.
if( !( isset($_SESSION['oturumAcildi']) && $_SESSION['oturumAcildi'] == 1 ) ){
    header('Location: login.php');
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Yönetim anasayfa</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
</head>
<body>
    
<div id="menu" style="width:200px; min-height: 400px; float: left; background: #ccffcc">
<?php
include_once 'inc/menu.php';
?>
</div>

<div id="icerik" style="width:600px; min-height: 600px; float: left; background: #ffff99">
    içerik
</div>

</body>
</html>
