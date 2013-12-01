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
$sql    ="UPDATE kullanici "
        . "SET status=1 "
        . "WHERE id_kullanici=3;";


//veritabanına update sorgusu yapılıyor
mysqli_query($dbBaglanti, $sql);

//mysql bağlantısı sonlandırılıyor
mysqli_close( $dbBaglanti );