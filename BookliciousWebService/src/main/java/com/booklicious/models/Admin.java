package com.booklicious.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
@Entity
public class Admin {
@Id
private String id;
private String password;

private String name;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
@Override
public String toString() {
	return "Admin [id=" + id + ", password=" + password + ", name=" + name + "]";
}
}
