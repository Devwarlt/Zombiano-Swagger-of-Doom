using db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace server.unicorn
{
    public class found : RequestHandler
    {
        private static readonly string SECRET_TOKEN = "01001000 01101001 00100000 01101101 00111000 00101100 00100000 01001001 00100000 01101010 01110101 01110011 01110100 00100000 01100110 01101111 01110101 01101110 01100100 00100000 01110100 01101000 01100101 00100000 00100010 01001001 00100000 01100001 01101101 00100000 01100001 00100000 01110101 01101110 01101001 01100011 01101111 01110010 01101110 00100000 01100101 01100001 01110011 01110100 01100101 01110010 01100101 01100111 01100111 00100010 00101110 00001010 01010011 01110101 01110011 01101001 00100000 01001001 00100000 01101100 01101111 01110110 01100101 00100000 01111001 01101111 01110101 00100000 00111100 00110011 00100000 01111110 01101111 01110011 01110011 01101001 01101101 01100011 00111000 00110010";
        protected override void HandleRequest()
        {
            if (Query["secretToken"] == SECRET_TOKEN)
            {
                using (var db = new Database())
                {
                    Account acc;

                    if ((acc = db.Verify(Query["guid"], Query["password"])) != null)
                    {
                        WriteLine("<Success />");
                        if (!acc.OwnedSkins.Contains(0x0343))
                        {
                            Task.Factory.StartNew(new Action(() =>
                            {
                                using (var dbNew = new Database())
                                {
                                    Thread.Sleep(2000);
                                    acc = dbNew.GetAccount(acc.AccountId);
                                    acc.OwnedSkins.Add(0x0343);
                                    dbNew.SaveAccount(acc);
                                }
                            }));
                        }
                        else WriteErrorLine("Nope");
                    }
                    else WriteErrorLine("Account credentials not valid.");
                }
            }
        }
    }
}
