import 'package:flutter/material.dart';
import 'dart:math'; // per generare colori casuali

void main() {
  runApp(const CambiaColoreSfondo());
}

class CambiaColoreSfondo extends StatefulWidget {
  const CambiaColoreSfondo({super.key});

  @override
  State<CambiaColoreSfondo> createState() => _CambiaColoreSfondoState();
}

class _CambiaColoreSfondoState extends State<CambiaColoreSfondo> {
  // Variabile di stato per il colore di sfondo
  Color _coloreSfondo = Colors.white;

  // Variabile per lo stato dello switch (modalità scura)
  bool _modalitaScura = false;

  // Funzione per cambiare colore sfondo
  void _cambiaColore(Color nuovoColore) {
    setState(() {
      _coloreSfondo = nuovoColore;
    });
  }

  // Funzione per colore casuale
  void _coloreCasuale() {
    final random = Random();
    _cambiaColore(Colors.primaries[random.nextInt(Colors.primaries.length)]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _coloreSfondo,
        appBar: AppBar(
          title: const Text('Cambia Sfondo'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Clicca un pulsante...',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Pulsanti per i colori principali
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => _cambiaColore(Colors.red),
                    child: const Text('Rosso'),
                  ),
                  ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => _cambiaColore(Colors.green),
                    child: const Text('Verde'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => _cambiaColore(Colors.blue),
                    child: const Text('Blu'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Pulsante per colore casuale
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: _coloreCasuale,
                child: const Text('Colore Casuale'),
              ),

              const SizedBox(height: 20),

              // Switch per Light/Dark Mode
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Light Mode'),
                  Switch(
                    value: _modalitaScura,
                    onChanged: (valore) {
                      setState(() {
                        _modalitaScura = valore;
                        _coloreSfondo = _modalitaScura
                            ? const Color.fromARGB(255, 50, 50, 50)
                            : Colors.white;
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
