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

public class ChefController {
	List<Chef> pList=new ArrayList<>();
	@RequestMapping(value= "/all_chef")
	public List<Chef> allChfs() {
		ChefDA d=new ChefDA();
		pList=d.allChef();
		return pList;
	}
	
	
	@PostMapping(value="/chef_singin")
	public Chef singinChef(@RequestBody Chef s) {
		ChefDA d= new ChefDA();
		Chef st=d.chef_singin(s.chef_id);
		return st;
		
	}
	@PostMapping(value="/chef_singup")
	public Chef singupChef(@RequestBody Chef s) {
		ChefDA d= new ChefDA();
		Chef st=d.chef_singup(s);
		return st;
		
	}


}
