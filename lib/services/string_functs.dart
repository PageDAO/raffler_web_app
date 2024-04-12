String formatAddress(String input) {
  if (input.length < 8) {
    return input;
  }
  String first3 = input.substring(0, 3);
  String last5 = input.substring(input.length - 5);
  return '$first3...$last5';
}
