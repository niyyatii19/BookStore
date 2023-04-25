package com.bookStore.controller;

import java.io.BufferedWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.bookStore.dto.BookAuthor;
import com.bookStore.entity.Books;
import com.bookStore.service.BookService;
import com.bookStore.utility.FileUploadUtil;

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

	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String insertBook(@RequestParam("image") MultipartFile text, BookAuthor book) {
		System.out.println("ccc");
		byte[] bytes;
		
		try {
			System.out.println(text.getOriginalFilename());
			bytes = text.getBytes();
			book.setUrl("/images/"+ text.getOriginalFilename());
			String result = bookServ.insert(book);
			
			String uploadDir = "src/main/resources/static/images/";
			 
	        FileUploadUtil.saveFile(uploadDir, text.getOriginalFilename(), text);
//			book.setUrl(text);
			
			
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
