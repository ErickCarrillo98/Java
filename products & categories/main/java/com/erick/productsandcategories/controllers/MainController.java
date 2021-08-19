package com.erick.productsandcategories.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.erick.productsandcategories.models.Category;
import com.erick.productsandcategories.models.Product;
import com.erick.productsandcategories.services.CategoryService;
import com.erick.productsandcategories.services.ProductService;

@Controller
public class MainController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

	@RequestMapping("/")
	public String index(Model model) {
		List<Product> allProducts = productService.allProducts();
		List<Category> allCategories = categoryService.allCategories();
		
		
		model.addAttribute("allProducts", allProducts);
		model.addAttribute("allCategories", allCategories);
		return "index.jsp";
	}

	// CREATE PRODUCT FORM
	@GetMapping("products/new")
	public String newProduct(@ModelAttribute("product") Product product) {
		return "newProduct.jsp";
	}

	// HANDLE CREATE PRODUCT FORM
	@PostMapping("/products/new")
	public String createProduct(@Valid @ModelAttribute("product") Product product, BindingResult result) {
		if (result.hasErrors()) {
			return "newProduct.jsp";
		} else {
			productService.createProduct(product);
			return "redirect:/";
		}

	}

	@RequestMapping("/categories/new")
	public String newCategory(@ModelAttribute("category") Category category) {
		return "newCategory.jsp";
	}

	// HANDLE CREATE Category FORM
	@PostMapping("/categories/new")
	public String createCategory(@Valid @ModelAttribute("category") Category category, BindingResult result) {
		if (result.hasErrors()) {
			return "newCategory.jsp";
		} else {
			categoryService.createCategory(category);
			return "redirect:/";
		}
	}
	
	
	//SHOW ONE PRODUCT/ on render page
	@RequestMapping("/products/{id}")
	public String showProduct(@PathVariable("id") Long id, Model model) {
		Product thisProduct = productService.findProduct(id);
		model.addAttribute("product", thisProduct);
		
		
		//SHOW ITS CATEGORIES
		List<Category> allCategories = categoryService.allCategories();
		model.addAttribute("categories", allCategories);
		return "showProduct.jsp";
	}
	
	//ASSOCIATION MANY TO MANY ADDING CATEGORY TO PRODUCT
	@PostMapping("/products/{id}")
	public String addCategoryToProduct(@PathVariable("id") Long id,
			@RequestParam("categoryId") Long categoryId) {
		Category cat = categoryService.findCategory(categoryId);
		Product prod = productService.findProduct(id);
		
		
		// ADDING CATEOGRY TO PRODUCT
		prod.getCategories().add(cat);
		productService.updateProduct(prod);
		
		
		
		return "redirect:/products/" + id;
	}
	
	//SHOW ONE CATEGORY
	@RequestMapping("/categories/{id}")
	public String showCategory(@PathVariable("id") Long id, Model model) {
		Category thisCategory = categoryService.findCategory(id);
		model.addAttribute("category", thisCategory);
		
		//SHOW ITS PRODUCTS
		List<Product> allProducts = productService.allProducts();
		model.addAttribute("products", allProducts);
		
		return "showCategory.jsp";
	}
	
	//HANDLE BUTTON/ON SUBMIT for CATEGORIES
	@PostMapping("/categories/{id}")
	public String addProductToCategory(@PathVariable("id") Long id,
			@RequestParam("productId") Long productId) {
		Product prod = productService.findProduct(productId);
		Category cat = categoryService.findCategory(id);
		
		//MAKING ASSOCIATION---ADDING PRODUCT TO CATEGORY
		cat.getProducts().add(prod);
		categoryService.updateCategory(cat);
		
		
		
		return "redirect:/categories/" + id;
	}
}


