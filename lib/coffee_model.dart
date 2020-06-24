class Coffee {
  final String coffeeName;
  final String coffeeImage;
  final String coffeePrice;
  final String coffeesubText;

  Coffee(
      this.coffeeName, this.coffeeImage, this.coffeePrice, this.coffeesubText);
}

class CoffeeList {
  static List<Coffee> _coffeeList = [
    Coffee("Cappuccino", "images/coffee1.jpg", "150", "Latesso"),
    Coffee("Espresso", "images/coffee2.jpg", "200", "Latesso"),
    Coffee("Ristretto", "images/coffee3.jpg", "300", "Latesso"),
    Coffee("Americano", "images/coffee4.jpg", "350", "Latesso"),
    Coffee("Latte", "images/coffee5.jpg", "400", "Latesso")
  ];

  static List<Coffee> get coffeeList {
    return _coffeeList;
  }
}
