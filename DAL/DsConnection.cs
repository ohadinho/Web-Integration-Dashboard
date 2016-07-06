using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class DsConnection
    {
        public DsConnection()
        {
        }

        public string ExecCommandGetJSON(string connStr,SqlCommand cmd)
        {
            string json = String.Empty;
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(connStr))
            {
                cmd.Connection = con;
                con.Open();                
                SqlDataAdapter da = new SqlDataAdapter(cmd);                
                da.Fill(dt);
                json = Helpers.DataManipulation.ConvertDataTableToJSON(dt);
            }

            return json;
        }

        public DataTable ExecCommandGetDT(string connStr, SqlCommand cmd)
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(connStr))
            {
                cmd.Connection = con;
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            return dt;
        }
    }
}
