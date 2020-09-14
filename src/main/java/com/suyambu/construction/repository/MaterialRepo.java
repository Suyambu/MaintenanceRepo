package com.suyambu.construction.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.suyambu.construction.model.Material;

public interface MaterialRepo extends JpaRepository<Material, Integer>{

	 @Modifying
		@Query("UPDATE Material  set name = :name, amount = :amount where id = :id")
		void updateMaterial(@Param("name") String name,@Param("amount") int amount ,@Param("id") int id);
	
	 @Query("SELECT amount FROM Material  where id = :id")
		Integer getRate(@Param("id") int id);
	 
	 @Query("SELECT name FROM Material  where id = :id")
		String getName(@Param("id") int id);
}
