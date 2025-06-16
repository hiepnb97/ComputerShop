/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Cart;
import model.Product;

/**
 *
 * @author hiepn
 */
public class OrderDAO extends DBContext {

    public void createOrder(Order order, List<Cart> cartItems) {
        String orderSql = "INSERT INTO Orders (userId, totalAmount, status) VALUES (?, ?, ?)";
        String detailSql = "INSERT INTO OrderDetails (orderId, productId, quantity, unitPrice) VALUES (?, ?, ?, ?)";

        try {
            // Insert order
            PreparedStatement orderSt = connection.prepareStatement(orderSql, PreparedStatement.RETURN_GENERATED_KEYS);
            orderSt.setInt(1, order.getUserId());
            orderSt.setDouble(2, order.getTotalAmount());
            orderSt.setString(3, order.getStatus());
            orderSt.executeUpdate();

            ResultSet rs = orderSt.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // Insert order details
            PreparedStatement detailSt = connection.prepareStatement(detailSql);
            ProductDAO productDAO = new ProductDAO();
            for (Cart item : cartItems) {
                Product product = productDAO.getProductById(item.getProductId());
                detailSt.setInt(1, orderId);
                detailSt.setInt(2, item.getProductId());
                detailSt.setInt(3, item.getQuantity());
                detailSt.setDouble(4, product.getPrice());
                detailSt.executeUpdate();
            }

            // Clear cart
            new CartDAO().clearCart(order.getUserId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
