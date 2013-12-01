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
$sql    ="SELECT * FROM kullanici";

//veritabanına select sorgusu yapılıyor
$sonuclar = mysqli_query( $dbBaglanti, $sql );

//gelen sonuclar döngü içinde yazdırılıyor
while( $kayit = mysqli_fetch_array( $sonuclar ) )
{
    echo $kayit['password'] . ' - '  .$kayit['email'];
    echo "<br>";
}

//mysql bağlantısı sonlandırılıyor
mysqli_close( $dbBaglanti );