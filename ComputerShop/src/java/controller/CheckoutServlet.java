package controller;

import dal.CartDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import model.Cart;
import model.Order;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Product;

@WebServlet(name="CheckoutServlet", urlPatterns={"/checkout"})
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        
        CartDAO cartDAO = new CartDAO();
        List<Cart> cartItems = cartDAO.getCartItems(user.getUserId());
        ProductDAO productDAO = new ProductDAO();
        double total = 0;
        for (Cart item : cartItems) {
            Product product = productDAO.getProductById(item.getProductId());
            total += product.getPrice() * item.getQuantity();
        }
        
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("total", total);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        CartDAO cartDAO = new CartDAO();
        List<Cart> cartItems = cartDAO.getCartItems(user.getUserId());
        ProductDAO productDAO = new ProductDAO();
        double total = 0;
        for (Cart item : cartItems) {
            Product product = productDAO.getProductById(item.getProductId());
            total += product.getPrice() * item.getQuantity();
        }

        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setTotalAmount(total);
        order.setStatus("PENDING");

        OrderDAO orderDAO = new OrderDAO();
        orderDAO.createOrder(order, cartItems);
        
        response.sendRedirect("home?order=success");
    }
}