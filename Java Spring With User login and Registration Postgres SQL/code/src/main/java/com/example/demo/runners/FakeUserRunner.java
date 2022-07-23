package com.example.demo.runners;

import com.example.demo.models.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

@Log4j2
@RequiredArgsConstructor
@Order(value=1)
@Component
public class FakeUserRunner implements CommandLineRunner{
    @Override
    public void run(String... args) throws Exception {
    }
}
