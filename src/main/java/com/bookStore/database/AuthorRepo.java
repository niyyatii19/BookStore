package com.bookStore.database;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookStore.entity.Authors;


public interface AuthorRepo extends JpaRepository<Authors, Integer> {
	//List<Books> findAllBooks(int id);
	List<Authors> findByNameStartsWith(String name);
}
