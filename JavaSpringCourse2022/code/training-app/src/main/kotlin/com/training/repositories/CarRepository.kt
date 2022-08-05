package com.training.repositories

import com.training.models.Car
import org.springframework.data.jpa.repository.JpaRepository


internal interface CarRepository : JpaRepository<Car?, Long?>