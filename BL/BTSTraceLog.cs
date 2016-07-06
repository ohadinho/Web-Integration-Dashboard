using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TreeNodes;

namespace BL
{
    public enum eStatusCode
    {
        Failure = 10,
        Rejection = 20,
        Update = 30,
        Success = 40
    }

    /// <summary>
    /// Reflects the BTSTraceLog table according the sql
    /// </summary>
    public class BTSTraceLog : GUIDTree
    {
        #region Props - Columns BTSTraceLog table

        public string RecordID { get; set; }
        public string ProcessName { get; set; }
        public string ProcessInstanceID { get; set; }
        public string SrvName { get; set; }
        public string StatusCode { get; set; }
        public string SrvBeginDate { get; set; }
        public string SrvEndDate { get; set; }
        public string SrvKey1 { get; set; }
        public string SrvKey2 { get; set; }
        public string SrvKey3 { get; set; }
        public string TargetTransactionID { get; set; }
        public string FullExceptionText { get; set; }

        #endregion

        #region Ctor

        public BTSTraceLog(string serviceInstanceId, string prevServiceInstanceId, string nextServiceName) 
            : base(serviceInstanceId, prevServiceInstanceId, nextServiceName)
        {
        }

        public BTSTraceLog(string recordId, string processInstanceId, string srvName, string statusCode, string srvBeginDate, string srvEndDate, string srvKey1, string srvKey2, string srvKey3, string fullExceptionText, string serviceInstanceId, string prevServiceInstanceId, string targetTransactionID, string nextServiceName)
            : base(serviceInstanceId, prevServiceInstanceId, nextServiceName)
        {
            this.RecordID = recordId;
            this.ProcessInstanceID = processInstanceId;
            this.SrvName = srvName;
            this.StatusCode = statusCode;
            this.SrvBeginDate = srvBeginDate;
            this.SrvEndDate = srvEndDate;
            this.SrvKey1 = srvKey1;
            this.SrvKey2 = srvKey2;
            this.SrvKey3 = srvKey3;
            this.TargetTransactionID = targetTransactionID;
            this.FullExceptionText = fullExceptionText;
        }

        #endregion
    }
}
