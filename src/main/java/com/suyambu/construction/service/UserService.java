package com.suyambu.construction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.suyambu.construction.model.User;
import com.suyambu.construction.repository.UserRepo;


@Component
@Service
@javax.transaction.Transactional
public class UserService {

	@Autowired
	UserRepo userRepo;

	public void save(User user) {

		userRepo.save(user);
	}

	public Integer getId(User user) {

		Integer id = userRepo.getIdByUserName(user.getUsername(), user.getPassword());
		System.out.println(id);
		if (id != null) {
			return id;
		} else {
			return 0;
		}

	}

	public User getUserById(int id) {
		User user = userRepo.getOne(id);
		return user;
	}

}
