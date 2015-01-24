using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace terrain
{
    public class WmapDecompiler
    {
        public static void Main(string[] args)
        {
            try
            {
                var data = new XmlData();
                FileInfo fi = new FileInfo(args[0].ToString());
                if (fi.Exists)
                    if (args.Length != 3)
                        terrain.Json2Wmap.Convert(new XmlData(), args[0], args[1]);
                    else
                        terrain.Json2Wmap.ConvertReverse(data, args[0], args[1]);
                else
                {
                    Console.WriteLine("input file not found: " + fi.FullName);
                    return;
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception : " + e);
            }
            Console.WriteLine("done");
        }
    }
}
