package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import com.Sugar_and_Silk.dao.CartDAO;
import com.Sugar_and_Silk.model.CartItemModel;
import com.Sugar_and_Silk.model.UserModel;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartDAO cartDAO = new CartDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        try {
            UserModel user = (UserModel) session.getAttribute("user");
            
            // 1. Fetch items list
            List<CartItemModel> cartItems = cartDAO.getCartByUser(user.getUserId());
            request.setAttribute("cartItems", cartItems);
            
            // 2. Fetch total header sum quantity
            int totalItemsCount = cartDAO.getCartItemCount(user.getUserId());
            request.setAttribute("cartCount", totalItemsCount);
            
            // 3 Calculate Sub-Totals, Taxes, and grand overall summary amounts
            double subTotal = 0.0;
            for (CartItemModel item : cartItems) {
                subTotal += (item.getProductPrice() * item.getQuantity());
            }
            double taxes = subTotal * 0.10; // 10% VAT mapping
            double total = subTotal + taxes;
            
            //calculated math variables into page  elements
            request.setAttribute("subTotal", String.format("%.2f", subTotal));
            request.setAttribute("taxes", String.format("%.2f", taxes));
            request.setAttribute("total", String.format("%.2f", total));
            
            request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        try {
            UserModel user = (UserModel) session.getAttribute("user");
            String action = request.getParameter("action");
            int productId = Integer.parseInt(request.getParameter("productId"));

            if ("delete".equals(action)) {
                cartDAO.deleteCartItem(user.getUserId(), productId);
            } else if ("update".equals(action)) {
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                if (quantity > 0) {
                    cartDAO.updateCartQuantity(user.getUserId(), productId, quantity);
                } else {
                    cartDAO.deleteCartItem(user.getUserId(), productId);
                }
            } else {
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                cartDAO.addToCart(user.getUserId(), productId, quantity);
            }

            int totalItemsCount = cartDAO.getCartItemCount(user.getUserId());
            
           
            session.setAttribute("cartCount", totalItemsCount);

            // Redirect the user back to the page 
            String referer = request.getHeader("Referer");
            if (referer != null && !referer.isEmpty()) {
                response.sendRedirect(referer);
            } else {
                response.sendRedirect(request.getContextPath() + "/product");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}