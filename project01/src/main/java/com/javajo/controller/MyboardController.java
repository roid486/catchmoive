package com.javajo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;

@Controller
@RequestMapping("/myboard.com")
public class MyboardController {

	@Autowired
	private JavajoDao dao;

	private int pageSize=5;
	private int pageGroup=5;
	private String key;
	private String c_id;
	
	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView blist(@RequestParam(value="pageNUM", defaultValue="1") int pageNUM, HttpServletRequest request,String c_id)
	{
		this.c_id=c_id;
		int totalRecode = dao.mybtotalRecode(this.key,c_id);
		int totalpage=1;
		if(totalRecode % pageSize != 0)
		{
			totalpage = (int)Math.ceil(totalRecode/pageSize)+1;
		}
		else
		{
			totalpage = totalRecode/pageSize;
		}
		String pageNUM2="";
		int start = ((int)Math.ceil(pageNUM/(double)pageGroup)-1)*pageGroup+1;
		int end = start+pageGroup-1;
		if(start > pageGroup)
		{
			pageNUM2 += "<a href='myboard.com?pageNUM="+(start-1)+"&&c_id="+c_id+"'>이전</a> ";
		}
		for(int i = start; i <= end; i++)
		{
			pageNUM2 += "<a href='myboard.com?pageNUM="+i+"&&c_id="+c_id+"'>"+i+"</a> ";
			if(i >= totalpage)
			{
				break;
			}
		}
		if(end < totalpage)
		{
			pageNUM2 += "<a href='myboard.com?pageNUM="+(end+1)+"&&c_id="+c_id+"'>다음</a> ";
		}
		ModelAndView mav = new ModelAndView();
		int num2 = pageNUM*pageSize;
		int num1 = num2-pageSize+1;
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("clist", dao.myblist(num1,num2,this.key,c_id));
		mav.addObject("pagenum", pageNUM2);
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView blistserch(@RequestParam(value="key", required=false) String key,@RequestParam(value="pageNUM", defaultValue="1") int pageNUM)
	{
		this.key = key;
		int totalRecode = dao.mybtotalRecode(key,c_id);
		int totalpage=1;
		if(totalRecode % pageSize != 0)
		{
			totalpage = (int)Math.ceil(totalRecode/pageSize)+1;
		}
		else
		{
			totalpage = totalRecode/pageSize;
		}
		String pageNUM2="";
		int start = ((int)Math.ceil(pageNUM/(double)pageGroup)-1)*pageGroup+1;
		int end = start+pageGroup-1;
		if(start > pageGroup)
		{
			pageNUM2 += "<a href='myboard.com?pageNUM="+(start-1)+"&&c_id="+c_id+"'>이전</a> ";
		}
		for(int i = start; i <= end; i++)
		{
			pageNUM2 += "<a href='myboard.com?pageNUM="+i+"&&c_id="+c_id+"'>"+i+"</a> ";
			if(i >= totalpage)
			{
				break;
			}
		}
		if(end < totalpage)
		{
			pageNUM2 += "<a href='myboard.com?pageNUM="+(end+1)+"&&c_id="+c_id+"'>다음</a> ";
		}
		ModelAndView mav = new ModelAndView();
		int num2 = pageNUM*pageSize;
		int num1 = num2-pageSize+1;
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("clist", dao.myblist(num1,num2,key,c_id));
		mav.addObject("pagenum", pageNUM2);
		return mav;
	}
}
