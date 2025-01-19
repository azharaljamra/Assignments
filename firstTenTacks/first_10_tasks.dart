void main() {


  
}

//Question 1 Dynamic Calculator, By country
calculateTax(double price, {String? country = "USA"}) {
  double? taxAmount;
  switch (country) {
    case "USA":
      return taxAmount = price * 0.10;

    case "UK":
      return taxAmount = price * 0.20;

    default:
      return "Tax rate not available";
  }
}

//Question 2
void generateInvoice(
    {required String customerName,
    List<String>? items,
    required double total}) {
  total = (items == null) ? total : 0.0;

  print("Invoice for $customerName");
  if (items != null && items.isEmpty) {
    print("Items: ${items.join(',')} ");
  } else {
    print("No items provided. ");
  }

  print("Total: $total");
}

// Question 3
double calculateTripCost(
    {required double distance,
    required double fuleCostPerKm,
    double? additionalCosts}) {
  return (distance * fuleCostPerKm) + (additionalCosts ?? 0.0);
}

// Question 4

filterEvenScores(List<int> scores) {
  print(scores.where((x) => x.isEven));
}
// Question 5
List<String> mergeProductLists(List<String> nameProduct1, List<String> nameProduct2) {
nameProduct1.addAll(nameProduct2);
  return nameProduct1;
}
//  Question 6
Map<String, int> countWords(String sentence) {
  Map<String, int> wordCount = {};

  sentence.split(" ").forEach((word) {
    if (wordCount.containsKey(word)) {
      wordCount[word] = wordCount[word]! + 1;
    } else {
      wordCount[word] = 1;
    }
  });
  return wordCount;
}

//  Question 7
List<String> findTopStudent(Map<String, double> studentDegre) {
  return studentDegre.entries
      .where((entry) => entry.value > 80)
      .map((entry) => entry.key)
      .toList();
}
//  Question 8

Map<String, double> updatePrice(Map<String, double> productsCatalog) {
  productsCatalog.forEach((Product, price) {
    productsCatalog[Product] = price * 1.10;
  });
  return productsCatalog;
}
//  Question 9
String getConfigValue(Map<String, String> config, String key) {
  return config[key] ?? "Not Found";
}


//  Question 10

String submitFeedback({String? name, String? email, required String feedback}) {
  String Name = name ?? "Anonymous";
  String Email = email ?? "No Email";

  return "Name:$Name Email:$Email Feedback: $feedback ";
}
