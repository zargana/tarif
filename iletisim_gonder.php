<?php
include_once 'config.php';

//atamalar

//formdan gelen veri
$ad = $_POST['ad'];
$soyad = $_POST['soyad'];
$email = $_POST['email'];
$id_kategori = $_POST['id_kategori'];
$baslik = $_POST['baslik'];
$mesaj = $_POST['mesaj'];

$dosya1 = $_FILES['dosya1'];

//phpnin ürettiği veri
$tarih = date('Y-m-d H:i:s');
$ip = $_SERVER['REMOTE_ADDR'];

//kontroller
$hataMesaj = array();
if( empty( $ad ) ){
    $hataMesaj[] = 'Ad boş bırakılamaz.';
}

if( empty( $soyad ) ){
    $hataMesaj[] = 'Soyad boş bırakılamaz.';
}

if( strlen($ad)>25 || strlen($soyad)>25 ){
    $hataMesaj[] = 'Ad ve soyad 25 karakterden büyük olamaz.';
}

if( empty( $email ) ){
    $hataMesaj[] = 'Email boş bırakılamaz.';
}

if( strlen($email)>100 ){
    $hataMesaj[] = 'Email 100 karakterden büyük olamaz.';
}

if( empty( $id_kategori ) ){
    $hataMesaj[] = 'Kategori boş bırakılamaz.';
}

if( !is_integer(  (int)$id_kategori) ){
    $hataMesaj[] = 'Kategori hatalı.';
}

if( empty( $baslik ) ){
    $hataMesaj[] = 'Başlık boş bırakılamaz.';
}

if( strlen($baslik)>255 ){
    $hataMesaj[] = 'Başlık 255 karakterden büyük olamaz.';
}

if( empty( $mesaj ) ){
    $hataMesaj[] = 'Mesaj boş bırakılamaz.';
}

if( strlen($mesaj)>1000 ){
    $hataMesaj[] = 'Başlık 1000 karakterden büyük olamaz.';
}

//dosya türü kontrolü örneği için bkz. http://www.w3schools.com/php/php_file_upload.asp
if( !empty( $dosya1 ) && $dosya1['size'] > 3 * 1024 * 1024 ){
    $hataMesaj[] = 'Dosya boyutu 3MB den büyük olamaz.';
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>İletişim formu</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
</head>
<body>
<div>
    <?php 
        //hata varsa hataları yazdıracak
        if(count($hataMesaj)>0 ){
            foreach ($hataMesaj as $hata){
                echo $hata;
                echo '<br />';
            }
        }else{
            move_uploaded_file($dosya1['tmp_name'], 'dosyalar/' . $dosya1['name'] );
            
            $sql = "INSERT INTO "
                    . "iletisim(ad,soyad,email,id_iletisim_kategori,baslik,mesaj,tarih,ip,dosya1) "
                    . "VALUES('$ad', '$soyad', '$email', $id_kategori, '$baslik', '$mesaj', '$tarih', '$ip', '".$dosya1['name']."')";
            
            $sonuc = $DB->query( $sql);
            if($sonuc==1){
                echo 'Kayıt başarılı..';
            }else{
                echo 'Kayıt esnasında bir hata oluştu.';
                echo '<br />';
                echo 'Hata mesajı: <br />';
                echo $DB->last_error;
            }
        }
    ?>
</div>
</body>
</html>