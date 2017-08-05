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

import com.jun.dao.NoticeDao;
import com.jun.vo.BoardVo;
import com.jun.vo.NoticeVo;

@Controller
@RequestMapping("/updateNotice.com")
public class UpdateNoticeController {

	@Autowired
	private NoticeDao dao;

	public void setDao(NoticeDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView form(int nb_number)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("n", dao.getNotice(nb_number));
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView submit(NoticeVo n, HttpServletRequest request)
	{
		
		ModelAndView mav = new ModelAndView();
		String oldFname = n.getNb_fname();
		String path = request.getRealPath("resources/noticejun");
		System.out.println("path : "+path);
		
		MultipartFile file = n.getUploadFile();
		String nb_fname = "";
		if(file != null)
			nb_fname = file.getOriginalFilename();
		n.setNb_fname(oldFname);
		
		if(!nb_fname.equals(""))
		{
			n.setNb_fname(nb_fname);
			try {
				byte[] data = file.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+nb_fname);
				fos.write(data);
				fos.close();
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("update 컨트롤러 "+e.getMessage());
			}
		}
		
		int re = dao.updateNb(n);
		System.out.println("rerererere::::    "+re);
		if(re ==1 && !oldFname.equals("") && !nb_fname.equals(""))
		{
			File file2 = new File(path+"/"+oldFname);
			file2.delete();
		}
	
		
		
		mav.setViewName("redirect:/nblist.com");
		return mav;
	}
	
	
}
