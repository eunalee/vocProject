package com.bitcamp.Model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	
	private String id;
	private String pwd;
	private String name;
	private String birth;
	private String gender;
	private String email;
	private String phone;
	private String zipcode;
	private String address;
	private String joindate;
	private String photo;
	private MultipartFile photoFile;
	private String confirm;
	
	public Member() {
	}

	public Member(String id, String pwd, String name, String birth, String gender, String email, String phone,
			String zipcode, String address, String joindate, String photo) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.zipcode = zipcode;
		this.address = address;
		this.joindate = joindate;
		this.photo = photo;
	}


	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public MultipartFile getPhotoFile() {
		return photoFile;
	}

	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", birth=" + birth + ", gender=" + gender
				+ ", email=" + email + ", phone=" + phone + ", zipcode=" + zipcode + ", address=" + address
				+ ", joindate=" + joindate + ", photo=" + photo + ", photoFile=" + photoFile + ", confirm=" + confirm
				+ "]";
	}


}
