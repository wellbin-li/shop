package cn.it.shop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//判断当前session是否有用户信息
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		if(req.getSession().getAttribute("user")==null){
			//保存当前客户想要去的url地址
//			System.out.println(req.getRealPath("/"));  打印结果:C:\Program Files\Apache Software Foundation\apache-tomcat-7.0.75\webapps\shop\
//			System.out.println(req.getServletPath()); //打印结果:/user/confirm.jsp 正是所想要的地址
//			System.out.println(req.getContextPath());  打印结果:/shop
//			System.out.println(req.getQueryString());  获取当前请求参数，如果有参数会打印，打印结果:null
			String goURL=req.getServletPath();
			String param=req.getQueryString();
			//若参数不为空，则将参数保存到所要请求地址中
			if(param!=null){
				goURL=goURL +"?"+ param;
			}
			//把当前客户想要访问的地址，存储到session中
			req.getSession().setAttribute("goURL", goURL);
			//非法请求，跳转到登录页面
			req.getSession().setAttribute("error", "非法请求，请登录！");
			res.sendRedirect(req.getContextPath()+"/ulogin.jsp");
		}else{
			//如果有下一个过滤器则跳转，否则直接到目标页面
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
