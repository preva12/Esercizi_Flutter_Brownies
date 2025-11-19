import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MiaApp());
}

class MiaApp extends StatelessWidget {
  const MiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaRicetteScreen(),
    );
  }
}

//come è formata una ricetta
class Ricetta {
  final String titolo;
  final List<String> ingredienti;
  final List<String> passaggi;
  final String link;

  Ricetta({
    required this.titolo,
    required this.ingredienti,
    required this.passaggi,
    required this.link,
  });
}

//home page
class ListaRicetteScreen extends StatelessWidget {
  ListaRicetteScreen({super.key});

  final List<Ricetta> ricette = [
    Ricetta(
      titolo: "Pasta al Pomodoro",
      ingredienti: ["Pasta", "Pomodoro", "Sale", "Olio"],
      passaggi: [
        "1-Mettere a bollire l'acqua",
        "2-Cuocere la pasta",
        "3-Aggiungere il sugo"
      ],
      link: "https://ricette.giallozafferano.it/Spaghetti-al-pomodoro.html",
    ),
    Ricetta(
      titolo: "Tiramisù",
      ingredienti: ["Savoiardi", "Mascarpone", "Caffè", "Cacao"],
      passaggi: [
        "1-Preparare il caffè",
        "2-Montare mascarpone e uova",
        "3-Assemblare a strati"
      ],
      link: "https://ricette.giallozafferano.it/Tiramisu.html",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Libro di Ricette")),
      body: ListView.builder(
        itemCount: ricette.length,
        itemBuilder: (context, index) {
          final ricetta = ricette[index];

          return ListTile(
            title: Text(ricetta.titolo),
            trailing: IconButton(
              icon: const Icon(Icons.link),
              onPressed: () {
                launchUrl(Uri.parse(ricetta.link)); //link diretto
              },
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => DettaglioRicetta(ricetta: ricetta),
              );
            },
          );
        },
      ),
    );
  }
}


class DettaglioRicetta extends StatelessWidget {
  const DettaglioRicetta({super.key, required this.ricetta});

  final Ricetta ricetta;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ricetta.titolo,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Ingredienti:",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              // Ingredienti SENZA PUNTI
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ricetta.ingredienti.map((ingrediente) {
                  return Text(ingrediente);
                }).toList(),
              ),

              const SizedBox(height: 20),

              const Text(
                "Passaggi:",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ricetta.passaggi.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(e),
                  );
                }).toList(),
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  launchUrl(Uri.parse(ricetta.link)); //link diretto giallo zafferano
                },
                child: const Text("Apri la ricetta"),
              ),

              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Chiudi"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
