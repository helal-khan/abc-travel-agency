package com.abctravelagency.controller;

import java.util.UUID;
import java.util.logging.Logger;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abctravelagency.utility.Utility;
import com.abctravelagency.model.User;
import com.abctravelagency.service.AuthenticationService;

@Controller
public class AuthenticationController {
	
	//private static final Logger logger = Logger.getLogger(AuthenticationController.class);
	
	@Autowired
	private AuthenticationService authenticationService;
	
	private JSONObject jsonObj = new JSONObject();
	
	@RequestMapping(value={"/login"})
	public String login(Model model) {
		if(Utility.isLoggedIn())
			return "redirect:home";
		
		model.addAttribute("pageTitle", "Login");
		return "Login";
	}
	
	@RequestMapping(value="/user-registration", method=RequestMethod.GET)
	public String createAccountForm(Model model) {
		if(Utility.isLoggedIn())
			return "redirect:home";
		model.addAttribute("user", new User());
		model.addAttribute("pageTitle", "Register");
			return "UserRegistration";
	}
	
	
	@RequestMapping(value="/user-registration", method=RequestMethod.POST)
	public String createAccountSubmit(Model model, HttpServletRequest request,
			@ModelAttribute("user") @Validated User user, BindingResult result) {
		if(Utility.isLoggedIn())
			return "redirect:home";
		boolean isUserCreated = false;
		try {
			if(authenticationService.isExist(user.getUsername())) {
				result.rejectValue("username", "DuplicateKey.user.username");
				return "UserRegistration";
			}
			if(authenticationService.isExistEmail(user.getEmail())) {
				result.rejectValue("email", "DuplicateKey.user.email");
				return "UserRegistration";
			}
			if(result.hasErrors()) {
				return "UserRegistration";
			}
			System.out.println("Before insert");
			user.setUserKey(UUID.randomUUID().toString());
			isUserCreated = authenticationService.createAccount(user);
			model.addAttribute("reg", isUserCreated);
			System.out.println("After insert");
			return "UserRegistration";
			
		} catch (Exception e) {
			System.out.println("error heeeeeeeeeee");
			model.addAttribute("reg", isUserCreated);
			return "UserRegistration";
		}
	}
	
	
	
	
	

	
	
	@RequestMapping(value="/checkUsername", method=RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String CheckUsername(@RequestParam("username") String username) {
		try {
			if(username!=null || username!="") {
				jsonObj.put("success", true);
				jsonObj.put("data", authenticationService.isExist(username));
				jsonObj.put("message", "null");
				return jsonObj.toString();
			}
			return Utility.errorResponse("");
			
		} catch (Exception e) {
			return Utility.errorResponse(e.getMessage());
		}
	}
	
	@RequestMapping(value="/checkEmail", method=RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String CheckEmail(@RequestParam("email") String email) {
		try {
			if(email!=null || email!="") {
				jsonObj.put("success", true);
				jsonObj.put("data", authenticationService.isExistEmail(email));
				jsonObj.put("message", "null");
				return jsonObj.toString();
			}
			return Utility.errorResponse("");
		} catch (Exception e) {
			return Utility.errorResponse(e.getMessage());
		}
	}

}
