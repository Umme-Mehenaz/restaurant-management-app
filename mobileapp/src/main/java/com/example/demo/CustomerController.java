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
public class CustomerController {
	List<Customer> pList=new ArrayList<>();
	@RequestMapping(value= "/all_customer")
	public List<Customer> allStudents() {
		CustomerDA d=new CustomerDA();
		pList=d.allStudent();
		return pList;
	}
	
	
	@PostMapping(value="/singin")
	public Customer singinCustomer(@RequestBody Customer s) {
		CustomerDA d= new CustomerDA();
		Customer st=d.singin(s.id);
		return st;
		
	}
	@PostMapping(value="/singup")
	public Customer singupCustomer(@RequestBody Customer s) {
		CustomerDA d= new CustomerDA();
		Customer st=d.singup(s);
		return st;
		
	}

}
