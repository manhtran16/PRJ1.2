package service;

import repository.OrderDao;
import model.OrderTable;
import model.OrderDetail;
import model.OrderDetailKey;
import model.ProductVariant;
import model.User;
import java.sql.Date;
import java.util.List;
import java.util.ArrayList;

/**
 * Cart Service - manages cart using OrderTable as temporary cart
 * Cart is represented as OrderTable with status = 0 (temporary/cart status)
 */
public class CartService {

    private OrderDao orderDao;
    private ProductService productService;

    public CartService() {
        this.orderDao = new OrderDao();
        this.productService = new ProductService();
    }

    /**
     * Get or create cart for user
     * Cart is an OrderTable with status = 0
     */
    public OrderTable getOrCreateCart(User user) {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }

        // Try to find existing cart (order with status = 0)
        OrderTable cart = orderDao.getCartByUserId(user.getUserID());
        System.out.println(
                "Existing cart for user " + user.getUserID() + ": " + (cart != null ? cart.getOrderID() : "null"));

        if (cart == null) {
            // Create new cart
            System.out.println("Creating new cart for user: " + user.getUserID());
            cart = new OrderTable();
            cart.setUser(user);
            cart.setOrderDate(new Date(System.currentTimeMillis()));
            cart.setStatus(0); // 0 = Cart status (temporary)

            cart = orderDao.createOrder(cart);
            System.out.println("New cart created with ID: " + (cart != null ? cart.getOrderID() : "null"));
        }

        return cart;
    }

    /**
     * Add item to cart
     */
    public boolean addToCart(User user, int variantId, int quantity) {
        if (user == null || variantId <= 0 || quantity <= 0) {
            System.err.println("AddToCart failed: Invalid parameters - user: " + user + ", variantId: " + variantId
                    + ", quantity: " + quantity);
            return false;
        }

        try {
            System.out.println("Adding to cart - User: " + user.getUserID() + ", Variant: " + variantId + ", Quantity: "
                    + quantity);

            // Validate variant exists
            ProductVariant variant = productService.getVariantWithDetails(variantId);
            if (variant == null) {
                System.err.println("Product variant not found for ID: " + variantId);
                throw new IllegalArgumentException("Product variant not found");
            }
            System.out.println("Variant found: " + variant.getVariantID());

            OrderTable cart = getOrCreateCart(user);
            System.out.println("Cart retrieved/created with ID: " + cart.getOrderID());

            // Check if item already exists in cart
            OrderDetail existingItem = orderDao.getCartItem(cart.getOrderID(), variantId);

            if (existingItem != null) {
                // Update quantity
                int newQuantity = existingItem.getOrderQuantity() + quantity;
                System.out.println("Updating existing item quantity to: " + newQuantity);
                return orderDao.updateCartItemQuantity(cart.getOrderID(), variantId, newQuantity);
            } else {
                // Add new item - don't set the detached variant object
                System.out.println("Adding new item to cart");
                OrderDetail newItem = new OrderDetail();
                newItem.setOrder(cart);
                // Don't set variant object directly to avoid detached entity issue
                // newItem.setVariant(variant);
                newItem.setOrderQuantity(quantity);

                // Set composite key with variant ID
                OrderDetailKey key = new OrderDetailKey(cart.getOrderID(), variantId);
                newItem.setId(key);

                boolean result = orderDao.createOrderDetail(newItem);
                System.out.println("Add new item result: " + result);
                return result;
            }

        } catch (Exception e) {
            System.err.println("Error adding to cart: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Update cart item quantity
     */
    public boolean updateCartItem(User user, int variantId, int newQuantity) {
        if (user == null || variantId <= 0) {
            return false;
        }

        try {
            OrderTable cart = getOrCreateCart(user);

            if (newQuantity <= 0) {
                // Remove item
                return orderDao.removeCartItem(cart.getOrderID(), variantId);
            } else {
                // Update quantity
                return orderDao.updateCartItemQuantity(cart.getOrderID(), variantId, newQuantity);
            }

        } catch (Exception e) {
            System.err.println("Error updating cart item: " + e.getMessage());
            return false;
        }
    }

    /**
     * Remove item from cart
     */
    public boolean removeFromCart(User user, int variantId) {
        if (user == null || variantId <= 0) {
            return false;
        }

        try {
            OrderTable cart = getOrCreateCart(user);
            return orderDao.removeCartItem(cart.getOrderID(), variantId);

        } catch (Exception e) {
            System.err.println("Error removing from cart: " + e.getMessage());
            return false;
        }
    }

    /**
     * Get cart items (OrderDetails with status = 0)
     */
    public List<OrderDetail> getCartItems(User user) {
        if (user == null) {
            return new ArrayList<>();
        }

        try {
            OrderTable cart = getOrCreateCart(user);
            List<OrderDetail> items = orderDao.getOrderDetailsByOrderId(cart.getOrderID());
            System.out.println("Cart items retrieved for user " + user.getUserID() + ": " + items.size() + " items");
            return items;

        } catch (Exception e) {
            System.err.println("Error getting cart items: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * Get cart total amount
     */
    public double getCartTotal(User user) {
        if (user == null) {
            return 0.0;
        }

        try {
            OrderTable cart = getOrCreateCart(user);
            return orderDao.getOrderTotal(cart.getOrderID());

        } catch (Exception e) {
            System.err.println("Error calculating cart total: " + e.getMessage());
            return 0.0;
        }
    }

    /**
     * Get cart items count
     */
    public int getCartItemsCount(User user) {
        if (user == null) {
            return 0;
        }

        List<OrderDetail> items = getCartItems(user);
        return items.stream().mapToInt(OrderDetail::getOrderQuantity).sum();
    }

    /**
     * Convert cart to order (checkout)
     */
    public OrderTable checkoutCart(User user) {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }

        try {
            OrderTable cart = getOrCreateCart(user);
            List<OrderDetail> cartItems = getCartItems(user);

            if (cartItems.isEmpty()) {
                throw new IllegalArgumentException("Cart is empty");
            }

            // Update cart status from 0 (cart) to 1 (pending order)
            boolean updated = orderDao.updateOrderStatus(cart.getOrderID(), 1);

            if (updated) {
                // Update order date to current time
                cart.setOrderDate(new Date(System.currentTimeMillis()));
                cart.setStatus(1);
                return cart;
            } else {
                throw new RuntimeException("Failed to checkout cart");
            }

        } catch (Exception e) {
            throw new RuntimeException("Checkout failed: " + e.getMessage(), e);
        }
    }

    /**
     * Clear cart (remove all items)
     */
    public boolean clearCart(User user) {
        if (user == null) {
            return false;
        }

        try {
            OrderTable cart = getOrCreateCart(user);
            return orderDao.clearCart(cart.getOrderID());

        } catch (Exception e) {
            System.err.println("Error clearing cart: " + e.getMessage());
            return false;
        }
    }

    /**
     * Get user cart (returns null if no cart exists)
     */
    public OrderTable getUserCart(User user) {
        if (user == null) {
            return null;
        }

        try {
            return orderDao.getCartByUserId(user.getUserID());
        } catch (Exception e) {
            System.err.println("Error getting user cart: " + e.getMessage());
            return null;
        }
    }

    /**
     * Close resources
     */
    public void close() {
        if (orderDao != null) {
            orderDao.close();
        }
        if (productService != null) {
            productService.close();
        }
    }
}
