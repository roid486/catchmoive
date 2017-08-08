package com.jun.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jun.data.JavajoManager;
import com.jun.vo.NoticeVo;

@Repository
public class NoticeDao {

	//�� ȭ�鿡 ������ �Խù��� ��
	public static int pageSIZE= 3;
		
	//��ü ���ڵ�� 
	public static int totalRecord;
		
	//��ü ��������
	public static int totalPage;
		
	//�� ȭ�鿡 ������ ��������
	public static int pageGRUOP=3;

	public List<NoticeVo> listNb(int start, int end, String searchField, String keyword, String pOrderField)
	{
		totalRecord= getTotal(searchField, keyword);
		totalPage = (int)Math.ceil((double)totalRecord/pageSIZE);
		System.out.println("totalRecord:"+ totalRecord);
		System.out.println("totalPage:"+ totalPage);
		return JavajoManager.listNb(start,end,searchField,keyword, pOrderField);
	}

	public int getTotal(String searchField, String keyword) {
		// TODO Auto-generated method stub
		return JavajoManager.getTotalNb(searchField, keyword);
	}

	public String getPageStrNb(int pageNUM, String searchField, String keyword, String pOrderField)
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
			str = str + "<a href='listNotice.com?pageNUM="+(start-1)+"'>[����]</a>&nbsp;";
		}
		
		
		for(int i=start; i<= end; i++)
		{
			str = str + "<a href='listNotice.com?pageNUM="+i+"'>"+ i + "</a>&nbsp;";
		}
		
		if( end < totalPage  )
		{
			str = str + "<a href='listNotice.com?pageNUM="+(end+1)+"'>[����]</a>&nbsp;";
		}
		
		return str;
	}

	public int noticeHit(int nb_number) {
		// TODO Auto-generated method stub
		return JavajoManager.noticeHit(nb_number);
	}

	public NoticeVo getNotice(int nb_number) {
		// TODO Auto-generated method stub
		return JavajoManager.getNotice(nb_number);
	}
	
	public int getNextNb()
	{
		return JavajoManager.getNextNb();
	}

	public int insertNb(NoticeVo n) {
		// TODO Auto-generated method stub
		return JavajoManager.insertNb(n);
		
	}

	public int updateNb(NoticeVo n) {
		// TODO Auto-generated method stub
		return JavajoManager.updateNb(n);
	}

	public int deleteNb(int nb_number) {
		// TODO Auto-generated method stub
		return JavajoManager.deleteNb(nb_number);
	}
}
