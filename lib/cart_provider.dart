import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assignment_task/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem(this.product, this.quantity);

  double get totalPrice => product.price * quantity;
}

class Cart extends StateNotifier<List<CartItem>> {
  Cart() : super([]);

  void addProduct(Product product) {
    state = [
      ...state,
      CartItem(product, 1),
    ];
  }

  void increaseQuantity(Product product) {
    state = [
      for (final item in state)
        if (item.product == product)
          CartItem(item.product, item.quantity + 1)
        else
          item,
    ];
  }

  void decreaseQuantity(Product product) {
    state = [
      for (final item in state)
        if (item.product == product && item.quantity > 1)
          CartItem(item.product, item.quantity - 1)
        else
          item,
    ];
  }

  double get totalPrice =>
      state.fold(0, (total, item) => total + item.totalPrice);
}

final cartProvider =
    StateNotifierProvider<Cart, List<CartItem>>((ref) => Cart());
