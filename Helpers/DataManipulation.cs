using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Helpers
{
    public class DataManipulation
    {
        public static string ConvertDataTableToJSON(DataTable dt)
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            
            string json = serializer.Serialize(rows);
            return json;
        }
    }
}
