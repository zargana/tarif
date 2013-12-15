<?php
include_once 'config.php';
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
    <form action="iletisim_gonder.php" method="POST" enctype="multipart/form-data">
        Ad: <input type="text" name="ad" value="" placeholder="Adınızı girin.." size="25" maxlength="25" />
        <br />
        Soyad: <input type="text" name="soyad" value="" placeholder="Soyadınızı girin.." />
        <br />
        Email: <input type="text" name="email" value="" placeholder="Email adresinizi girin.." />
        <br />
        Kategori: 
        <?php
        $sql = "SELECT * FROM iletisim_kategori;";
        
        $kategoriler = $DB->get_results( $sql );
        ?>
        <select name="id_kategori">
            <option value="">Seçiniz..</option>
            
            <?php
            foreach($kategoriler as $kategori){
            ?>
                <option value="<?php echo $kategori->id_iletisim_kategori ?>">
                <?php echo $kategori->ad; ?>
                </option>
            <?php
            }
            ?>
            
        </select>
        
        <br />
        
        Başlık: <input type="text" name="baslik" value="" placeholder="Mesaj başlığınızı girin.." />
        <br />
        
        Mesajınız: <br />
        <textarea name="mesaj" rows="4" cols="20" placeholder="Mesajınızı girin.."></textarea>
        <br />
        
        Dosya eki 1: <input type="file" name="dosya1" value="" />
        <br />
        
        <input type="submit" value="Gönder" name="btnGonder" />
        
        
    </form>
</div>
</body>
</html>
