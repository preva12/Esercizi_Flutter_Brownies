import 'package:flutter/material.dart';


void main() {
  runApp(const MiaApp());
}

// final perchè quella variabile non puo essere piu modificata
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

// contatti
final List<Contatto> listaContatti = [
  Contatto(nome: "Marco", cognome: "Rossi", numero: ["123456789"]),
  Contatto(nome: "Sergio", cognome: "Gialli", numero:  ["123456789", "111111111"]),
];

// APP
class MiaApp extends StatelessWidget {
  const MiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaHome(),
    );
  }
}

// schermata principale
class PaginaHome extends StatelessWidget {
  const PaginaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rubrica")),
      body: ListView.builder(
        itemCount: listaContatti.length,
        itemBuilder: (context, index) {
          final contatto = listaContatti[index];

          return ListTile(
            title: Text("${contatto.nome} ${contatto.cognome}"),
            subtitle: Text(
              contatto.numero.isNotEmpty
                  ? contatto.numero.first
                  : "Nessun numero",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:(e) => PaginaDettaglio(contatto: contatto),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// pagina di contatto
class PaginaDettaglio extends StatelessWidget {
  final Contatto contatto;

  const PaginaDettaglio({super.key, required this.contatto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${contatto.nome} ${contatto.cognome}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Numeri di telefono:", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            ...contatto.numero.map((numero) => Text(numero)),
          ],
        ),
      ),
    );
  }
}