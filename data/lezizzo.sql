-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 08 Ara 2013, 11:30:19
-- Sunucu sürümü: 5.6.11
-- PHP Sürümü: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `lezizzo`
--
CREATE DATABASE IF NOT EXISTS `lezizzo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `lezizzo`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `iletisim`
--

CREATE TABLE IF NOT EXISTS `iletisim` (
  `id_iletisim` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(25) NOT NULL,
  `soyad` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_iletisim_kategori` int(2) NOT NULL,
  `baslik` varchar(255) NOT NULL,
  `mesaj` text NOT NULL,
  `tarih` datetime NOT NULL,
  `ip` varchar(30) NOT NULL,
  PRIMARY KEY (`id_iletisim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `iletisim_kategori`
--

CREATE TABLE IF NOT EXISTS `iletisim_kategori` (
  `id_iletisim_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(25) NOT NULL,
  PRIMARY KEY (`id_iletisim_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

CREATE TABLE IF NOT EXISTS `kullanici` (
  `id_kullanici` int(11) NOT NULL AUTO_INCREMENT,
  `id_kullanici_rol` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `status` int(1) NOT NULL COMMENT '0-pasif,1-aktif,2-yasakli',
  PRIMARY KEY (`id_kullanici`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`id_kullanici`, `id_kullanici_rol`, `email`, `password`, `status`) VALUES
(1, 1, 'hasantktl@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(2, 3, 'admin@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(3, 2, 'editor@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(4, 2, 'editor2@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(5, 1, 'uye2@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici_rol`
--

CREATE TABLE IF NOT EXISTS `kullanici_rol` (
  `id_kullanici_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(100) NOT NULL,
  PRIMARY KEY (`id_kullanici_rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Tablo döküm verisi `kullanici_rol`
--

INSERT INTO `kullanici_rol` (`id_kullanici_rol`, `rol`) VALUES
(1, 'Üye'),
(2, 'Editör'),
(3, 'Yönetici');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tarif`
--

CREATE TABLE IF NOT EXISTS `tarif` (
  `id_tarif` int(11) NOT NULL AUTO_INCREMENT,
  `id_kullanici` int(11) NOT NULL,
  `baslik` varchar(255) NOT NULL,
  `icerik` text NOT NULL,
  `olusturma_tarihi` datetime NOT NULL,
  `kisi_sayisi` int(1) DEFAULT NULL,
  `sure` int(3) DEFAULT NULL,
  `seviye` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_tarif`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Tablo döküm verisi `tarif`
--

INSERT INTO `tarif` (`id_tarif`, `id_kullanici`, `baslik`, `icerik`, `olusturma_tarihi`, `kisi_sayisi`, `sure`, `seviye`) VALUES
(1, 0, 'Zeytinyağlı Sarma', '\r\n     4-5 kuru soğanı yemeklik doğrayıp, 1 çay bardağı zeytinyağı ve 1,5-2 yemek kaşığı dolmalık fıstık ile (fıstıklar pembeleşene kadar) kavurun.  \r\n    2 su bardağı pirinci yıkayıp soğanlara ekleyin. 1-2 dakika daha kavurun. sonra sırasıyla tencereye 1 yemek kaşığı kuru nane, 1,5 tatlı kaşığı karabiber, 1 tatlı kaşığı tarçın, 2 kesme şeker, 2 yemek kaşığı kuş üzümü, yarım limonun suyu ve 1 su bardağı kıyılmış maydanoz ekleyip karıştırın. tencereye 1 tatlı kaşığı tuzu ve 1 çay bardağı kaynamış suyu ilave edin. çok kısık ateşte pirinçler suyu çekene kadar demlendirin. pirinçler suyu çekince tencerenin altını kapatıp soğutun.  \r\n    diğer tarafta yarım kg salamura asma yaprağını ılık suyla - 4-5 kez suyu değiştirerek - yıkayın. yaprakları iki avucunuz arasında sıkarak sudan çıkartın. her bir yaprağı avucunuz içine alın, ortasına 1 tatlı kaşığı içten koyun. yaprağı sigara böreği gibi sarın.\r\n    pişireceğiniz tencerenin dibine bir sıra yaprak serin (böylece dibi tutmaz). üzerlerine sarmaları dizin. en sonunda üzerlerine bir sıra daha yaprak kapatıp yarım çay bardağı zeytinyağı gezdirin. (ekşi olsun isterseniz yarım limon suyu da ekleyebilirsiniz)\r\n     yaprakların üzerine bir tabak kapatın ve 2 su bardağı kaynamış su ekleyin. tencereyi ateşe koyun. su kaynamaya başlayınca ateşi kısıp 30 dakika pişirin. piştikten sonra sarmaları soğutup servis tabağına dizin. limon dilimleri ve maydanoz yaprakları ile süsleyip servis yapın.', '2013-11-24 12:23:00', NULL, NULL, NULL),
(2, 0, 'İçli Köfte', 'Teyzemle birlikte başına geçtiğimiz “içli köfte” az kalsın hüsran oluyordu. Yaptığımız ufak gibi görünen ama çok önemli bir hata bizi mahvetti. Yaklaşık 57 adet çıkan içli köftemizden maalesef ki 20 tanesi kızartırken parçalandı. Ve denediğimiz bir çok yöntemden sonra 37 adet içli köfteyi başarıyla yaptık.\r\n\r\nÖnce iç harcı hazırlanır. Bir tavaya tereyağı alınarak eritilir. Eriyince kıyma eklenir. Kıyma 15 dk kadar kavrulunca yemeklik doğranmış soğanlar eklenir. Ve pişmeye bırakılır. Kıymanın tamamen pişmesine yakın tuz ve baharatlar eklenir. Karıştırılarak ocaktan alınır ve dövülmüş ceviz eklenir. Soğumaya bırakılır.\r\n\r\nDışı harcı için, bulgur ve irmik karıştırılır. Üzerini geçecek kadar sıcak su ilave edilir. Yumuşayıncaya kadar bekletilir. Daha sonra genişçe bir kaba veya tepsiye alınarak çiğ köfte yoğurur gibi yoğrulur. Ardından üzerine diğer malzemeler eklenir. İyice karıştırılarak yoğrulmaya devam edilir.\r\nYoğururken içi su dolu bir kabı yanınızda bulundurmanız işinizi kolaylaştıracaktır.\r\nHamur ele yapışmayacak kıvama gelene kadar yoğrulur.\r\n\r\nArtık köftelerimizi yapmaya başlayabiliriz. Hamurdan cevizden biraz daha iri parçalar koparılır. Daha sonra parmakla bir tarafından oyularak hamur çukurlaştırılır. İç malzemeden 1 – 1,5 kaşık koyularak köfteler kapatılır.\r\nPüf Noktası -1- Bu işlemi yaparken elinizi sürekli suya batırın ki yapışmasın.\r\n\r\nPüf Noktası -2- Köfteyi yaparken dış kısmı ince tutunuz. Maharet dış kısmının ince olmasındadır.\r\n\r\nTüm içli köfteler bir tepsiye dizilir.\r\n\r\nArdından kızartmak için sıvı yağ tencereye alınır. İyice kızdıktan sonra içli köfteler tek tek kızgın yağa koyulur ve kızartılır.\r\n\r\nPüf Noktası -3- Biz dış harcına un eklemeyi unuttuk. Bu büyük bir hataydı. Meğer dış harcını tutan malzemelerden biri de unmuş. Bu yüzden kendimizce ürettiğimiz çözümlerle başarılı olmaya çalışsak da 20 adedi parçalandı. Neyse ki sonunda başardık. Önce size ürettiğimiz çözümleri söyleyeyim. Parçalandıklarını görünce önce yağı epey artırdık. Çevirmeden tek hamlede kızartalım diye. Ama olmadı. Ardından bir tanesini yumurtaya bulayarak kızarttık bu daha kötü oldu. Kızardıktan sonra yumurta kokuyordu. En sonunda una bulayarak kızarttık. Ve işte bu çok iyi bir ÇÖZÜM oldu. Tüm içli köftelerimiz bu aşamadan sonra harika oldular.\r\n\r\nKızartılan tüm köfteler kağıt havlu serili bir tepsiye alınarak fazla yağı çektirilir.\r\n\r\n..::Afiyet Olsun::..', '2013-11-24 00:00:00', NULL, NULL, NULL),
(3, 0, 'Sucuklu Kuru Fasulye Tarifi', 'Fasulyeleri akşamdan suyla ıslatıyoruz. Sabah düdüklü tencerenin içine soğanı doğrayıp pembeleşene kadar kavuruyoruz. Sonra salçayı ekleyip kokusu çıkana kadar kavuruyoruz. Ardından akşamdan suda beklettiğimiz fasulyelerin suyunu süzüp tencereye ekliyoruz ( ben fasulyeleri haşlamadan yapıyorum vitamini yemeğin içinde kalsın diye ) üzerine sucukları ilave ediyoruz ( ne kadar eklemek isterseniz ) sonra sıvı yağ tuz ve küp şekeri de ekleyip suyunu ilave edip tencerenin kapağını kapatıyoruz. Kaynamaya başladıktan sonra ( düdüğü öttükten sonra ) 30 dk kısık ateşte pişiriyoruz. Afiyet olsun.', '2013-11-24 00:00:00', NULL, NULL, NULL),
(4, 0, 'Sucuklu Kuru Fasulye Tarifi', 'Fasulyeleri akşamdan suyla ıslatıyoruz. Sabah düdüklü tencerenin içine soğanı doğrayıp pembeleşene kadar kavuruyoruz. Sonra salçayı ekleyip kokusu çıkana kadar kavuruyoruz. Ardından akşamdan suda beklettiğimiz fasulyelerin suyunu süzüp tencereye ekliyoruz ( ben fasulyeleri haşlamadan yapıyorum vitamini yemeğin içinde kalsın diye ) üzerine sucukları ilave ediyoruz ( ne kadar eklemek isterseniz ) sonra sıvı yağ tuz ve küp şekeri de ekleyip suyunu ilave edip tencerenin kapağını kapatıyoruz. Kaynamaya başladıktan sonra ( düdüğü öttükten sonra ) 30 dk kısık ateşte pişiriyoruz. Afiyet olsun.', '2013-11-24 00:00:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tarif_foto`
--

CREATE TABLE IF NOT EXISTS `tarif_foto` (
  `id_foto` int(11) NOT NULL AUTO_INCREMENT,
  `id_tarif` int(11) NOT NULL,
  `dosya_adi` varchar(255) NOT NULL,
  PRIMARY KEY (`id_foto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tarif_kategori`
--

CREATE TABLE IF NOT EXISTS `tarif_kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_adi` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tarif_kategori_nn`
--

CREATE TABLE IF NOT EXISTS `tarif_kategori_nn` (
  `id_tarif` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tarif_malzeme`
--

CREATE TABLE IF NOT EXISTS `tarif_malzeme` (
  `id_malzeme` int(11) NOT NULL AUTO_INCREMENT,
  `id_tarif` int(11) NOT NULL,
  `miktar` varchar(45) NOT NULL,
  `malzeme_adi` varchar(45) NOT NULL,
  PRIMARY KEY (`id_malzeme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
