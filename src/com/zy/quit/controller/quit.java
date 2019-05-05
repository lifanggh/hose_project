package com.zy.quit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Quit")
public class quit {

	@RequestMapping("/quit")
	public String quitt(HttpServletRequest request,HttpServletResponse response) {
		
		try {
			response.sendRedirect(request.getContextPath()+"/login.jsp");
			request.getSession().invalidate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return null;
	}
	/*@RequestMapping("zhuxiao")
	public String zhuxiao(HttpServletRequest request,HttpServletResponse response){
		request.getSession().removeAttribute("user");
		try {
			response.sendRedirect(request.getContextPath()+ "/login.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}*/
	
}
