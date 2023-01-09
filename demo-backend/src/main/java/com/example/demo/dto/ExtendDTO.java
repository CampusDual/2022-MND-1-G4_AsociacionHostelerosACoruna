package com.example.demo.dto;

import javax.validation.constraints.NotEmpty;

import com.example.demo.utils.Constant;

public class ExtendDTO {

	
	private Integer id;
	@NotEmpty(message = Constant.NAME_REQUIRED)
	private String name;
	
	@NotEmpty(message = Constant.SURNAME1_REQUIRED)
	private String surname1;
	
	//private Integer id;
	@NotEmpty(message = Constant.NAME_REQUIRED)
	private String login;
	
	@NotEmpty(message = Constant.SURNAME1_REQUIRED)
	private String password;
	
	public ExtendDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public ExtendDTO( int id, String name, String surname1, String login, String password) {	
		this.id = id;
		this.name = name;
		this.surname1 = surname1;
		this.login = login;
		this.password = password;
	}
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname1() {
		return surname1;
	}
	public void setSurname1 (String surname1) {
		this.surname1 = surname1;
	}
	public String getLogin() {
		return login;
	}


	public void setLogin(String login) {
		this.login = login;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
}
