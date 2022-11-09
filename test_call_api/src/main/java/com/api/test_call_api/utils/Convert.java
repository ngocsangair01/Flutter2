package com.api.test_call_api.utils;

import com.api.test_call_api.dtos.CategoryDTO;
import com.api.test_call_api.dtos.SubjectDTO;
import com.api.test_call_api.models.Category;
import com.api.test_call_api.models.Subject;

public class Convert {
    public static Category fromCategoryDTOToCategory(CategoryDTO categoryDTO,Category category){
        if (categoryDTO.getName() != null){
            category.setName(categoryDTO.getName());
        }
        if (categoryDTO.getDescription() != null){
            category.setDescription(categoryDTO.getDescription());
        }
        return category;
    }
    public static Subject fromSubjectDTOToSubject(SubjectDTO subjectDTO, Subject subject){
        if (subjectDTO.getName() != null){
            subject.setName(subjectDTO.getName());
        }
        if (subjectDTO.getDescription() != null){
            subject.setDescription(subjectDTO.getDescription());
        }
        return subject;
    }
}
