/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hiepn
 */
public class CartDAO extends DBContext {
    public void addToCart(Cart cart) {
        String sql = "MERGE INTO Cart AS target " +
                     "USING (SELECT ? AS userId, ? AS productId, ? AS quantity) AS source " +
                     "ON target.userId = source.userId AND target.productId = source.productId " +
                     "WHEN MATCHED THEN " +
                     "    UPDATE SET quantity = target.quantity + source.quantity " +
                     "WHEN NOT MATCHED THEN " +
                     "    INSERT (userId, productId, quantity) VALUES (source.userId, source.productId, source.quantity);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cart.getUserId());
            st.setInt(2, cart.getProductId());
            st.setInt(3, cart.getQuantity());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Cart> getCartItems(int userId) {
        List<Cart> cartItems = new ArrayList<>();
        String sql = "SELECT * FROM Cart WHERE userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                cartItems.add(new Cart(
                    rs.getInt("cartId"),
                    rs.getInt("userId"),
                    rs.getInt("productId"),
                    rs.getInt("quantity")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    public void clearCart(int userId) {
        String sql = "DELETE FROM Cart WHERE userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
