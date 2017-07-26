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
import com.jihye.vo.MovieVo_j;

@Controller
@RequestMapping("/detailMovie.com")
public class DetailMovieController {

	@Autowired
	private MovieDao dao;

	public void setDao(MovieDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getMovie(int m_number){
		ModelAndView mav = new ModelAndView();
		mav.addObject("m",dao.getMovie(m_number));
		return mav;
	}
	
	
	/*public ModelAndView getMovie(@RequestParam(value="m_number", defaultValue="1") int m_number,HttpServletRequest request,HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		System.out.println("������1 : "+request.getAttribute("m_number"));
		if(request.getAttribute("m_number")!=null && !request.getAttribute("m_number").equals(""))
		{
			//System.out.println("��������");
			m_number = Integer.parseInt(request.getAttribute("m_number").toString());
			System.out.println("������2 : "+m_number);
		}
		
	
		mav.addObject("m",dao.getMovie(m_number));
		return mav;
	}*/
	
	@RequestMapping(method= RequestMethod.POST)
	public ModelAndView getMovieScore(MovieScoreVo ms,HttpServletRequest request,HttpServletResponse response, HttpSession session){
		ModelAndView mav = new ModelAndView();
		int re = dao.insertMovieScore(ms);
		int m_number = ms.getMs_mid();
		
		
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
			 
		    if( i != list.size() -1){     // ���� i�� list.size ���� 1 ������
		        json += ",";
		    }
		    
		    json += "]";
		}
		
		try{
			response.setContentType("text/plain"); //plain json����1!!!!!!
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(json);
			out.flush();
			out.close();
		}catch(Exception e){System.out.println(e.getMessage());}
		
		System.out.println("post����� m_number = "+m_number);
		MovieVo_j m=dao.getMovie(m_number);
		System.out.println("�������� movievo_j : "+m.getM_actor());
		System.out.println("�������� movievo_j : "+m.getM_boxoffice());
		System.out.println("�������� movievo_j : "+m.getM_image2());
		System.out.println("�������� movievo_j : "+m.getM_name());
		System.out.println("�������� �ѹ� : "+m.getM_number());
		
		
		mav.addObject("m",m);

		
		if(re==1){
			System.out.println("���� ���ھ� ������ ���� ����!!!");
		}
		else{
			System.out.println("���� ���ھ� ������ ���� ���� �Ф�");
		}
		
		
		
		
		return mav;
	}
	
}
