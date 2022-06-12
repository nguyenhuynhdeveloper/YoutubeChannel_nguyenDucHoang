package com.kotlin.tutorials.models
data class User(val id: Int, val name: String, val email:String) {
    //compare content
    override fun equals(other: Any?): Boolean =
        other is User && this.id == id &&
                this.name == name &&
                this.email == email
}
//data class User(val name: String, val id: Int) {           // 1
//    override fun equals(other: Any?) =
//        other is User && other.id == this.id               // 2
//}
