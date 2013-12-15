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
<?php
include_once 'inc/menu.php';
?>
</div>

<div id="icerik" style="width:600px; min-height: 600px; float: left; background: #ffff99">

    <?php
    $sql = "SELECT * FROM iletisim";
    $mesajlar = $DB->get_results( $sql );
    
    if( count( $mesajlar ) == 0 ){
        echo 'Hiç mesaj yok';
    }else{
        echo '<table border="1">';
        echo '<tr><td>ID</td> <td>Başlık</td> <td>Ad</td> <td>Soyad</td> <td>Tarih</td> <td>İşlem</td> </tr>';
        foreach ($mesajlar as $mesaj) {
            echo '<tr>';
                echo '<td>' . $mesaj->id_iletisim . '</td>';
                echo '<td>' . $mesaj->baslik . '</td>';
                echo '<td>' . $mesaj->ad . '</td>';
                echo '<td>' . $mesaj->soyad . '</td>';
                echo '<td>' . $mesaj->tarih . '</td>';
                echo '<td><a href="iletisim_islem.php?islem=detay&id='. $mesaj->id_iletisim .'">Detay</a> | '
                        . '<a onclick="return confirm( \' Mesaj silinecek! \' );" href="iletisim_islem.php?islem=sil&id='. $mesaj->id_iletisim .'">Sil</a></td>';
            echo '</tr>';
        }
        echo '</table>';
        
    }
    
    ?>
    
</div>

</body>
</html>
