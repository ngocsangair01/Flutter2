package com.api.test_call_api.constants;

public enum ResponseMessageEnum {
    SUCCESS ("Response success"),
    ERROR ("Response error");
    private String message;

    ResponseMessageEnum() {
    }

    ResponseMessageEnum(String message) {
        this.message = message;
    }
}
