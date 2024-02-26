import 'package:flame/components.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import '../gen/assets.gen.dart';
import '../zombies_game.dart';

class Player extends SpriteComponent
    with KeyboardHandler, HasGameReference<ZombieGame> {
  //

  late Vector2 halfSize = halfSize = size / 2;
  late Vector2 maxPosition = game.world.size - halfSize;
  Vector2 movement = Vector2.zero();
  double speed = worldTileSize * 4;

  Player()
      : super(
          position: Vector2(worldTileSize * 12.5, worldTileSize * 5.5),
          size: Vector2.all(64),
          anchor: Anchor.center,
          priority: 1,
        );

  @override
  void update(double dt) {
    position.add(movement * speed * dt);
    position.clamp(halfSize, maxPosition);
  }

  @override
  void onLoad() {
    sprite = Sprite(game.images.fromCache(
      Assets.character.adventurer.poses.adventurerAction1.path,
    ));
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    //

    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        movement.y = movement.y + 1;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        movement.y = movement.y - 1;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        movement.x = movement.x - 1;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        movement.x = movement.x + 1;
      }
    } else if (event is KeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        movement.y = keysPressed.contains(LogicalKeyboardKey.arrowUp) ? -1 : 0;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        movement.y = keysPressed.contains(LogicalKeyboardKey.arrowDown) ? 1 : 0;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        movement.x =
            keysPressed.contains(LogicalKeyboardKey.arrowRight) ? 1 : 0;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        movement.x =
            keysPressed.contains(LogicalKeyboardKey.arrowLeft) ? -1 : 0;
      }
    }

    return super.onKeyEvent(event, keysPressed);
  }
}
