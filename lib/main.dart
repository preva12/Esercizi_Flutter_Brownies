import 'package:flutter/material.dart';

void main() {
  runApp(const MiaApp());
}

class MiaApp extends StatelessWidget {
  const MiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista To-Do',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PaginaHome(),
    );
  }
}

class PaginaHome extends StatefulWidget {
  const PaginaHome({super.key});

  @override
  State<PaginaHome> createState() => _PaginaHomeState();
}

class Compiti { //inizializzo variabile compiti per popolare casella di inserimento e checkbox
  String titolo;
  bool completato;
  Compiti(this.titolo, {this.completato = false});
}

class _PaginaHomeState extends State<PaginaHome> {
  List<Compiti> listacompiti = [ Compiti('fatti mandare dalla mamma a prendere il latte', completato: true)]; //List<String> nello stato della schermata principale la lista che ho introdotto è compiti dove si gestiscono i vari pulsanti sopra
  bool mostraSoloCompletati = false;
  bool completato = false;

  @override
  Widget build(BuildContext context) {
    // Lista da mostrare in base al filtro
    List<Compiti> listaDaMostrare = mostraSoloCompletati
        ? listacompiti.where((filtro) => filtro.completato).toList()  //se vi è il check box cambia stato 
        : listacompiti;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista delle cose da fare"),
      ),
      body: Column(
        children: [
          // Filtrare le attività da svolgere mantenendo solo quelle completate, utilizzare un pulsante, posizionarlo ovunque
          Padding(
            padding: const EdgeInsets.all(13),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  mostraSoloCompletati = true; //solo quelli completati
                });
              },
              child: const Text("Mostra solo completati"),
            ),
          ),
          // Bottone mostra tutti
          Padding(
            padding: const EdgeInsets.all(13),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  mostraSoloCompletati = false;
                });
              },
              child: const Text("Mostra tutti i task"),
            ),
          ),
          // aggiunto ListView per visualizzare dinamicamente l'elenco delle attività
          Expanded(
            child: ListView(
              children: [
                if (listaDaMostrare.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(200),
                    child: Text(
                      "Nessun task completato",
                      textAlign: TextAlign.center,
                    ),
                  ),
                for (var task in listaDaMostrare)
                  CheckboxListTile(
                    value: task.completato,
                    title: Text(
                      task.titolo,
                      style: TextStyle(
                        decoration: task.completato
                          ? TextDecoration.lineThrough //Toccare la casella di controllo dovrebbe attivare o disattivare lo stato "completato", visualizzato con testo barrato.
                          : TextDecoration.none,
                        
                      ),
                    ),
                    onChanged: (valore) {
                      setState(() {
                        task.completato = valore ?? false;
                      });
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
      // Bottone per aggiungere task
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<String>( //showDialog per passare alla schermata "Aggiungi attività"
            context: context,
            builder: (context) {
              String testoInserito = "";
              return AlertDialog(
                title: const Text("Inserisci un nuovo Task"),
                content: TextField(
                      decoration: const InputDecoration(
                      hintText: "Scrivi qui..."),
                  onChanged: (val) => testoInserito = val,
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Annulla"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (testoInserito.trim().isEmpty) return;
                      Navigator.pop(context, testoInserito); //Navigator.pop per tornare indietro.
                    },
                    child: const Text("Aggiungi"),
                  ),
                ],
              );
            },
          ).then((nuovoTask) {
            if (nuovoTask != null && nuovoTask.isNotEmpty) { // controlla che non sia vuoto o nullo
              setState(() {
                listacompiti.add(Compiti(nuovoTask)); // aggiungo un nuovo task alla lista
              });
            }
          });
        },
        child: const Icon(Icons.add), //pulsante "+"
      ),
    );
  }
}
