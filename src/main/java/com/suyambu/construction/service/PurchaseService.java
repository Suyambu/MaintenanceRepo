package com.suyambu.construction.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.suyambu.construction.model.Purchase;
import com.suyambu.construction.repository.PurchaseRepo;

@Component
@javax.transaction.Transactional
@Service
public class PurchaseService{

	@Autowired
	PurchaseRepo purchaseRepo;
	
	public void save(Purchase purchase) {
		
		
		purchaseRepo.save(purchase);
		
	}
public List<Purchase> getAll() {
		
		return purchaseRepo.findAll();
		
	}
	
public Purchase getPurchase(int id) {
	
	return purchaseRepo.getOne(id);
}
	
public void updatePurchase(Purchase purchase) {
	
	purchaseRepo.updateMaterial(purchase.getQty(), purchase.getTotal(), purchase.getPaid(), purchase.getBending(), purchase.getOutStanding(), purchase.getCoolie(), purchase.getId());
}

public void delete(int id) {
	
	purchaseRepo.deleteById(id);
}


public List<Purchase> readByMaterial(int materialId){
	
	return purchaseRepo.searchByMaterial(materialId);
}

public List<Purchase> readByBendings(){
	
	return purchaseRepo.searchByBending();
}

public List<Purchase> readByDate(Date date){
	
	return purchaseRepo.searchByDate(date);
}

}
