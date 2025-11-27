import 'package:flutter/material.dart';

void main() {
  runApp(const MiaApp());
}

// Modello contatto
class Contatto {
  final String nome;
  final String cognome;
  final List<String> numero;

  Contatto({
    required this.nome,
    required this.cognome,
    required this.numero,
  });
}

// Lista contatti
final List<Contatto> listaContatti = [
  Contatto(nome: "Marco", cognome: "Rossi", numero: ["123456789"]),
  Contatto(nome: "Sergio", cognome: "Gialli", numero: ["123456789", "111111111"]),
];

// App principale
class MiaApp extends StatelessWidget {
  const MiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PaginaHome(),
    );
  }
}

// Schermata principale
class PaginaHome extends StatelessWidget {
  const PaginaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rubrica")),
      body: ListView(
        children: listaContatti.map((contatto) {
          return ListTile(
            title: Text("${contatto.nome} ${contatto.cognome}"),
           
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaginaDettaglio(contatto: contatto),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

// Pagina di dettaglio contatto
class PaginaDettaglio extends StatelessWidget {
  final Contatto contatto;

  const PaginaDettaglio({super.key, required this.contatto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${contatto.nome} ${contatto.cognome}")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Numeri di telefono:", style: TextStyle(fontSize: 15)),
            const SizedBox(height: 10),
            ...contatto.numero.map((numero) => Text(numero)),
          ],
        ),
      ),
    );
  }
}
