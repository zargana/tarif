<?php
include_once "lib/ezSQL/shared/ez_sql_core.php";
include_once "lib/ezSQL/mysqli/ez_sql_mysqli.php";

$DB = new ezSQL_mysqli('hande','123456','lezizzo','localhost');

$sql = "SELECT * "
        . "FROM kullanici";

$sonuclar = $DB->get_results($sql);

foreach ($sonuclar AS $kayit){
    echo $kayit->email;
}