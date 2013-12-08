-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 08 Ara 2013, 13:06:37
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Tablo döküm verisi `iletisim`
--

INSERT INTO `iletisim` (`id_iletisim`, `ad`, `soyad`, `email`, `id_iletisim_kategori`, `baslik`, `mesaj`, `tarih`, `ip`) VALUES
(1, 'hasan', 'tokatlı', 'hasantktl@gmail.com', 3, 'yemekler çok lezzetli', 'sitenizdeki tarifleri uyguladım, teşekkür ederim', '2013-12-08 12:57:47', '::1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
