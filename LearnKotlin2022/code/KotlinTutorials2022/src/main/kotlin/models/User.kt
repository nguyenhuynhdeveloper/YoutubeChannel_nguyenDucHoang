package com.kotlin.tutorials.models
data class User(var id: Int, var name: String, var email:String) {
    //compare content
    override fun equals(other: Any?): Boolean =
        other is User && this.id == id &&
                this.name == name &&
                this.email == email

    override fun hashCode(): Int {
        return id + name.hashCode() + email.hashCode()
    }
}
//data class User(val name: String, val id: Int) {           // 1
//    override fun equals(other: Any?) =
//        other is User && other.id == this.id               // 2
//}
