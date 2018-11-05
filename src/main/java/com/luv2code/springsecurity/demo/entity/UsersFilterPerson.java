package com.luv2code.springsecurity.demo.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="application_filter_user")
public class UsersFilterPerson {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	@Column(name="position")
	private String position;
	
	@Column(name="email")
	private String email;
	
	@Column(name="phone")
	private String phoneNo;
	
	@Column(name="skills")
	private String skillDescription;
	
	@Column(name="avatar")
	private String avatarImage;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="application_filter_type_id")
	private UsersFilterType filterType;
	
	public UsersFilterPerson() {}

	public UsersFilterPerson(String firstName, String lastName, String position, String email, String phoneNo,
			String skillDescription, String avatarImage, UsersFilterType filterType) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.position = position;
		this.email = email;
		this.phoneNo = phoneNo;
		this.skillDescription = skillDescription;
		this.avatarImage = avatarImage;
		this.filterType = filterType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getSkillDescription() {
		return skillDescription;
	}

	public void setSkillDescription(String skillDescription) {
		this.skillDescription = skillDescription;
	}

	public String getAvatarImage() {
		return avatarImage;
	}

	public void setAvatarImage(String avatarImage) {
		this.avatarImage = avatarImage;
	}

	public UsersFilterType getFilterType() {
		return filterType;
	}

	public void setFilterType(UsersFilterType filterType) {
		this.filterType = filterType;
	}

	@Override
	public String toString() {
		return "UsersFilterPerson [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", position="
				+ position + ", email=" + email + ", phoneNo=" + phoneNo + ", skillDescription=" + skillDescription
				+ ", avatarImage=" + avatarImage + ", instructorDetail=" + filterType + "]";
	}
	
	
}
