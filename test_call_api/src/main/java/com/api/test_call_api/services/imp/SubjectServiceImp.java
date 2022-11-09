package com.api.test_call_api.services.imp;

import com.api.test_call_api.dtos.SubjectDTO;
import com.api.test_call_api.exceptions.NotFoundException;
import com.api.test_call_api.models.Category;
import com.api.test_call_api.models.Subject;
import com.api.test_call_api.repositories.CategoryRepository;
import com.api.test_call_api.repositories.SubjectRepository;
import com.api.test_call_api.services.SubjectService;
import com.api.test_call_api.utils.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

@Service
public class SubjectServiceImp implements SubjectService {
    @Autowired
    private SubjectRepository subjectRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Override
    public Subject createSubject(Integer idCategory, SubjectDTO subjectDTO) {
        Optional<Category> category = categoryRepository.findById(idCategory);
        Subject subject = new Subject();
        Convert.fromSubjectDTOToSubject(subjectDTO,subject);
        subject.setCategory(category.get());
        return subjectRepository.save(subject);
    }

    @Override
    public List<Subject> viewAllSubjects() {
        List<Subject> subjects = subjectRepository.findAll();
        if (subjects.isEmpty()){
            throw new NotFoundException("No subject");
        }
        return subjects;
    }

    @Override
    public List<Subject> viewAllSubjectsByCategory(Integer idCategory) {
        Optional<Category> category = categoryRepository.findById(idCategory);
        List<Subject> subjects = subjectRepository.findAllByCategory(category.get());
        if (subjects.isEmpty()){
            throw new NotFoundException("No subject");
        }
        return subjects;
    }

    @Override
    public Subject editSubject(Integer idSubject, SubjectDTO subjectDTO) {
        Optional<Subject> subject = subjectRepository.findById(idSubject);
        if (subject.isEmpty()){
            throw new NotFoundException("No subject");
        }
        return subjectRepository.save(Convert.fromSubjectDTOToSubject(subjectDTO,subject.get()));
    }

    @Override
    public Subject deleteSubject(Integer idSubject) {
        Optional<Subject> subject = subjectRepository.findById(idSubject);
        if (subject.isEmpty()){
            throw new NotFoundException("No subject");
        }
        subjectRepository.delete(subject.get());
        return subject.get();
    }
}
