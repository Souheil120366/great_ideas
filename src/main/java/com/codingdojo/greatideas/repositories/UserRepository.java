package com.codingdojo.greatideas.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.greatideas.models.User;

import java.util.Optional;

@Repository

public interface UserRepository extends CrudRepository<User, Long> {
	
	Optional<User> findByEmail(String email);
	Optional<User> findById(Long id);

}
