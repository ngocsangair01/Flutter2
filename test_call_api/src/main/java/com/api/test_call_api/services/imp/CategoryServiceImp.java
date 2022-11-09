package com.api.test_call_api.services.imp;

import com.api.test_call_api.dtos.CategoryDTO;
import com.api.test_call_api.exceptions.NotFoundException;
import com.api.test_call_api.models.Category;
import com.api.test_call_api.repositories.CategoryRepository;
import com.api.test_call_api.services.CategoryService;
import com.api.test_call_api.utils.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImp implements CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;
    @Override
    public Category createCategory(CategoryDTO categoryDTO) {
        Category category =new Category();
        Convert.fromCategoryDTOToCategory(categoryDTO,category);
        return categoryRepository.save(category);
    }

    @Override
    public List<Category> viewAllCategory() {
        List<Category> categories = categoryRepository.findAll();
        return categories;
    }

    @Override
    public Category editCategory(Integer idCategory, CategoryDTO categoryDTO) {
        Optional<Category> category = categoryRepository.findById(idCategory);
        if (category.isEmpty()){
            throw new NotFoundException("No category");
        }
        return categoryRepository.save(Convert.fromCategoryDTOToCategory(categoryDTO,category.get()));
    }

    @Override
    public Category deleteCategory(Integer idCategory) {
        Optional<Category> category = categoryRepository.findById(idCategory);
        if (category.isEmpty()){
            throw new NotFoundException("No category");
        }

        categoryRepository.delete(category.get());
        return category.get();
    }

    @Override
    public Category viewCategory(Integer idCategory) {
        Optional<Category> category = categoryRepository.findById(idCategory);
        if (category.isEmpty()){
            throw new NotFoundException("No category");
        }
        return category.get();
    }
}
