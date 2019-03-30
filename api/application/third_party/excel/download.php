<?php

$file = $_GET['file'].".xls";
$file_url = 'http://localhost/garap/emonev/application/third_party/excel/output/'.$file;
header('Content-Type: application/octet-stream');
header("Content-Transfer-Encoding: Binary"); 
header("Content-disposition: attachment; filename=\"" . basename($file_url) . "\""); 
readfile($file_url);
unlink('output/'.$file);
