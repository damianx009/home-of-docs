package com.luv2code.springsecurity.demo.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity @IdClass(Authority.class)
@Table(name="authorities")
public class Authority implements Serializable{

	@Id private String username;
	@Id private String authority;

	
	public Authority() {}
	
	public Authority(String username, String authority) {
		this.username = username;
		this.authority = authority;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAuthorityName() {
		return authority;
	}

	public void setAuthorityName(String authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "Authority [username=" + username + ", authorityName=" + authority + "]";
	}

	
	
}
