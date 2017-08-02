package com.jihye.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jihye.dao.MovieDao;
import com.jihye.vo.MovieScoreVo;

@Controller
@RequestMapping("/updateMovieScore.com")
public class UpdateMovieScore {

	@Autowired
	private MovieDao dao;

	public void setDao(MovieDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET,produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String form(int ms_no){
		String str="";
		
		MovieScoreVo ms = dao.listMovieScore(ms_no);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(ms);
			//System.out.println(str);
			
		} catch (Exception e) {
			System.out.println("����� ���� ���� get��� ������() mapper   ::    " + e.getMessage());
		}
		
		
		return str;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String submit(MovieScoreVo ms){
		String str="";
		
		//System.out.println("��Ʈ�ѷ����� �޴°�"+ms.getMs_mid());
		int re = dao.updateMovieScore(ms);
		if(re==1){
			//System.out.println("�������̺� ���� ����");
			double avg = dao.getScoreAvg(ms.getMs_mid());
			//System.out.println("��� ���� : "+avg);
			int up = dao.updateMovieTableScore(avg, ms.getMs_mid());
			if(up==1){
				System.out.println(avg+"��ȭ���̺� �ݿ��� ��� �� m_score������ �����Ͽ����ϴ�. ");
			}
		}
		else{
			System.out.println("���� ���� �Ф�");
		}
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(ms);
		
			
		} catch (Exception e) {
			System.out.println("����� ���� ���� get��� ������() mapper   ::    " + e.getMessage());
		}
		
		return str;
	}
}
