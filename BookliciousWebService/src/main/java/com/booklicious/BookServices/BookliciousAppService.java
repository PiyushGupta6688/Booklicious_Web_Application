package com.booklicious.BookServices;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.booklicious.Repo.AdminRepository;
import com.booklicious.Repo.BookRepository;
import com.booklicious.models.Book;
import com.booklicious.models.Bookprojection;

import jakarta.persistence.EntityManager;
import jakarta.servlet.http.HttpServletResponse;
@Service
public class BookliciousAppService {
@Autowired 
private BookRepository bookRepo;
@Autowired
private AdminRepository adminRepo;

public List<Bookprojection> getBooks(String name) {
	return bookRepo.getBooks(name);
}
public Book getBook(String name) {
	return bookRepo.getBook(name);
}
public String login(String id,String password) {
	return adminRepo.login(id, password);
}
public boolean addBook(Book book) {
	return bookRepo.addBook(book);
}
public boolean updateBookImage(String name,byte[] image) {
	return bookRepo.updateBookImage(name,image);
}
public boolean updateBook(Book book) {
	return bookRepo.updateBook(book);
}
public boolean deleteBook(String name) {
	return bookRepo.deleteBook(name);
}
public List<String> getBookNames() {
	return bookRepo.getBookNames();
}
public List<Bookprojection> getBooks() {
	return bookRepo.getBooks();
}
public byte[] getBookImage(String name) {
	return bookRepo.getBookImage(name);
}
public byte[] getBookContent(String name) {
	return bookRepo.getBookContent(name);
}
public String updatePassword(String opass,String npass,String rpass,String id) {
	return adminRepo.updatePassword(opass,npass,rpass,id);
}
public String forgetPassword(String email) {
	return adminRepo.forgetPassword(email);
}
}

