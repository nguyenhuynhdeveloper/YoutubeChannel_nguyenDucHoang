package com.training

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class TrainingAppApplication

fun main(args: Array<String>) {
	runApplication<TrainingAppApplication>(*args)
}
