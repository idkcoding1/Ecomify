import 'package:flutter/foundation.dart';
import 'package:project/product_page.dart';

class Cart with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items => _items;

  void addToCart(Product product) {
    bool found = false;
    for (var item in _items) {
      if (item.id == product.id) {
        item.quantity++;
        found = true;
        break;
      }
    }
    if (!found) {
      _items.add(product);
    }
    notifyListeners();
  }

  void incrementItem(Product product) {
    product.quantity++;
    notifyListeners();
  }

  void decrementItem(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      _items.removeWhere((item) => item.id == product.id);
    }
    notifyListeners();
  }

  double calculateTotal() {
    return _items.fold(
        0, (total, current) => total + current.price * current.quantity);
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
