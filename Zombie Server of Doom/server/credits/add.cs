using db;

namespace server.credits
{
    public class add : RequestHandler
    {
        protected override void HandleRequest()
        {
            string status;
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                var cmd = db.CreateQuery();
                cmd.CommandText = "SELECT id FROM accounts WHERE uuid=@uuid";
                cmd.Parameters.AddWithValue("@uuid", Query["guid"]);
                object id = cmd.ExecuteScalar();

                if (id != null)
                {
                    int amount = int.Parse(Query["jwt"]);
                    cmd = db.CreateQuery();
                    cmd.CommandText = "UPDATE stats SET credits = credits + @amount WHERE accId=@accId";
                    cmd.Parameters.AddWithValue("@accId", (int)id);
                    cmd.Parameters.AddWithValue("@amount", amount);
                    int result = (int)cmd.ExecuteNonQuery();
                    if (result > 0)
                        status = "Ya done...";
                    else
                        status = "Internal error :(";
                }
                else
                    status = "Account not exists :(";
            }

            WriteLine(
@"<html>
    <head>
        <title>Ya...</title>
    </head>
    <body style='background: #333333'>
        <h1 style='color: #EEEEEE; text-align: center'>
            {0}
        </h1>
    </body>
</html>", status);
        }
    }
}