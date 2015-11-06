package spring.oauth.example.controller.rest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/home")
public class RestHomeController {

	@RequestMapping("/main")
	public String main() {
		return "main rest";
	}
}
