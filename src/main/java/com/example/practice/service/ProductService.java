package com.example.practice.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.practice.model.ProductModel;

@Service
public class ProductService {
	
	public static List<ProductModel> productList = new ArrayList<ProductModel>();
	
	ProductModel productModel = new ProductModel();
	
	ProductService(){
//		productModel.setId(1);
//		productModel.setName("Name");
//		productModel.setDetail("Details");
//		productModel.setPrice("44");
//		productModel.setQuantity("4");
//		productModel.setTotalprice("44");
//		productModel.setCreatedon("17-12-2021");
//		
//		productList.add(productModel);
	}
	
	public List<ProductModel> getAllProducts() {
		return productList;
	}
	
	public void addProduct(ProductModel productModel) {
		productList.add(productModel);
	}
	
	public void updateProduct(ProductModel productModel) {
		ProductModel model = productList.get(productModel.getId()-1);
		model.setName(productModel.getName());
		model.setDetail(productModel.getDetail());
		model.setPrice(productModel.getPrice());
		model.setQuantity(productModel.getQuantity());
		model.setTotalprice(productModel.getTotalprice());
		productList.remove(productModel.getId()-1);
		productList.add(productModel.getId()-1, model);
	}

	public void deleteProduct(Integer id) {
		productList.remove(id-1);
	}

	public ProductModel findById(Integer id) {
		return productList.get(id-1);
	}
	
}
