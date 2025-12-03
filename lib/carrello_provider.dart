import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'prodotti.dart';
import 'carrello.dart';

class CartNotifier extends Notifier<List<ItemCarrello>> {
  @override
  List<ItemCarrello> build() {
    return []; 
  }

  void incrementItem(ItemCarrello item){
    item.quantita = item.quantita + 1;
    ref.notifyListeners();
  }

  void decrementItem(ItemCarrello item){
    item.quantita = item.quantita - 1;
    if (item.quantita <= 0){
      state.remove(item);
    }
    ref.notifyListeners();
  }

 void addItem(Prodotti prodotto) { 
    bool trovato = false; //lo utilizzo per controllare se quel id è gia presente (come lista di visualizzazione), se presente aggiungo altrimenti inserisco nuovo elemento

    for (var item in state) {
      if (item.prodotto.id == prodotto.id) {
        item.quantita = item.quantita + 1;
        trovato = true;
      }
    }
    if (!trovato) {
      state.add(ItemCarrello(prodotto: prodotto));
    }
    ref.notifyListeners();
  }

  int totalPrice() {
    int totale = 0;
    for (var item in state) {
      totale = totale + item.prodotto.prezzo * item.quantita;
    }
    return totale;
  }

  int totalItems() {
    int totale = 0;
    for (var item in state) {
      totale = totale + item.quantita;
    }
    return totale;
  }
}

final cartProvider = NotifierProvider<CartNotifier, List<ItemCarrello>>(CartNotifier.new); //espone la variabile a tutta l'appil suo stato si può vedere con l'inconcina 1 o più
