package com.okten.drunker.validation;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.UNPROCESSABLE_ENTITY, reason = "Password confirmation do not match with provided password")
public class PasswordConfirmationException extends Exception {
    public PasswordConfirmationException(final String message) {
        super(message);
    }
}

