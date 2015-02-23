using wServer.logic.behaviors;
using wServer.logic.loot;
using wServer.logic.transitions;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        _ ZombifiedF = () => Behav()
            .Init("Zombified Fabian",
                new State(
                    new State("Idle",
                       new Shoot(10, count: 4, shootAngle: 7, predictive: 0.7, coolDown: 600),
                       new Taunt(text: "Rawwrr i'm so smerxyghr", cooldown: 88 * 1000),
                       new TimedTransition(4000, "if_cloaked"),
                        new Prioritize(
                            new Follow(speed: 0.3),
                            new Wander(0.2221)
                            ),
                    new State("if_cloaked",
                            new Shoot(10, count: 8, shootAngle: 45, fixedAngle: 20, coolDown: 1600, coolDownOffset: 400),
                            new Shoot(10, count: 8, shootAngle: 45, fixedAngle: 42, coolDown: 1600, coolDownOffset: 1200),
                            new PlayerWithinTransition(10, "Idle")
                    ))))
            .Init("Zombified BARm",
                new State(
                    new State("Idle",
                       new Shoot(10, count: 4, shootAngle: 7, predictive: 0.7, coolDown: 600),
                       new Taunt(text: "Blurhghaghrrrr i eat cold potatos", cooldown: 88 * 1000),
                       new TimedTransition(4000, "if_cloaked"),
                        new Prioritize(
                            new Follow(speed: 0.3),
                            new Wander(0.2221)
                            ),
                    new State("if_cloaked",
                            new Shoot(10, count: 8, shootAngle: 45, fixedAngle: 20, coolDown: 1600, coolDownOffset: 400),
                            new Shoot(10, count: 8, shootAngle: 45, fixedAngle: 42, coolDown: 1600, coolDownOffset: 1200),
                            new PlayerWithinTransition(10, "Idle")
                    ))));
    }
}
