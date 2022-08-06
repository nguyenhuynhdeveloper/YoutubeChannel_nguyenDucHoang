package com.training.controllers

import com.training.models.Car
import com.training.repositories.CarRepository
import org.springframework.web.bind.annotation.*

@RestController
internal class CarController(repository: CarRepository) {
    private val repository: CarRepository

    init {
        this.repository = repository
    }
    @GetMapping("/cars")
    fun all(): MutableList<Car?> {
        return repository.findAll()
    }

    // end::get-aggregate-root[]
    @PostMapping("/cars")
    fun insert(@RequestBody newCar: Car): Car {
        return repository.save(newCar)
    }

    // Single item
    @GetMapping("/cars/{id}")
    fun find(@PathVariable id: Long): Car? {
        return repository.findById(id)
            .orElseThrow { NoSuchElementException("${id}") }
    }

    @PutMapping("/cars/{id}")
    fun update(@RequestBody newCar: Car, @PathVariable id: Long): Car? {
        val existingCar:Car? = repository.findById(id)?.get();
        if (existingCar != null) {
            existingCar.name = newCar.name;
            existingCar.year = newCar.year;
            existingCar.engineSize = newCar.engineSize;
            existingCar.horsePower = newCar.horsePower;
            repository.save(existingCar);
        }
        return  existingCar;
    }

    @DeleteMapping("/cars/{id}")
    fun delete(@PathVariable id: Long) {
        repository.deleteById(id)
    }
}