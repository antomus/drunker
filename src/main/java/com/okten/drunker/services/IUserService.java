package com.okten.drunker.services;

import com.okten.drunker.dto.UserProfileDto;
import com.okten.drunker.dto.UserRegisterDto;
import com.okten.drunker.models.User;
import com.okten.drunker.validation.EmailExistsException;
import com.okten.drunker.validation.PasswordConfirmationException;
import com.okten.drunker.validation.UserNotFoundException;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.Optional;

public interface IUserService extends UserDetailsService {
    Optional<User> findByEmail(String email);
    UserRegisterDto registerUser(UserRegisterDto dto) throws EmailExistsException, PasswordConfirmationException;
    User deleteUser(Long id) throws UserNotFoundException;
    UserProfileDto getProfile(User user);
}
