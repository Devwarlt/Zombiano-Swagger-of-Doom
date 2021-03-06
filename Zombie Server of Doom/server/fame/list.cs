﻿using db;
using System.Xml;

namespace server.fame
{
    public class list : RequestHandler
    {
        protected override void HandleRequest()
        {
            string span = "";
            switch (Query["timespan"])
            {
                case "week":
                    span = "(time >= DATE_SUB(NOW(), INTERVAL 1 WEEK))"; break;
                case "month":
                    span = "(time >= DATE_SUB(NOW(), INTERVAL 1 MONTH))"; break;
                case "all":
                    span = "TRUE"; break;
                default:
                    WriteErrorLine("Invalid fame list"); return;
            }
            string ac = "FALSE";
            if (Query["accountId"] != null)
                ac = "(accId=@accId AND chrId=@charId)";

            XmlDocument doc = new XmlDocument();
            var root = doc.CreateElement("FameList");

            var spanAttr = doc.CreateAttribute("timespan");
            spanAttr.Value = Query["timespan"];
            root.Attributes.Append(spanAttr);

            doc.AppendChild(root);

            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                var cmd = db.CreateQuery();
                cmd.CommandText = @"SELECT accId, chrId, name, charType, tex1, tex2, items, totalFame 
FROM (SELECT * FROM (SELECT * FROM death ORDER BY totalFame DESC) x GROUP BY accId) y 
WHERE " + span + @" OR " + ac + @" 
LIMIT 10;";
                if (Query["accountId"] != null)
                {
                    cmd.Parameters.AddWithValue("@accId", Query["accountId"]);
                    cmd.Parameters.AddWithValue("@charId", Query["charId"]);
                }
                using (var rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        var elem = doc.CreateElement("FameListElem");

                        var accIdAttr = doc.CreateAttribute("accountId");
                        accIdAttr.Value = rdr.GetInt32("accId").ToString();
                        elem.Attributes.Append(accIdAttr);
                        var chrIdAttr = doc.CreateAttribute("charId");
                        chrIdAttr.Value = rdr.GetInt32("chrId").ToString();
                        elem.Attributes.Append(chrIdAttr);

                        root.AppendChild(elem);

                        var nameElem = doc.CreateElement("Name");
                        nameElem.InnerText = rdr.GetString("name");
                        elem.AppendChild(nameElem);
                        var objTypeElem = doc.CreateElement("ObjectType");
                        objTypeElem.InnerText = rdr.GetString("charType");
                        elem.AppendChild(objTypeElem);
                        var tex1Elem = doc.CreateElement("Tex1");
                        tex1Elem.InnerText = rdr.GetString("tex1");
                        elem.AppendChild(tex1Elem);
                        var tex2Elem = doc.CreateElement("Tex2");
                        tex2Elem.InnerText = rdr.GetString("tex2");
                        elem.AppendChild(tex2Elem);
                        var equElem = doc.CreateElement("Equipment");
                        equElem.InnerText = rdr.GetString("items");
                        elem.AppendChild(equElem);
                        var fameElem = doc.CreateElement("TotalFame");
                        fameElem.InnerText = rdr.GetString("totalFame");
                        elem.AppendChild(fameElem);
                    }
                }
            }

            XmlWriterSettings settings = new XmlWriterSettings();
            settings.OmitXmlDeclaration = true;
            using (XmlWriter wtr = XmlWriter.Create(Context.Response.OutputStream))
                doc.Save(wtr);
        }
    }
}