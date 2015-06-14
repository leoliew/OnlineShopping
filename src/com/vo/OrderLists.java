package com.vo;

import java.sql.Timestamp;

/**
 * 订单集合
 * @author Zeming
 *
 */
public class OrderLists {
	private  Integer id;//订单id
	private  String listId;//对应订单表的订单号
	private Integer userId;//用户表的id
	private Integer fid;//食品表的id
	private String fname;//食品名称
	private Integer ftype;//食品类型，对应类型表的id
	private Double fprice;//食品单价
	private Integer  fcount;//订购数量
	private Double ftotal;//订购总价钱
	public OrderLists() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getListId() {
		return listId;
	}
	public void setListId(String listId) {
		this.listId = listId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public Integer getFtype() {
		return ftype;
	}
	public void setFtype(Integer ftype) {
		this.ftype = ftype;
	}
	public Double getFprice() {
		return fprice;
	}
	public void setFprice(Double fprice) {
		this.fprice = fprice;
	}
	public Integer getFcount() {
		return fcount;
	}
	public void setFcount(Integer fcount) {
		this.fcount = fcount;
	}
	public Double getFtotal() {
		return ftotal;
	}
	public void setFtotal(Double ftotal) {
		this.ftotal = ftotal;
	}	
}
