package com.example.demo.services;

import com.example.demo.models.Role;
import com.example.demo.models.User;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.List;

public interface UserRoleService {
    User saveUser(User user);
    User getUser(String username);
    Role saveRole(Role role);
    void addRoleToUser(String roleName, String username);
    List<User> getUsers();
    UserDetails toUserDetails(String username);
}
