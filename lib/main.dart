import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  runApp(const MaterialApp(home: WidgetSaluto()));
}

class WidgetSaluto extends StatefulWidget { //questo blocco definisce un widget stateful
  const WidgetSaluto({super.key});

  @override
  State<WidgetSaluto> createState() => _WidgetSalutoState(); //cambia stato nel tempo
}

class _WidgetSalutoState extends State<WidgetSaluto> {
  late final FormGroup _formulario; // form che contiene i campi di testo
  String _messaggio = ''; // Messaggio da mostrare che cambia in base alla variabile

  @override
  void initState() {
    super.initState(); // chiama il metodo initState 
    _formulario = FormGroup({
      'saluto': FormControl<String>(value: ''),// campo per il saluto
      'nome': FormControl<String>(value: ''), // campo per il nome dell'utente
    });
  }

  @override
  void dispose() { //pulire correttamente il widget quando non serve più
    _formulario.dispose();
    super.dispose();
  }

  void _aggiornaSaluto() {
    final saluto = _formulario.control('saluto').value as String? ?? ''; //assegna a saluto la frase che scrive l'utente
    final nome = _formulario.control('nome').value as String? ?? '';

    setState(() {
      if (saluto.isNotEmpty && nome.isNotEmpty) { //prende i valori inseriti dall'utente e aggiorna _messaggio in base a cosa scrive l'utente
        _messaggio = "$saluto $nome";
      } else if (saluto.isNotEmpty) {
        _messaggio = saluto;
      } else if (nome.isNotEmpty) {
        _messaggio = nome;
      } else {
        _messaggio = '';
      }
    });
  }

  void _pulisciFormulario() { //reset formulario
    _formulario.reset();
    setState(() {
      _messaggio = '';
    });
  }

  @override
  Widget build(BuildContext context) {  //popolazione widgete
    return Scaffold(
      appBar: AppBar(title: const Text("esercizio 1.2")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ReactiveForm(
          formGroup: _formulario,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ReactiveTextField<String>(
                formControlName: 'saluto',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Inserisci il tuo saluto (ciao, hello, yo)',
                ),
                onChanged: (_) => _aggiornaSaluto(),
              ),
              const SizedBox(height: 20),
              ReactiveTextField(
                formControlName: 'nome',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Inserisci il tuo nome',
                ),
                onChanged: (_) => _aggiornaSaluto(),
              ),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _pulisciFormulario,
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          
                        ),
                        foregroundColor: const Color.fromARGB(255, 28, 216, 18)
                      ),
                      child: const Text('Pulisci'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(_messaggio),
            ],
          ),
        ),
      ),
    );
  }
}