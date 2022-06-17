package com.kotlin.tutorials.models

import kotlin.properties.Delegates

class Product(val map: Map<String, Any?>) {
    val name: String by map
    val price: Int by map
    var description: String by Delegates.observable("Initial value") {
            property, oldValue, newValue ->
        println("${property.name}: $oldValue -> $newValue")
    }
    var count: Int by Delegates.vetoable(0) {
            property, oldValue, newValue ->
        println("${property.name}: $oldValue -> $newValue")
        newValue >= 0
    }
    override fun toString(): String {
        return "name: $name, price: $price"
    }
}
