package com.kotlin.tutorials.models
class Car(name: String, model: String, price: Double,val horsePower: Double)
    : Vehicle(name, model, price) {
    override fun toString(): String = "${super.toString()} price: ${this.price}"
}