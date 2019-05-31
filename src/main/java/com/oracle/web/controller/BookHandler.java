package com.oracle.web.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.oracle.web.bean.Book;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean;
import com.oracle.web.service.BookService;
import com.oracle.web.service.FenleiService;

@Controller
@Scope(value = "prototype")
public class BookHandler {
	private static final String NONE = null;
	@Autowired
	private BookService bookService;

	@Autowired
	private FenleiService fenleiService;

	@RequestMapping(value = "/addUI", method = RequestMethod.GET)
	public String addUI(HttpServletRequest request) {

		List<Fenlei> fList = this.fenleiService.list();

		request.getSession().setAttribute("fList", fList);

		return "redirect:/addBook.jsp";
	}

	@RequestMapping(value = "/addbook", method = RequestMethod.POST)
	public String add(Book book) {

		int i = this.bookService.save(book);

		return "redirect:/showByPage";
	}

//	@RequestMapping(value = "/books", method = RequestMethod.GET)
//	public String Books(HttpServletRequest request) {
//
//		List<SubBook> bList = bookService.list();
//
//		request.setAttribute("bList", bList);
//
//		return "showBook";
//	}

	@RequestMapping(value = "/showByPage", method = RequestMethod.GET)
	public String showByPage(Integer pageNow, HttpServletRequest request) {

		// int pageSize = 2;

		if (pageNow == null) {

			pageNow = 1;
		}

		pageBean<SubBook> pb = this.bookService.showByPage(pageNow);

		//System.out.println(pb);
		
		request.setAttribute("pb", pb);

		return "showBook";

	}

	@RequestMapping(value = "/deleteBook/{id}", method = RequestMethod.DELETE)
	public String deleteBook(@PathVariable(value = "id") Integer id) {

		// String[] ids=id2.split(",");

		Book book = new Book();
		book.setId(id);
		this.bookService.delete(book);

		// System.out.println("pp");
		return "redirect:/showByPage";
	}
	
	@RequestMapping(value = "/book/{id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable(value = "id") Integer id, HttpSession session) {

		List<Fenlei> flist = this.fenleiService.list();

		session.setAttribute("flist", flist);

		Book b = this.bookService.queryOne(id);

		session.setAttribute("b", b);

		return "redirect:/updateBook.jsp";

	}

	@RequestMapping(value = "/updatebook", method = RequestMethod.PUT)
	public String update(Book book) {

		bookService.update(book);

		return "redirect:/showByPage";

	}

}
