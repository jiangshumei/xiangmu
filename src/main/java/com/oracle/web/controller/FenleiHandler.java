package com.oracle.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.pageBean;
import com.oracle.web.service.FenleiService;

@Controller
@Scope(value = "prototype")
public class FenleiHandler {
	private static final String NONE = null;
	
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

	@RequestMapping(value = "/delete/{fid}", method = RequestMethod.DELETE)
	public String delete(@PathVariable(value="fid") String ids) {
		
		
		/*Fenlei f = new Fenlei();

		f.setFid(id);
		

		fenleiService.delete(f);*/
		
		
		/*for(String string:arr){
			
			System.out.println(string);
			
		}
		*/
		String[] arr=ids.split(",");
		
		fenleiService.delete(arr);
		
		return "redirect:/fenleis/1";

	}
	

		
		

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
	
	@RequestMapping(value = "validateName.action")
	@ResponseBody
	public String queryByname(String fname,HttpServletResponse response) throws IOException{
		
		System.out.println(fname);
		
		//Book b =bookService.validateName(name);
		
		Fenlei f=fenleiService.validateName(fname);
		
		response .setContentType("textml;charset=utf-8");
		
		if(f!=null){
			response.getWriter().write("{\"valid\":\"false\"}");
		}else{
			response.getWriter().write("{\"valid\":\"true\"}");
		}
		return NONE;
	}


	

//	@RequestMapping(value = "/queryone", method = RequestMethod.GET)
//	public String queryone(String fname,HttpSession session,HttpServletResponse response) throws IOException {
//
//		System.out.println(fname);
//
//		Fenlei a = this.fenleiService.queryone(fname);
//
//
//		response.setContentType("text/html;charset=utf-8");
//
//		if (a != null) {
//
//			response.getWriter().write("{\"valid\":\"false\"}");
//
//		} else {
//
//			response.getWriter().write("{\"valid\":\"true\"}");// 不存在
//		}
//
//		return null;
//
//	}
	
	@RequestMapping(value = "validate")
	@ResponseBody
	public String queryByFname(String fname,HttpServletResponse response) throws IOException{


		//System.out.println(name);


		Fenlei f =fenleiService.queryOne(fname);


		response.setContentType("text/html;charset=utf-8");


        if(f!=null){
			
            response.getWriter().write("{\"valid\":\"false\"}");
		
			}else{
				
				response.getWriter().write("{\"valid\":\"true\"}");//不存在
			}
		
		return NONE;


	}
	
	
	

	
	
	// 导出分类
			@RequestMapping(value = "/outPutFenlei/{ids}", method = RequestMethod.GET)
			public  void
			outPutFenLei(@PathVariable(value = "ids") String ids1,HttpServletResponse response) throws IOException {
				 
				List<Fenlei> list = null;
				String key = "";
				if (ids1.equals("a")) {//传入a 表示导出全部
					
					list = this.fenleiService.outPutFenleiAll();
					key = "全部";

				}else{ 
					//System.out.println(ids1);
					list = this.fenleiService.outPutFenleiIds(ids1);
					key = "勾选";

				}
				//创件一个工作蒲
				HSSFWorkbook Workbook = new HSSFWorkbook();
				//创建一个工作表
				HSSFSheet sheet = Workbook.createSheet(key + "分类信息表");
		          
				sheet.setColumnWidth(7, 15 * 256); //设定列宽度
				//设置样式
				HSSFCellStyle style = Workbook.createCellStyle();
				style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
				HSSFFont font = Workbook.createFont();
				font.setBold(true);
				font.setColor(HSSFColor.DARK_RED.index);
				style.setFont(font);
				String[] title = { "分类编号", "分类名称"};
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
					Fenlei fenlei = list.get(i);

					HSSFCell cell1 = row1.createCell(0);
					cell1.setCellValue(fenlei.getFid());

					HSSFCell cell2 = row1.createCell(1);
					cell2.setCellValue(fenlei.getFname());
	 
	  
	 
					cell1.setCellStyle(style1);
					cell2.setCellStyle(style1);
					 
				 
	 
				}
				 
				 String fname = key +"分类信息表.xls"; 
				response.setContentType("application/octet-stream");
				response.setHeader("Content-disposition", "attachment;filename="+new String(fname.getBytes("UTF-8"), "iso-8859-1"));
				response.flushBuffer();
				 Workbook.write(response.getOutputStream());
				 
			}

}
