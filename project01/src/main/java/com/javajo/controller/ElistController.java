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
@RequestMapping("/elist.com")
public class ElistController {

	@Autowired
	private JavajoDao dao;

	private int pageSize=5;
	private int pageGroup=5;
	private String key;
	
	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView mlist(@RequestParam(value="pageNUM", defaultValue="1") int pageNUM, HttpServletRequest request)
	{
		int totalRecode = dao.etotalRecode(this.key);
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
			pageNUM2 += "<a href='elist.com?pageNUM="+(start-1)+"'>이전</a> ";
		}
		for(int i = start; i <= end; i++)
		{
			pageNUM2 += "<a href='elist.com?pageNUM="+i+"'>"+i+"</a> ";
			if(i >= totalpage)
			{
				break;
			}
		}
		if(end < totalpage)
		{
			pageNUM2 += "<a href='elist.com?pageNUM="+(end+1)+"'>다음</a> ";
		}
		ModelAndView mav = new ModelAndView();
		int num2 = pageNUM*pageSize;
		int num1 = num2-pageSize+1;
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("clist", dao.elist(num1,num2,this.key));
		mav.addObject("pagenum", pageNUM2);
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView mlistserch(@RequestParam(value="key", required=false) String key,@RequestParam(value="pageNUM", defaultValue="1") int pageNUM)
	{
		this.key = key;
		int totalRecode = dao.etotalRecode(key);
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
			pageNUM2 += "<a href='elist.com?pageNUM="+(start-1)+"'>이전</a> ";
		}
		for(int i = start; i <= end; i++)
		{
			pageNUM2 += "<a href='elist.com?pageNUM="+i+"'>"+i+"</a> ";
			if(i >= totalpage)
			{
				break;
			}
		}
		if(end < totalpage)
		{
			pageNUM2 += "<a href='elist.com?pageNUM="+(end+1)+"'>다음</a> ";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("title", "게시물 목록");
		int num2 = pageNUM*pageSize;
		int num1 = num2-pageSize+1;
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("clist", dao.elist(num1,num2,key));
		mav.addObject("pagenum", pageNUM2);
		return mav;
	}
}
