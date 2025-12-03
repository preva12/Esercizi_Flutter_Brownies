import 'prodotti.dart';

class ItemCarrello {
  final Prodotti prodotto;
  int quantita;

  ItemCarrello({
    required this.prodotto, 
    this.quantita = 1
    });
}