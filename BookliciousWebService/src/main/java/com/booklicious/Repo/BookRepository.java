package com.booklicious.Repo;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;
import java.util.TreeSet;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.booklicious.models.Admin;
import com.booklicious.models.Book;
import com.booklicious.models.Bookprojection;


import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;

@Repository
public class BookRepository {
	@Autowired
	private EntityManager entityManager;

	public List<Bookprojection> getBooks(String name) {
		Session session= entityManager.unwrap(Session.class);
		List<Bookprojection> list = session.createQuery(
		        "select new com.booklicious.models.Bookprojection(b.name, b.price, b.aname, b.pname) from Book b where b.name like :name", Bookprojection.class)
		    .setParameter("name", "%" + name + "%")
		    .list();
		return list;
	}
	
	public Book getBook(String name) {
		Session session= entityManager.unwrap(Session.class);
		Book book=session.get(Book.class,name);
		return book;
	}
	public List<String> getBookNames() {
		Session session= entityManager.unwrap(Session.class);
		List<String> list=session.createQuery("select b.name from Book b ",String.class)
		.list();
		
		return list;
	}
	public List<Bookprojection> getBooks() {
		Session session= entityManager.unwrap(Session.class);
		List<Bookprojection> list=session.createQuery("select new com.booklicious.models.Bookprojection(b.name, b.price, b.aname, b.pname) from Book b ",Bookprojection.class)
		.list();
		return list;
	}
	@Transactional
	public boolean addBook(Book book) {
		Session session= entityManager.unwrap(Session.class);
		Book b=session.get(Book.class, book.getName());
		if(b==null) {
			session.persist(book);
			return true;
		}else {
			return false;
		}
		
	}
	@Transactional
	public boolean updateBookImage(String name,byte[] image) {
		Session session= entityManager.unwrap(Session.class);
		Book book=session.get(Book.class, name);
		if(book==null) {
			return false;
		}else {
			book.setImage(image);
			session.persist(book);
			return true;
		}
	}
	@Transactional
	public boolean updateBook(Book book){
		Session session= entityManager.unwrap(Session.class);
		Book b=session.get(Book.class, book.getName());
		if(b==null) {
			return false;
		}else {
			b.setPrice(book.getPrice());
			b.setAname(book.getAname());
			b.setPname(book.getPname());
			session.persist(b);
			return true;
		}
	}
	@Transactional
	public boolean deleteBook(String name){
		Session session= entityManager.unwrap(Session.class);
		Book book=session.get(Book.class, name);
		if(book==null) {
			return false;
		}else {
			session.remove(book);
			return true;
		}
	}
	public byte[] getBookImage(String name) {
		Session session= entityManager.unwrap(Session.class);
		Book book=session.get(Book.class, name);
		return book.getImage();
    }
	public byte[] getBookContent(String name) {
		Session session= entityManager.unwrap(Session.class);
		Book book=session.get(Book.class, name);
		return book.getContent();
    }
}
