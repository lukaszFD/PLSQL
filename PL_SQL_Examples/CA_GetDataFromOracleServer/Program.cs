using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;

namespace CA_GetDataFromOracleServer
{
    class Program
    {
        static void Main(string[] args)
        {
            string oradb = "Data Source=(DESCRIPTION="
                         + "(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))"
                         + "(CONNECT_DATA=(SERVICE_NAME=xe)));"
                         + "User Id=test;Password=password;";
            OracleConnection conn = new OracleConnection(oradb);
            try
            {
                conn.Open();
                
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select  * from employees_test";
                cmd.CommandType = CommandType.Text;
                OracleDataReader dr = cmd.ExecuteReader();
                var dataTable = new DataTable();
                dataTable.Load(dr);

                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    Console.WriteLine(dataTable.Rows[i]["first_name"].ToString() + " " + dataTable.Rows[i]["last_name"].ToString());
                }

            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.Message);
            }
            finally
            {
                conn.Close();
            }

            Console.ReadKey();

        }
    }
}
