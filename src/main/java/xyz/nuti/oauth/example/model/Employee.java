package xyz.nuti.oauth.example.model;

public class Employee {
	private int no;
	private String name;
	private String dept;
	private int age;
	
	public Employee() {
		
	}
	
	public Employee(int no, String name, String depth, int age) {
		this.no = no;
		this.name = name;
		this.dept = depth;
		this.age = age;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
}
