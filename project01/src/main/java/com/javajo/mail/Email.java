package com.javajo.mail;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
				messageHelper.setSubject("Email ����");
				messageHelper.setText("<h1>Email������ �ϼž� ���� �̿��� �����մϴ�.<h1><br> <a href='http://192.168.0.12:8089/controller/emailok.com?email="+email+"'>�����ϱ�</a>", true);
			}
		});
		return mav;
	}
}
