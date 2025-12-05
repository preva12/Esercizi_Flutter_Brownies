import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'carrello_provider.dart';
import 'products.dart';

class ProductsScreen extends ConsumerWidget {
   ProductsScreen({super.key});

  final List<Products> products = [
    Products(id: '1', name: 'Vestito lungo', price: 20),
    Products(id: '2', name: 'Camicia bianca', price: 30),
    Products(id: '3', name: 'Scarpe', price: 50),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    int totalItem = 0;
    for (var item in cart) {
      totalItem = totalItem + item.quantity;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Prodotti"),
        actions: [
          IconButton(
            onPressed: () => context.push("/cart"),
              icon: Row(
              children: [
                const Icon(Icons.shopping_cart),
                if (totalItem > 0)
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      '$totalItem',
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
          for (var product in products)
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.name),
                  ElevatedButton(
                    onPressed: () => ref.read(cartProvider.notifier).addItem(product),
                    child: const Text("Aggiungi"),
                  ),
                ],
              ),
                subtitle: Text("${product.price} €"),
            ),
        ],
      ),
    );
  }
}
