package com.suyambu.construction.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suyambu.construction.model.Material;
import com.suyambu.construction.model.Purchase;
import com.suyambu.construction.model.Wages;
import com.suyambu.construction.service.WageService;

@Controller
@RequestMapping("wage")
public class WageController {
	
	@Autowired
	WageService wageService;

	@RequestMapping(value = "newWage", method = RequestMethod.POST)
	public ModelAndView addWage(HttpServletRequest request, Wages wage) {

		// **Session **
		 int userId = 0;
		 String userName = "";
			HttpSession session=request.getSession(false);  
			if(session != null) {
	         userId = (int) session.getAttribute("id");
	         userName = (String) session.getAttribute("userName");
	        if(userId == 0 ) {
	        	ModelAndView mv = new ModelAndView("home");
	    		return mv;
	        }
			}else {
				ModelAndView mv = new ModelAndView("home");
	    		return mv;
			}
			wageService.saveWage(wage);
		ModelAndView mv = new ModelAndView("/wage/addWage");
		return mv;
	}
	
	@RequestMapping(value = "newWage", method = RequestMethod.GET)
	public ModelAndView getWage(HttpServletRequest request) {

		int userId = 0;
		HttpSession session=request.getSession(false);  
		if(session != null) {
         userId = (int) session.getAttribute("id");
        if(userId == 0 ) {
        	ModelAndView mv = new ModelAndView("home");
    		return mv;
        }
		}else {
			ModelAndView mv = new ModelAndView("home");
    		return mv;
		}
		
		
		ModelAndView urlPurchase = new ModelAndView("/wage/addWage");
		return urlPurchase;
	}

	@RequestMapping(value = "getWage", method = RequestMethod.GET)
	public ModelAndView getPurchase(HttpServletRequest request, Purchase purchase) {

		// **Session **
		 int userId = 0;
			HttpSession session=request.getSession(false);  
			if(session != null) {
	         userId = (int) session.getAttribute("id");
	        if(userId == 0 ) {
	        	ModelAndView mv = new ModelAndView("home");
	    		return mv;
	        }
			}else {
				ModelAndView mv = new ModelAndView("home");
	    		return mv;
			}
		
			
			List<Wages> wageList = wageService.getAll();
int total = 0;
			
			if(wageList != null && !wageList.isEmpty()) {
				
				for(int i = 0; i<wageList.size();i++) {
					
					total = total + wageList.get(i).getAmount();
					
				}
				
			}
		ModelAndView mv = new ModelAndView("wage/wages");
		mv.addObject("wageList", wageList);
		mv.addObject("grantTotal", total);
		return mv;
	}
	
	@RequestMapping(value = "updateWage", method = RequestMethod.POST)
	public String updateWage(HttpServletRequest request,Wages wage, HttpServletResponse response) throws IOException {

		System.out.println("comes in");
		// Session
				HttpSession session=request.getSession(false);  
		        int userId = (int) session.getAttribute("id");
		        if(userId == 0) {
		        	response.sendRedirect("/");
		        }
		        
		        wageService.update(wage);
		        return "redirect:/wage/getWage";
		
	}
	
	@RequestMapping("/edit/{id}")
	public ModelAndView edit(HttpServletRequest request,@PathVariable(value = "id") int id, HttpServletResponse response)
			throws IOException {
	

		 int userId = 0;
			HttpSession session=request.getSession(false);  
			if(session != null) {
	         userId = (int) session.getAttribute("id");
	        if(userId == 0 ) {
	        	ModelAndView mv = new ModelAndView("home");
	    		return mv;
	        }
			}else {
				ModelAndView mv = new ModelAndView("home");
	    		return mv;
			}
			
			
		ModelAndView mv = new ModelAndView("/wage/updateWage");
		System.out.println("comes wedit");
		Wages wage = wageService.getWage(id);
		System.out.println("comes wedit2");
		mv.addObject("wage", wage);
       return mv;
	}

	@RequestMapping("/delete/{id}")
	public String delete(HttpServletRequest request,@PathVariable(value = "id") int id, HttpServletResponse response)
			throws IOException {
		// Session
		
		  HttpSession session=request.getSession(false);
		  int userId = (int) session.getAttribute("id"); 
		  if(userId == 0) { 
			  response.sendRedirect("/");
			  }
		 
	
        wageService.delete(id);
        return "redirect:/wage/getWage";
	}
	
	
	
}
