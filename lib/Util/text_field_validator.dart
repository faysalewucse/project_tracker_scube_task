class TextFieldValidator {
  String? simpleValidator({value, errorMessage}) {
    if (value == null || value == "") {
      return errorMessage;
    }
    return null;
  }

  String? passwordValidator(value) {
    if (value == null || value == "") {
      return "Password should not be empty";
    } else if (value.length < 6) {
      return "Password should have minimum 6 characters";
    }
    return null;
  }

  String? confirmPasswordValidator(value, password) {
    if (value == null || value == "") {
      return "Confirm password should not be empty";
    } else if (value.length < 6) {
      return "Confirm password should have minimum 6 characters";
    } else if (value != password) {
      return "Password did not match";
    }
    return null;
  }
}
