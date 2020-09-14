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
import com.suyambu.construction.service.MaterialService;

@Controller
public class MaterialController {
	
	@Autowired
	MaterialService materialService;

	@RequestMapping(value = "newMaterial", method = RequestMethod.POST)
	public ModelAndView addMaterial(HttpServletRequest request, Material material) {

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
		
		materialService.save(material);
		ModelAndView mv = new ModelAndView("index");
		return mv;
		
		
	}
	
	@RequestMapping(value = "newMaterial", method = RequestMethod.GET)
	public ModelAndView getAddMaterial(HttpServletRequest request) {

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

		ModelAndView mv = new ModelAndView("index");
		return mv;
		
		
	}
	
	@RequestMapping(value = "getMaterial", method = RequestMethod.GET)
	public ModelAndView getMaterial(HttpServletRequest request) {

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
		
		ModelAndView mv = new ModelAndView("materials");
		List<Material> materials = materialService.getAll();
		mv.addObject("materialList",materials);
		
		return mv;
		
	}
	
	@RequestMapping(value = "updateMaterial", method = RequestMethod.POST)
	public String updateMaterial(HttpServletRequest request, Material material, HttpServletResponse response) throws IOException {

		// Session
		HttpSession session=request.getSession(false);  
        int userId = (int) session.getAttribute("id");
        if(userId == 0) {
        	response.sendRedirect("/");
        }
		
		 materialService.update(material);
		return "redirect:/getMaterial";
		
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
		 
	
        materialService.delete(id);
        return "redirect:/getMaterial";
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
			
			
		ModelAndView mv = new ModelAndView("updateMaterial");
		Material material = materialService.read(id);
       mv.addObject("material",material);
       return mv;
	}

}
