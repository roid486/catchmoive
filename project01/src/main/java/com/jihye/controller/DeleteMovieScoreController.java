package com.jihye.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jihye.dao.MovieDao;
import com.jihye.vo.MovieScoreVo;


@Controller
public class DeleteMovieScoreController {
	
	@Autowired
	private MovieDao dao;

	public void setDao(MovieDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/deleteMovieScore.com")
	@ResponseBody
	public String deleteMovieScore(int ms_no,int ms_mid){
		String str="";
		int re = dao.deleteMovieScore(ms_no);
		
		if(re==1){
			double avg = dao.getScoreAvg(ms_mid);
			System.out.println("삭제후 평점 평균 : "+avg);
			int up = dao.updateMovieTableScore(avg, ms_mid);
			if(up==1){
				System.out.println(avg+"삭제뒤 영화테이블에 반영된 평균 값 m_score수정에 성공하였습니다. ");
			}
		}
		else{
			System.out.println("삭제 실패 ㅠ");
		}
		
		MovieScoreVo ms = dao.listMovieScore(ms_no);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(ms);	
			
		} catch (Exception e) {
			System.out.println("여기는 평점 삭제 get방식 데이터() mapper   ::    " + e.getMessage());
		}
		
		return str;
	}
}
