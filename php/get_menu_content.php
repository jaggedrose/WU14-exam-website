<?php

include_once("autoloader.php");

$queries = New SqlQueries("127.0.0.1","memade_magazine","root","mysql");


echo(json_encode($queries->getMenuLinks()));


// // Get the menu links for a specific menu_name if told to do so 
// //(by receiving correct AJAX data), else get all menu_names
// if (isset($_REQUEST["menu_data"])) {
//   // Get all menu_links for a specific menu_name
//   echo(json_encode($queries->getMenuLinks($_REQUEST["menu_data"])));
// } else {
//   // Get all menu_names
//   echo(json_encode($queries->getMenuNames()));
// }