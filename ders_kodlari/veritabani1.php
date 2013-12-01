<?php
error_reporting( 1 );

//bir veritabanı bağlantı nesnesi oluşturuldu
$dbBaglanti = mysqli_connect("localhost","root","","lezizzo");

//bağlantıda hata olup olmadığı kontrol ediliyor
if( mysqli_connect_errno() )
{
    echo "MySQL sunucusuna bağlantıda sorun oluştu: " . mysqli_connect_error();
    exit();
}

//sql ifadesi yazılıyor
$sql    ="INSERT INTO kullanici (id_kullanici_rol, email, password, status) "
        . "VALUES ( 2, 'editor2@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1)";

//sql komutu mysql sunucuda çalıştırılıyor ve hata varsa yazdırılıyor, yoksa başarılı 
if ( !mysqli_query( $dbBaglanti, $sql ) )
{
    echo 'Hata oluştu: ' . mysqli_error( $dbBaglanti ) ;
}
else{
    echo "Kayıt eklendi.";    
}

//mysql bağlantısı sonlandırılıyor
mysqli_close( $dbBaglanti );