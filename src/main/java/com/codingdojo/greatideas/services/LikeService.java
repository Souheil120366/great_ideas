package com.codingdojo.greatideas.services;

import org.springframework.stereotype.Service;


import com.codingdojo.greatideas.models.Like;
import com.codingdojo.greatideas.models.User;
import com.codingdojo.greatideas.models.Idea;

import com.codingdojo.greatideas.repositories.LikeRepository;

import java.util.List;
import java.util.Optional;

@Service
public class LikeService {
	// adding the Like repository as a dependency
	private final LikeRepository likeRepository;

	public LikeService(LikeRepository likeRepository) {
				     this.likeRepository = likeRepository;
				 }

	// returns all the likes
	public List<Like> allLikes() {
		return likeRepository.findAll();
	}

	// creates a like
	public Like createLike(Like b) {
		return likeRepository.save(b);
	}
	
	public String getStateByUserAndIdea(User user, Idea idea) {
        // Use the repository to find the Like entity for the given user and idea
		
        String likeEntry = likeRepository.findByUserAndIdea(user, idea);

        // Check if a like exists for the user and idea
        if (likeEntry != null) {
            return likeEntry;
        } else {
            // Default state if no like exists
            return "NoLike";
        }
    }
	
	public List<Like> getAllLikesByUser(User user) {
		return likeRepository.findLikesByUser(user);
	}
	
	public List<Like> getAllLikesByIdea(Idea idea) {
		return likeRepository.findLikesByIdea(idea);
	}
	
	public Like updateLike(Like like) {

		return likeRepository.save(like);
	}
	
	public Like getLikeByUserandIdea(Idea idea, User user) { 
		return likeRepository.findLikeByIdeaAndUser(idea, user);
	}

}
