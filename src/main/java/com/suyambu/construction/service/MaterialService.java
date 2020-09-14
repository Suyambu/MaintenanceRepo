package com.suyambu.construction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.suyambu.construction.model.Material;
import com.suyambu.construction.repository.MaterialRepo;

@Component
@javax.transaction.Transactional
@Service
public class MaterialService {

	@Autowired
	MaterialRepo materialRepo;
	
	public void save(Material material) {
		
		materialRepo.save(material);
	}
	
	public List<Material> getAll(){
		
		return materialRepo.findAll();
	}
	
	public void delete(int id) {
		
		materialRepo.deleteById(id);
	}
	
	public Material read(int id) {
		
		return materialRepo.getOne(id);
	}
	
	public void update(Material material) {
		
		materialRepo.updateMaterial(material.getName(), material.getAmount(), material.getId());
	}
	
	public int getRate(int id) {
		
		return materialRepo.getRate(id);
	}
	
	public String getName(int id) {
		
		return materialRepo.getName(id);
	}
}
