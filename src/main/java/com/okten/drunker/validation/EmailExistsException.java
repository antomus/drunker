package com.okten.drunker.validation;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.UNPROCESSABLE_ENTITY, reason = "Email is already used")
public class EmailExistsException extends Exception {

    public EmailExistsException(final String message) {
        super(message);
    }
}
