package com.jihye.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jihye.data.MovieManager;
import com.jihye.vo.MovieScoreVo;
import com.jihye.vo.MovieVo_j;


@Repository
public class MovieDao {
	
	
		//�� ȭ�鿡 ������ �Խù��� ��
		public static int pageSIZE= 3;
		
		//������Ʈ ȭ�鿡 ������ �Խù��� ��
		public static int moviepageSIZE= 9;
		
		//��ü ���ڵ�� 
		public static int totalRecord;
		
		//������Ʈ ��ü ���ڵ�� 
		public static int movietotalRecord;
		
		//��ü ��������
		public static int totalPage;
		
		//���� ��Ʈ ��ü ��������
		public static int movietotalPage;
		
		//�� ȭ�鿡 ������ ��������
		public static int pageGRUOP=3;
		
		
		public int getNextNo(int ms_mid)
		{
			return MovieManager.getNextNo(ms_mid);
		}
		
		public int getTotal(int ms_mid)
		{
			return MovieManager.getTotal(ms_mid);
		}
	
		
		/*public String getPageStr(int ms_mid)
		{
			// ���� �������� ���� ������������ �������������� ����Ѵ�.
			// ��ȭ�鿡 ������ ���������� 5
			// ������������ 1,2,3,4,5 ��� start = 1, end 5
			// ������������ 6,7,8,9,10 ��� start = 6, end 10
			                             
			//int start = (int) Math.ceil((pageNUM-1) /(double)pageGRUOP)*pageGRUOP+1;		
			//int start = (pageNUM + pageGRUOP-1) / pageGRUOP * pageGRUOP - (pageGRUOP-1);		
			int start = 
			(pageNUM + pageGRUOP-1) / pageGRUOP * pageGRUOP - (pageGRUOP-1);				
			
			int end = start+pageGRUOP-1;
			
			if(end > totalPage)
				end = totalPage;
			
			System.out.println("pageNUM:"+pageNUM);
			System.out.println("start:"+start);
			System.out.println("end:"+end);
			
			String str = "";
			
			if( start > pageGRUOP  )
			{
				//str = str + "<a href='listMovieScore.com?ms_mid="+ms_mid+"&pageNUM="+(start-1)+"'>[����]</a>&nbsp;";
				str += "<span>";
				str = str + "<label class='paging'>[����]</label>&nbsp;";
			}
			
			
			for(int i=start; i<= end; i++)
			{
				//str = str + "<a href='listMovieScore.com?ms_mid="+ms_mid+"&pageNUM="+i+"'>"+ i + "</a>&nbsp;";
				str = str + "<label class='paging'>"+ i + "</label>&nbsp;";
				//str = str +i;
			}
			
			if( end < totalPage  )
			{
				//str = str + "<a href='listMovieScore.com?ms_mid="+ms_mid+"&pageNUM="+(end+1)+"'>[����]</a>&nbsp;";
				str = str + "<label class='paging'>[����]</label>&nbsp;";
				str+="</span>";
			}
			
			return str;
		}*/
		
		
		public List<MovieScoreVo> getMovieScore(int ms_mid){
			
			totalRecord= getTotal(ms_mid);
			totalPage = (int)Math.ceil((double)totalRecord/pageSIZE);
			//System.out.println("totalRecord:"+ totalRecord);
			//System.out.println("totalPage:"+ totalPage);
			
			return MovieManager.getMovieScore(ms_mid);
		}
		
		public int isOneMember(int ms_mid,String ms_custid){
		
			return MovieManager.isOneMember(ms_mid, ms_custid);
		}
		
		public double getScoreAvg(int ms_mid){
			return MovieManager.getScoreAvg(ms_mid);
		}
		
		public int updateMovieTableScore(double avg,int ms_mid){
			return MovieManager.updateMovieTableScore(avg, ms_mid);
		}
		
	
 
	public int insertMovie(MovieVo_j m){
		return MovieManager.insertMovie(m);
		//commit�� �ȵ�?
	}
	
	public int updateMovie(MovieVo_j m){
		return MovieManager.updateMovie(m);
	}
	
	public MovieVo_j getMovie(int m_number){
		return MovieManager.getMovie(m_number);
	}
	
	public List<MovieVo_j> listMovie(String select){
		
		return MovieManager.listMovie(select);
	}
	
	public List<MovieVo_j> preMovie(){
		return MovieManager.preMovie();
	}
	
	public int insertMovieScore(MovieScoreVo ms){
		return MovieManager.insertMovieScore(ms);
	}
	
	public int updateMovieScore(MovieScoreVo ms){
		return MovieManager.updateMovieScore(ms);
	}
	
	public int deleteMovieScore(int ms_no){
		return MovieManager.deleteMovieScore(ms_no);
	}
	
	public MovieScoreVo listMovieScore(int ms_no){
		return MovieManager.listMovieScore(ms_no);
	}
	
	
	public List<MovieVo_j> getMovieFinder(String searchField,String searchWord,String[] m_genre,String[] m_nation,String[] m_grade,String startyear,String endyear){
		return MovieManager.getMovieFinder(searchField,searchWord,m_genre,m_nation,m_grade,startyear,endyear);
	}
	
	
}
