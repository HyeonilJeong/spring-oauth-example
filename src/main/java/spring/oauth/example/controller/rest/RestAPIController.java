package spring.oauth.example.controller.rest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class RestAPIController {
	
	@RequestMapping("main")
	public String main() {
		return "api main";
	}
}
