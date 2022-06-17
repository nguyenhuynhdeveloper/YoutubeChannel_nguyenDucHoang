package com.kotlin.tutorials.models

import kotlin.reflect.KProperty

data class User(var id: Int, var name: String, var email:String) {
    //compare content
    override fun equals(other: Any?): Boolean =
        other is User && this.id == id &&
                this.name == name &&
                this.email == email

    var age:Int by UserDelegate()
    override fun hashCode(): Int {
        return id + name.hashCode() + email.hashCode()
    }
    //lazy delegates
    val description: String by lazy {
        "id: $id, name: $name, email: $email"
    }
}
class UserDelegate {
    private var value:Int = 0
    operator fun getValue(user: User, property: KProperty<*>): Int {
        println("Call getValue of ${property.name}")
        return value
    }
    operator fun setValue(user: User, property: KProperty<*>, i: Int) {
        println("Call setValue of ${property.name}")
        value = i
    }
}