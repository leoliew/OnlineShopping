package com.vo;

import java.sql.Timestamp;

public class Foods {
	private Integer id;//食物id
	private String name;//名称
	private Integer type;//类型
	private Double price;//价格
	private String details;//描述
	private String foodPic;//图片
	private Integer sold;//已经购买的数量
	private Integer isGroup;//是否可以进行团购 1.可以 0,不可以
	private Double groupPrice;//团购价格
	private Timestamp beginTime;//团购开始时间
	private Timestamp endTime;//团购结束时间
	private Integer groupCount;//达到团购的数量
	private Integer buyCount;//购物车中购买的数量
	public Foods() {
		super();
		// TODO Auto-generated constructor stub
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
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getFoodPic() {
		return foodPic;
	}
	public void setFoodPic(String foodPic) {
		this.foodPic = foodPic;
	}
	public Integer getSold() {
		return sold;
	}
	public void setSold(Integer sold) {
		this.sold = sold;
	}
	public Integer getIsGroup() {
		return isGroup;
	}
	public void setIsGroup(Integer isGroup) {
		this.isGroup = isGroup;
	}
	public Double getGroupPrice() {
		return groupPrice;
	}
	public void setGroupPrice(Double groupPrice) {
		this.groupPrice = groupPrice;
	}
	public Timestamp getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Timestamp beginTime) {
		this.beginTime = beginTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	public Integer getGroupCount() {
		return groupCount;
	}
	public void setGroupCount(Integer groupCount) {
		this.groupCount = groupCount;
	}
	public Integer getBuyCount() {
		return buyCount;
	}
	public void setBuyCount(Integer buyCount) {
		this.buyCount = buyCount;
	}
	@Override
	public String toString() {
		return "Foods [id=" + id + ", name=" + name + ", type=" + type
				+ ", price=" + price + ", details=" + details + ", foodPic="
				+ foodPic + ", sold=" + sold + ", isGroup=" + isGroup
				+ ", groupPrice=" + groupPrice + ", beginTime=" + beginTime
				+ ", endTime=" + endTime + ", groupCount=" + groupCount
				+ ", buyCount=" + buyCount + "]";
	}
	
	
	
}
