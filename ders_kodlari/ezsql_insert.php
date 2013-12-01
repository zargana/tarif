<?php
include_once "lib/ezSQL/shared/ez_sql_core.php";
include_once "lib/ezSQL/mysqli/ez_sql_mysqli.php";

$DB = new ezSQL_mysqli('hande','123456','lezizzo','localhost');

$sql = "INSERT INTO kullanici(id_kullanici_rol, email, password, status) "
        . "VALUES(1, 'uye2@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1)";

$DB->query($sql);