package com.Sugar_and_Silk.controller;

import java.io.IOException; 

import com.Sugar_and_Silk.dao.ReviewDAO;
import com.Sugar_and_Silk.model.ReviewModel;
import com.Sugar_and_Silk.model.UserModel;
import com.Sugar_and_Silk.utils.SessionUtil;
import com.Sugar_and_Silk.utils.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/submitReview")
public class ReviewServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private ReviewDAO reviewDAO;

	@Override
	public void init() throws ServletException {
		reviewDAO = new ReviewDAO();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int productId = Integer.parseInt(request.getParameter("productId"));
			String ratingParam = request.getParameter("rating");
			String comment = request.getParameter("comment");

			int rating = 0;

			try {

			    rating = Integer.parseInt(ratingParam);

			} catch (NumberFormatException e) {

			    response.sendRedirect(
			            request.getContextPath()
			            + "/detail?productId="
			            + productId
			            + "&error=invalidReview");

			    return;
			}
			
			if (!ValidationUtil.isValidRating(rating)
			        || !ValidationUtil.isValidComment(comment)) {

			    response.sendRedirect(
			            request.getContextPath()
			            + "/detail?productId="
			            + productId
			            + "&error=invalidReview");

			    return;
			}
			
			HttpSession session = request.getSession();

			UserModel loggedInUser = (UserModel) session.getAttribute("user");

			if (loggedInUser == null) {
				response.sendRedirect(request.getContextPath() + "/login");
				return;
			}

			int userId = loggedInUser.getUserId();
			ReviewModel review = new ReviewModel(userId, productId, rating, comment);
			boolean isAdded = reviewDAO.addReview(review);
			
			if (isAdded) {
			    SessionUtil.setAttribute(request, "reviewSuccess", "Review submitted successfully!", 60);
			    response.sendRedirect(request.getContextPath() + "/detail?productId=" + productId);
			} else {
			    response.sendRedirect(request.getContextPath() + "/detail?productId=" + productId + "&error=reviewFailed");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/product?error=somethingWentWrong");
		}
	}
}