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
			System.out.println("������ ���� ��� : "+avg);
			int up = dao.updateMovieTableScore(avg, ms_mid);
			if(up==1){
				System.out.println(avg+"������ ��ȭ���̺� �ݿ��� ��� �� m_score������ �����Ͽ����ϴ�. ");
			}
		}
		else{
			System.out.println("���� ���� ��");
		}
		
		MovieScoreVo ms = dao.listMovieScore(ms_no);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(ms);	
			
		} catch (Exception e) {
			System.out.println("����� ���� ���� get��� ������() mapper   ::    " + e.getMessage());
		}
		
		return str;
	}
}
