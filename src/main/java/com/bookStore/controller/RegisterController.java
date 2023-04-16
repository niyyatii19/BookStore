package com.bookStore.controller;

import java.util.Map;

import javax.persistence.EntityExistsException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bookStore.entity.Users;
import com.bookStore.service.UserService;


@Controller
public class RegisterController {
	@Autowired
	UserService userService;
	
	@GetMapping("/register")
	public String getRegisterPage() {
		return "register";
	}

	@PostMapping("/register")
	public String getUserDetails(Users  user, Map<String, String> map) {
		//register user call user service
		try{
			userService.registerUser(user);
		}catch(EntityExistsException e) {
			System.out.println(e.getMessage()); 
			map.put("error", e.getMessage());
			return "redirect:register?error=User Already exists";
		}
		return "redirect:login";
	}
}
