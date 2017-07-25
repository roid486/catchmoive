package com.javajo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;

@Controller
@RequestMapping("/mtlist.com")
public class MtlistController {

	@Autowired
	private JavajoDao dao;

	private int pageSize=3;
	private int pageGroup=5;
	private String key;
	
	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView blist(@RequestParam(value="pageNUM", defaultValue="1") int pageNUM)
	{
		
		int totalRecode = dao.mttotalRecode(this.key);
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
			pageNUM2 += "<a href='masterpage.com?pageNUM="+(start-1)+"'>이전</a> ";
		}
		for(int i = start; i <= end; i++)
		{
			pageNUM2 += "<a href='masterpage.com?pageNUM="+i+"'>"+i+"</a> ";
			if(i >= totalpage)
			{
				break;
			}
		}
		if(end < totalpage)
		{
			pageNUM2 += "<a href='masterpage.com?pageNUM="+(end+1)+"'>다음</a> ";
		}
		ModelAndView mav = new ModelAndView();
		int num2 = pageNUM*pageSize;
		int num1 = num2-pageSize+1;
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("mtl", dao.movietlist(num1,num2,this.key));
		mav.addObject("pagenum", pageNUM2);
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView blistserch(@RequestParam(value="key", required=false) String key,@RequestParam(value="pageNUM", defaultValue="1") int pageNUM)
	{
		this.key = key;
		int totalRecode = dao.mttotalRecode(key);
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
			pageNUM2 += "<a href='masterpage.com?pageNUM="+(start-1)+"'>이전</a> ";
		}
		for(int i = start; i <= end; i++)
		{
			pageNUM2 += "<a href='masterpage.com?pageNUM="+i+"'>"+i+"</a> ";
			if(i >= totalpage)
			{
				break;
			}
		}
		if(end < totalpage)
		{
			pageNUM2 += "<a href='masterpage.com?pageNUM="+(end+1)+"'>다음</a> ";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("title", "게시물 목록");
		int num2 = pageNUM*pageSize;
		int num1 = num2-pageSize+1;
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("mtl", dao.movietlist(num1,num2,key));
		mav.addObject("pagenum", pageNUM2);
		return mav;
	}
}
