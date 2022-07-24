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
docker-compose -f ./postgres-compose.yml up
docker-compose -f ./postgres-compose.yml down
pgcli -h localhost -p 5433 -U postgres

psql
\l
create database test_db;
\c test_db;
* */
