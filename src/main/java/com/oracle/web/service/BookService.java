package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean;

public interface BookService {

	int save(Book book);

	List<SubBook> list();

	void update(Book book);

	void delete(Book book);

	Book queryOne(Integer id);

	pageBean<SubBook> showByPage(Integer pageNow);

}
