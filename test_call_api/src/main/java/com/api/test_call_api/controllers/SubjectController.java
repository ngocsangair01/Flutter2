package com.api.test_call_api.controllers;

import com.api.test_call_api.bases.BaseController;
import com.api.test_call_api.dtos.SubjectDTO;
import com.api.test_call_api.models.Subject;
import com.api.test_call_api.services.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/subjects")
public class SubjectController extends BaseController<Subject> {
    @Autowired
    private SubjectService subjectService;

    @PostMapping("/{idCategory}")
    public ResponseEntity<?> createSubject(@PathVariable(name = "idCategory")Integer idCategory,
                                           @RequestBody SubjectDTO subjectDTO){
        return this.resSuccess(subjectService.createSubject(idCategory,subjectDTO));
    }
    @GetMapping("/getAll")
    public ResponseEntity<?> viewAllSubject(){
        return this.resListSuccess(subjectService.viewAllSubjects());
    }
    @GetMapping("/getAll/{idCategory}")
    public ResponseEntity<?> viewAllSubjectByCategory(@PathVariable(name = "idCategory")Integer idCategory){
        return this.resListSuccess(subjectService.viewAllSubjectsByCategory(idCategory));
    }
    @PatchMapping("/{idSubject}")
    public ResponseEntity<?> editSubject(@PathVariable(name = "idSubject")Integer idSubject,
                                         @RequestBody SubjectDTO subjectDTO){
        return this.resSuccess(subjectService.editSubject(idSubject,subjectDTO));
    }
    @DeleteMapping("/idSubject")
    public ResponseEntity<?> deleteSubject(@PathVariable(name = "idSubject")Integer idSubject){
        return this.resSuccess(subjectService.deleteSubject(idSubject));
    }
}
