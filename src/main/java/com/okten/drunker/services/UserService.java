package com.okten.drunker.services;

import com.okten.drunker.dto.UserProfileDto;
import com.okten.drunker.dto.UserRegisterDto;
import com.okten.drunker.models.Role;
import com.okten.drunker.models.User;
import com.okten.drunker.repositories.IUserRepository;
import com.okten.drunker.validation.EmailExistsException;
import com.okten.drunker.validation.PasswordConfirmationException;
import com.okten.drunker.validation.UserNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDateTime;
import java.util.Optional;

@Service

public class UserService implements IUserService {
    @Autowired
    private IUserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;


    @Override
    public Optional<User> findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    @Modifying
    public UserRegisterDto registerUser(UserRegisterDto accountDto) throws EmailExistsException, PasswordConfirmationException {
        if (userRepository.existsUserByEmail((accountDto.getEmail()))) {
            throw new EmailExistsException(
                    "There is an account with that email adress:" + accountDto.getEmail());
        }
        User user = new User();
        user.setFirstName(accountDto.getFirstName());
        user.setLastName(accountDto.getLastName());
        if (!accountDto.getPassword().equals(accountDto.getPasswordConfirmation())) {
            throw new PasswordConfirmationException(
                    "password " + accountDto.getPassword());
        }
        user.setPassword(passwordEncoder.encode(accountDto.getPassword()));

        user.setEmail(accountDto.getEmail());
        user.setRole(Role.ROLE_USER.name());
        user.setCreatedAt(LocalDateTime.now());
        userRepository.save(user);
        return accountDto;
    }

    @Override
    @Modifying
    public User deleteUser(Long id) throws UserNotFoundException {
        Optional<User> user = userRepository.findById(id);
        user.orElseThrow(() ->new UserNotFoundException("User not found by id "+ id));
        userRepository.deleteById(id);
        return user.get();
    }


    @Override
    public UserDetails loadUserByUsername(String email)  {
        return userRepository.findByEmail(email).get();
    }

    @Override
    public UserProfileDto getProfile(User user) {
        UserProfileDto dto = new UserProfileDto();
        dto.setEmail(user.getEmail());
        dto.setFirstName(user.getFirstName());
        dto.setLastName(user.getLastName());
        return dto;
    }
}
