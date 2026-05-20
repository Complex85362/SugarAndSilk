package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.Sugar_and_Silk.model.UserModel;
import com.Sugar_and_Silk.dao.OrderDAO;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderDAO orderDAO = new OrderDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            UserModel user = (UserModel) session.getAttribute("user");
            double totalAmount = Double.parseDouble(request.getParameter("checkoutTotal"));

            // Execute the sequential payment and order insert statements
            boolean success = orderDAO.processCheckout(user.getUserId(), totalAmount);

            if (success) {
                // Clear out our global cart indicator badge value from the session pool completely
                session.setAttribute("cartCount", 0);
                
                // Redirect to a clean success order tracking milestone dashboard layout
                response.sendRedirect(request.getContextPath() + "/product?orderSuccess=true");
            } else {
                response.sendRedirect(request.getContextPath() + "/cart?error=checkout_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}