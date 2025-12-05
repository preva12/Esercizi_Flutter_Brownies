import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'products.dart';
import 'carrello.dart';

class CartNotifier extends Notifier<List<ItemCart>> {
  @override
  List<ItemCart> build() {
    return []; 
  }

  void incrementItem(ItemCart item){
    item.quantity = item.quantity + 1;
    ref.notifyListeners();
  }

  void decrementItem(ItemCart item){
    item.quantity = item.quantity - 1;
    if (item.quantity <= 0){
      state.remove(item);
    }
    ref.notifyListeners();
  }

 void addItem(Products product) { 
    bool find = false; //lo utilizzo per controllare se quel id è gia presente (come lista di visualizzazione), se presente aggiungo altrimenti inserisco nuovo elemento

    for (var item in state) {
      if (item.product.id == product.id) {
        item.quantity = item.quantity + 1;
        find = true;
      }
    }
    if (!find) {
      state.add(ItemCart(product: product));
    }
    ref.notifyListeners();
  }

  int totalPrice() {
    int total = 0;
    for (var item in state) {
      total = total + item.product.price * item.quantity;
    }
    return total;
  }

  int totalItems() {
    int total = 0;
    for (var item in state) {
      total = total + item.quantity;
    }
    return total;
  }
}

final cartProvider = NotifierProvider<CartNotifier, List<ItemCart>>(CartNotifier.new); //espone la variabile a tutta l'appil suo stato si può vedere con l'inconcina 1 o più
