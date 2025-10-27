import 'package:flutter/material.dart';

void main() {
  runApp(const MiaApp());
}

class MiaApp extends StatelessWidget {
  const MiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contatore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 25, 8, 55)),
      ),
      home: const PaginaContatore(),
    );
  }
}

class PaginaContatore extends StatefulWidget {
  const PaginaContatore({super.key});

  @override
  State<PaginaContatore> createState() => _StatoPaginaContatore();
}

class _StatoPaginaContatore extends State<PaginaContatore> {
  int _contatore = 0;

  void _incrementaContatore() {
    setState(() {
      _contatore++;
    });
  }

  void _decrementaContatore() {
    setState(() {
      _contatore--;
    });
  }

  void _azzeraContatore() {
    setState(() {
      _contatore = 0;
    });
  }

  void _dimezzaContatore() {
    setState(() {
      _contatore = _contatore ~/ 2;
    });
  }

  void _raddoppiaContatore() {
    setState(() {
      _contatore *= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Contatore'),
          Text(
            '$_contatore',
            style: const TextStyle(fontSize: 32, color: Colors.red),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _decrementaContatore,
                label: const Text('1'),
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: _incrementaContatore,
                label: const Text('1'),
                icon: const Icon(Icons.add),
              ),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: _azzeraContatore,
                label: const Text('Azzera'),
                icon: const Icon(Icons.reset_tv),
              ),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: _dimezzaContatore,
                label: const Text('/2'),
              ),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: _raddoppiaContatore,
                label: const Text('x2'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
