package com.booklicious.models;

import java.util.Arrays;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
public class Book {
	@Id
	private String name;
	private int price;
	private String aname;
	private String pname;
	
	@Column(nullable = true , columnDefinition = "longblob")
	private byte[] image;
	
	@Column(nullable = true , columnDefinition = "longblob")
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
