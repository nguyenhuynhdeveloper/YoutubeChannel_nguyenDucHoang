package com.example.demo.services;

import com.example.demo.models.Role;
import com.example.demo.models.User;
import com.example.demo.repositories.RoleRepository;
import com.example.demo.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j //Simple Logging Facade for Java

public class UserRoleServiceImplement implements UserRoleService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    @Override
    public User saveUser(User user) {
        //save ? not insert
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
    public void addRoleToUser(String roleName, String username) {
        Role role = roleRepository.findByName(roleName);
        User user = userRepository.findByUsername(username);
        log.info("add role: {} to user: {}", role.getName(), user.getUsername());
        user.getRoles().add(role);
    }

    @Override
    public List<User> getUsers() {
        log.info("get all users");
        return userRepository.findAll();
    }

    @Override
    public UserDetails toUserDetails(String username) {
        User user = userRepository.findByUsername(username);
        if(user == null) {
            log.error("user not found");
            throw new UsernameNotFoundException(
                    String.format("cannot find user with username: %s", username));
        }
        log.info("found user");
        Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
        user.getRoles().forEach(role -> {
            authorities.add(new SimpleGrantedAuthority(role.getName()));
        });
        return new org.springframework.security.core.userdetails.User(
          user.getUsername(),
          user.getPassword(),
          authorities
        );
    }
}
