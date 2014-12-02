using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.realm;
using wServer.logic.behaviors;
using wServer.logic.loot;
using wServer.logic.transitions;

namespace wServer.logic
{
    partial class BehaviorDb
    {
        _ Lithium = () => Behav()
            .Init("Lithium 1",
                new State(
                    new State("Idle",
                        new Taunt(text: "Meat??", cooldown: 88 * 1000),
                        new Taunt(text: "Ahhrghh!", cooldown: 72 * 1000),
                        new PlayerWithinTransition(dist: 50, targetState: "Attack"),
                    new State("Attack",
                        new Wander(speed: 0.2221),
                        new Taunt(text: "B-brains...", cooldown: 60 * 1000),
                        new Shoot(radius: 10, count: 2, projectileIndex: 0, shootAngle: 20, predictive: 1, coolDown: 1221),
                        new NoPlayerWithinTransition(dist: 50, targetState: "Idle")))))
            .Init("Lithium 2",
                new State(
                    new State("Walk",
                        new Follow(speed: 0.3))));
    }
}
