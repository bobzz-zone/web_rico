<?php


require_once 'excel/PHPExcel.php';
$gdImage = imagecreatefrompng('foto/1449294514.jpg');
//$image = imagecreatefrompng($originalFile);
imagejpeg($gdImage, "foto/oke.jpg", "90");


$gImage = imagecreatefromjpg('foto/1449294514.jpg');