package com.kotlin.tutorials.storage

//class MyDBRepository(connectionString: String): IStorageRepository by MySQLRepository(connectionString)
class MyDBRepository(connectionString: String): IStorageRepository by MongoDBRepository(connectionString)
