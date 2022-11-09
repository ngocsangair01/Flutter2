package com.api.test_call_api.controllers;

import com.api.test_call_api.bases.BaseController;
import com.api.test_call_api.dtos.CategoryDTO;
import com.api.test_call_api.models.Category;
import com.api.test_call_api.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/categories")
public class CategoryController extends BaseController<Category> {

    @Autowired
    private CategoryService categoryService;

    @PostMapping
    public ResponseEntity<?> createCategory(@RequestBody CategoryDTO categoryDTO){
        return this.resSuccess(categoryService.createCategory(categoryDTO));
    }
    @GetMapping
    public ResponseEntity<?> viewAllCategory(){
        return this.resListSuccess(categoryService.viewAllCategory());
    }
    @PatchMapping("/{idCategory}")
    public ResponseEntity<?> editCategory(@PathVariable(name = "idCategory")Integer idCategory,
                                          @RequestBody CategoryDTO categoryDTO){
        return this.resSuccess(categoryService.editCategory(idCategory,categoryDTO));
    }
    @DeleteMapping("/{idCategory}")
    public ResponseEntity<?> deleteCategory(@PathVariable(name = "idCategory")Integer idCategory){
        return this.resSuccess(categoryService.deleteCategory(idCategory));
    }
    @GetMapping("/{idCategory}")
    public ResponseEntity<?> viewCategory(@PathVariable(name = "idCategory")Integer idCategory){
        return this.resSuccess(categoryService.viewCategory(idCategory));
    }
}
