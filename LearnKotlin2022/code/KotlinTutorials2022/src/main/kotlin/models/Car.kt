package com.kotlin.tutorials.models
class Car(name: String, year: Int,
          private val engineSize: Float, val horsePower: Int)
    : Vehicle(name, year) {
    override fun toString(): String = "${super.toString()} " +
            "engineSize: ${this.engineSize}, horsePower: ${this.horsePower}"
}