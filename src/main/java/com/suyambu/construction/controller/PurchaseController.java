package com.suyambu.construction.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.suyambu.construction.model.Material;
import com.suyambu.construction.model.Purchase;
import com.suyambu.construction.service.MaterialService;
import com.suyambu.construction.service.PurchaseService;

@Controller
@RequestMapping("purchase")
public class PurchaseController {

	@Autowired
	PurchaseService purchaseService;

	@Autowired
	MaterialService materialService;
	
	
	@RequestMapping(value = "newPurchase", method = RequestMethod.POST)
	public ModelAndView addPurchase(HttpServletRequest request, Purchase purchase) {

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
		
			purchase.setUserId(userId);
			purchase.setUserName(userName);
			purchase.setMaterialName(materialService.getName(purchase.getMaterialId()));
			purchaseService.save(purchase);
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
	

	@RequestMapping(value = "newPurchase", method = RequestMethod.GET)
	public ModelAndView getAddPurchase(HttpServletRequest request) {

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
		
		List<Material> materialList = materialService.getAll();
		
		ModelAndView urlPurchase = new ModelAndView("/purchase/addPurchase");
		urlPurchase.addObject("materialList",materialList);
		return urlPurchase;
	}
	
	@RequestMapping(value = "getPurchase", method = RequestMethod.GET)
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
		
			
			List<Purchase> purchaseList = purchaseService.getAll();
			int total = 0;
			
			if(purchaseList != null && !purchaseList.isEmpty()) {
				
				for(int i = 0; i<purchaseList.size();i++) {
					
					total = total + purchaseList.get(i).getTotal();
					
				}
				
			}
			
			List<Material> materialList = materialService.getAll();
		ModelAndView mv = new ModelAndView("purchase/purchases");
		mv.addObject("purchaseList", purchaseList);
		mv.addObject("materialList", materialList);
		mv.addObject("grantTotal", total);
		return mv;
	}
	
	
	@RequestMapping("getRate")     
	@ResponseBody
	public String getRate(@RequestParam int id, HttpServletRequest request, HttpServletResponse response, Model model) {
	   
		int rate = materialService.getRate(id);
	        model.addAttribute("rate", rate);
	        return String.valueOf(rate);
	   
	}
	
	@RequestMapping(value = "updatePurchase", method = RequestMethod.POST)
	public String updatePurchase(HttpServletRequest request,Purchase purchase, HttpServletResponse response) throws IOException {

		// Session
				HttpSession session=request.getSession(false);  
		        int userId = (int) session.getAttribute("id");
		        if(userId == 0) {
		        	response.sendRedirect("/");
		        }
		        
		        purchaseService.updatePurchase(purchase);
		        return "redirect:/purchase/getPurchase";
		
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
			
			
		ModelAndView mv = new ModelAndView("/purchase/updatePurchase");
		Purchase purchase = purchaseService.getPurchase(id);
		mv.addObject("purchase", purchase);
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
		 
	
        purchaseService.delete(id);
        return "redirect:/purchase/getPurchase";
	}
	
	
	// ********************   Search    ****************************************************
	

	@RequestMapping("searchByMaterial")     
	@ResponseBody
	public List<Purchase> searchByMaterial(@RequestParam int materialId, HttpServletRequest request, HttpServletResponse response, Model model) {
	   
	        return purchaseService.readByMaterial(materialId);
	   
	}
	@RequestMapping("searchByBendings")     
	@ResponseBody
	public List<Purchase> searchByBendings( HttpServletRequest request, HttpServletResponse response, Model model) {
	   
	        return purchaseService.readByBendings();
	   
	}
	
	@RequestMapping("searchByDate")     
	@ResponseBody
	public List<Purchase> searchByDate(@RequestParam String date, HttpServletRequest request, HttpServletResponse response, Model model) throws ParseException {
	   
		date = date.replace("-", "/");
		  Date date1=new SimpleDateFormat("yyyy/MM/dd").parse(date); 
	        return purchaseService.readByDate(date1);
	   
	}
	
}
