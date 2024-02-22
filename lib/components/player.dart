import 'package:flame/components.dart';
import 'package:flutter/services.dart';

class Player extends SpriteComponent with KeyboardHandler {
  Player({super.position, super.sprite})
      : super(
          size: Vector2.all(64),
          anchor: Anchor.center,
        );

  Vector2 movement = Vector2.zero();
  double speed = 100;

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    //

    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        movement = Vector2(movement.x, 1);
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        movement = Vector2(movement.x, -1);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        movement = Vector2(-1, movement.y);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        movement = Vector2(1, movement.y);
      }
    } else if (event is KeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        movement = Vector2(movement.x, 0);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        movement = Vector2(movement.x, 0);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        movement = Vector2(0, movement.y);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        movement = Vector2(0, movement.y);
      }
    }

    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void update(double dt) {
    position = position + (movement * speed * dt);
  }
}
