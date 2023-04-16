package com.bookStore.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookStore.database.AuthorRepo;
import com.bookStore.database.BookRepo;
import com.bookStore.dto.BookAuthor;
import com.bookStore.entity.Authors;
import com.bookStore.entity.Books;

@Service
public class BookService {

	@Autowired
	private BookRepo bookRepo;
	@Autowired
	private AuthorRepo authorRepo;

	public List<Books> getAllBooks() {
		List<Books> books = new ArrayList<>();
		bookRepo.findAll().forEach(books::add);
		return books;
	}

	// 1. Insert
	// 2. Update
	// 3. search

	public String insert(BookAuthor bookAuthor) {
		Books book = new Books();
		Authors author = new Authors();
		book.setTitle(bookAuthor.getTitle());
		book.setDescription(bookAuthor.getDescription());
		book.setPrice(bookAuthor.getPrice());
		book.setUrl(bookAuthor.getUrl());
		author.setName(bookAuthor.getName());
		author.setCountry(bookAuthor.getCountry());
		book.setAuthor(author);
		authorRepo.saveAndFlush(author);
		bookRepo.saveAndFlush(book);
		return "Inserted";
	}

	public Books getById(int id) {
		return bookRepo.findById(id).get();
	}

	public List<Books> getByAuthor(String name) {
		List<Books> books = new ArrayList<>();
		List<Authors> authors = authorRepo.findByNameStartsWith(name);
		for(Authors author : authors) {
			List<Books> booksA = bookRepo.findByAuthorId(author.getId());
			booksA.forEach(books :: add);
		}
		return books;
	}
	
	public String updateBook(Books book) {
		System.out.println(book.getAuthor());
		authorRepo.save(book.getAuthor());
		
		bookRepo.save(book);
		return "Updated";
	}
	
	
	public String deleteBook(Books book) {
		bookRepo.delete(book);
		return "deleted";
	}
	
	public List<Books> getOrderByPrice(){
		List<Books> books = new ArrayList<>();
		bookRepo.findAllByOrderByPriceAsc().forEach(books :: add);
		return books;
	}
	
	public List<Books> getByPriceRange(double start, double end){
		List<Books> books = new ArrayList<>();
		bookRepo.findByPriceBetween(start, end).forEach(books :: add);
		return books;
	}
	
}
