package com.codingdojo.greatideas.controllers;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.greatideas.models.Idea;
import com.codingdojo.greatideas.models.LoginUser;
import com.codingdojo.greatideas.models.User;
import com.codingdojo.greatideas.models.Like;
import com.codingdojo.greatideas.services.IdeaService;
import com.codingdojo.greatideas.services.UserService;
import com.codingdojo.greatideas.services.LikeService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller

public class MainController {

	@Autowired
	private UserService userServ;

	@Autowired
	IdeaService ideaService;

	@Autowired
	LikeService likeService;

	@GetMapping("/")
	public String index(Model model) {

		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {

		userServ.register(newUser, result);

		if (result.hasErrors()) {

			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}

		session.setAttribute("userId", newUser.getId());

		return "redirect:/ideas";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {

		User user = userServ.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}

		session.setAttribute("userId", user.getId());

		return "redirect:/ideas";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("userId", null);

		return "redirect:/";
	}

	@GetMapping("/ideas")
	public String home(Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}

		User user = userServ.findById(userId);

		List<Idea> ideasWithStates = ideaService.getAllIdeasWithStatesSortedByUserId(user);

		Collections.sort(ideasWithStates, new Comparator<Idea>() {
			@Override
			public int compare(Idea idea1, Idea idea2) {
				return Integer.compare(idea2.getNb_likes(), idea1.getNb_likes());
			}
		});

		model.addAttribute("ideasWithStates", ideasWithStates);

		model.addAttribute("user", user);
		return "dashboard.jsp";
	}

	@GetMapping("/ideas_lh")
	public String ideasLowToHigh(Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}

		User user = userServ.findById(userId);

		List<Idea> ideasWithStates = ideaService.getAllIdeasWithStatesSortedByUserId(user);

		Collections.sort(ideasWithStates, new Comparator<Idea>() {
			@Override
			public int compare(Idea idea1, Idea idea2) {
				return Integer.compare(idea1.getNb_likes(), idea2.getNb_likes());
			}
		});

		model.addAttribute("ideasWithStates", ideasWithStates);

		model.addAttribute("user", user);
		return "dashboard.jsp";
	}

	@GetMapping("/ideas/new")
	public String newIdea(@ModelAttribute("idea") Idea idea, Model model, HttpSession session) {

		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}

		User user = userServ.findById(userId);
		model.addAttribute("user", user);

		return "new_idea.jsp";
	}

	@PostMapping("/new/idea")
	public String create(@Valid @ModelAttribute("idea") Idea idea, BindingResult result, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}

		// User user = userServ.findById(userId);
		if (result.hasErrors()) {
			return "new_idea.jsp";
		} else {
			// Like likeEntry = new Like();

			ideaService.createIdea(idea);
			// likeEntry.setUser(user);
			// likeEntry.setIdea(idea);
			// likeService.createLike(likeEntry);
			return "redirect:/ideas";
		}
	}

	@PostMapping("/likeState")
	public String updateLike(@RequestParam(value = "state") String state, @RequestParam(value = "ideaId") Long ideaId,
			HttpSession session) {

		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}

		User user = userServ.findById(userId);

		Idea idea = ideaService.findIdea(ideaId);
		Like potentialLike = likeService.getLikeByUserandIdea(idea, user);
		String newState = "";
		Integer likesNumber = idea.getNb_likes();

		if ("Like".equals(state)) {
			newState = "Unlike";
			likesNumber += 1;
		} else {
			newState = "Like";
			if (likesNumber > 0)
				likesNumber -= 1;
		}

		if (potentialLike != null) {
			potentialLike.setState(newState);
			likeService.updateLike(potentialLike);
		} else {
			Like likeEntry = new Like();
			likeEntry.setState(newState);
			likeEntry.setUser(user);
			likeEntry.setIdea(idea);
			likeService.createLike(likeEntry);
		}

		idea.setNb_likes(likesNumber);

		ideaService.updateIdea(idea);
		return "redirect:/ideas";

	}
	
	@GetMapping("/ideas/{ideaId}")
	public String oneBook (Model model,@PathVariable("ideaId") Long ideaId, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}

		User user = userServ.findById(userId);
		model.addAttribute("user", user);

		Idea idea = ideaService.findIdea(ideaId);
		model.addAttribute("idea",idea);
		
		List<Like> allLikesByIdea = likeService.getAllLikesByIdea(idea);
		
		List<Like> filteredLikes = allLikesByIdea.stream()
			    .filter(like -> !like.getUser().getId().equals(idea.getUser().getId())) // Filter out likes with the same user as userId
			    .filter(like -> "Unlike".equals(like.getState())) // Filter out likes with state "Like"
			    .collect(Collectors.toList());
		
		model.addAttribute("userLike", filteredLikes);
		
		return "show_idea.jsp";
	}

}
