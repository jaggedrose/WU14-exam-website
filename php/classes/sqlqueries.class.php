<?php

class SqlQueries extends PDOHelper {

	public function saveNewPage($page_data) {
		// $page_data = array(
		// 	":title" => "String",
		// 	":body" => "String",
		// 	":user_id" => int
		// );

		$sql = "INSERT INTO pages (title, body, user_id) VALUES (:title, :body, 1)";
		return $this->query($sql, $page_data);
	}

	public function saveMenuLink($menu_link_data) {
		$sql1 = "SELECT pid FROM pages ORDER BY created DESC LIMIT 1";
		$last_pid = $this->query($sql1);

		// Get pid from the array we got back
		$last_pid = $last_pid[0]["pid"];

		// $page_path = "pageid=".$last_pid;
		
		if ($menu_link_data[":plid"] === "") {
			unset($menu_link_data[":plid"]);
			// TODO - Changed $page_path to $last_pid, not using "pageid=" string for now
			$sql2 = "INSERT INTO menu_links (title, placement, path, menu) VALUES (:m_title, :placement, '$last_pid', 'menu-main-menu')";
		} else {
			$sql2 = "INSERT INTO menu_links (title, placement, plid, path, menu) VALUES (:m_title, :placement, :plid, '$last_pid', 'menu-main-menu')";
		}	
		return $this->query($sql2, $menu_link_data);
	}

	public function saveNewFooter($footer_data) {
		$sql = "INSERT INTO footer (title, company, street, postalcode, city, email) VALUES (:f_title, :company, :street, :postalcode, :city, :email)";
		return $this->query($sql, $footer_data);
	}

	public function updatePage($update_data) {
		$sql = "UPDATE pages SET title=:title, body=:body WHERE pid = :pid";
		return $this->query($sql, $update_data);
	}

	public function getChosenPage($chosen_page) {
		$this_page = array(":pid" => $chosen_page);
		$sql1 ="SELECT * FROM pages WHERE pid = :pid";
		$this_page_data = $this->query($sql1, $this_page);

		$sql2 ="SELECT * FROM images WHERE page_id = :pid";
		$image_data = $this->query($sql2, $this_page);

		$this_page_data["images"] = $image_data;

		return $this_page_data;
	}

	public function getPagesList() {
		$sql = "SELECT pages.pid, pages.title, pages.body, pages.created, CONCAT(users.fname, ' ', users.lname) as author FROM pages, users";
		return $this->query($sql);
	}

	public function getMenuLinks() {
		$sql = "SELECT * FROM menu_links";
		return $this->query($sql);
	}

	public function getFooterText() {
		$sql = "SELECT * FROM footer";
		return $this->query($sql);
	}

	
	// public function searchPages($search_param) {
	// 	$search_param = array(":search_param" => "%".$search_param."%");
	// 	$sql = "SELECT * FROM pages WHERE title LIKE :search_param";
	// 	return $this->query($sql, $search_param);
	// }

}

