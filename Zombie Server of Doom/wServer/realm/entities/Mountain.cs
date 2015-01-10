using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace wServer.realm.entities
{
    public class Mountain : ConnectedObject
    {
        public Mountain(RealmManager manager, ushort objType)
            : base(manager, objType)
        {
        }
    }
}
