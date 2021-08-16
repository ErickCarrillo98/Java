package com.erick.dojosandninjas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erick.dojosandninjas.models.Ninja;
import com.erick.dojosandninjas.repositories.NinjaRepo;

@Service
public class NinjaService {
	
	
	//SHORTCUT FOR DEPENDENCY INJECTION
	@Autowired
	private NinjaRepo ninjaRepo;
	
	
	
	//CREATE NINJA	
	public Ninja createNinja(Ninja n) {
		return ninjaRepo.save(n);
	}
	
	
	//READ ALL
	public List<Ninja> allNinjas(){
		return ninjaRepo.findAll();
	}

}
