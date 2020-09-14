package com.suyambu.construction.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.suyambu.construction.model.User;
import com.suyambu.construction.service.UserService;

@Controller
public class HomeController {

	@Autowired
	UserService userService;
	

	@RequestMapping("/")
	public ModelAndView home() {

		ModelAndView mv = new ModelAndView("home");
		return mv;
	}
	
	@RequestMapping(value = "/register")
	public ModelAndView register() {

		ModelAndView mv = new ModelAndView("registeruser");
		User user = new User();
		mv.addObject("user", user);
		return mv;

	}
	
	@RequestMapping(value = "/registerUser")
	public ModelAndView registerUser(@ModelAttribute("user") User user) {

		userService.save(user);
		ModelAndView mv = new ModelAndView("home");
		return mv;

	}

	@RequestMapping(value = "/login")
	public ModelAndView login(HttpServletRequest request,@ModelAttribute("user") User user) {

		int id = userService.getId(user);
		if (id != 0) {
			HttpSession session=request.getSession(); 
			session.setMaxInactiveInterval(100000);
	        session.setAttribute("id",id); 
	        session.setAttribute("userName", user.getUsername());
			ModelAndView mv = new ModelAndView("index");
			return mv;
		} else {
			
			ModelAndView mv = new ModelAndView("home");	
			return mv;
		}
		

	}
	
	@RequestMapping("/logout")
	public String delete(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// Session
		HttpSession session=request.getSession(false);  
       session.setAttribute("id", 0);
	
        return "redirect:/";
	}
}
