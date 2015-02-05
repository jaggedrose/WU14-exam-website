<?php

class SqlQueries extends PDOHelper {

	public function saveNewPage($page_data) {
		// $page_data = array(
		// 	":title" => "String",
		// 	":body" => "String",
		// 	":user_id" => int
		// );

		//$sql1 = "INSERT INTO pages (title, body, user_id) VALUES (" . $page_data["title"]."," . $page_data["body"].",1)";
		$sql1 = "INSERT INTO pages (title, body, user_id) VALUES (:title, :body, 1)";
		return $this->query($sql1, $page_data);
	}

	public function saveMenuLink($menu_link_data) {
		$sql1 = "SELECT pid FROM pages ORDER BY created DESC LIMIT 1";
		$last_pid = $this->query($sql1);

		// Get pid from the array we got back
		$last_pid = $last_pid[0]["pid"];

		$page_path = "pageid=".$last_pid;

		$sql2 = "INSERT INTO menu_links (title, placement, path, menu) VALUES (:m_title, :placement, '$page_path', 'menu-main-menu')";
		return $this->query($sql2, $menu_link_data);
	}

	public function getChosenPage($chosen_page) {
		$sql ="SELECT title, body FROM pages WHERE pid = :pid";
		return $this->query($sql);
	}

	public function getPagesList() {
		$sql = "SELECT pages.pid, pages.title, pages.body, pages.created, CONCAT(users.fname, ' ', users.lname) as author FROM pages, users";
		return $this->query($sql);
	}

	public function getMenuLinks() {
		$sql = "SELECT mlid, title, placement FROM menu_links";
		return $this->query($sql);
	}

	

	// public function searchPages($search_param) {
	// 	$search_param = array(":search_param" => "%".$search_param."%");
	// 	$sql = "SELECT * FROM pages WHERE title LIKE :search_param";
	// 	return $this->query($sql, $search_param);
	// }

}