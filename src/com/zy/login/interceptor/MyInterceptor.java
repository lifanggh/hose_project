package com.zy.login.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class MyInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
	String uri=arg0.getRequestURI();
	string uri =arg0.getRequestURI();
	//判斷是否登錄請求
	if (uri.indexOf("login")!=-1) {
		return true;
	}else if (uri.indexOf("add")!=-1) {
		return true;
	}else if (uri.indexOf("addResgister")!=-1) {
		return true;
	}
	else {
		//不是登錄請求 查詢是否已經登錄了
		//去session中獲取用戶的登錄信息
		Object attribute = arg0.getSession().getAttribute("user");
		//判斷是否有用戶的登錄信息
		if (attribute!=null) {
			return true;
			
		}else {
			arg1.sendRedirect(arg0.getContextPath()+"/login.jsp");
		}
	}
	
	
	
		return false;
	}

}
