package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DemoApplication {
	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}
}
/*
docker run --name postgres-container \
-it --rm \
-e POSTGRES_PASSWORD=Abc123456789@ \
postgres \
psql -h postgres-container -U postgres

docker-compose -f ./postgres-compose.yml up
docker-compose -f ./postgres-compose.yml down

psql
\l
create database test_db;
\c test_db;
* */
