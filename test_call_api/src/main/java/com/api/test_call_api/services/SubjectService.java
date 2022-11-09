package com.api.test_call_api.services;

import com.api.test_call_api.dtos.SubjectDTO;
import com.api.test_call_api.models.Subject;

import java.util.List;

public interface SubjectService {
    Subject createSubject(Integer idCategory, SubjectDTO subjectDTO);
    List<Subject> viewAllSubjects();
    List<Subject> viewAllSubjectsByCategory(Integer idCategory);
    Subject editSubject(Integer idSubject,SubjectDTO subjectDTO);
    Subject deleteSubject(Integer idSubject);
}
