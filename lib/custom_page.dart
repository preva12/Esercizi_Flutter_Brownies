import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "state/brightness_changer.dart";
import "state/color_changer.dart";

class CustomPage extends ConsumerStatefulWidget {
  const CustomPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomPageState();
}

class _CustomPageState extends ConsumerState<CustomPage> {
  @override
  Widget build(BuildContext context) {
    final brightness = ref.watch(brightnessProvider);
     final selectedColor = ref.watch(colorChangerProvider); 
     final colorNotifier = ref.read(colorChangerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Personalizza"),
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 40),
        child: Column(
          spacing: 12,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Cambia tema",
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: brightness == Brightness.dark,
                  onChanged: (value) {
                    ref.read(brightnessProvider.notifier).toggle(value: value);
                  },
                ),
              ],
            ),

            const SizedBox(height: 10),
            const Text("Cambia colore", style: TextStyle(fontSize: 18),),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RadioListTile<Color>(
              title: const Text("Viola"),
              value: Colors.purple,
              groupValue: selectedColor, //deprecato pero funziona lo stesso, versione precedente
              onChanged: (Color? value) {
                if (value != null) colorNotifier.purple();
              },
            ),
              RadioListTile<Color>(
              title: const Text("Giallo"),
              value: Colors.yellow,
              groupValue: selectedColor,
              onChanged: (Color? value) {
                if (value != null) colorNotifier.yellow();
              },
            ),  
              RadioListTile<Color>(
              title: const Text("Blu"),
              value: Colors.blue,
              groupValue: selectedColor,
              onChanged: (Color? value) {
                if (value != null) colorNotifier.blue();
              },
            ),
              ],
            ),
            const SizedBox(height: 4),
            ElevatedButton.icon( 
              onPressed: () {
                ref.read(colorChangerProvider.notifier).randomize();
              },
              label: const Text("Colore Random"),
            ),
          ],
        ),
      ),
    );
  }
}
