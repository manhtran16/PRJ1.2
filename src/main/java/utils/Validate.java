package utils;

public class Validate {
	public static boolean checkPhoneNumber(String phoneNumber) {
		if (phoneNumber == null) {
			return false;
		}
		return phoneNumber.trim().matches("^\\+?1?[-.\\s]?\\(?\\d{3}\\)?[-.\\s]?\\d{3}[-.\\s]?\\d{4}$");
	}

	public static boolean checkInt(String intnumber) {
		try {
			Integer.parseInt(intnumber);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	public static boolean checkDouble(String doubleNumber) {
		try {
			Double.parseDouble(doubleNumber);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public static boolean checkInt(String[] strings) {
		if (strings == null) {
			return false;
		}
		for (String s : strings) {
			if (!checkInt(s)) {
				return false;
			}
		}
		return true;
	}

	public static boolean checkDouble(String[] doubleNumber) {
		for (String s : doubleNumber) {
			if (!checkDouble(s) && !s.isBlank()) {
				return false;
			}
		}
		return true;
	}

	public static boolean checkString(String input) {
		return input != null && !input.trim().isEmpty();
	}

	public static boolean checkUserName(String userName) {
		return userName != null && !userName.trim().isEmpty();
	}

	public static boolean checkName(String name) {
		return name != null && !name.trim().isEmpty();
	}

	public static boolean checkEmail(String email) {
		if (email == null)
			return false;
		return email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$");
	}

	public static boolean checkPhone(String phone) {
		if (phone == null)
			return false;
		return phone.matches("^[0-9]{10,}$");
	}

	public static boolean checkAddress(String address) {
		return address != null && !address.trim().isEmpty();
	}

	public static boolean checkPassword(String password) {
		return password != null && password.length() >= 6;
	}

	public static boolean checkConfirmPassword(String password, String confirmPassword) {
		return password != null && password.equals(confirmPassword);
	}
}