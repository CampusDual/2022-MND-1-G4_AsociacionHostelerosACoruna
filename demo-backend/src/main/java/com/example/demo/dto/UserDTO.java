package com.example.demo.dto;

import javax.validation.constraints.NotEmpty;

import com.example.demo.utils.Constant;

public class UserDTO {

	private Integer id;
	@NotEmpty(message = Constant.NAME_REQUIRED)
	private String login;
	
	@NotEmpty(message = Constant.SURNAME1_REQUIRED)
	private String password;
	
	public Integer getId() {
		return id;
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

	public void setId(Integer id) {
		this.id = id;
	}
	
}
