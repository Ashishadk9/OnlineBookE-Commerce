package com.uniquebooks.controller;

import com.uniquebooks.model.CartItem;
import com.uniquebooks.service.BookService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.uniquebooks.entity.Book;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private final BookService bookService=new BookService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action= request.getParameter("action");
        HttpSession session= request.getSession();

        //Get cart from session, or create new if none
        List<CartItem> cart= (List<CartItem>) session.getAttribute("cart");

        if(cart==null){
            cart=new ArrayList<>();
            session.setAttribute("cart",cart);
        }

        if ("add".equals(action)){
            int  bookId=Integer.parseInt(request.getParameter("bookId"));

            Book book =bookService.findById(bookId);
            if (book!=null){
                boolean found =false;
                for(CartItem item:cart){
                    if (item.getBook().getId() == bookId){
                        item.setQuantity(item.getQuantity()+1);
                        found=true;
                        break;
                    }
                }
                if (!found){
                    cart.add(new CartItem(book, 1));
                }
            }
            response.sendRedirect(request.getContextPath()+ "/product"); // stay on product page

        } else if ("update".equals(action)) {
            int  bookId=Integer.parseInt(request.getParameter("bookId"));
            int  quantity=Integer.parseInt(request.getParameter("quantity"));

            for (CartItem item :cart){
                if (item.getBook().getId()==bookId){
                    if (quantity<=0){
                        cart.remove(item);
                    } else{
                        item.setQuantity(quantity);
                    }
                    break;
                }
            }
            response.sendRedirect(request.getContextPath()+ "/cart");

        } else if ("remove".equals(action)) {
            int  bookId=Integer.parseInt(request.getParameter("bookId"));
            cart.removeIf(item -> item.getBook().getId()==bookId);
            response.sendRedirect(request.getContextPath()+"/cart");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request,response);
    }
}
