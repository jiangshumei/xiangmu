package com.oracle.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.pageBean;
import com.oracle.web.service.FenleiService;

@Controller
@Scope(value = "prototype")
public class FenleiHandler {
  
	@Autowired
	private FenleiService fenleiService;

	@RequestMapping(value = "/fenleis1", method = RequestMethod.GET)
	public String fenleis(HttpServletRequest request) {

		List<Fenlei> list = fenleiService.list();

		//System.out.println(list);

		request.setAttribute("fList", list);

		return "showFenlei";
	}

	

	@RequestMapping(value = "/fenlei", method = RequestMethod.POST)
	public String add(Fenlei fenlei) {

		fenleiService.save(fenlei);

		return "redirect:/fenleis/1";

	}

	@RequestMapping(value = "/fenlei_delete/{fid}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("fid") Integer id) {

		Fenlei f = new Fenlei();

		f.setFid(id);

		fenleiService.delete(f);

		return "redirect:/fenleis/1";

	}
	
	/*@RequestMapping(value = "/deleteFenlei/{ids}/{pageNow}", method = RequestMethod.DELETE)
	public String delete(@PathVariable(value = "ids") String ids, @PathVariable(value = "pageNow") Integer pageNow) {
		// System.out.println(ids);
		this.fenleiService.deleteFenlei(ids);
		return "redirect:/fenleis/" + pageNow;


	}*/


	@RequestMapping(value = "/fenlei/{fid}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("fid") Integer id, HttpSession session) {

		Fenlei fenlei = fenleiService.selectByPrimaryKey(id);

		session.setAttribute("s", fenlei);
		
		return "updateFenlei";//Forward

	}

	@RequestMapping(value = "/fenleiupdate", method = RequestMethod.PUT)
	public String update(Fenlei fenlei) {

		fenleiService.update(fenlei);

		return "redirect:/fenleis/1";
	}

	@RequestMapping(value = "/fenleis/{pageNow}", method = RequestMethod.GET)
	public String list(@PathVariable(value = "pageNow") Integer pageNow, HttpServletRequest request) {

		if (pageNow == null || pageNow < 1) {

			pageNow = 1;

		}

		pageBean<Fenlei> pb = this.fenleiService.selectAllByPageHelper(pageNow);

		request.setAttribute("pb", pb);

		System.out.println(pb);

		return "showFenlei";
	}

	

	@RequestMapping(value = "/queryone", method = RequestMethod.POST)
	public String queryone(String fname,HttpSession session,HttpServletResponse response) throws IOException {

		System.out.println(fname);

		Fenlei a = this.fenleiService.queryone(fname);


		response.setContentType("text/html;charset=utf-8");

		if (a != null) {

			response.getWriter().write("{\"valid\":\"false\"}");

		} else {

			response.getWriter().write("{\"valid\":\"true\"}");// 不存在
		}

		return null;

	}
	
	
	
	/*@RequestMapping(value = "/outFenleiExcle/{ids}", method = RequestMethod.GET)
	public void
	outPutBook(@PathVariable(value = "ids") String ids1,HttpServletResponse response) throws IOException {
		 
		List<Fenlei> list = null;
		String key = "";
		if (ids1.equals("a")) {//传入a 表示导出全部
			
			list = this.fenleiService.();
			key = "全部";


		}else{ 
			//System.out.println(ids1);
			list = this.fenleiService.selectByPrimaryKey(ids1);
			key = "勾选";


		}
		//创件一个工作蒲
		HSSFWorkbook Workbook = new HSSFWorkbook();
		//创建一个工作表
		HSSFSheet sheet = Workbook.createSheet(key + "图书信息表");
          
		sheet.setColumnWidth(7, 15 * 256); //设定列宽度
		//设置样式
		HSSFCellStyle style = Workbook.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		HSSFFont font = Workbook.createFont();
		font.setBold(true);
		font.setColor(HSSFColor.DARK_RED.index);
		style.setFont(font);
		String[] title = { "编号", "分类编号", "图书名", "图书价格", "出版社", "作者", "库存" };
		HSSFRow row = sheet.createRow(0);//从0开始
		for (int i = 0; i < title.length; i++) {
			HSSFCell cell = row.createCell(i);
			cell.setCellStyle(style);
			cell.setCellValue(title[i]);
		}
		HSSFCellStyle style1 = Workbook.createCellStyle();
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中
		// 设置字体样式
		for (int i = 0; i < list.size(); i++) { 


			HSSFRow row1 = sheet.createRow(i + 1);
			BookAndFenlei book = list.get(i);


			HSSFCell cell1 = row1.createCell(0);
			cell1.setCellValue(book.getBid());


			HSSFCell cell2 = row1.createCell(1);
			cell2.setCellValue(book.getFenlei().getFname());


			HSSFCell cell3 = row1.createCell(2);
			cell3.setCellValue(book.getBname());


			HSSFCell cell4 = row1.createCell(3);
			cell4.setCellValue(book.getMoney());


			HSSFCell cell5 = row1.createCell(4);
			cell5.setCellValue(book.getPress());


			HSSFCell cell6 = row1.createCell(5);
			cell6.setCellValue(book.getAuthor());


			HSSFCell cell7 = row1.createCell(6);
			cell7.setCellValue(book.getStock());


			cell1.setCellStyle(style1);
			cell2.setCellStyle(style1);
			cell3.setCellStyle(style1);
			cell4.setCellStyle(style1);
			cell5.setCellStyle(style1);
			cell6.setCellStyle(style1);
			cell7.setCellStyle(style1);


		}
		 
		 String fname = key +"分类信息表.xls"; 
		response.setContentType("application/octet-stream");
		response.setHeader("Content-disposition", "attachment;filename="+new String(fname.getBytes("UTF-8"), "iso-8859-1"));
		response.flushBuffer();
		 Workbook.write(response.getOutputStream());
		 
	}

*/
}
