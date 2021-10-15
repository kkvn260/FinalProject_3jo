package com.kosta.o2controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import nl.captcha.Captcha;
import nl.captcha.servlet.CaptchaServletUtil;

@Controller
@RequestMapping(value ="/captcha")
public class CaptchaController {
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void index(HttpServletResponse response, HttpSession session) {
		Captcha captcha = new Captcha.Builder(148, 48)
				.addText().addNoise().addNoise().addNoise()
				.addBackground().build();
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Max-Age", 0);
		response.setContentType("image/png");
		CaptchaServletUtil.writeImage(response, captcha.getImage());
		session.setAttribute("captcha", captcha.getAnswer());
		
	}
	@RequestMapping(value = "/isRight",method = RequestMethod.GET)
	@ResponseBody
	public Integer isRight(@RequestParam(value = "captcha",required=false) String captcha,HttpSession session) {
		String answer = (String)session.getAttribute("captcha");
		if(captcha.equals(answer)) {
			return 1;
			
		}else {
			return 0;
		}
	}
}
