package com.kotlin.tutorials.storage

open class MongoDBRepository(val connectionString: String):IStorageRepository {
    override fun makeConnection(connectionString: String) {
        println("connect MySQL DB with $connectionString")
    }
}