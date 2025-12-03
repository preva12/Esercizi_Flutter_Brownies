import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'carrello_provider.dart';
import 'prodotti.dart';

class ProductsScreen extends ConsumerWidget {
   ProductsScreen({super.key});

  final List<Prodotti> products = [
    Prodotti(id: '1', nome: 'Vestito lungo', prezzo: 20),
    Prodotti(id: '2', nome: 'Camicia bianca', prezzo: 30),
    Prodotti(id: '3', nome: 'Scarpe', prezzo: 50),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    int totaleArticoli = 0;
    for (var item in cart) {
      totaleArticoli = totaleArticoli + item.quantita;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Prodotti"),
        actions: [
          IconButton(
            onPressed: () => context.push("/carrello"),
              icon: Row(
              children: [
                const Icon(Icons.shopping_cart),
                if (totaleArticoli > 0)
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      '$totaleArticoli',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.from(alpha: 1, red: 0.361, green: 0.212, blue: 0.957),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          for (var prodotto in products)
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(prodotto.nome),
                  ElevatedButton(
                    onPressed: () => ref.read(cartProvider.notifier).addItem(prodotto),
                    child: const Text("Aggiungi"),
                  ),
                ],
              ),
                subtitle: Text("${prodotto.prezzo} €"),
            ),
        ],
      ),
    );
  }
}
