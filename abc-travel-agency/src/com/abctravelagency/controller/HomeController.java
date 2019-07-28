package com.abctravelagency.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abctravelagency.service.HomeService;
import com.abctravelagency.service.ProfileService;
import com.abctravelagency.utility.Utility;


@Controller
public class HomeController {
	
	@Autowired
	HomeService homeService;
	
	@RequestMapping(value={"/", "/home"})
	public String home(Model model) {
		model.addAttribute("pageTitle", "Home");
		model.addAttribute("listOfStatus", homeService.getAllStatus());
		return "Home";
	}

}
