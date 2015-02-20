<?php

include_once("autoloader.php");

$queries = New SqlQueries("127.0.0.1","memade_magazine","root","mysql");

// Save page content if told to do so (by receiving correct AJAX data)
if (isset($_REQUEST["page_data"])) {
  // Save page and echo SqlQueries response
  echo(json_encode($queries->saveNewPage($_REQUEST["page_data"])));
}

if (isset($_REQUEST["update_data"])) {
	echo(json_encode($queries->updatePage($_REQUEST["update_data"])));
}

if (isset($_REQUEST["menu_link_data"])) {
	echo(json_encode($queries->saveMenuLink($_REQUEST["menu_link_data"])));
}

if (isset($_REQUEST["footer_data"])) {
	echo(json_encode($queries->saveNewFooter($_REQUEST["footer_data"])));
}

if (isset($_REQUEST["image_data"])) {
	echo(json_encode($queries->saveImageInfo($_REQUEST["image_data"])));
}