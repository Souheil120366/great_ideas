package com.codingdojo.greatideas.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.greatideas.models.Idea;

import java.util.List;


@Repository

public interface IdeaRepository extends CrudRepository <Idea, Long>{
	List<Idea> findAll();
	
	List<Idea> findByLikesUser_Id(Long userId);
}
