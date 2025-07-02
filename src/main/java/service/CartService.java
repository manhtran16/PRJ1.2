package service;

import repository.OrderDAO;
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

    private OrderDAO orderDAO;
    private ProductService productService;

    public CartService() {
        this.orderDAO = new OrderDAO();
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
        OrderTable cart = orderDAO.getCartByUserId(user.getUserID());

        if (cart == null) {
            // Create new cart
            cart = new OrderTable();
            cart.setUser(user);
            cart.setOrderDate(new Date(System.currentTimeMillis()));
            cart.setStatus(0); // 0 = Cart status (giỏ hàng)

            cart = orderDAO.createOrder(cart);

            // Check if cart creation failed
            if (cart == null) {
                throw new RuntimeException("Failed to create cart for user: " + user.getUserID());
            }
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
            // Validate variant exists
            ProductVariant variant = productService.getVariantWithDetails(variantId);
            if (variant == null) {
                System.err.println("Product variant not found for ID: " + variantId);
                throw new IllegalArgumentException("Product variant not found");
            }

            OrderTable cart = getOrCreateCart(user);

            // Check if item already exists in cart
            OrderDetail existingItem = orderDAO.getCartItem(cart.getOrderID(), variantId);

            if (existingItem != null) {
                // Update quantity
                int newQuantity = existingItem.getOrderQuantity() + quantity;
                return orderDAO.updateCartItemQuantity(cart.getOrderID(), variantId, newQuantity);
            } else {
                // Add new item - don't set the detached variant object
                OrderDetail newItem = new OrderDetail();
                newItem.setOrder(cart);
                // Don't set variant object directly to avoid detached entity issue
                // newItem.setVariant(variant);
                newItem.setOrderQuantity(quantity);

                // Set composite key with variant ID
                OrderDetailKey key = new OrderDetailKey(cart.getOrderID(), variantId);
                newItem.setId(key);

                boolean result = orderDAO.createOrderDetail(newItem);
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
            System.err.println("Invalid parameters - user: " + user + ", variantId: " + variantId);
            return false;
        }

        System.out.println("=== CART SERVICE UPDATE DEBUG ===");
        System.out.println("User ID: " + user.getUserID());
        System.out.println("Variant ID: " + variantId);
        System.out.println("New Quantity: " + newQuantity);

        try {
            OrderTable cart = getOrCreateCart(user);
            System.out.println("Cart ID: " + cart.getOrderID());

            if (newQuantity <= 0) {
                // Remove item
                System.out.println("Quantity <= 0, removing item");
                return orderDAO.removeCartItem(cart.getOrderID(), variantId);
            } else {
                // Update quantity
                System.out.println("Updating quantity to: " + newQuantity);
                boolean result = orderDAO.updateCartItemQuantity(cart.getOrderID(), variantId, newQuantity);
                System.out.println("DAO update result: " + result);
                return result;
            }

        } catch (Exception e) {
            System.err.println("Error updating cart item: " + e.getMessage());
            e.printStackTrace();
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

            boolean result = orderDAO.removeCartItem(cart.getOrderID(), variantId);

            return result;

        } catch (Exception e) {
            System.err.println("Error removing from cart: " + e.getMessage());
            e.printStackTrace();
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
            System.out.println("=== getCartItems DEBUG ===");
            System.out.println("Getting cart items for user: " + user.getUserID());

            OrderTable cart = getOrCreateCart(user);

            if (cart == null) {
                System.err.println("Cart is null for user: " + user.getUserID());
                return new ArrayList<>();
            }

            System.out.println("Cart ID: " + cart.getOrderID());

            List<OrderDetail> items = orderDAO.getOrderDetailsByOrderId(cart.getOrderID());

            if (items == null) {
                items = new ArrayList<>();
            }

            System.out.println("Found " + items.size() + " items");

            for (OrderDetail item : items) {
                System.out.println("Item - VariantID: " + item.getVariant().getVariantID() +
                        ", Quantity: " + item.getOrderQuantity());
            }

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

            if (cart == null) {
                System.err.println("Cart is null for user: " + user.getUserID());
                return 0.0;
            }

            return orderDAO.getOrderTotal(cart.getOrderID());

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

            // Update cart status from 0 (giỏ hàng) to 1 (đã thanh toán)
            boolean updated = orderDAO.updateOrderStatus(cart.getOrderID(), 1);

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
     * Checkout only selected items from cart
     */
    public OrderTable checkoutSelectedItems(User user, Integer[] selectedVariantIds) {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        if (selectedVariantIds == null || selectedVariantIds.length == 0) {
            throw new IllegalArgumentException("Selected variant IDs cannot be null or empty");
        }

        try {
            OrderTable cart = getOrCreateCart(user);
            List<OrderDetail> cartItems = getCartItems(user);

            if (cartItems.isEmpty()) {
                throw new IllegalArgumentException("Cart is empty");
            }

            // Filter cart items to only include selected variants
            List<OrderDetail> selectedItems = new ArrayList<>();
            for (OrderDetail item : cartItems) {
                for (Integer variantId : selectedVariantIds) {
                    if (item.getVariant().getVariantID() == variantId.intValue()) {
                        selectedItems.add(item);
                        break;
                    }
                }
            }

            if (selectedItems.isEmpty()) {
                throw new IllegalArgumentException("No selected items found in cart");
            }

            // Create a new order for selected items
            OrderTable newOrder = new OrderTable();
            newOrder.setUser(user);
            newOrder.setOrderDate(new Date(System.currentTimeMillis()));
            newOrder.setStatus(1); // Confirmed order

            // Save the new order and get the created order with ID
            OrderTable savedOrder = orderDAO.createOrder(newOrder);
            if (savedOrder == null) {
                throw new RuntimeException("Failed to create new order");
            }

            // Move selected items to the new order
            for (OrderDetail selectedItem : selectedItems) {
                // Create new order detail for the new order
                OrderDetail newDetail = new OrderDetail();
                OrderDetailKey newKey = new OrderDetailKey();
                newKey.setOrderId(savedOrder.getOrderID());
                newKey.setVariantId(selectedItem.getVariant().getVariantID());

                newDetail.setId(newKey);
                newDetail.setOrder(savedOrder);
                newDetail.setVariant(selectedItem.getVariant());
                newDetail.setOrderQuantity(selectedItem.getOrderQuantity());

                // Add to new order
                boolean detailAdded = orderDAO.createOrderDetail(newDetail);
                if (!detailAdded) {
                    throw new RuntimeException(
                            "Failed to add order detail for variant " + selectedItem.getVariant().getVariantID());
                }

                // Remove from cart
                OrderDetailKey cartKey = selectedItem.getId();
                boolean removedFromCart = orderDAO.removeCartItem(cartKey.getOrderId(), cartKey.getVariantId());
                if (!removedFromCart) {
                    System.err.println("Warning: Failed to remove item from cart for variant "
                            + selectedItem.getVariant().getVariantID());
                }
            }

            return newOrder;

        } catch (Exception e) {
            throw new RuntimeException("Selected checkout failed: " + e.getMessage(), e);
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
            return orderDAO.clearCart(cart.getOrderID());

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
            return orderDAO.getCartByUserId(user.getUserID());
        } catch (Exception e) {
            System.err.println("Error getting user cart: " + e.getMessage());
            return null;
        }
    }

    /**
     * Close resources
     */
    public void close() {
        if (orderDAO != null) {
            orderDAO.close();
        }
        if (productService != null) {
            productService.close();
        }
    }
}
