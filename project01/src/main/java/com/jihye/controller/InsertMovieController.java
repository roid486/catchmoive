package com.jihye.controller;

import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jihye.dao.MovieDao;
import com.jihye.vo.MovieVo_j;

@Controller
@RequestMapping("/insertMovie.com")
public class InsertMovieController {
	@Autowired
	private MovieDao dao;

	public void setDao(MovieDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public void form(){
		
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView submit(MovieVo_j m , HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		String path = request.getRealPath("resources/upload");
		System.out.println("path = "+path);
		

		MultipartFile mfile = m.getUploadFile();
		String fname="";
		if(mfile != null){
			fname=mfile.getOriginalFilename();
		}
		m.setM_image(fname);
		if(!fname.equals(""))
		{
			try{
			byte[]data = mfile.getBytes();
			FileOutputStream fos= new FileOutputStream(path +"/" +fname);
					fos.write(data);
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}
		
		MultipartFile mfile1 = m.getUploadFile1();
		String fname1="";
		if(mfile1 != null){
			fname1=mfile1.getOriginalFilename();
		}
		m.setM_image1(fname1);
		if(!fname1.equals(""))
		{
			try{
			byte[]data = mfile1.getBytes();
			FileOutputStream fos= new FileOutputStream(path +"/" +fname1);
					fos.write(data);
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}
		
		MultipartFile mfile2 = m.getUploadFile2();
		String fname2="";
		if(mfile2 != null){
			fname2=mfile2.getOriginalFilename();
		}
		m.setM_image2(fname2);
		if(!fname2.equals(""))
		{
			try{
			byte[]data = mfile2.getBytes();
			FileOutputStream fos= new FileOutputStream(path +"/" +fname2);
					fos.write(data);
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}
		
		MultipartFile mfile3 = m.getUploadFile3();
		String fname3="";
		if(mfile3 != null){
			fname3=mfile3.getOriginalFilename();
		}
		m.setM_image3(fname3);
		if(!fname3.equals(""))
		{
			try{
			byte[]data = mfile3.getBytes();
			FileOutputStream fos= new FileOutputStream(path +"/" +fname3);
					fos.write(data);
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}
		
		int re =dao.insertMovie(m);
		if(re==1){
			mav.addObject("success", "영화 \""+m.getM_name()+"\""+" 데이터 추가에 성공 했습니다!");
		}
		else{
			mav.addObject("fail", "영화 \""+m.getM_name()+"\""+" 데이터 추가에 실패 했습니다.");
		}
		return mav;
	}
	
}
