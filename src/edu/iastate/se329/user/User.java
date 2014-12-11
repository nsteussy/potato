package edu.iastate.se329.user;

public class User {
	
	private String fname, lname, username, pass, email;
	
	public User(String fname, String lname, String username, String pass, String email){
		this.fname = fname;
		this.lname = lname;
		this.username = username;
		this.pass = pass;
		this.email = email;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
