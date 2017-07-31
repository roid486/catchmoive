package com.jihye.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.jihye.dao.MovieDao;
import com.jihye.vo.MovieScoreVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class InsertMovieScoreController {

	@Autowired
	private MovieDao dao;
	
	public static int m_number;

	public void setDao(MovieDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="/insertMovieScore.com",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String submit(MovieScoreVo ms,HttpServletRequest request,HttpSession session,HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		int re = dao.insertMovieScore(ms);
		//System.out.println("�μ�Ʈ �����ھ� : "+ms.getMs_mid());
		//request.setAttribute("m_number", ms.getMs_mid()); //request�� ������ �ѹ� �Ѿ���� ��ȿ! session�� ������ ���մ� ���� ��ȿ 
		
		
		List<MovieScoreVo> list = dao.getMoveiScore(ms.getMs_mid());
		
		String str = "";

		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
			  // response.getWriter().print(mapper.writeValueAsString(person));
		} catch (Exception e) {
			System.out.println("����� ���� ������() mapper   ::    " + e.getMessage());
		}
	
		
		
		
		if(re==1){
			System.out.println("������ ���� ����!!!");
		}
		else{
			System.out.println("���� ���� �Ф�");
		}
		return str;
	}
	
	
	@RequestMapping(value="/listMovieScore.com",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String getMovieScore(int ms_mid){
		ModelAndView mav = new ModelAndView();
		List<MovieScoreVo> list = dao.getMoveiScore(ms_mid);
		mav.addObject("ms",list);
		String str="";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
			  // response.getWriter().print(mapper.writeValueAsString(person));
		} catch (Exception e) {
			System.out.println("����� ���� ����Ʈ ������() mapper   ::    " + e.getMessage());
		}
		
		return str;
		
	}
}
