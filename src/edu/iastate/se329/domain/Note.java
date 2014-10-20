package edu.iastate.se329.domain;

/**
 * A way to take or record notes. 
 * @author SaldinBajric
 *
 */
public class Note {
	private Long userId;
	private Long id;
	private String subject;
	private String description;
	
	public Note() {}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
