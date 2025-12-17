import 'package:go_router/go_router.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";
import 'home.dart';
import 'custom_page.dart';

part 'router.g.dart';

@riverpod
 GoRouter router(Ref ref) {
  final router = GoRouter(initialLocation: '/',
  routes: [
    GoRoute(path: '/',
    builder: (context, state) {
      return const Home();
    }),
     GoRoute(
        path: "/Personalizza",
        builder: (context, state) {
          return const CustomPage();
        },
      )
  ])
  ;
  return router;
}
