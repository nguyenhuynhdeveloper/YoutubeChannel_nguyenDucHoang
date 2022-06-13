package com.kotlin.tutorials.enums
enum class RequestError(val message: String) {
    BAD_REQUEST("You send an invalid request"),
    INTERNAL_ERROR("Internal server error"),
    SUCCESS("Server processes request successfully");
    //method as a getter
    fun wordCount() = message.trim().split("\\s+".toRegex()).size
    /*
    fun wordCount():Int {
        println("ddd")
        return message.trim().split("\\s+".toRegex()).size
    }
    */

}