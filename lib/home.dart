import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("Home"),
      actions: [
      IconButton(
      icon: const Icon(Icons.color_lens),
      onPressed: () {
        context.push("/Personalizza");
      },
    )
  ],
),

      body: const Center(
        child: Text("Benvenuta nella Home Page"),
      ),
    );
  }
}