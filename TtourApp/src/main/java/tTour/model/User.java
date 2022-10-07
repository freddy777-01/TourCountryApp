package tTour.model;

public class User {

	private String name,email,pswd,userType;
	private Long id;
	
	public User(String email,String pswd) {
		this.email = email;
		this.pswd = pswd;
	}
	
	public User() {
		
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setPswd(String psw) {
		this.pswd = psw;
	}
	
	public void setUserType(String userType) {
		this.userType = userType;
	}
	
//	get user details
	public String getName() {
		return name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public Long getId() {
		return id;
	}
	public String getUserType() {
		return userType;
	}
	
	public String getPassword() {
		return pswd;
	}
	
}
