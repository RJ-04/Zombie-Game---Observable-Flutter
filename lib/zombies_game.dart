import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'components/world.dart';
import 'gen/assets.gen.dart';

class ZombieGame extends FlameGame with HasKeyboardHandlerComponents {
  @override
  final ZombieWorld world;
  late final CameraComponent cameraComponent;

  ZombieGame() : world = ZombieWorld() {
    cameraComponent = CameraComponent(world: world);
    images.prefix = '';
  }

  @override
  Future<void> onLoad() async {
    //

    await images.loadAll([
      Assets.character.adventurer.poses.adventurerAction1.path,
      Assets.town.tile0000.path,
    ]);

    add(cameraComponent);
    add(world);
  }
}
