import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "/state/brightness_changer.dart";
import "/state/color_changer.dart";
import "router.dart";

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final color = ref.watch(colorChangerProvider);
    final brightness = ref.watch(brightnessProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: "ColorChange",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: color,
          brightness: brightness,
        ),
      ),
    );
  }
}
