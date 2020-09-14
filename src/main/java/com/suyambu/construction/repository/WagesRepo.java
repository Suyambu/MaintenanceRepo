package com.suyambu.construction.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.suyambu.construction.model.Wages;

public interface WagesRepo  extends JpaRepository<Wages, Integer>{


	 @Modifying
		@Query("UPDATE Wages  set workName = :workName,workerName = :workerName, amount = :amount where id = :id")
		void updateWages(@Param("workName") String workName,@Param("workerName") String workerName,@Param("amount") int amount ,@Param("id") int id);
}
