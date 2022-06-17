package com.kotlin.tutorials.storage

interface IStorageRepository {
    fun makeConnection(connectionString: String)
    //other insert, update, delete...here
}