package com.suyambu.construction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.suyambu.construction.model.Wages;
import com.suyambu.construction.repository.WagesRepo;

@Component
@javax.transaction.Transactional
@Service
public class WageService {

	@Autowired
	WagesRepo wagesRepo;
	
	public void saveWage(Wages wage) {
		
		wagesRepo.save(wage);
	}

	public List<Wages> getAll() {
		
		return wagesRepo.findAll();
	}
	
	public void update(Wages wage) {
		
		wagesRepo.updateWages(wage.getWorkName(), wage.getWorkerName(), wage.getAmount(), wage.getId());
	}

	public Wages getWage(int id) {
		return wagesRepo.getOne(id);
	}
	
	public void delete(int id) {
		
		wagesRepo.deleteById(id);
	}
}
