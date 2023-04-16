package com.bookStore.database;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookStore.entity.Users;



public interface UserRepo extends JpaRepository<Users, Integer>{
	Users findByEmail(String email);
	
}
