package com.codingdojo.greatideas.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.greatideas.models.Idea;
//import com.codingdojo.greatideas.models.IdeaWithUserAndStateDTO;
import com.codingdojo.greatideas.models.Like;
import com.codingdojo.greatideas.models.User;
import com.codingdojo.greatideas.repositories.IdeaRepository;
import com.codingdojo.greatideas.repositories.LikeRepository;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;
//import java.util.stream.Collectors;

@Service

public class IdeaService {

	// adding the Idea repository as a dependency
	private final IdeaRepository ideaRepository;
	private final LikeRepository likeRepository;

	@Autowired
	public IdeaService(IdeaRepository ideaRepository, LikeRepository likeRepository) {
		this.ideaRepository = ideaRepository;
		this.likeRepository = likeRepository;
	}

	public List<Idea> getAllIdeasWithStatesSortedByUserId(User user) {
		List<Idea> ideas = ideaRepository.findAll();

		// For each idea, populate the state based on the associated likes
		ideas.forEach(idea -> {
			Like like = likeRepository.findLikeByIdeaAndUser(idea, user);
			if (like != null) {
				String likeState = like.getState();
				idea.setState(likeState);
			} else idea.setState("Like");
			
		});

		// Sort the ideas by user_id (you can customize the sorting logic as needed)
		//ideas.sort(Comparator.comparingLong(idea -> idea.getUser().getId()));

		return ideas;
	}

	public List<Idea> getIdeasLikedByUser(Long userId) {
		return ideaRepository.findByLikesUser_Id(userId);
	}

	// returns all the ideas
	public List<Idea> allIdeas() {
		return ideaRepository.findAll();
	}

	// creates a idea
	public Idea createIdea(Idea b) {
		return ideaRepository.save(b);
	}

	// retrieves a idea
	public Idea findIdea(Long id) {
		Optional<Idea> optionalIdea = ideaRepository.findById(id);
		if (optionalIdea.isPresent()) {
			return optionalIdea.get();
		} else {
			return null;
		}
	}

	public Idea updateIdea(Idea idea) {

		return ideaRepository.save(idea);
	}

	// to delete a idea, we simply pass in the idea ID and if our repository finds
	// it, the idea will be deleted
	public void deleteIdea(Long id) {
		Optional<Idea> optionalIdea = ideaRepository.findById(id);
		if (optionalIdea.isPresent()) {
			ideaRepository.deleteById(id);
		}
	}

}
