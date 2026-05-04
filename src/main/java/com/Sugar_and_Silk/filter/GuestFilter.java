package com.Sugar_and_Silk.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.Sugar_and_Silk.model.UserModel;
import com.Sugar_and_Silk.utils.SessionUtil;

/**
 * Servlet Filter implementation class GuestFilter
 */
@WebFilter(urlPatterns = {"/register", "/login"})
public class GuestFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public GuestFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	    HttpServletRequest httpRequest = (HttpServletRequest) request;
	    HttpServletResponse httpResponse = (HttpServletResponse) response;
	    
	    UserModel user = (UserModel) SessionUtil.getAttribute(httpRequest, "user");
	    
	    if (user != null) {
	        // If they try to access /login or /register while already logged in:
	        if ("admin".equalsIgnoreCase(user.getUserRole())) {
	            httpResponse.sendRedirect(httpRequest.getContextPath() + "/dashboard");
	        } else {
	            httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
	        }
	    } else {
	        // If not logged in, let them see /login or /register
	        chain.doFilter(request, response);
	    }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
