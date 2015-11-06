package xyz.nuti.oauth.example.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import xyz.nuti.oauth.example.model.Employee;
import xyz.nuti.oauth.example.service.EmployeeService;

@RestController
@RequestMapping("/employee")
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/employeeList", method = RequestMethod.GET)
	public ResponseEntity<?> employeeList() {
		List<Employee> employeeList = employeeService.getEmployeeList();
		ResponseEntity<?> response = null;
		
		if (employeeList == null) {
			response = new ResponseEntity<String>("Not Found Employee", HttpStatus.NOT_FOUND);
		} else {
			response = new ResponseEntity<List<Employee>>(employeeList, HttpStatus.OK);
		}
		
		return response;
	}
}
