void main() {
  List<double> itemPrices = [15.0, 5.0, 25.0, 7.0, 30.0];

  // Filter items with price below $10
  var filteredPrices = itemPrices.where((price) => price >= 10).toList();

  // Calculate total price with optional tax
  double total = calculateTotal(filteredPrices, tax: 0.08); // 8% tax

  // Apply a discount
  double finalPriceAfterDiscount =
      applyDiscount(filteredPrices, (price) => price * 0.9);

  // Calculate special discount using factorial
  double specialDiscount = calculateFactorialDiscount(filteredPrices.length);
  finalPriceAfterDiscount -=
      (finalPriceAfterDiscount * (specialDiscount / 100));

  // Print results
  print("Filtered Prices: $filteredPrices");
  print("Total Price (with tax): \$${total.toStringAsFixed(2)}");
  print(
      "Final Price after Discount and Special Discount: \$${finalPriceAfterDiscount.toStringAsFixed(2)}");
}

// Function to calculate the total price with optional tax
double calculateTotal(List<double> prices, {double tax = 0.0}) {
  double total = prices.reduce((a, b) => a + b);
  return total + (total * tax);
}

// Higher-order function to apply a discount
double applyDiscount(
    List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).reduce((a, b) => a + b);
}

// Recursive function to calculate factorial discount
double calculateFactorialDiscount(int n) {
  if (n <= 1) {
    return 1;
  } else {
    return n * calculateFactorialDiscount(n - 1);
  }
}
