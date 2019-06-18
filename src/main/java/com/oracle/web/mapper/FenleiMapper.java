package com.oracle.web.mapper;

import com.oracle.web.bean.Fenlei;

import java.util.List;

public interface FenleiMapper {

	/*int deleteByPrimaryKey(Integer fid);*/

	int insert(Fenlei record);

	Fenlei selectByPrimaryKey(Integer fid);

	List<Fenlei> selectAll();

	int updateByPrimaryKey(Fenlei record);

	int counts();

	List<Fenlei> selectAllByPageHelper();

	Fenlei selectFenleiByFname(String fname);

	
	List<Fenlei> selectOutPutIds(List<Integer> list);

	
	

	void deleteByPrimaryKey1(String[] arr);

	int yanzhengAddFenlei2(Integer fid);

	Fenlei selectFenleiByFname1(String fname);

	Fenlei validateName(String fname);

	Fenlei queryOne(String fname);


	

}