<?php

$array = json_decode($_POST["data"],true);
echo $array[0][0]."<br />";
echo count($array)."<br />";
echo count($array[0])."<br />";