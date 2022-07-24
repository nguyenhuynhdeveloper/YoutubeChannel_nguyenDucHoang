package com.example.demo.models.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

import java.io.Serializable;

@AllArgsConstructor
@Log4j2
@Getter @Setter
public class UserLoginDTO implements Serializable {
    private String username;
    private String password;
}
