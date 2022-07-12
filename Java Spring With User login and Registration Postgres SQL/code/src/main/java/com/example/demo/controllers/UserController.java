package com.example.demo.controllers;

import com.example.demo.models.User;
import com.example.demo.services.UserRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/users")
@RequiredArgsConstructor
public class UserController {
    private final UserRoleService securiryService;

    @GetMapping("")
    public ResponseEntity<List<User>> getUsers() {
        return ResponseEntity.ok().body(securiryService.getUsers());
    }
    @PostMapping("/insert")
    public ResponseEntity<User> insert(@RequestBody User user) {
        User insertedUser = securiryService.saveUser(user);
        return ResponseEntity.ok().body(insertedUser);
    }
}
