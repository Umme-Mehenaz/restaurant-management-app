package com.example.demo;


import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins="*")

@RestController

public class FoodController {
//	@GetMapping("/")
//	String index() {
//		return"Hello Spring Boot Rocks";
//	}
	
	List<Food> pList=new ArrayList<>();
			@RequestMapping(value= "/alls")
			public List<Food> allFoods() {
				FoodDA d=new FoodDA();
				pList=d.allFood();
				return pList;
			}
	@PostMapping(value= "/saves")
	public void save(@RequestBody Food s) {
		FoodDA d=new FoodDA();
		d.inserts(s);
		
	}
	@PostMapping(value= "/update")
	public void update(@RequestBody Food s) {
		FoodDA d=new FoodDA();
		d.update(s);
		
	}
	@DeleteMapping(value= "/deletes/{food_id}")
	public void deletes(@PathVariable ("food_id") int food_id) {
		FoodDA d=new FoodDA();
		d.deletes(food_id);
		
	}
	List<Food> aList=new ArrayList<>();
	@RequestMapping(value= "/pizza")
	public List<Food> selectFoods() {
		FoodDA d=new FoodDA();
		aList=d.pizza();
		return aList;
	}
	
	List<Food> bList=new ArrayList<>();
	@RequestMapping(value= "/burger")
	public List<Food> burgers() {
		FoodDA d=new FoodDA();
		bList=d.burger();
		return bList;
	}
	List<Food> cList=new ArrayList<>();
	@RequestMapping(value= "/chicken")
	public List<Food> chickens() {
		FoodDA d=new FoodDA();
		cList=d.chicken();
		return cList;
	}
	List<Food> dList=new ArrayList<>();
	@RequestMapping(value= "/snacks")
	public List<Food> snackss() {
		FoodDA d=new FoodDA();
		dList=d.snacks();
		return dList;
	}
	List<Food> eList=new ArrayList<>();
	@RequestMapping(value= "/beverage")
	public List<Food> beverages() {
		FoodDA d=new FoodDA();
		eList=d.beverage();
		return eList;
	}
	List<Food> fList=new ArrayList<>();
	@RequestMapping(value= "/deals")
	public List<Food> dealss() {
		FoodDA d=new FoodDA();
		fList=d.deals();
		return fList;
	}

}
