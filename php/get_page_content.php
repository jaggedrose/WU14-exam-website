<?php

include_once("autoloader.php");

$queries = new SqlQueries("127.0.0.1","memade_magazine","root","mysql");

if (isset($_REQUEST["search_param"])) {
	echo(json_encode($queries->searchPages($_REQUEST["search_param"])));
}
elseif (isset($_REQUEST["chosen_page"])) {
	echo(json_encode($queries->getChosenPage($_REQUEST["chosen_page"])));
}
else {
	echo(json_encode($queries->getPagesList()));
}

