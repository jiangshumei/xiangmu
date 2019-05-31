package com.oracle.web.mapper;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;

import java.util.List;

public interface BookMapper {
   
    int deleteByPrimaryKey(Integer id);

    int insert(Book record);

    Book selectByPrimaryKey(Integer id);

    int selectCounts();
    
    List<SubBook> showByPageHelper();

    int updateByPrimaryKey(Book record);
   

	List<SubBook> selectAllWithOneSQL();
}