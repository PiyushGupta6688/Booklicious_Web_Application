package com.Booklicious.models;

import java.util.Arrays;



public class Book {

	private String name;
	private int price;
	private String aname;
	private String pname;
	
	
	private byte[] image;
	
	
	private byte[] content;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public byte[] getContent() {
		return content;
	}
	public void setContent(byte[] content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Book [name=" + name + ", price=" + price + ", aname=" + aname + ", pname=" + pname + ", image="
				+ Arrays.toString(image) + ", content=" + Arrays.toString(content) + "]";
	}
	
	
}
