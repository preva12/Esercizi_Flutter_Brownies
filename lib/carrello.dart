import 'products.dart';

class ItemCart {
  final Products product;
  int quantity;

  ItemCart({
    required this.product, 
    this.quantity = 1
    });
}