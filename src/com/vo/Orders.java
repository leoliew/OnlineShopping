package com.vo;

import java.sql.Timestamp;

/**
 * 订单表
 * @author Zeming
 *
 */
public class Orders {
	private 	Integer id;//订单id
	private	String  orderId;//订单号码
	private	Integer userId;//对应用户表的id
	private	String realName;//下订的昵称
	private	String addr;//送货地址
	private	 String phone;//下订者的电话
	private	String notice;//订单备注
	private Double total;//订单总价钱
	private Timestamp time;//订餐时间
	private Integer status;//订单状态 0.未送餐 1.已派送
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
	
	
	
}
