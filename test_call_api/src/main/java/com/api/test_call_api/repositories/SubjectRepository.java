package com.api.test_call_api.repositories;

import com.api.test_call_api.models.Category;
import com.api.test_call_api.models.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubjectRepository extends JpaRepository<Subject,Integer> {
    List<Subject> findAllByCategory(Category category);
}
