bool isNameValid(String name) {
  return RegExp(r'^[a-zA-Z]{3,15}$').hasMatch(name);
}
