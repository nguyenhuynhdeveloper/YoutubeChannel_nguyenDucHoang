package com.kotlin.tutorials.models

class Bicycle(name: String, model: String, price: Double,val hasBaset: Boolean)
    : Vehicle(name, model, price) {
    override fun toString(): String = "${super.toString()} price: ${this.price}"
    }