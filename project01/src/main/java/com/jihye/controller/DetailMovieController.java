package com.jihye.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jihye.dao.MovieDao;
import com.jihye.vo.MovieScoreVo;

@Controller
@RequestMapping("/detailMovie.com")
public class DetailMovieController {

	@Autowired
	private MovieDao dao;

	public void setDao(MovieDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getMovie(@RequestParam(value="m_number", defaultValue="1") int m_number,HttpSession session){
		ModelAndView mav = new ModelAndView();
		System.out.println("get방식의: " + m_number);
		session.setAttribute("m", dao.getMovie(m_number));
		//mav.addObject("m",dao.getMovie(m_number));
		return mav;
	}
	
	
	/*public ModelAndView getMovie(@RequestParam(value="m_number", defaultValue="1") int m_number,HttpServletRequest request,HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		System.out.println("디테일1 : "+request.getAttribute("m_number"));
		if(request.getAttribute("m_number")!=null && !request.getAttribute("m_number").equals(""))
		{
			//System.out.println("에러직전");
			m_number = Integer.parseInt(request.getAttribute("m_number").toString());
			System.out.println("디테일2 : "+m_number);
		}
		
	
		mav.addObject("m",dao.getMovie(m_number));
		return mav;
	}*/
	
	/*@RequestMapping(method= RequestMethod.POST)
	public ModelAndView getMovieScore(@RequestParam(value="m_number", defaultValue="1") int m_number,MovieScoreVo ms,HttpServletRequest request,HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		int re = dao.insertMovieScore(ms);
		m_number = ms.getMs_mid();
		System.out.println("post 시작부분" + m_number);
		
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
		}catch(Exception e){System.out.println(e.getMessage());}
		
		System.out.println("post방식의 m_number = "+m_number);
		//mav.addObject("m",dao.getMovie(m_number));
		try{
		response.sendRedirect("detailMovie.com?m_number="+m_number);
		}catch(Exception e){System.out.println(e.getMessage());}
		//mav.setViewName("redirect:/detailMovie.com?m_number="+m_number);
		
		if(re==1){
			System.out.println("무비 스코어 데이터 삽입 성공!!!");
		}
		else{
			System.out.println("무비 스코어 데이터 삽입 실패 ㅠㅠ");
		}
		
		
		
		
		return mav;
	}*/
	
}
