package com.erick.dojosandninjas.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.erick.dojosandninjas.models.Dojo;
import com.erick.dojosandninjas.models.Ninja;
import com.erick.dojosandninjas.services.DojoService;
import com.erick.dojosandninjas.services.NinjaService;

@Controller
public class MainController {
	
	@Autowired
	private DojoService dojoService;
	
	@Autowired
	private NinjaService ninjaService;
	
	public MainController(DojoService dojoService, NinjaService ninjaService) {
		this.dojoService = dojoService;
		this.ninjaService = ninjaService;
	}
	
	@RequestMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	
	
	
	//ONE DOJO
	@RequestMapping("/dojos/{id}")
	public String showDojo(@PathVariable("id") long id, Model model) {
		Dojo dojo = dojoService.findById(id);
		model.addAttribute("dojo", dojo);
		model.addAttribute("ninjas", dojo.getNinjas());
		return "showDojo.jsp";
	}
	
	//NEW DOJO PAGE
	@RequestMapping("/dojos/new")
	public String newDojo(@ModelAttribute ("dojo") Dojo dojo, Model model) {
		model.addAttribute("dojos", dojoService.allDojos());
		return "newDojo.jsp";
	}
	//HANDLE POST
	@PostMapping("/dojos/new")
	public String createDojo(@Valid @ModelAttribute("dojo") Dojo dojo,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "newDojo.jsp";
		} else {
			dojoService.createDojo(dojo);
			return "redirect:/";
		}
		
	}
	
	//NEW NINJA PAGE
	@RequestMapping("/ninjas/new")
	public String newNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
		model.addAttribute("dojo", dojoService.allDojos());
		model.addAttribute("ninjas", ninjaService.allNinjas());
		return "newNinja.jsp";
	}
	
	//HANDLE CREATE NINJA
	@PostMapping("/ninjas/new")
	public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("dojo", dojoService.allDojos());
			return "newNinja.jsp";
		} else {
				ninjaService.createNinja(ninja);
				return "redirect:/";
	}
	

	}
}
