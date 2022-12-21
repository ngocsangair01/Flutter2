package com.api.test_call_api.dtos;

import com.api.test_call_api.models.Category;
import lombok.AllArgsConstructor;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CategoryDTO {
    @Nationalized
    private String name;

    @Nationalized
    private String description;
}
