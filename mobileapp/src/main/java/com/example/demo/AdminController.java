package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@RestController

public class AdminController {
	List<Admin> pList=new ArrayList<>();
	@RequestMapping(value= "/allad")
	public List<Admin> allAdmins() {
		AdminDA d=new AdminDA();
		pList=d.allAdmin();
		return pList;
	}
	
	
	@PostMapping(value="/adsingin")
	public Admin singinAdmin(@RequestBody Admin s) {
		AdminDA d= new AdminDA();
		Admin st=d.adSingin(s.admin_id);
		return st;
		
	}
	@PostMapping(value="/adsingup")
	public Admin singupAdmin(@RequestBody Admin s) {
		AdminDA d= new AdminDA();
		Admin st=d.adSingup(s);
		return st;
		
	}

}
