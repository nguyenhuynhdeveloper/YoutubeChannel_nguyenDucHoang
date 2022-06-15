package com.kotlin.tutorials.models
//default is "final"
//open or sealed = inheritable
//sealed class is abstract
//sealed can be inherited only in the same package
sealed class Vehicle(private val name: String, private val year: Int) {
    override fun toString(): String = "name: ${this.name}, year: ${this.year}"
}