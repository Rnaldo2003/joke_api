import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
        fontFamily: 'ComicNeue', // Puedes agregar una fuente divertida si quieres
      ),
      home: const JokeHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class JokeHomePage extends StatefulWidget {
  const JokeHomePage({super.key});

  @override
  State<JokeHomePage> createState() => _JokeHomePageState();
}

class _JokeHomePageState extends State<JokeHomePage> {
  final List<String> jokes = [
    "¿Por qué los programadores confunden Halloween y Navidad? Porque OCT 31 == DEC 25.",
    "¿Cómo se llama un programador en la playa? Un 'surfer' de la web.",
    "¿Por qué el código fue al médico? Porque tenía un bug.",
    "¿Cuál es el animal favorito de los programadores? El pingüino.",
    "¿Por qué el ordenador fue al gimnasio? Para mejorar su 'byte'.",
  ];

  int currentJoke = 0;

  void showNextJoke() {
    setState(() {
      currentJoke = (currentJoke + 1) % jokes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Joke API',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.emoji_emotions,
                    color: Colors.orange,
                    size: 64,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    jokes[currentJoke],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showNextJoke,
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.emoji_emotions,
          color: Colors.white,
          size: 36,
        ),
        tooltip: '¡Muéstrame un chiste!',
        shape: const CircleBorder(),
      ),
    );
  }
}
