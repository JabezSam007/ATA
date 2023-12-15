package wipro.jabez.ATA.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import wipro.jabez.ATA.model.User;
import wipro.jabez.ATA.repository.UserRepository;
import wipro.jabez.ATA.service.UserService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private UserRepository userRepository;

	@GetMapping("/")
	public String home(){
		return "login";
	}

	@GetMapping("login")
	String login() {
		return "login";
	}

	@PostMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, HttpSession session, Model model) {
		User user = userRepository.findByUsername(username);
		if (user != null && user.getPassword().equals(password)) {
			session.setAttribute("user", user);
			return "redirect:/passenger/vehicle/all";
		} else {
			model.addAttribute("error", "Invalid credentials");
			return "login";
		}
	}


	@GetMapping(value = "registration")
	public ModelAndView register(@ModelAttribute("user") User user) {
		return new ModelAndView("registration", "user", new User());
	}

	@PostMapping("register")
	public String registerUser(@ModelAttribute("user") User user) {
			userService.saveUser(user);
		return "redirect:/login";
	}

	@GetMapping("forgetPassword")
	public String forgetPassword() {
		return "forgetPassword";
	}

	@PostMapping("forgetPassword/user")
	public ModelAndView getUsername(@ModelAttribute("user") User user) {
		boolean userExists = userService.isUserExists(user.getUsername());
		if (!userExists){
			throw new IllegalArgumentException("User does not exist");
		}
		return new ModelAndView("changePassword","email",user.getUsername());
	}

	@GetMapping("changePassword/user")
	public ModelAndView changePass() throws Exception {
		return new ModelAndView("changePassword");
	}

	@PostMapping("/changePassword")
	public String changePass(@ModelAttribute("user") User user) {
		boolean userExists = userService.isUserExists(user.getUsername());
		if (userExists){
			userService.updateUser(user);
		}else {
			throw new IllegalArgumentException("User does not exist");
		}
		return "redirect:/login";
	}

	@GetMapping(value = "logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		session.invalidate();
		return "redirect:/login";
	}

	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(ModelMap model) {
		model.addAttribute("error", "true");
		return "login";

	}

}