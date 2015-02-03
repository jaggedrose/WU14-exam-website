<?php

include_once("autoloader.php");

$queries = New SqlQueries("127.0.0.1","memade_magazine","root","mysql");

// Save page content if told to do so (by receiving correct AJAX data)
if (isset($_REQUEST["page_data"])) {
  // Save page and echo SqlQueries response
  echo(json_encode($queries->saveNewPage($_REQUEST["page_data"])));
}

if (isset($_REQUEST["menu_link_data"])) {
	echo(json_encode($queries->saveMenuLinks($_REQUEST["menu_link_data"])));
}