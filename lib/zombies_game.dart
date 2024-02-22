import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:zombies/components/components.dart';
import 'package:zombies/gen/assets.gen.dart';

class ZombieGame extends FlameGame with HasKeyboardHandlerComponents {
  final ZombieWorld _world;
  late final CameraComponent cameraComponent;

  ZombieGame() : _world = ZombieWorld() {
    cameraComponent = CameraComponent(world: _world);
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
    add(_world);

    cameraComponent.viewfinder.anchor = Anchor.center;
    cameraComponent.follow(_world.player);
  }
}
