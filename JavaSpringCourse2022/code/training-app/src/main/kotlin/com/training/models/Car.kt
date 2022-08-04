package com.training.models

class Car(var name: String, var year: Int, var engineSize:Float, var horsePower: Int) {
    override fun toString(): String {
        return "name: $name, year: $year, engineSize: $engineSize, horsePower:$horsePower"
    }
}