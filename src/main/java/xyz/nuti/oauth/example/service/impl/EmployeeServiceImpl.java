package xyz.nuti.oauth.example.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import xyz.nuti.oauth.example.model.Employee;
import xyz.nuti.oauth.example.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Override
	public List<Employee> getEmployeeList() {
		List<Employee> employeeList = new ArrayList<Employee>();
		
		employeeList.add(new Employee(1, "Chris", "development", 27));
		employeeList.add(new Employee(2, "Mike", "design", 31));
		employeeList.add(new Employee(3, "Jhone", "development", 24));
		employeeList.add(new Employee(4, "Jessica", "development", 35));
		employeeList.add(new Employee(5, "Jennifer", "management", 42));
		employeeList.add(new Employee(6, "Robert", "business sales", 33));
		employeeList.add(new Employee(7, "Megan", "development", 21));
		
		return employeeList;
	}
}
