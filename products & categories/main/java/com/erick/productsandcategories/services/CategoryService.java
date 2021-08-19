package com.erick.productsandcategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erick.productsandcategories.models.Category;
import com.erick.productsandcategories.repositories.CategoryRepo;

@Service
	public class CategoryService {
		@Autowired
		private CategoryRepo categoryRepo;
		
//		READ ALL
		public List<Category> allCategories(){
			return categoryRepo.findAll();
		}
//		CREATE
		public Category createCategory(Category c) {
			return categoryRepo.save(c);
		}
//		UPDATE
		public Category updateCategory(Category c) {
			return categoryRepo.save(c);
		}
//		READ ONE
		public Category findCategory(Long id) {
			Optional<Category> optionalCategory = categoryRepo.findById(id);
			if (optionalCategory.isPresent()) {
				return optionalCategory.get();
			}
			return null;
		}
//		DELETE
		public void deleteCategory(Long id) {
			categoryRepo.deleteById(id);
		}

	}

