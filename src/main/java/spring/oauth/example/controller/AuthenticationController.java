package spring.oauth.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/authentication")
public class AuthenticationController {
	
	@RequestMapping(value = "/authentication", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav  = new ModelAndView("authentication/authentication");
		
		return mav;
	}
}
