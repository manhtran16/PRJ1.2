package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

/**
 * Utility class for password hashing and verification
 */
public class PasswordUtils {

    private static final String SALT_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final int SALT_LENGTH = 16;

    /**
     * Generate a random salt
     */
    public static String generateSalt() {
        SecureRandom random = new SecureRandom();
        StringBuilder salt = new StringBuilder(SALT_LENGTH);

        for (int i = 0; i < SALT_LENGTH; i++) {
            int randomIndex = random.nextInt(SALT_CHARS.length());
            salt.append(SALT_CHARS.charAt(randomIndex));
        }

        return salt.toString();
    }

    /**
     * Hash password with salt using SHA-256
     */
    public static String hashPassword(String password, String salt) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(salt.getBytes());
            byte[] hashedPassword = md.digest(password.getBytes());

            return Base64.getEncoder().encodeToString(hashedPassword);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }

    /**
     * Hash password with auto-generated salt
     */
    public static String hashPassword(String password) {
        String salt = generateSalt();
        String hashedPassword = hashPassword(password, salt);
        return salt + ":" + hashedPassword;
    }

    /**
     * Verify password against stored hash
     */
    public static boolean verifyPassword(String password, String storedHash) {
        if (storedHash == null || !storedHash.contains(":")) {
            // For backward compatibility with plain text passwords
            return password.equals(storedHash);
        }

        String[] parts = storedHash.split(":", 2);
        String salt = parts[0];
        String hash = parts[1];

        String hashedInput = hashPassword(password, salt);
        return hashedInput.equals(hash);
    }

    /**
     * Check if password meets minimum requirements
     */
    public static boolean isValidPassword(String password) {
        if (password == null || password.length() < 6) {
            return false;
        }

        // Add more validation rules as needed
        // e.g., require uppercase, lowercase, numbers, special characters

        return true;
    }
}
