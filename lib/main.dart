import 'package:flutter/material.dart';
import 'dart:math'; // per generare colori casuali

void main() {
  runApp(const MaterialApp(home: CambiaColoreSfondo()));
}

class CambiaColoreSfondo extends StatefulWidget {
  const CambiaColoreSfondo({super.key});

  @override
  State<CambiaColoreSfondo> createState() => _CambiaColoreSfondoState();
}

class _CambiaColoreSfondoState extends State<CambiaColoreSfondo> {
  // variabile di stato per il colore di sfondo
  Color _coloreSfondo = Colors.white;

  // Variabile di stato per gestire lo switch Dark/Light
  bool _modalitaScura = false;

  // funzione per cambiare il colore dello sfondo
  void _cambiaColore(Color nuovoColore) {
    setState(() {
      _coloreSfondo = nuovoColore;
      // non tocchiamo _modalitaScura: lo switch mantiene il suo stato
    });
  }

  // funzione per scegliere un colore casuale
  void _coloreCasuale() {
    final random = Random();
    _cambiaColore(Colors.primaries[random.nextInt(Colors.primaries.length)]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambia Sfondo'),
        backgroundColor: const Color.fromARGB(221, 0, 8, 255),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        color: _coloreSfondo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Clicca un pulsante...',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              // pulsanti colorati
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                     style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: () => _cambiaColore(Colors.red),
                    child: const Text('Rosso'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 255, 42),
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    
                    onPressed: () => _cambiaColore(Colors.green),
                    child: const Text('Verde'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: () => _cambiaColore(Colors.blue),
                    child: const Text('Blu'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Pulsante per colore casuale
              ElevatedButton(
                onPressed: _coloreCasuale,
                child: Text(
                  'Colore Casuale',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Switch per modalità Dark/Light
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Light Mode'),
                  Switch(
                    value: _modalitaScura,
                    onChanged: (valore) {
                      setState(() {
                        _modalitaScura = valore;
                        _coloreSfondo =
                            _modalitaScura ? const Color.fromARGB(255, 86, 86, 86)! : const Color.fromARGB(255, 255, 255, 255);
                      });
                    },
                  ),
                  const Text('Dark Mode'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
