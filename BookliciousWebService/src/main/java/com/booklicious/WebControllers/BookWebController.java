package com.booklicious.WebControllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.booklicious.BookServices.BookliciousAppService;
import com.booklicious.models.Book;
import com.booklicious.models.Bookprojection;

import jakarta.mail.Multipart;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PostMapping;




@RestController
public class BookWebController {
@Autowired
BookliciousAppService appService;

@GetMapping("/getBooks/{name}")
public List<Bookprojection> getBooks(@PathVariable String name) {
    return appService.getBooks();
}


@RequestMapping("/allBook")
	public List<Bookprojection> getBooks(){
		return appService.getBooks();
	}
@PutMapping("/updateBook")
public boolean updateBook(@RequestBody Book book) {
	return appService.updateBook(book);
}

@PutMapping("/updateBookImage/{name}")
public boolean updateBookImage(@PathVariable String name,@RequestBody byte[] image) {
	return appService.updateBookImage(name, image);
}
  @DeleteMapping("/deleteBook/{name}")
	  public boolean deleteBook(@PathVariable String name) {
	  return appService.deleteBook(name);
  }
  
  @GetMapping("/getBookImage/{name}")
  public byte[] getBookImage(@PathVariable String name) {
      return appService.getBookImage(name);
  }
  @PostMapping("addBook")
  public boolean addBook(@RequestBody Book book) {
      return appService.addBook(book);
  }
  
  @PostMapping("/editBook/{name}")
  public Book editBook(@PathVariable String name) {
      return appService.getBook(name);
  }
  @PostMapping("/getBookContent/{name}")
  public byte[] getBookContent( @PathVariable String name) {  
      return appService.getBookContent(name);
  }
 
  
  
}
