//package com.example.demo.entity;
//
//import java.io.Serializable;
//
//import javax.persistence.CascadeType;
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.MapsId;
//import javax.persistence.OneToOne;
//import javax.persistence.Table;
//
//@Entity
//@Table(name = "users_profiles_map")
//public class ProfileUser implements Serializable{
//
//
//	@Column(nullable=false, name = "user_id")
//	private Integer userId;
//	
//	
//	@Column(nullable=false, name = "profile_id")
//	private Integer profileId;
//	
//
//	public ProfileUser() {
//	}
//	
//	public ProfileUser(Integer userId, Integer profileId) {
//		this.userId = userId;
//		this.profileId = profileId;
//	}
//
//
//
//	private static final long serialVersionUID = 1L;
//}