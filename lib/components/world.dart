import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_tiled/flame_tiled.dart';

import '../constants.dart';
import '../zombies_game.dart';
import 'land.dart';
import 'player.dart';

class ZombieWorld extends World with HasGameRef<ZombieGame> {
  final List<Land> land = [];
  late final Player player;
  late TiledComponent map;
  late Vector2 size = Vector2(
    map.tileMap.map.width * worldTileSize,
    map.tileMap.map.height * worldTileSize,
  );

  ZombieWorld({super.children});

  void setCameraBounds(Vector2 gameSize) async {
    if (!gameRef.cameraComponent.isMounted) {
      gameRef.cameraComponent.setBounds(
        Rectangle.fromLTRB(
          gameSize.x / 2,
          gameSize.y / 2,
          size.x - gameSize.x / 2,
          size.y - gameSize.y / 2,
        ),
      );
    }
  }

  @override
  void onGameResize(Vector2 size) async {
    super.onGameResize(size);
    setCameraBounds(size);
  }

  @override
  Future<void> onLoad() async {
    // map

    map = await TiledComponent.load(
      'world.tmx',
      Vector2.all(worldTileSize),
    );
    add(map);

    // player
    player = Player();
    add(player);

    gameRef.cameraComponent.follow(player);
    setCameraBounds(size);
  }
}
