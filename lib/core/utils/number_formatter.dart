class NumberFormatter {
  static String formatNumber(num number) {
    String numberStr = number.toString();
    RegExp reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return numberStr.replaceAllMapped(reg, (match) => ',');
  }
}
