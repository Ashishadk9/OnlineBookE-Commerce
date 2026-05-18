package com.uniquebooks.controller;

import com.uniquebooks.model.CartItem;
import com.uniquebooks.service.BookRequestService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private final BookRequestService requestService= new BookRequestService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            request.setAttribute("error", "Your cart is empty.");
            request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);
            return;
        }

        // Create a book request for each copy
        int totalRequests =0;
        for (CartItem item : cart) {
            for (int i=0;i<item.getQuantity();i++) {
                boolean success= requestService.requestBook(userId,
                        item.getBook().getId());
                if (success) totalRequests++;
            }
        }

        // Clear the cart
        session.removeAttribute("cart");

        request.setAttribute("message", "Thank you for your checkout." + totalRequests +
                " Book requests have been submitted.");
        request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);
    }
}
