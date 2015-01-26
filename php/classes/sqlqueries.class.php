<?php

class SqlQueries extends PDOHelper {

	public function saveNewPage($page_data) {
		// $page_data = array(
		// 	":title" => "String",
		// 	":body" => "String",
		// 	":user_id" => int
		// );
		$sql1 = "INSERT INTO pages (title, body, user_id) VALUES (:title, :body, :user_id)";
		return $this->query($sql1, $page_data);
	}

	public function getAllPages() {
		$sql2 = "SELECT * FROM pages";
		return $this->query($sql2);
	}

	public function searchForPages($search_param) {
		$search_param = array(":search_param" => "%".$search_param."%");
		$sql3 = "SELECT * FROM pages WHERE title LIKE :search_param";
		return $this->query($sql3, $search_param);
	}

}