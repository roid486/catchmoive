package com.jihye.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		String str="";
		int re = dao.insertMovieScore(ms);
		//System.out.println("인서트 무비스코어 : "+ms.getMs_mid());
		//request.setAttribute("m_number", ms.getMs_mid()); //request는 페이지 한번 넘어갈때만 유효! session은 서버가 켜잇는 동안 유효 
		
		/*
		//List<MovieScoreVo> list = dao.getMoveiScore(ms.getMs_mid());
		
		String str = "";

		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
			  // response.getWriter().print(mapper.writeValueAsString(person));
		} catch (Exception e) {
			System.out.println("여기는 평점 데이터() mapper   ::    " + e.getMessage());
		}
	*/
		
		
		
		if(re==1){
			System.out.println("데이터 삽입 성공!!!");
		
			double avg = dao.getScoreAvg(ms.getMs_mid());
			
			//System.out.println("평균 평점 : "+avg);
			int up = dao.updateMovieTableScore(avg, ms.getMs_mid());
			if(up==1){
				System.out.println(avg+"영화테이블에 반영된 평균 값 m_score수정에 성공하였습니다. ");
			}
		}
		else{
			System.out.println("삽입 실패 ㅠㅠ");
		}
		
		
		List<MovieScoreVo> list = dao.getMoveiScore(ms.getMs_mid());
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
		
			
		} catch (Exception e) {
			System.out.println("여기는 평점 인서트 get방식 데이터() mapper   ::    " + e.getMessage());
		}
		
		
		return str;
	}
	
	
	@RequestMapping(value="/listMovieScore.com",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String getMovieScore(int ms_mid,HttpSession session){
		
		
		String str="";
		
		//String pageStr = dao.getPageStr(ms_mid);
		List<MovieScoreVo> list = dao.getMoveiScore(ms_mid);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
			//System.out.println(pageStr);
			
			
			//session.setAttribute("pageStr", pageStr);
			//System.out.println(str);
			  // response.getWriter().print(mapper.writeValueAsString(person));
		} catch (Exception e) {
			System.out.println("여기는 평점 리스트 데이터() mapper   ::    " + e.getMessage());
		}
		
		return str;
		
	}
	
	
	/*@RequestMapping(value="/updateMovieScore.com",produces = "text/plain;charset=utf-8")
	public String updateMovieScore(MovieScoreVo ms){
		String str="";
		System.out.println(ms.getMs_no()+" : "+ms.getMs_score());
		int re = dao.updateMovieScore(ms);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.updateMovieScore(ms));
			System.out.println(str);
			
		} catch (Exception e) {
			System.out.println("여기는 평점 리스트 데이터() mapper   ::    " + e.getMessage());
		}
		
		
		if(re==1){
			System.out.println("평점 수정 성공!");
		}
		else{
			System.out.println("평점 수정 실패ㅠㅠ");
		}
		return str;
	}*/
}
