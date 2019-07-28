package com.abctravelagency.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abctravelagency.model.Status;
import com.abctravelagency.model.User;
import com.abctravelagency.service.ProfileService;
import com.abctravelagency.utility.Utility;

@Controller
public class ProfileController {
	
	@Autowired
	private ProfileService profileService;
	
	JSONObject jsonObj=new JSONObject();
	
	@RequestMapping(value={"/profile"})
	public String profile(Model model) {
		User user= profileService.getUserByUsername(Utility.getUsername());
		model.addAttribute("user", user);
		model.addAttribute("locations", profileService.getLocation());
		model.addAttribute("pageTitle", "Profile");
		model.addAttribute("listOfStatus", profileService.getStatusByUserId(user.getUserId()));
		model.addAttribute("status", new Status());
		return "Profile";
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.POST)
	public String postStatus(Model model, HttpServletRequest request,
			@ModelAttribute("status") @Validated Status status, BindingResult result) {
		
		
		boolean isUserCreated = false;
		User user = profileService.getUserByUsername(Utility.getUsername());
		model.addAttribute("user", user);
		model.addAttribute("locations", profileService.getLocation());
		model.addAttribute("pageTitle", "Profile");
		model.addAttribute("status", new Status());
		try {
			
			if(result.hasErrors()) {
				return "Profile";
			}
			status.setUserId(user.getUserId());
			isUserCreated = profileService.createPost(status);
			model.addAttribute("post", isUserCreated);
			model.addAttribute("listOfStatus", profileService.getStatusByUserId(user.getUserId()));
			return "Profile";
			
		} catch (Exception e) {
			model.addAttribute("post", isUserCreated);
			return "Profile";
		}
	}
	
	@RequestMapping(value="/change-status", method=RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String CheckUsername(@RequestParam("statusId") int statusId, @RequestParam("access") int access) {
			System.out.println(statusId);
		try {
			if(statusId!=0) {
				profileService.changeStatusAccess(statusId, access);
				jsonObj.put("success", true);
				jsonObj.put("message", "null");
				return jsonObj.toString();
			}
			return Utility.errorResponse("");
			
		} catch (Exception e) {
			return Utility.errorResponse(e.getMessage());
		}
	}

}
