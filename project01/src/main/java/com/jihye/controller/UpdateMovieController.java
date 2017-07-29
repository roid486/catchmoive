package com.jihye.controller;

import java.io.File;
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
@RequestMapping("/updateMovie.com")
public class UpdateMovieController {
	
	@Autowired
	private MovieDao dao;

	public void setDao(MovieDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView updateForm(int m_number){
		ModelAndView mav = new ModelAndView();
		mav.addObject("m",dao.getMovie(m_number));
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView updateSubmit(MovieVo_j m,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		
		String path=request.getRealPath("resources/upload");
		System.out.println("path : "+ path);
		
		MovieVo_j mvo = dao.getMovie(m.getM_number());
		String oldFname = mvo.getM_image();
		
		String fname="";
		MultipartFile mfile = m.getUploadFile();
		if(mfile!=null){
			fname=mfile.getOriginalFilename();
		}
		m.setM_image(oldFname);
		
		if(!fname.equals("")){
			m.setM_image(fname);
			try{
				byte[] data = mfile.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+fname);
				fos.write(data);
				
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
		}
		
		
		String oldFname1 = mvo.getM_image1();
		
		String fname1="";
		MultipartFile mfile1 = m.getUploadFile1();
		if(mfile1!=null){
			fname1=mfile1.getOriginalFilename();
		}
		m.setM_image1(oldFname1);
		
		if(!fname1.equals("")){
			m.setM_image1(fname1);
			try{
				byte[] data = mfile1.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+fname1);
				fos.write(data);
				
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
		}
		
		
		String oldFname2 = mvo.getM_image2();
		
		String fname2="";
		MultipartFile mfile2 = m.getUploadFile2();
		if(mfile2!=null){
			fname2=mfile2.getOriginalFilename();
		}
		m.setM_image2(oldFname2);
		
		if(!fname2.equals("")){
			m.setM_image2(fname2);
			try{
				byte[] data = mfile2.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+fname2);
				fos.write(data);
				
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
		}
		
		
		
		String oldFname3 = mvo.getM_image3();
		
		String fname3="";
		MultipartFile mfile3 = m.getUploadFile3();
		if(mfile3!=null){
			fname3=mfile3.getOriginalFilename();
		}
		m.setM_image3(oldFname3);
		
		if(!fname3.equals("")){
			m.setM_image3(fname3);
			try{
				byte[] data = mfile3.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+fname3);
				fos.write(data);
				
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
		}
		int re = dao.updateMovie(m);
		
		
		
		if(re==1 && !oldFname.equals("") && !fname.equals(""))
		{
			File file= new File(path+"/"+oldFname);
			file.delete();
		}

		if(re==1 && !oldFname1.equals("") && !fname1.equals(""))
		{
			File file= new File(path+"/"+oldFname1);
			file.delete();
		}
		
		if(re==1 && !oldFname2.equals("") && !fname2.equals(""))
		{
			File file= new File(path+"/"+oldFname2);
			file.delete();
		}
		
		if(re==1 && !oldFname3.equals("") && !fname3.equals(""))
		{
			File file= new File(path+"/"+oldFname);
			file.delete();
		}
		
		if(re==1){
			
			mav.addObject("success", "\""+m.getM_name()+"\""+" 데이터 수정에 성공 했습니다.");
		}
		else{
			mav.addObject("fail", "\""+m.getM_name()+"\""+" 데이터 수정에 실패 했습니다.");
		}

		
		return mav;
	}
	
	
}
