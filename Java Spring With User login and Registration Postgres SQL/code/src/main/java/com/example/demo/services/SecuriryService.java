package com.example.demo.services;

import com.example.demo.models.Role;
import com.example.demo.models.User;

import java.util.List;

public interface SecuriryService {
    User saveUser(User user);
    User getUser(String username);
    Role insertRole(Role role);
    void addRoleToUser(String roleName, String username);
    List<User> getUsers();
}
