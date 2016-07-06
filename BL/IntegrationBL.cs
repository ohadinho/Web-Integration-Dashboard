using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace BL
{
    public class IntegrationBL : BaseBL
    {
        private const string ProcessFailuresBetweenDatesCommand = "WRITE SQL STATEMENT HERE";
        private const string MessageSearchCommand = "WRITE SQL STATEMENT HERE";
        private const string ResultsRetrievalDistCommand = "WRITE SQL STATEMENT HERE";
        private const string RentgenRetrievalDistCommand = "WRITE SQL STATEMENT HERE";
        private const string OwnerTopFiveNewsCommand = "WRITE SQL STATEMENT HERE";
        private const string TopFiveNewsCommand = "WRITE SQL STATEMENT HERE";
        private const string ProcessIDFromTraceCommand = "WRITE SQL STATEMENT HERE";

        public IntegrationBL(string connStr) : base(connStr)
        {
        }

        public string ProcessFailuresBetweenDates(string processName, DateTime startDate, DateTime endDate)
        {
            //string json = String.Empty;

            //using (SqlCommand sqlCommand = new SqlCommand(ProcessFailuresBetweenDatesCommand))
            //{
            //    sqlCommand.Parameters.Add(new SqlParameter("processName", processName));
            //    sqlCommand.Parameters.Add(new SqlParameter("startDate", startDate));
            //    sqlCommand.Parameters.Add(new SqlParameter("endDate", endDate));
            //    json = dsConn.ExecCommandGetJSON(connStr, sqlCommand);
            //}

            string json = "[{\"MessageId\":\"EnvDummy192.ipp\",\"SrcMessageID\":\"64696591\",\"MessageDateTime\":\"2015-11-01 06:04:00\",\"LoadDate\":\"2015-11-01 06:09:01\",\"Key1Value\":\"443649\",\"Key2Value\":\"2015-11-01 06:01:00\",\"Key3Value\":\"21\",\"Key4Value\":\"2016054\",\"Key5Value\":\"1000\",\"ArchivePath\":\"#\",\"FullExceptionText\":\"Violation of UNIQUE KEY\",\"ProcessName\":\"ProcessDum\"},{\"MessageId\":\"EnvDummy222.ipp\",\"SrcMessageID\":\"64706600\",\"MessageDateTime\":\"2015-11-01 07:50:00\",\"LoadDate\":\"2015-11-01 07:56:46\",\"Key1Value\":\"444894\",\"Key2Value\":\"2015-11-01 06:01:00\",\"Key3Value\":\"21\",\"Key4Value\":\"5462647\",\"Key5Value\":\"1000\",\"ArchivePath\":\"#\",\"FullExceptionText\":\"Violation of UNIQUE KEY.\",\"ProcessName\":\"ProcessDum\"},{\"MessageId\":\"EnvDummy1.ipp\",\"SrcMessageID\":\"64706600\",\"MessageDateTime\":\"2015-11-01 07:50:00\",\"LoadDate\":\"2015-11-01 07:56:46\",\"Key1Value\":\"444894\",\"Key2Value\":\"2015-11-01 06:01:00\",\"Key3Value\":\"21\",\"Key4Value\":\"5462647\",\"Key5Value\":\"1000\",\"ArchivePath\":\"#\",\"FullExceptionText\":\"Violation of UNIQUE KEY.\",\"ProcessName\":\"ProcessDum\"},{\"MessageId\":\"EnvDummy2.ipp\",\"SrcMessageID\":\"64706600\",\"MessageDateTime\":\"2015-11-01 07:50:00\",\"LoadDate\":\"2015-11-01 07:56:46\",\"Key1Value\":\"444894\",\"Key2Value\":\"2015-11-01 06:01:00\",\"Key3Value\":\"21\",\"Key4Value\":\"5462647\",\"Key5Value\":\"1000\",\"ArchivePath\":\"#\",\"FullExceptionText\":\"Violation of UNIQUE KEY.\",\"ProcessName\":\"ProcessDum\"},{\"MessageId\":\"EnvDummy3.ipp\",\"SrcMessageID\":\"64706600\",\"MessageDateTime\":\"2015-11-01 07:50:00\",\"LoadDate\":\"2015-11-01 07:56:46\",\"Key1Value\":\"444894\",\"Key2Value\":\"2015-11-01 06:01:00\",\"Key3Value\":\"21\",\"Key4Value\":\"5462647\",\"Key5Value\":\"1000\",\"ArchivePath\":\"#\",\"FullExceptionText\":\"Violation of UNIQUE KEY.\",\"ProcessName\":\"ProcessDum\"},{\"MessageId\":\"EnvDummy4.ipp\",\"SrcMessageID\":\"64706600\",\"MessageDateTime\":\"2015-11-01 07:50:00\",\"LoadDate\":\"2015-11-01 07:56:46\",\"Key1Value\":\"444894\",\"Key2Value\":\"2015-11-01 06:01:00\",\"Key3Value\":\"21\",\"Key4Value\":\"5462647\",\"Key5Value\":\"1000\",\"ArchivePath\":\"#\",\"FullExceptionText\":\"Violation of UNIQUE KEY.\",\"ProcessName\":\"ProcessDum\"},{\"MessageId\":\"EnvDummy5.ipp\",\"SrcMessageID\":\"64706600\",\"MessageDateTime\":\"2015-11-01 07:50:00\",\"LoadDate\":\"2015-11-01 07:56:46\",\"Key1Value\":\"444894\",\"Key2Value\":\"2015-11-01 06:01:00\",\"Key3Value\":\"21\",\"Key4Value\":\"5462647\",\"Key5Value\":\"1000\",\"ArchivePath\":\"#\",\"FullExceptionText\":\"Violation of UNIQUE KEY.\",\"ProcessName\":\"ProcessDum\"},{\"MessageId\":\"EnvDummy0126.ipp\",\"SrcMessageID\":\"64706600\",\"MessageDateTime\":\"2015-11-01 07:50:00\",\"LoadDate\":\"2015-11-01 07:56:46\",\"Key1Value\":\"444894\",\"Key2Value\":\"2015-11-01 06:01:00\",\"Key3Value\":\"21\",\"Key4Value\":\"5462647\",\"Key5Value\":\"1000\",\"ArchivePath\":\"#\",\"FullExceptionText\":\"Violation of UNIQUE KEY.\",\"ProcessName\":\"ProcessDum\"}]";
            return json;
        }

        public string MessageSearch(string processName, DateTime startDate, DateTime endDate,string patientId)
        {
            // string json = String.Empty;

            //using (SqlCommand sqlCommand = new SqlCommand(MessageSearchCommand))
            //{
            //    sqlCommand.Parameters.Add(new SqlParameter("processName", processName));
            //    sqlCommand.Parameters.Add(new SqlParameter("startDate", startDate.ToString()));
            //    sqlCommand.Parameters.Add(new SqlParameter("endDate", endDate.ToString()));
            //    sqlCommand.Parameters.Add(new SqlParameter("patientId", patientId));
            //    json = dsConn.ExecCommandGetJSON(connStr, sqlCommand);
            //}

            string json = "{\"Data\":[{\"MessageId\":\"EnvDummy192.ipp\",\"SrcMessageID\":\"64696591\",\"MessageDateTime\":\"2015-11-01 06:04:00\",\"LoadDate\":\"2015-11-01 06:09:01\",\"Key1Value\":\"443649\",\"Key2Value\":\"2015-11-01 06:01:00\",\"Key3Value\":\"21\",\"Key4Value\":\"2016054\",\"Key5Value\":\"1000\",\"ArchivePath\":\"#\",\"FullExceptionText\":\"Violation of UNIQUE KEY\",\"ProcessName\":\"ProcessDum\"},{\"MessageId\":\"EnvDummy222.ipp\",\"SrcMessageID\":\"64706600\",\"MessageDateTime\":\"2015-11-01 07:50:00\",\"LoadDate\":\"2015-11-01 07:56:46\",\"Key1Value\":\"444894\",\"Key2Value\":\"2015-11-01 06:01:00\",\"Key3Value\":\"21\",\"Key4Value\":\"5462647\",\"Key5Value\":\"1000\",\"ArchivePath\":\"#\",\"FullExceptionText\":\"Violation of UNIQUE KEY.\",\"ProcessName\":\"ProcessDum\"}]}";
            return json;
        }

        public string ResultsRetrievalDist()
        {
            //string json = String.Empty;

            //using (SqlCommand sqlCommand = new SqlCommand(ResultsRetrievalDistCommand))
            //{
            //    json = dsConn.ExecCommandGetJSON(connStr, sqlCommand);
            //}

            string json = "{\"Data\": [{\"DistID\": 3, \"SenderCode\": 0,\"FromRetrieveTimeStamp\": \"2015-11-01 11:45:09\",\"RetrieveTime\": \"2015-11-01 12:27:06\",\"UpdateTime\": \"2015-11-01 12:27:08\",\"Application\": 367,\"ApplicationDestination\": 206,\"InstituteCode\": 121,\"InstituteCodeDestination\": 121,\"IsActive\": 1},{\"DistID\": 4,\"SenderCode\": 1,\"FromRetrieveTimeStamp\": \"2015-11-01 11:56:08\",\"RetrieveTime\": \"2015-11-01 12:27:06\",\"UpdateTime\": \"2015-11-01 12:27:09\",\"Application\": 367,\"ApplicationDestination\": 206,\"InstituteCode\": 121,\"InstituteCodeDestination\": 121,\"IsActive\": 1}]}";
            return json;
        }

        public string RentgenRetrievalDist()
        {
            //string json = String.Empty;

            //using (SqlCommand sqlCommand = new SqlCommand(RentgenRetrievalDistCommand))
            //{
            //    json = dsConn.ExecCommandGetJSON(connStr, sqlCommand);
            //}

            string json = "{\"Data\": [{\"DistID\": 3, \"SenderCode\": 0,\"FromRetrieveTimeStamp\": \"2015-11-01 11:45:09\",\"RetrieveTime\": \"2015-11-01 12:27:06\",\"UpdateTime\": \"2015-11-01 12:27:08\",\"Application\": 367,\"ApplicationDestination\": 206,\"InstituteCode\": 121,\"InstituteCodeDestination\": 121,\"IsActive\": 1},{\"DistID\": 4,\"SenderCode\": 1,\"FromRetrieveTimeStamp\": \"2015-11-01 11:56:08\",\"RetrieveTime\": \"2015-11-01 12:27:06\",\"UpdateTime\": \"2015-11-01 12:27:09\",\"Application\": 367,\"ApplicationDestination\": 206,\"InstituteCode\": 121,\"InstituteCodeDestination\": 121,\"IsActive\": 1}]}";
            return json;
        }

        public DataTable OwnerTopFiveNews(string owner)
        {
            DataTable result = new DataTable();
            string command = string.Format(OwnerTopFiveNewsCommand, owner);

            using (SqlCommand sqlCommand = new SqlCommand(command))
            {
                result = dsConn.ExecCommandGetDT(connStr, sqlCommand);
            }

            return result;
        }

        public DataTable TopFiveNews()
        {
            DataTable result = new DataTable();

            using (SqlCommand sqlCommand = new SqlCommand(TopFiveNewsCommand))
            {
                result = dsConn.ExecCommandGetDT(connStr, sqlCommand);
            }

            return result;
        }

        public List<BTSTraceLog> ProcessIDFromTrace(string processInstanceId)
        {             
            DataTable result = new DataTable();
            List<BTSTraceLog> listBtl = new List<BTSTraceLog>();

            using (SqlCommand sqlCommand = new SqlCommand(ProcessIDFromTraceCommand))
            {
                sqlCommand.Parameters.Add(new SqlParameter("pid", processInstanceId));
                result = dsConn.ExecCommandGetDT(connStr, sqlCommand);
            }

            foreach (DataRow dr in result.Rows)
            {
                string recordID = dr["RecordID"].ToString();
                string serviceInstanceID = dr["ServiceInstanceID"].ToString();
                string prevServiceInstanceID =dr["PrevServiceInstanceID"].ToString();
                string nextServiceName = dr["NextServiceName"].ToString();
                string processName = dr["ProcessName"].ToString();
                string srvName = dr["SrvName"].ToString();
                string statusCode = dr["StatusCode"].ToString();
                string srvBeginDate = dr["SrvBeginDate"].ToString();
                string srvEndDate = dr["SrvEndDate"].ToString();
                string srvKey1 = dr["SrvKey1"].ToString();
                string srvKey2 = dr["SrvKey2"].ToString();
                string srvKey3 = dr["SrvKey3"].ToString();
                string targetTransactionID = dr["TargetTransactionID"].ToString();
                string fullExceptionText = dr["FullExceptionText"].ToString();
                BTSTraceLog btl = new BTSTraceLog(recordID,processInstanceId, srvName, statusCode, srvBeginDate, srvEndDate, srvKey1, srvKey2, srvKey3, fullExceptionText, serviceInstanceID, prevServiceInstanceID, targetTransactionID, nextServiceName);
                listBtl.Add(btl);
            }

            return listBtl.OrderBy(item => item.RecordID).ToList<BTSTraceLog>();
        }
    }
}
