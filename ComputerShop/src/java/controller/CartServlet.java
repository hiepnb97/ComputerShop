package controller;

import dal.CartDAO;
import dal.ProductDAO;
import model.Cart;
import model.Product;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name="CartServlet", urlPatterns={"/cart", "/add-to-cart"})
public class CartServlet extends HttpServlet {
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
        List<Product> products = productDAO.getAllProducts();
        
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("products", products);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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

        String action = request.getServletPath();
        if (action.equals("/add-to-cart")) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            Cart cart = new Cart();
            cart.setUserId(user.getUserId());
            cart.setProductId(productId);
            cart.setQuantity(1);
            
            CartDAO cartDAO = new CartDAO();
            cartDAO.addToCart(cart);
            response.sendRedirect("home");
        }
    }
}