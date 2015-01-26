<?php

include_once("autoloader.php");

$queries = new SqlQueries("127.0.0.1","memade_magazine","root","mysql");

if (isset($_REQUEST["search_param"])) {
	echo(json_encode($queries->searchForPages($_REQUEST["search_param"])));
} else {
	echo(json_encode($queries->getAllPages()));
}