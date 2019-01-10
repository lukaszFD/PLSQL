using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace CA_SqlTableToXml
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                int cnt = 19972;
                for (int i = 1; i < cnt; i++)
                {
                    using (DataTable db = script(i.ToString()))
                    {
                        foreach (DataRow item in db.Rows)
                        {
                            File.WriteAllText(@"C:\Users\lukasz.dejko\Documents\XML_Test\" + i.ToString() + ".xml", item[0].ToString());
                        }
                    }
                }
                Console.WriteLine("Pliki wygenerowane");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            Console.ReadKey();
        }


        static SqlConnection sqlCon = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=AdventureWorks2012;Integrated Security=True");

        private static SqlCommand sqlExec(string param)
        {
            SqlCommand sqlScript = new SqlCommand("[dbo].[TabletoXML]", sqlCon);
            sqlScript.CommandType = CommandType.StoredProcedure;
            sqlScript.CommandTimeout = 1000;
            sqlScript.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(param);
            return sqlScript;
        }
        public static DataTable script(string param)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlCommand sqlScript = sqlExec(param);

                sqlCon.Open();
                dt.Load(sqlScript.ExecuteReader());
            }
            catch (Exception ex)
            {
                sqlCon.Close();
                throw ex;
            }
            finally
            {
                sqlCon.Close();
            }
            return dt;
        }
    }
}
