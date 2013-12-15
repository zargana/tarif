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
    <title>Yönetim - İletişim işlemleri</title>
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
$islem = $_GET['islem'];
$id = $_GET['id'];
$id = (int)$id;

if( $islem == 'detay' ){
    $sql = "SELECT * FROM iletisim WHERE id_iletisim = $id";
    $mesaj = $DB->get_row( $sql );
    
    if( empty( $mesaj ) ){
        echo 'Mesaj bulunamadı..';
    }else{
        echo $mesaj->id;
        echo '<br />';
        
        $sql2 = "SELECT ad FROM iletisim_kategori WHERE id_iletisim_kategori = " . $mesaj->id_iletisim_kategori;
        $kategoriAd = $DB->get_var( $sql2 );
        
        echo $kategoriAd;
        echo '<br />';        
        
        echo $mesaj->baslik;
        echo '<br />';
        
        echo $mesaj->mesaj;
        echo '<br />';

        
        echo $mesaj->ad;
        echo '<br />';
        
        echo $mesaj->soyad;
        echo '<br />';
        
        echo $mesaj->email;
        echo '<br />';
        
        echo $mesaj->tarih;
        echo '<br />';
        
        echo $mesaj->ip;
        echo '<br />';
        
        if ( !empty( $mesaj->dosya1 ) ){
            echo '<a href="../dosyalar/'.$mesaj->dosya1.'"> '.$mesaj->dosya1.'  </a>';
        }
        
    }
}

if( $islem == 'sil' ){
    $sql4 = "SELECT dosya1 FROM iletisim WHERE id_iletisim = $id;";
    $dosya1Ad = $DB->get_var( $sql4 );

    $sql3 = "DELETE FROM iletisim WHERE id_iletisim = $id";
    $DB->query( $sql3 );
    
    unlink( '../dosyalar/' . $dosya1Ad );
    
    echo 'Mesaj silindi.';
}
?>
    
</div>

</body>
</html>
