package com.erick.productsandcategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erick.productsandcategories.models.Product;
import com.erick.productsandcategories.repositories.ProductRepo;

@Service
public class ProductService {
	@Autowired
	private ProductRepo productRepo;
	
//	READ ALL
	public List<Product> allProducts(){
		return productRepo.findAll();
	}
//	CREATE
	public Product createProduct(Product p) {
		return productRepo.save(p);
	}
//	UPDATE
	public Product updateProduct(Product p) {
		return productRepo.save(p);
	}
//	READ ONE
	public Product findProduct(Long id) {
		Optional<Product> optionalProduct = productRepo.findById(id);
		if (optionalProduct.isPresent()) {
			return optionalProduct.get();
		}
		return null;
	}
//	DELETE
	public void deleteProduct(Long id) {
		productRepo.deleteById(id);
	}
}