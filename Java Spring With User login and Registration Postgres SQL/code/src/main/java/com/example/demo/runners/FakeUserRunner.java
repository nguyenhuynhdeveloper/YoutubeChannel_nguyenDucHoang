package com.example.demo.runners;

import com.example.demo.models.Role;
import com.example.demo.models.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import com.example.demo.services.UserRoleService;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

@Log4j2
@RequiredArgsConstructor
@Order(value=1)
@Component
public class FakeUserRunner implements CommandLineRunner{
    private final UserRoleService securiryService;

    @Override
    public void run(String... args) throws Exception {
        securiryService.saveRole(new Role(1L, "owner"));
        securiryService.saveRole(new Role(2L, "admin"));
        securiryService.saveRole(new Role(3L, "user"));
        //insert user
        securiryService.saveUser(new User(1L, "hoangnd","hoangnd@gmail.com",
                "123456",new ArrayList<>()));
        securiryService.saveUser(new User(2L, "johny","johny@gmail.com",
                "123456",new ArrayList<>()));
        securiryService.saveUser(new User(3L, "jim","jim@gmail.com",
                "123456",new ArrayList<>()));
        securiryService.saveUser(new User(4L, "bill","bill@gmail.com",
                "123456",new ArrayList<>()));

        securiryService.addRoleToUser("user", "hoangnd");
        securiryService.addRoleToUser("user", "johny");

        securiryService.addRoleToUser("admin", "jim");
        securiryService.addRoleToUser("owner", "bill");

    }
}
