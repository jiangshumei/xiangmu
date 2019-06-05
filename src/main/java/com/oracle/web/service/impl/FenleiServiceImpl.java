package com.oracle.web.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.pageBean;
import com.oracle.web.mapper.FenleiMapper;
import com.oracle.web.service.FenleiService;



@Service
public  class FenleiServiceImpl implements FenleiService {
	
	@Autowired
	private FenleiMapper fenleiMapper;


	@Override
	@Transactional(readOnly = true)
	public List<Fenlei> list() {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectAll();
		
	}

	@Override
	@Transactional
	public int save(Fenlei fenlei) {
		// TODO Auto-generated method stub
		
		return this.fenleiMapper.insert(fenlei);
	}

	
	@Override
	@Transactional
	public int counts() {
		// TODO Auto-generated method stub
		return this.fenleiMapper.counts();
	}

	@Override
	@Transactional
	public void delete(Fenlei fenlei) {
		// TODO Auto-generated method stub
		
		 this.fenleiMapper.deleteByPrimaryKey(fenlei.getFid());
		
	}

	
	
	@Override
	@Transactional(readOnly = true)
	public Fenlei selectByPrimaryKey(Integer fid) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectByPrimaryKey(fid);
	}

	@Override
	@Transactional
	public void update(Fenlei fenlei) {
		// TODO Auto-generated method stub
		 this.fenleiMapper.updateByPrimaryKey(fenlei);
	}

	@Override
	public Fenlei queryone(String fname) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectFenleiByFname(fname); 
	}

	@Override
	@Transactional
	public pageBean<Fenlei> selectAllByPageHelper(Integer pageNow) {
		// TODO Auto-generated method stub
		pageBean<Fenlei> pb = new pageBean<Fenlei>();

		// 当前页的数据
		PageHelper.startPage(pageNow,5);

		//已经是分页好的数据了
		List<Fenlei> list = this.fenleiMapper.selectAllByPageHelper();

		pb.setBeanList(list);
		
		//总记录数
		PageInfo<Fenlei> pi=new PageInfo<Fenlei>(list);
		
		pb.setCounts((int)pi.getTotal());
		
		// 当前页
		//pb.setPageNow(pageNow);
		pb.setPageNow(pi.getPageNum());

		// 每页显示的条数-自定义
		//pb.setPageSize(3);
		pb.setpageSize(pi.getPageSize());

		return pb;
	}

	/*@Override
	@Transactional
	public int deleteFenlei(String ids) {
		// TODO Auto-generated method stub
		return this.deleteFenlei(ids);
	}*/

	

	

	

	

}
