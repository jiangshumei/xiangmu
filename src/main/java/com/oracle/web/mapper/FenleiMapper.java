package com.oracle.web.mapper;

import com.oracle.web.bean.Fenlei;

import java.util.List;

public interface FenleiMapper {

	int deleteByPrimaryKey(Integer fid);

	int insert(Fenlei record);

	Fenlei selectByPrimaryKey(Integer fid);

	List<Fenlei> selectAll();

	int updateByPrimaryKey(Fenlei record);

	int counts();

	List<Fenlei> selectAllByPageHelper();

	Fenlei selectFenleiByFname(String fname);

}