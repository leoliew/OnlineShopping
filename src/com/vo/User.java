package com.vo;

import java.sql.Timestamp;

public class User {
		private Integer id;//用户id，主键
		private String userName;//用户登录名
		private String  password;//登录密码
		private String realName;//用户昵称
		private String sex;//性别
		private String phone;//电话
		private String addr;//地址
		private String qq;//Qq号码
		private String  headImg;//用户头像
		private Double acount;//余额
		private Integer level;//用户角色：0为管理员，1为用户
		private Timestamp regTime;//注册时间
		public User() {
			super();
			// TODO Auto-generated constructor stub
		}
		
		
		
		public User(String userName, String password, String realName,
				String sex, String phone, String addr, String qq,
				String headImg, Double acount, Integer level, Timestamp regTime) {
			super();
			this.userName = userName;
			this.password = password;
			this.realName = realName;
			this.sex = sex;
			this.phone = phone;
			this.addr = addr;
			this.qq = qq;
			this.headImg = headImg;
			this.acount = acount;
			this.level = level;
			this.regTime = regTime;
		}



		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getRealName() {
			return realName;
		}
		public void setRealName(String realName) {
			this.realName = realName;
		}
		public String getSex() {
			return sex;
		}
		public void setSex(String sex) {
			this.sex = sex;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getAddr() {
			return addr;
		}
		public void setAddr(String addr) {
			this.addr = addr;
		}
		public String getQq() {
			return qq;
		}
		public void setQq(String qq) {
			this.qq = qq;
		}
		public String getHeadImg() {
			return headImg;
		}
		public void setHeadImg(String headImg) {
			this.headImg = headImg;
		}
		public Double getAcount() {
			return acount;
		}
		public void setAcount(Double acount) {
			this.acount = acount;
		}
		public Integer getLevel() {
			return level;
		}
		public void setLevel(Integer level) {
			this.level = level;
		}
		public Timestamp getRegTime() {
			return regTime;
		}
		public void setRegTime(Timestamp regTime) {
			this.regTime = regTime;
		}
	
		
		
		
}
