package com.example.demo.dto;

import javax.validation.constraints.NotEmpty;

import com.example.demo.utils.Constant;

public class ContactDTO {

	private Integer id;
	@NotEmpty(message = Constant.NAME_REQUIRED)
	private String name;
	
	@NotEmpty(message = Constant.SURNAME1_REQUIRED)
	private String surname1;
	
	private Integer idUser;
	

	private UserDTO user;
	
	public Integer getIdUser() {
		return idUser;
	}


	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
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


	public UserDTO getUser() {
		return user;
	}


	public void setUser(UserDTO user) {
		this.user = user;
	}
}
