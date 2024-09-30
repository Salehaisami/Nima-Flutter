import "actor.dart";
import "actor_bone_base.dart";
import "actor_component.dart";
import "readers/stream_reader.dart";

class ActorJellyBone extends ActorBoneBase {
  @override
  ActorComponent makeInstance(Actor resetActor) {
    ActorJellyBone instanceNode = ActorJellyBone();
    instanceNode.copyBoneBase(this, resetActor);
    return instanceNode;
  }

  static ActorJellyBone? read(
      Actor actor, StreamReader reader, ActorJellyBone? node) {
    node ??= ActorJellyBone();

    // The Jelly Bone has a specialized read that doesn't go down the typical node path, this is because majority of the transform properties
    // of the Jelly Bone are controlled by the Jelly Controller and are unnecessary for serialization.
    ActorComponent.read(actor, reader, node);
    node.opacity = reader.readFloat32("opacity");
    node.collapsedVisibility = reader.readBool("isCollapsed");
    return node;
  }
}
