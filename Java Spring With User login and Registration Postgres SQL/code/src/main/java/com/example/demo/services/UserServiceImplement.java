package com.example.demo.services;

import com.example.demo.models.Role;
import com.example.demo.models.User;
import com.example.demo.repositories.RoleRepository;
import com.example.demo.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j //Simple Logging Facade for Java

public class UserServiceImplement implements UserService{
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    @Override
    public User saveUser(User user) {
        log.info("saving user to DB");
        return userRepository.save(user);
    }

    @Override
    public User getUser(String username) {
        log.info("get user by username: {}", username);
        return userRepository.findByUsername(username);
    }

    @Override
    public Role saveRole(Role role) {
        log.info("saving role: {} to DB", role.getName());
        return roleRepository.save(role);
    }

    @Override

    public void addRoleToUser(Role role, User user) {
        log.info("add role: {} to user: {}", role.getName(), user.getUsername());
        user.getRoles().add(role);
    }

    @Override
    public List<User> getUsers() {
        log.info("get all users");
        return userRepository.findAll();
    }
}
