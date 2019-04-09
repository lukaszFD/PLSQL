using System;
using Oracle.ManagedDataAccess.Client;

namespace Demo
{
    class Program
    {
        static void Main(string[] args)
        {	
            string conString = "User Id=hr;Password=1234;Data Source=localhost:1521/XE;";

            //Using TNSNAMES.ORA 
            //string conString = "User Id=hr;Password=hr;Data Source=orclpdb;";

            using (OracleConnection con = new OracleConnection(conString))
            {
                using (OracleCommand cmd = con.CreateCommand())
                {
                    try
                    {
                        con.Open();
                        cmd.BindByName = true;
                        cmd.CommandText = "select first_name from employees where department_id = :id";
                        OracleParameter id = new OracleParameter("id", 50);
                        cmd.Parameters.Add(id);
                        OracleDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            Console.WriteLine("Employee First Name: " + reader.GetString(0));
                        }

                        Console.WriteLine();
                        Console.WriteLine("Press 'Enter' to continue");

                        reader.Dispose();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    Console.ReadLine();
                }
            }
        }
    }
}