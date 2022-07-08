package com.example.demo.services;

import com.example.demo.models.Role;
import com.example.demo.models.User;

import java.util.List;

public interface UserService {
    User saveUser(User user);
    User getUser(String username);
    Role saveRole(Role role);
    void addRoleToUser(Role role, User user);
    List<User> getUsers();
}
