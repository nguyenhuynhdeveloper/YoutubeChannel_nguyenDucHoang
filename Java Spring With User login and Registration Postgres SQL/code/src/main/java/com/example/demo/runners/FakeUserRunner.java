package com.example.demo.runners;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import com.example.demo.services.SecuriryService;
@Log4j2
@RequiredArgsConstructor
public class FakeUserRunner implements CommandLineRunner {
    private final SecuriryService securiryService;
    @Override
    public void run(String... args) throws Exception {

    }
}
