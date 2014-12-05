using Mono.Game;
using System;
using wServer.realm.entities;

namespace wServer.realm
{
    public class VisibilityManager
    {
        public const int MAX_VISIBILITYRANGE = 30;

        private readonly Player player;

        private Vector2 oldPos;
        private Vector2 newPos;

        public VisibilityManager(Player player)
        {
            this.player = player;
            this.oldPos = Vector2.Zero;
            this.newPos = Vector2.Zero;
        }

        public Player Host { get { return player; } }

        public void Move(float x, float y)
        {
            oldPos = newPos;
            newPos = new Vector2(x, y);
            //if (oldPos != newPos)
                player.UpdateCount++;
        }

        public int GetVisibility()
        {
            int len = (int)Math.Floor((Vector2.Distance(oldPos, newPos) * ((player.Stats[4] + player.Boost[4]) / 5.5)) + 3);
            int speedy = 0;
            if (player.HasConditionEffect(ConditionEffects.Speedy))
                speedy = 3;

            int ret = len + speedy;
            if (ret > MAX_VISIBILITYRANGE) ret = MAX_VISIBILITYRANGE;
            return ret;
        }
    }
}
