using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace CA_InsertDataIntoOracleServer
{
    class Program
    {
        static void Main(string[] args)
        {

            var doc = XDocument.Load(@"D:\XML_Test\1.xml");

            string sourceFileName = "";
            foreach (var item in Directory.GetFiles(@"D:\XML_Test\", "*.xml"))
            {
                sourceFileName = item.ToString();
                Console.WriteLine(sourceFileName);
            }



            Console.ReadKey();
        }
    }
}
