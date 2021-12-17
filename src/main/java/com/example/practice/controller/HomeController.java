package com.example.practice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.practice.service.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/home")
	public String home(Model model, HttpSession httpSession) {
		model.addAttribute("products", productService.getAllProducts());
		return "home";
	}
	
}
