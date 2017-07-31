package com.jihye.controller;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jihye.dao.MovieDao;
import com.jihye.vo.MovieVo_j;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/movieFinder.com")
public class MovieFinderController {

	@Autowired
	private MovieDao dao;

	public void setDao(MovieDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public void form(){
		
	}
	
	@RequestMapping(method=RequestMethod.POST,produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String submit(String searchField,String keyword,String[] m_genre,String[] m_nation,String[] m_grade,String startyear,String endyear,HttpServletResponse response){
		//ModelAndView mav = new ModelAndView(); 
		//System.out.println("컨트롤러에서 넘기는 값 : "+keyword);
		//System.out.println("컨트롤러에서 넘기는 startyear : "+startyear);
		//System.out.println("컨트롤러에서 넘기는 endyear : "+endyear);
		List<MovieVo_j> list = dao.getMovieFinder(searchField, keyword, m_genre, m_nation, m_grade, startyear, endyear);
		
		String str = "";

		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
			  // response.getWriter().print(mapper.writeValueAsString(person));
		} catch (Exception e) {
			System.out.println("first() mapper   ::    " + e.getMessage());
		}
		return str;

	}
		
	
	
	
}
