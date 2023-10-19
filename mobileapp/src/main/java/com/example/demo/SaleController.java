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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = "*")

@RestController
public class SaleController {
	List<Sale> pList = new ArrayList<>();

	@RequestMapping(value = "/allcart")
	public List<Sale> allCarts() {
		SaleDA d = new SaleDA();
		pList = d.allCart();
		return pList;
	}

	@PostMapping(value = "/cart")
	public void carts(@RequestBody Sale s) {
		SaleDA d = new SaleDA();
		d.cart(s);

	}

	List<Sale> aList = new ArrayList<>();

	@RequestMapping(value = "/cheforder")
	public List<Sale> chefOrders() {
		SaleDA d = new SaleDA();
		aList = d.chefOrder();
		return aList;
	}

	List<Sale> bList = new ArrayList<>();

	@RequestMapping(value = "/allorder")
	public List<Sale> allOrders() {
		SaleDA d = new SaleDA();
		bList = d.allOrder();
		return bList;
	}

	@PostMapping(value = "/order")
	public void orders(@RequestBody Sale s) {
		SaleDA d = new SaleDA();
		d.order(s);
	}

	@DeleteMapping(value = "/deleteall/{food_id}")
	public void deletes(@PathVariable("food_id") int food_id) {
		SaleDA d = new SaleDA();
		d.deleteAll(food_id);

	}
	

	@GetMapping(value = "/change-quantity")
	public void changeQuantity(@RequestParam int foodId, @RequestParam int qty) {
		SaleDA d = new SaleDA();
		d.changeQuantity(foodId, qty);
	}
}
