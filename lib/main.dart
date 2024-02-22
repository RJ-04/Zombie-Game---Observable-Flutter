import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:zombies/zombies_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final game = ZombieGame();
  runApp(MyApp(game: game));
}

class MyApp extends StatelessWidget {
  final ZombieGame game;
  const MyApp({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GameWidget(game: game),
    );
  }
}
