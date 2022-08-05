package com.training.models

import java.util.*
import javax.persistence.*

@Entity
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null

    @Column(nullable = false)
    var name: String = ""

    @Column(nullable = false)
    var year: Int? = null

    var engineSize:Float = 0.0f
    var horsePower: Int = 0

    constructor() {}
    constructor(name: String, year: Int,
                engineSize:Float, horsePower: Int) {
        this.name = name
        this.year = year
        this.engineSize = engineSize
        this.horsePower = horsePower
    }
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is Car) return false

        return (id == other.id
                && Objects.equals(name, other.name)
                && engineSize == other.engineSize
                && horsePower == other.horsePower)
    }

    override fun hashCode(): Int {
        return Objects.hash(id, name, engineSize, horsePower)
    }
    override fun toString(): String {
        return "name: $name, year: $year, engineSize: $engineSize, horsePower:$horsePower"
    }
}