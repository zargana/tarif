<?php
session_start();

//oturumAcildi session değişkeni daha önce oluşturulmuş mu? oluşturulmuşsa değeri 1 yapılmış mı?
//bu bize daha önce üye girişinin yapılıp yapılmadığını belirtir.
if( !( isset($_SESSION['oturumAcildi']) && $_SESSION['oturumAcildi'] == 1 ) ){
    header('Location: login.php');
    exit;
}

require_once '../config.php';
?>
<!DOCTYPE html>
<html>
<head>
    <title>Yönetim - İletişim mesajları</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
</head>
<body>
    
<div id="menu" style="width:200px; min-height: 400px; float: left; background: #ccffcc">
    <ul>
        <li><a href="index.php">Anasayfa</a></li>
        <li><a href="iletisim.php">İletişim mesajları</a></li>
    </ul>
</div>

<div id="icerik" style="width:600px; min-height: 600px; float: left; background: #ffff99">

    <?php
    $sql = "SELECT * FROM iletisim";
    $mesajlar = $DB->get_results( $sql );
    
    if( count( $mesajlar ) == 0 ){
        echo 'Hiç mesaj yok';
    }else{
        
        foreach ($mesajlar as $mesaj) {
            echo $mesaj->baslik;
            echo '<br />';
        }
        
    }
    
    ?>
    
</div>

</body>
</html>
