import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contatore',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 25, 8, 55)),
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counterpiu = 0; 
  int _countermeno = 0;


  void _incrementCounter() {
    setState(() {
      _countermeno ++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counterpiu ++;
    });
  }
  int get _contatore {
    return _countermeno - _counterpiu;
  }

  void _reset(){
    setState(() {
    _counterpiu = 0;  
    _countermeno = 0;
        });
  }

  void _halveCounter(){
    setState(() {
          _counterpiu = _counterpiu ~/2;
          _countermeno = _countermeno ~/2;
        });
      }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Contatore'),
          Text(
            '$_contatore', 
            style: TextStyle(fontSize: 32, color: Colors.red),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _decrementCounter,
                label: const Text('1'),
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: _incrementCounter,
                label: const Text('1'),
                icon: const Icon(Icons.add),
              ),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: _reset,
                label: const Text('Reset'),
                icon: const Icon(Icons.reset_tv),
              ),
              ElevatedButton.icon(
                onPressed: _halveCounter,
                label: const Text('/'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

