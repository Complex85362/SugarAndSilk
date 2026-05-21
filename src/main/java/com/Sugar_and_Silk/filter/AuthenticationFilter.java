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
 * Servlet Filter implementation class AuthenticationFilter
 */
@WebFilter(urlPatterns = {"/dashboard", "/addProduct", "/UpdateUserStatusServlet", "/updateProduct","/DeleteProduct", "/productManagement","/addNews",
	    "/newsManagement",
	    "/updateNews",
	    "/enquiryManagement",
	    "/profile",
	    "/updateProfile",
	    "/cart",
	    "/checkout",
	    "/submitReview"})
public class AuthenticationFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public AuthenticationFilter() {
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
            String role = user.getUserRole(); 
            String path = httpRequest.getServletPath();
            
            boolean isAdminPath = path.equals("/dashboard") || 
                    path.equals("/UpdateUserStatusServlet") || 
                    path.equals("/getimage") || 
                    path.equals("/updateProduct") || 
                    path.equals("/addProduct") ||  
                    path.equals("/DeleteProduct") || 
                    path.equals("/productManagement")||
                    path.equals("/addNews")                 ||
                    path.equals("/newsManagement")          ||
                    path.equals("/updateNews")              ||
                    path.equals("/enquiryManagement");
            if (isAdminPath) {
                if ("admin".equalsIgnoreCase(role)) {
                    // Admins are allowed to proceed to these restricted paths
                    chain.doFilter(request, response);
                } else {
                    // Customers attempting to access Admin paths are sent to home
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
                }
            } else {
                // Common paths like /profile and /logout are accessible to everyone logged in
                chain.doFilter(request, response);
            }
        } else {
            // If not logged in, redirect to login page and prevent back-button access to sensitive data
    
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
	}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
