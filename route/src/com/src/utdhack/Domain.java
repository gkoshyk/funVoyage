package com.src.utdhack;

public class Domain {

	private Integer id;
	private String placeName;
	private String city;
	private String address;
	private Float rating;
	private float timeSpent;
	private float cost;
	private String imgUrl;

	public Domain() {

	}

	public Domain(Integer Id, float Cost, float TimeSpent) {
		id = Id;
		cost = Cost;
		timeSpent = TimeSpent;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Float getRating() {
		return rating;
	}

	public void setRating(Float rating) {
		this.rating = rating;
	}

	public Float getTimeSpent() {
		return timeSpent;
	}

	public void setTimeSpent(Float timeSpent) {
		this.timeSpent = timeSpent;
	}

	public Float getCost() {
		return cost;
	}

	public void setCost(Float cost) {
		this.cost = cost;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
}
