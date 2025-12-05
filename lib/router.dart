import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'products_screen.dart';
import 'cart_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final router = GoRouter(
    initialLocation: "/products",
    routes: [
      GoRoute(
        path: "/products",
        builder: (context, state) {
          return ProductsScreen();
        },
      ),
      GoRoute(
        path: "/cart",
        builder: (context, state) {
          return CartScreen();
        } ,
      ),
    ],
  );

  ref.onDispose(router.dispose);

  return router;
}

