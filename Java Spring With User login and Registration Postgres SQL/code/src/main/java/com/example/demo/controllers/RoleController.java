package com.example.demo.controllers;

import com.example.demo.models.Role;
import com.example.demo.models.User;
import com.example.demo.services.SecuriryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("api/v1/roles")
@RequiredArgsConstructor

public class RoleController {
    private final SecuriryService securiryService;

    @PostMapping("/insert")
    public ResponseEntity<Role> insert(@RequestBody Role role) {
        Role insertedRole = securiryService.insertRole(role);
        return ResponseEntity.ok().body(insertedRole);
    }
    @PostMapping("/insertRoleToUser")
    public ResponseEntity<Role> insertRoleToUser(@RequestBody RoleUserForm roleUserForm) {
        securiryService.addRoleToUser(roleUserForm.roleName, roleUserForm.username);
        return ResponseEntity.ok().build();
    }
    private class RoleUserForm {
        private String roleName;
        private String username;
    }
}
