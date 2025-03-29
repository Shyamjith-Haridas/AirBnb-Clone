class AppFunctions {
  // Otp Function
  // The function works by fetching the current date and time, extracting the day, month, and year
  //using the substring and padLeft methods, and returning an OTP-like format (e.g., 090225)
  static String generateOtpFunction() {
    DateTime currentDateTime = DateTime.now();
    String date = currentDateTime.day.toString().padLeft(2, '0');
    String month = currentDateTime.month.toString().padLeft(2, '0');
    String year = currentDateTime.year.toString().substring(2, 4);
    return '$date$month$year';
  }
}
