package com.api.test_call_api.dtos;

import com.api.test_call_api.constants.ResponseMessageEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ResponseDTO<T> {
    private Integer status;
    private ResponseMessageEnum message;
    private T results;
}