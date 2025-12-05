import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'carrello_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.watch(cartProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("Carrello")),
      body: cart.isEmpty
          ? const Center(
              child: Text(
                "Il carrello è vuoto",
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                for (var item in cart)
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.product.name),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => cartNotifier.decrementItem(item),
                            ),
                            Text('${item.quantity}'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => cartNotifier.incrementItem(item),
                            ),
                          ],
                        ),
                      ],
                    ),
                    subtitle: Text("${item.product.price} €"),
                  ),
                const SizedBox(height: 20),
                Text(
                  "Totale: ${cartNotifier.totalPrice()} €",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
    );
  }
}
