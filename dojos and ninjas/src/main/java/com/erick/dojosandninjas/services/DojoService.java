package com.erick.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erick.dojosandninjas.models.Dojo;
import com.erick.dojosandninjas.repositories.DojoRepo;

@Service
public class DojoService {
	
	//SHORTCUT FOR DEPENDENCY INJECTION
	
	@Autowired
	private DojoRepo dojoRepo;
	
	
	
//CREATE DOJO
	public Dojo createDojo(Dojo d) {
		return dojoRepo.save(d);
	}
	
	//READ ALL
	public List<Dojo> allDojos(){
		return dojoRepo.findAll();
	}
	
	//ONE DOJO
	public Dojo findById(long id) {
		Optional<Dojo> dojo = dojoRepo.findById(id);
		if(dojo.isPresent()) {
			return dojo.get();
		}
		else {
			return null;
		}
	}
}
