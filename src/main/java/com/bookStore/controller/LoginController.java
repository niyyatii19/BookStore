package com.bookStore.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookStore.dto.LoginDto;
import com.bookStore.entity.Users;
import com.bookStore.service.UserService;

@Controller
@RequestMapping("/")
public class LoginController {

	@Autowired
	UserService userService;

	@GetMapping("/login")
	public String getLoginPage(HttpServletRequest request, Map<String, List<String>> map, Map<String, String> errorMap,
			@RequestParam(required = false) String error) {
		if (error != null)
			errorMap.put("error", error);
		return "/login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request) {

		session.removeAttribute("email");
		session.removeAttribute("id");
		session.removeAttribute("name");
		session.invalidate();
		return "redirect:showBooks";
	}

	@PostMapping("/login")
	public String loginPage(LoginDto loginDto, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		try {
			Users user = userService.validateUser(loginDto);
			if (user != null) {
				session.setAttribute("email", loginDto.getEmail());
				session.setAttribute("id", user.getId());
				session.setAttribute("name", user.getName());
				if (user.getRole().equals("admin")) {
					return "redirect:/admin";
				}
				return "redirect:showBooks/" + user.getId();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:login?error=Invalid credentials";
		}
		return "redirect:login?error=Invalid credentials";
	}
}
