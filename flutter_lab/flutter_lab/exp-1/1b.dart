void main() {
  print("Hello, Dart!"); // Printing Output

  // Basic Operations
  int num1 = 10;
  int num2 = 5;
  int sum = num1 + num2;
  int difference = num1 - num2;
  int product = num1 * num2;
  double quotient = num1 / num2;

  print("Sum: $sum");
  print("Difference: $difference");
  print("Product: $product");
  print("Quotient: $quotient");

  // Control Flow (Conditional Statements)
  String name = "Alice"; // define name
  int age = 20;          // define age

  if (age >= 18) {
    print("$name is an adult.");
  } else {
    print("$name is a minor.");
  }

  // Loops
  for (int i = 1; i <= 5; i++) {
    print("Count: $i");
  }

  // Functions
  greet("Bob");
}

// A simple function that takes a name as an argument and prints a greeting.
void greet(String personName) {
  print("Greetings, $personName!");
}
