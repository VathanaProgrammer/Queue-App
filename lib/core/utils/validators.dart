class Validators {
  static String? email(String value) {
    if (value.isEmpty) {
      return "Email is required";
    }

    if (!value.contains("@")) {
      return "Invalid email format";
    }

    return null;
  }

  static String? password(String value) {
    if (value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 6) {
      return "Password too short";
    }

    return null;
  }
}