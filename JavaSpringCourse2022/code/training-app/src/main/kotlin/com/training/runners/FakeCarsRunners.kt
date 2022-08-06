package com.training.runners

import com.training.repositories.CarRepository
import lombok.extern.slf4j.Slf4j
import mu.KotlinLogging
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.CommandLineRunner
import org.springframework.context.annotation.Bean
import org.springframework.stereotype.Component

@Component
@Slf4j
class FakeCarsRunners : CommandLineRunner {
    val logger = KotlinLogging.logger {}
    @Autowired
    private lateinit var carRepository:CarRepository;

    @Throws(Exception::class)
    override fun run(vararg args: String?) {
        logger.info("this ran")
    }
}