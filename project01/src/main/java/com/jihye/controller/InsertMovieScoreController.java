package com.jihye.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser;
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
	
	@RequestMapping("/insertMovieScore.com")
	public ModelAndView submit(MovieScoreVo ms,HttpServletRequest request,HttpSession session,HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		int re = dao.insertMovieScore(ms);
		System.out.println("인서트 무비스코어 : "+ms.getMs_mid());
		request.setAttribute("m_number", ms.getMs_mid()); //request는 페이지 한번 넘어갈때만 유효! session은 서버가 켜잇는 동안 유효 
		
		
		List<MovieScoreVo> list = dao.listMovieScore();
		String json = "[";
		for(int i=0;i<list.size();i++){
			MovieScoreVo list2 = (MovieScoreVo)list.get(i);
			int ms_no = list2.getMs_no();
			String ms_custid = list2.getMs_custid();
			int ms_mid = list2.getMs_mid();
			int ms_score = list2.getMs_score();
			String ms_comment = list2.getMs_comment();
			
			json += "{\"ms_no\": \"" + ms_no + "\",\"ms_custid\": \"" + ms_custid + "\",\"ms_mid\": \"" + ms_mid + "\",\"ms_score\": \"" + ms_score + "\",\"ms_comment\": \"" + ms_comment + "\"}";
			 
		    if( i != list.size() -1){     // 변수 i가 list.size 보다 1 작을때
		        json += ",";
		    }
		    
		    json += "]";
		}
		
		try{
			response.setContentType("text/plain"); //plain json형태1!!!!!!
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(json);
			out.flush();
			out.close();
			response.sendRedirect("detailMovie.com?m_number="+ms.getMs_mid());
		}catch(Exception e){System.out.println(e.getMessage());}
		
		
		/*JSONArray arr = new JSONArray();
		JSONObject obj = new JSONObject();*/
		
		
		//mav.addObject("m_number",ms.getMs_mid());
		//mav.setViewName("detailMovie.com");
		//mav.setViewName("redirect:/detailMovie.com?m_number="+ms.getMs_mid());
		
		
		if(re==1){
			System.out.println("데이터 삽입 성공!!!");
		}
		else{
			System.out.println("삽입 실패 ㅠㅠ");
		}
		return mav;
	}
	
}
