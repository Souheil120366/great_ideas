package com.codingdojo.greatideas.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


import com.codingdojo.greatideas.models.Like;
import com.codingdojo.greatideas.models.User;
import com.codingdojo.greatideas.models.Idea;

import java.util.List;
import java.util.Optional;


@Repository

public interface LikeRepository extends CrudRepository <Like, Long>{
	
	
	List<Like> findAll();
	
	String findByUserAndIdea(User user, Idea idea);
	
	Optional<Like> findByUser_IdAndIdea_Id(Long userId, Idea idea);
	
	List<Like> findLikesByUser(User user);
	
	List<Like> findLikesByIdea(Idea idea);
	
	Like findLikeByIdeaAndUser(Idea idea, User user);

	
	
	
	
}
