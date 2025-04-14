import 'package:flutter/material.dart';
import 'package:proj/models/food.dart';

class Shop extends ChangeNotifier {
  //foodmenu
  final List<Food> _foodMenu = [
    Food(
      name: "Salmon Sushi",
      price: '21.0',
      imagePath: 'assets/images/sushi_caviar.png',
      rating: '4.9',
    ),
    Food(
      name: 'Tuna',
      price: '23.00',
      imagePath: 'assets/images/sushi_belt.png',
      rating: '4.3',
    ),
    Food(
      name: 'Temaki',
      price: '26.00',
      imagePath: 'assets/images/temaki.png',
      rating: '5.0',
    ),
  ];

  //customer cart
  List<Food> _cart = [];

  //getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;
  

  //add to cart function
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart function
  void removeFromCart(Food foodItem) {
    _cart.remove(foodItem);
    notifyListeners();
  }
}
