package com.javajo.mail;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.controller.MainContoller;
import com.javajo.dao.JavajoDao;

@Controller
public class Email {

	private JavaMailSender mailSender;

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	@RequestMapping("/mail.com")
	public ModelAndView email(final String email)
	{
		ModelAndView mav = new ModelAndView("redirect:/main.com");
		mailSender.send(new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage message) throws Exception {
				// TODO Auto-generated method stub
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
				messageHelper.setFrom("roid486@naver.com");
				messageHelper.setTo(email);
				messageHelper.setSubject("Email 인증");
				messageHelper.setText("<h1>Email인증을 하셔야 서비스 이용이 가능합니다.<h1><br> <a href='http://192.168.0.12:8089/controller/emailok.com?email="+email+"'>인증하기</a>", true);
			}
		});
		return mav;
	}
	
	@RequestMapping("/scid.com")
	public ModelAndView scid(final String name,final String email)
	{
		ModelAndView mav = new ModelAndView("redirect:/main.com");
		JavajoDao dao = new JavajoDao();
		final String id = dao.scid(name,email);
		if(id==null)
		{
			MainContoller.emsg = "회원가입을 하십시오.";
			MainContoller.ere = 1;
		}
		else
		{
			mailSender.send(new MimeMessagePreparator() {
				
				@Override
				public void prepare(MimeMessage message) throws Exception {
					// TODO Auto-generated method stub
					MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
					messageHelper.setFrom("roid486@naver.com");
					messageHelper.setTo(email);
					messageHelper.setSubject("아이디 찾기");
					messageHelper.setText("<h2>"+name+"님의 아이디는 <font color='red' size='20'>"+id+"</font>입니다.</h2>", true);
				}
			});
		}
		return mav;
	}
	
	@RequestMapping("/scpw.com")
	public ModelAndView scpw(final String id, final String name,final String email)
	{
		ModelAndView mav = new ModelAndView("redirect:/main.com");
		JavajoDao dao = new JavajoDao();
		final String pw = dao.scpw(id,name,email);
		if(pw==null)
		{
			MainContoller.emsg = "회원가입을 하십시오.";
			MainContoller.ere = 1;
		}
		else
		{
			mailSender.send(new MimeMessagePreparator() {
				
				@Override
				public void prepare(MimeMessage message) throws Exception {
					// TODO Auto-generated method stub
					MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
					messageHelper.setFrom("roid486@naver.com");
					messageHelper.setTo(email);
					messageHelper.setSubject("비밀번호 찾기");
					messageHelper.setText("<h2>"+name+"님의 비밀번호는 <font color='red' size='20'>"+pw+"</font>입니다.</h2>", true);
				}
			});
		}
		return mav;
	}
}
