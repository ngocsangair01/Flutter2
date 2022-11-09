package com.api.test_call_api.services;

import com.api.test_call_api.dtos.CategoryDTO;
import com.api.test_call_api.models.Category;

import java.util.List;

public interface CategoryService {
    Category createCategory(CategoryDTO categoryDTO);
    List<Category> viewAllCategory();
    Category editCategory(Integer idCategory, CategoryDTO categoryDTO);
    Category deleteCategory(Integer idCategory);
    Category viewCategory(Integer idCategory);
}
