package com.okten.drunker.controllers;

import com.okten.drunker.dto.UserProfileDto;
import com.okten.drunker.dto.UserRegisterDto;
import com.okten.drunker.models.User;
import com.okten.drunker.services.UserService;
import com.okten.drunker.validation.EmailExistsException;
import com.okten.drunker.validation.PasswordConfirmationException;
import com.okten.drunker.validation.UserNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;

@RestController
public class UsersController {

    private final UserService userService;

    public UsersController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping(value = "/users")
    public UserRegisterDto createUser(@RequestBody @Valid UserRegisterDto accoundData)  throws Exception {
        UserRegisterDto user = userService.registerUser(accoundData);
        return user;
    }

    @GetMapping(value = "/users/current")
    public UserProfileDto getCurrentUser(@AuthenticationPrincipal User user) {
        UserProfileDto dto = userService.getProfile(user);
        return dto;
    }
}
