package com.kotlin.tutorials.models
class Car(name: String, year: Int,
          var engineSize: Float, var horsePower: Int)
    : Vehicle(name, year) {
    override fun toString(): String = "${super.toString()} " +
            "engineSize: ${this.engineSize}, horsePower: ${this.horsePower}"
}