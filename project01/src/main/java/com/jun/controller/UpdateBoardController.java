package com.jun.controller;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jun.dao.BoardDao;
import com.jun.vo.BoardVo;

@Controller
@RequestMapping("/updateBoard.com")
public class UpdateBoardController {

	@Autowired
	private BoardDao dao;

	public void setDao(BoardDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView form(int b_number)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("b", dao.getBoard(b_number));
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView submit(BoardVo b, HttpServletRequest request)
	{
		
		ModelAndView mav = new ModelAndView();
		String oldFname = b.getB_fname();
		String path = request.getRealPath("resources/jun");
		System.out.println("path : "+path);
		
		MultipartFile file = b.getUploadFile();
		String fname = "";
		if(file != null)
			fname = file.getOriginalFilename();
		b.setB_fname(oldFname);
		
		if(!fname.equals(""))
		{
			b.setB_fname(fname);
			try {
				byte[] data = file.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+fname);
				fos.write(data);
				fos.close();
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("update 컨트롤러 "+e.getMessage());
			}
		}
		
		int re = dao.update(b);
		if(re ==1 && !oldFname.equals("") && !fname.equals(""))
		{
			File file2 = new File(path+"/"+oldFname);
			file2.delete();
		}
	
		
		
		mav.setViewName("redirect:/nblist.com");
		return mav;
	}
}
