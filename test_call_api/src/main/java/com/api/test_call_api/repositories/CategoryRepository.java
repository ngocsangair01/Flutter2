package com.api.test_call_api.repositories;

import com.api.test_call_api.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category,Integer> {
//    Category findByName(String name);
}
