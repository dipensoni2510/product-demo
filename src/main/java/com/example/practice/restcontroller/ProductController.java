package com.example.practice.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.practice.model.ProductModel;
import com.example.practice.service.ProductService;

@RestController
public class ProductController {

	@Autowired
	private ProductService productService;
	
//	@GetMapping("/productList")
//	public ResponseEntity<List<Company>> getCompanyList() {
//		return new ResponseEntity<List<Company>>(crudService.getCompanyList(), HttpStatus.OK);
//	}
//
	@PostMapping("/product/get")
	public ProductModel getProduct(@RequestBody ProductModel productModel) {
		return productService.findById(productModel.getId());
	}

	@PostMapping("/product/save")
	public Boolean saveOrUpdateCompany(@RequestBody ProductModel productModel) {
		productService.addProduct(productModel);
		return true;
	}
	
	@PostMapping("/product/update")
	public Boolean updateCompany(@RequestBody ProductModel productModel) {
		productService.updateProduct(productModel);
		return true;
	}

	@PostMapping("/product/delete")
	public Boolean deleteCompany(@RequestBody ProductModel productModel) {
		productService.deleteProduct(productModel.getId());
		return true;
	}
	
}
