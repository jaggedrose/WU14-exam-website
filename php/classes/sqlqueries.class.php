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

	public function saveUrlPath($path_data) {
		$sql1 = "SELECT CONCAT('pageid=',pid) AS path FROM pages ORDER BY created DESC LIMIT 1";
		$last_pid = $this->query($sql);

		// Get pid from the array we got back
		$last_pid = $last_pid[0]["pid"];

		$page_path = $path_data["path"];

		$sql2 = "INSERT INTO url_alias (path, pid) VALUES (:path, :pid)";
		$url_path_data = array(
			":path" => $page_path,
			":pid" => $last_pid
			);
		return $this->query($sql2, $url_path_data);
	}

	public function getPages() {
		$sql = "SELECT pages.pid, pages.title, pages.body, pages.created, CONCAT(users.fname, ' ', users.lname) as author FROM pages, users";
		return $this->query($sql);
	}

	public function getMenuLinks() {
		$sql = "SELECT mlid, title, placement FROM menu_links";
		return $this->query($sql);
	}

	public function saveMenuLink($menu_link_data) {
		$sql = "INSERT INTO menu_links (title, placement, menu) VALUES (:m_title, :placement, 'menu-main-menu')";
		return $this->query($sql, $menu_link_data);
	}

	// public function searchPages($search_param) {
	// 	$search_param = array(":search_param" => "%".$search_param."%");
	// 	$sql = "SELECT * FROM pages WHERE title LIKE :search_param";
	// 	return $this->query($sql, $search_param);
	// }

}