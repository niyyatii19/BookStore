package com.bookStore.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookStore.dto.BookAuthor;
import com.bookStore.entity.Books;
import com.bookStore.service.BookService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	BookService bookServ;

	@GetMapping
	public String getList(Map<String, List<Books>> map) {
		List<Books> list = bookServ.getAllBooks();
		map.put("books", list);
		return "listBooks";
	}

	@GetMapping("/add")
	public String getInsertForm() {
		return "insertForm";
	}

	@PostMapping("/add")
	public String insertBook(@RequestParam("image") String text, BookAuthor book) {
		byte[] bytes;
		
		try {
//			bytes = image.getBytes();
//			Path path = Paths.get("./resources/static/images/" + image.getOriginalFilename());
//			Files.write(path, bytes);
//			book.setUrl("/images/"+ image.getOriginalFilename());
			System.out.println(text);
			book.setUrl(text);
			String result = bookServ.insert(book);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:add";
		}
		return "redirect:/admin";
	}

	@GetMapping("/edit/{id}")
	public String editBook(@PathVariable int id, Map<String, Books> map) {
		Books book;
		try {
			book = bookServ.getById(id);
			map.put("book", book);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/admin";
		}

		return "updateForm";
	}
	
	@PostMapping("/edit/{id}")
	public String updateBook(Books book, @PathVariable int id) {
		
		bookServ.updateBook(book);
		return "redirect:/admin";
	}

	@GetMapping("/delete/{id}")
	public String deleteBook(@PathVariable int id) {
		Books book = bookServ.getById(id);
		bookServ.deleteBook(book);
		return "redirect:/admin";
	}

	@GetMapping("search")
	public String searchAllBooks(@RequestParam("name") String name, Map<String, List<Books>> map) {
		List<Books> list = bookServ.getByAuthor(name);
		map.put("books", list);
		return "listBooks";
	}
	
	
}
