package com.bookStore.controller;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookStore.entity.Books;
import com.bookStore.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/likedBooks")
	public String getAllLikedBooks(Map<String, Set<Books>> map, HttpSession session) {
		int userId = (int) session.getAttribute("id");
		Set<Books> books = userService.getAllLikedBooks(userId);
		// System.out.println(books);
		if (books.isEmpty()) {
			return "redirect:showBooks?error=list is empty";
		}
		map.put("books", books);
		return "likedBooks";
	}

	@GetMapping("/book/{bookId}")
	public String addToLikeBooks(@PathVariable("bookId") int bookId, HttpSession session) {
		int userId = (int) session.getAttribute("id");
		// System.out.println(userId);
		String result = userService.addToLikedBooks(userId, bookId);
		// System.out.println(result);
		return "redirect:/showBooks";
	}

	@GetMapping("/readLaterBooks")
	public String getAllReadLaterBooks(Map<String, Set<Books>> map, HttpSession session) {
		int userId = (int) session.getAttribute("id");
		Set<Books> books = userService.getAllReadLaterBooks(userId);
		// System.out.println(books);
		if (books.isEmpty()) {
			return "redirect:showBooks?error=list is empty";
		}
		map.put("books", books);
		return "readLaterBooks";
	}

	@GetMapping("/readLaterBook/{bookId}")
	public String addToReadLaterBooks(@PathVariable("bookId") int bookId, HttpSession session) {
		int userId = (int) session.getAttribute("id");
		// System.out.println(userId);
		String result = userService.addToReadLaterBooks(userId, bookId);
		// System.out.println(result);
		return "redirect:/showBooks";
	}
	
	
	
}
