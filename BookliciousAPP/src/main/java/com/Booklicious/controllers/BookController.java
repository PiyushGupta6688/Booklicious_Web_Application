package com.Booklicious.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.net.http.HttpResponse;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.Booklicious.models.Book;
import com.Booklicious.models.Bookprojection;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {

	RestTemplate restTemplate = new RestTemplate();
	String URL = "http://localhost:9990/";

	@PostMapping("/getBooks")
	public String getBooks(@RequestParam String name, ModelMap m) {
		String API = "getBooks/" + name;
		List<Bookprojection> list = restTemplate.getForObject(URL + API, List.class);
		m.addAttribute("books", list);
		return "ViewBooks";
	}

	@GetMapping("/allBook")
	public String allBook(ModelMap m, HttpSession session) {

		String name = (String) session.getAttribute("name");
		if (name == null) {
			m.addAttribute("msg", "Please Login First!");
			return "AdminLogin";
		}
		String API = "allBook";
		ResponseEntity<List> list = restTemplate.exchange(URL + API, HttpMethod.GET, null, List.class);
		List<Bookprojection> books = list.getBody();
		m.addAttribute("books", books);
		return "AllBooks";
	}


	@PostMapping("/addBook")
	public String addBook(Book book, @RequestPart("photo") MultipartFile photo, @RequestPart("data") MultipartFile data,
			ModelMap m) throws IOException {
		book.setImage(photo.getBytes());
		book.setContent(data.getBytes());
		String API = "addBook";
		HttpEntity<Book> requestEntity = new HttpEntity<Book>(book);
		ResponseEntity<Boolean> res = restTemplate.exchange(URL + API, HttpMethod.POST, requestEntity, Boolean.class);
		boolean result = res.getBody();
		if (result) {
			m.addAttribute("msg", "Book added successfully!");
		} else {
			m.addAttribute("msg", "Book name already exist!");
		}
		return "AdminHome";
	}


	@PostMapping("/updateBookImage")
	public String updateBookImage(String name,@RequestPart("image") MultipartFile photo,ModelMap m) throws IOException {
		String API="updateBookImage/"+name;
		HttpEntity<byte[]> requestEntity=new HttpEntity<>(photo.getBytes());
		restTemplate.put(URL+API, requestEntity);
		m.addAttribute("msg","Book Image updated successfully!");
	    API = "editBook/"+name;
		ResponseEntity<Book> result = restTemplate.exchange(URL + API, HttpMethod.POST, null, Book.class);
		Book book = result.getBody();
		m.addAttribute("b", book);
		return "EditBook";
	}
	
	@GetMapping("/getBookImage")
	public void getBookImage(String name, HttpServletResponse response) throws IOException {
		String API = "getBookImage/" + name;
		ResponseEntity<byte[]> result = restTemplate.exchange(URL + API, HttpMethod.GET, null, byte[].class);
		byte image[] = result.getBody();
		if (image == null || image.length == 0) {
			InputStream is = this.getClass().getClassLoader().getResourceAsStream("static/book.jpeg");
			image = is.readAllBytes();
		}
		response.getOutputStream().write(image);
	}

	@PostMapping("/editBook")
	public String editBook(String name, ModelMap m) {
		String API = "editBook/"+name;
		ResponseEntity<Book> result = restTemplate.exchange(URL + API, HttpMethod.POST, null, Book.class);
		Book book = result.getBody();
		m.addAttribute("b", book);
		return "EditBook";
	}

	@PostMapping("/updateBook")
	public String updateBook(Book book, ModelMap m) {
		String API = "updateBook";
		HttpEntity<Book> requestEntity = new HttpEntity<>(book);
		restTemplate.put(URL + API, requestEntity);
		m.addAttribute("msg", "Book updated successfully!");
		m.addAttribute("b", book);
		return "EditBook";

	}

	@PostMapping("/deleteBook")
	public String deleteBook(@RequestParam String name, ModelMap m) {
		String API = "deleteBook/"+name;
		restTemplate.delete(URL + API);
		m.addAttribute("msg", "Book deleted successfully!");

		API = "allBook";
		ResponseEntity<List> list = restTemplate.exchange(URL + API, HttpMethod.GET, null, List.class);
		List<Bookprojection> books = list.getBody();
		m.addAttribute("books", books);
		return "AllBooks";
	}

	@PostMapping("/downloadBook")
	public String downloadBook(String name, HttpServletResponse response, ModelMap m) throws IOException {
		String API = "getBookContent/" + name;
		ResponseEntity<byte[]> result = restTemplate.exchange(URL + API, HttpMethod.POST, null, byte[].class);
		byte[] content = result.getBody();
		if (content == null || content.length == 0) {
			m.addAttribute("msg", "Book Content Not Available!");
		} else {
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition", "attachment; filename=" + name + ".pdf");
			response.getOutputStream().write(content);
		}
		API = "allBook";
		ResponseEntity<List> list = restTemplate.exchange(URL + API, HttpMethod.GET, null, List.class);
		List<Bookprojection> books = list.getBody();
		m.addAttribute("books", books);
		System.out.println("all book");
		return "AllBooks";
	}

	@PostMapping("/viewBook")
	public String viewBook(String name, HttpServletResponse response, ModelMap m) throws IOException {
		String API = "getBookContent/" + name;
		ResponseEntity<byte[]> result = restTemplate.exchange(URL + API, HttpMethod.POST, null, byte[].class);
		byte[] content = result.getBody();

		if (content == null || content.length == 0) {
			m.addAttribute("msg", "Book Content Not Available!");
		} else {
			response.setContentType("application/pdf");
			response.addHeader("content-disposition", "inline; filename=" + name + ".pdf");
			response.getOutputStream().write(content);
		}
		API = "allBook";
		ResponseEntity<List> list = restTemplate.exchange(URL + API, HttpMethod.GET, null, List.class);
		List<Bookprojection> books = list.getBody();
		m.addAttribute("books", books);
		return "AllBook";
	}

}
