<?php

include_once("autoloader.php");

$queries = New SqlQueries("127.0.0.1","memade_magazine","root","mysql");


echo(json_encode($queries->getFooterText()));
