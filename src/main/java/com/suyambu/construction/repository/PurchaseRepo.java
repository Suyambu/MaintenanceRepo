package com.suyambu.construction.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.suyambu.construction.model.Purchase;

public interface PurchaseRepo extends JpaRepository<Purchase, Integer>{

	 @Modifying
		@Query("UPDATE Purchase  set qty = :qty, total = :total,paid = :paid,bending = :bending,outStanding = :outStanding,coolie = :coolie where id = :id")
		void updateMaterial(@Param("qty") int qty,@Param("total") int total,@Param("paid") int paid,@Param("bending") int bending,@Param("outStanding") int outStanding,@Param("coolie") int coolie,@Param("id") int id);


		@Query("SELECT f FROM Purchase f  where f.materialId = :materialId")
		List<Purchase> searchByMaterial(@Param("materialId") int materialId);
		
		@Query("SELECT f FROM Purchase f  where f.bending > 0")
		List<Purchase> searchByBending();
		
		@Query("SELECT f FROM Purchase f  where f.date = :date")
		List<Purchase> searchByDate(@Param("date") Date date);
}
