package com.bookStore.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookStore.entity.Books;
import com.bookStore.service.BookService;



@Controller
@RequestMapping("")
public class BookController {
	
	@Autowired
	private BookService bookService;

	@GetMapping("/showBooks")
	public String getAllBooks(Map<String, List<Books>> map, @RequestParam(required=false) String isClick, 
			@RequestParam(required=false) Double min, @RequestParam(required=false) Double max) {
		List<Books> books;
		if(isClick != null) {
			books = bookService.getOrderByPrice();
		}
		else if(min != null && max != null) {
			books = bookService.getByPriceRange(min, max);
		}
		else {
			books = bookService.getAllBooks();
		}
		map.put("books", books);
		return "showBooks";
	}
	
	
	@GetMapping("/showBooks/{id}")
	public String getAllBooks(@PathVariable("id") int id, Map<String, List<Books>> map) {
		System.out.println(""+ id);
		List<Books> list = bookService.getAllBooks();
		//System.out.println(list);
		map.put("books", bookService.getAllBooks());
		return "showBooks";
	}
	
	@GetMapping("search")
	public String searchAllBooks(@RequestParam("name") String name, Map<String, List<Books>> map) {
		List<Books> list = bookService.getByAuthor(name);
		map.put("books", list);
		return "showBooks";
	}
	
	
}
