package com.kotlin.tutorials.models
//default is "final"
//open or sealed = inheritable
//sealed class is abstract
//sealed can be inherited only in the same package
sealed class Vehicle(val name: String, val model: String, val price: Double) {
    override fun toString(): String = "name: ${this.name}, model: ${this.model}, price: ${this.price}"
}