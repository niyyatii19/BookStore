package com.bookStore.database;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookStore.entity.Books;


public interface BookRepo extends JpaRepository<Books, Integer>{
	List<Books> findByAuthorId(int id);
	List<Books> findAllByOrderByPriceAsc();
	List<Books> findByPriceBetween(double start, double end);
}
