package service;

import repository.OrderDAO;
import repository.ProductVariantDAO;
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
    private ProductVariantDAO productVariantDAO;

    public CartService() {
        this.orderDAO = new OrderDAO();
        this.productService = new ProductService();
        this.productVariantDAO = new ProductVariantDAO();
    }


    public OrderTable getOrCreateCart(User user) {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }

        OrderTable cart = orderDAO.getCartByUserId(user.getUserID());

        if (cart == null) {

            cart = new OrderTable();
            cart.setUser(user);
            cart.setOrderDate(new Date(System.currentTimeMillis()));
            cart.setStatus(0); 
            cart = orderDAO.createOrder(cart);

            if (cart == null) {
                throw new RuntimeException("Failed to create cart for user: " + user.getUserID());
            }
        }

        return cart;
    }


    public boolean addToCart(User user, int variantId, int quantity) {
        if (user == null || variantId <= 0 || quantity <= 0) {
            System.err.println("AddToCart failed: Invalid parameters - user: " + user + ", variantId: " + variantId
                    + ", quantity: " + quantity);
            return false;
        }

        try {
            ProductVariant variant = productService.getVariantWithDetails(variantId);
            if (variant == null) {
                System.err.println("Product variant not found for ID: " + variantId);
                throw new IllegalArgumentException("Product variant not found");
            }

            OrderTable cart = getOrCreateCart(user);
            OrderDetail existingItem = orderDAO.getCartItem(cart.getOrderID(), variantId);

            if (existingItem != null) {
                int newQuantity = existingItem.getOrderQuantity() + quantity;
                return orderDAO.updateCartItemQuantity(cart.getOrderID(), variantId, newQuantity);
            } else {
                OrderDetail newItem = new OrderDetail();
                newItem.setOrder(cart);
                newItem.setOrderQuantity(quantity);

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
                System.out.println("Quantity <= 0, removing item");
                return orderDAO.removeCartItem(cart.getOrderID(), variantId);
            } else {
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

    public int getCartItemsCount(User user) {
        if (user == null) {
            return 0;
        }

        List<OrderDetail> items = getCartItems(user);
        return items.stream().mapToInt(OrderDetail::getOrderQuantity).sum();
    }

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

            for (OrderDetail item : cartItems) {
                int variantId = item.getVariant().getVariantID();
                int orderQuantity = item.getOrderQuantity();

                boolean stockUpdated = productVariantDAO.updateStock(variantId, orderQuantity);
                if (!stockUpdated) {
                    throw new RuntimeException("Failed to update stock for variant " + variantId +
                            ". Insufficient stock or variant not found.");
                }
            }

            boolean updated = orderDAO.updateOrderStatus(cart.getOrderID(), 1);

            if (updated) {
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

    public OrderTable checkoutSelectedItems(User user, Integer[] selectedVariantIds) {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        if (selectedVariantIds == null || selectedVariantIds.length == 0) {
            throw new IllegalArgumentException("Selected variant IDs cannot be null or empty");
        }

        try {
            List<OrderDetail> cartItems = getCartItems(user);

            if (cartItems.isEmpty()) {
                throw new IllegalArgumentException("Cart is empty");
            }
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

            OrderTable newOrder = new OrderTable();
            newOrder.setUser(user);
            newOrder.setOrderDate(new Date(System.currentTimeMillis()));
            newOrder.setStatus(1); 
            OrderTable savedOrder = orderDAO.createOrder(newOrder);
            if (savedOrder == null) {
                throw new RuntimeException("Failed to create new order");
            }

            for (OrderDetail selectedItem : selectedItems) {
                int variantId = selectedItem.getVariant().getVariantID();
                int orderQuantity = selectedItem.getOrderQuantity();

                System.out.println("Processing variant ID: " + variantId);
                System.out.println("Order quantity: " + orderQuantity);
                System.out.println("Current stock before update: " + selectedItem.getVariant().getQuantity());

                boolean stockUpdated = productVariantDAO.updateStock(variantId, orderQuantity);
                System.out.println("Stock update result: " + stockUpdated);

                if (!stockUpdated) {
                    throw new RuntimeException("Failed to update stock for variant " + variantId +
                            ". Insufficient stock or variant not found.");
                }

                OrderDetail newDetail = new OrderDetail();
                OrderDetailKey newKey = new OrderDetailKey();
                newKey.setOrderId(savedOrder.getOrderID());
                newKey.setVariantId(variantId);

                newDetail.setId(newKey);
                newDetail.setOrder(savedOrder);
                newDetail.setVariant(selectedItem.getVariant());
                newDetail.setOrderQuantity(orderQuantity);

                boolean detailAdded = orderDAO.createOrderDetail(newDetail);
                if (!detailAdded) {
                    throw new RuntimeException(
                            "Failed to add order detail for variant " + variantId);
                }

                OrderDetailKey cartKey = selectedItem.getId();
                boolean removedFromCart = orderDAO.removeCartItem(cartKey.getOrderId(), cartKey.getVariantId());
                if (!removedFromCart) {
                    System.err.println("Warning: Failed to remove item from cart for variant " + variantId);
                }
            }

            return newOrder;

        } catch (Exception e) {
            throw new RuntimeException("Selected checkout failed: " + e.getMessage(), e);
        }
    }


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

    public void close() {
        if (orderDAO != null) {
            orderDAO.close();
        }
        if (productService != null) {
            productService.close();
        }
        if (productVariantDAO != null) {
            productVariantDAO.close();
        }
    }
}
