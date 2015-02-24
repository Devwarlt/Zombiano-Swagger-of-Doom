using wServer.logic.behaviors;
using wServer.logic.loot;
using wServer.logic.transitions;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        _ Solider = () => Behav()
            .Init("Solider",
                new State(
                    new State("NPC",
                       new ConditionalEffect(ConditionEffectIndex.Invulnerable),
                       new Taunt("I got your back."),
                       new Follow(1, range: 3.50),
                       new NPC_Shoot(radius: 10, count: 1, projectileIndex: 0, coolDown: 850)
                    )));
    }
}
