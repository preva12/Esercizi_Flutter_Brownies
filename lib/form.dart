import 'package:flutter/material.dart';

class FinestraAggiungiCompito extends StatefulWidget {
  const FinestraAggiungiCompito({super.key});

  @override
  State<FinestraAggiungiCompito> createState() =>
      _FinestraAggiungiCompito();
}

class _FinestraAggiungiCompito extends State<FinestraAggiungiCompito> {
  final controllerTesto = TextEditingController();

  @override
  Widget build(BuildContext context) { 
    return AlertDialog(
      title: const Text('Aggiungi un nuovo compito...'),
      content: TextField(
        controller: controllerTesto, // collega il controller al campo di testo
        decoration: const InputDecoration(labelText: 'Nome del compito...'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annulla...'),
        ),
        ElevatedButton( //chiude e 
          onPressed: () => Navigator.pop(context, controllerTesto.text),
          child: const Text('Aggiungi...'),
        ),
      ],
    );
  }
}
