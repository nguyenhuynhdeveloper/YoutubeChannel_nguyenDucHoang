package com.training.controllers

import org.springframework.web.bind.annotation.*

@RestController
internal class CarController(repository: CarRepository) {
    private val repository: CarRepository

    init {
        this.repository = repository
    }
    @GetMapping("/cars")
    fun all(): List<Car> {
        return repository.findAll()
    }

    // end::get-aggregate-root[]
    @PostMapping("/cars")
    fun newCar(@RequestBody newCar: Car?): Car {
        return repository.save(newCar)
    }

    // Single item
    @GetMapping("/cars/{id}")
    fun one(@PathVariable id: Long?): Car {
        return repository.findById(id)
            .orElseThrow { CarNotFoundException(id) }
    }

    @PutMapping("/cars/{id}")
    fun replaceCar(@RequestBody newCar: Car, @PathVariable id: Long?): Car {
        return repository.findById(id)
            .map { Car ->
                Car.setName(newCar.getName())
                Car.setRole(newCar.getRole())
                repository.save(Car)
            }
            .orElseGet {
                newCar.setId(id)
                repository.save(newCar)
            }
    }

    @DeleteMapping("/cars/{id}")
    fun deleteCar(@PathVariable id: Long?) {
        repository.deleteById(id)
    }
}