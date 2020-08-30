class ValidatorHelper {
  static Function emailValidator = (String value) {
    if (value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  };

  static Function passwordValidator = (String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 5 || value.length > 20) {
      return 'Password must be between 5 and 20 characters';
    }
    return null;
  };
}