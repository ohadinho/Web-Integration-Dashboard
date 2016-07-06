using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using BL;
using TreeNodes;

namespace Tester
{
    class Program
    {
        static void Main(string[] args)
        {
            List<BTSTraceLog> list = new List<BTSTraceLog>();
            list.Add(new BTSTraceLog("1","OHADProc", "Recv", "40", "2015-11-10", "2015-11-10", "Hello", "World", "Yes", "Error", "1a", null, "aaa", ""));
            list.Add(new BTSTraceLog("1", "OHADProc", "Dispatcher", "40", "2015-11-10", "2015-11-10", "", "AA", "", "", "2a", "1a", "aaa", ""));
            list.Add(new BTSTraceLog("1", "OHADProc", "DispatcherSecond", "40", "2015-11-10", "2015-11-10", "", "BBB", "CC", "", "2b", "1a", "aaa", ""));
            list.Add(new BTSTraceLog("1", "OHADProc", "SendToMSMQ", "40", "2015-11-10", "2015-11-10", "1231", "", "", "Error Error Error Error Error Error Error Error Error Error", "2c", "1a", "aaa", ""));
            list.Add(new BTSTraceLog("1", "OHADProc", "SendToCDR", "40", "2015-11-10", "2015-11-10", "", "Results", "", "", "3a", "2a", "aaa", ""));
            list.Add(new BTSTraceLog("1", "OHADProc", "SendToFile", "30", "2015-11-10", "2015-11-10", "", "AA", "", "", "3b", "2b", null, ""));
            list.Add(new BTSTraceLog("1", "OHADProc", "SendToFile", "20", "2015-11-10", "2015-11-10", "", "AA", "", "", "3c", "2c", null, ""));
            list.Add(new BTSTraceLog("1", "OHADProc", "SendToFile", "10", "2015-11-10", "2015-11-10", "", "AA", "", "Error Error Error Error Error Error Error Error Error Error", "3d", "2c", null, ""));
            list.Add(new BTSTraceLog("1", "OHADProc", "SendToFile", "10", "2015-11-10", "2015-11-10", "", "AA", "", "Error Error Error Error Error Error Error Error Error Error", "3e", "2c", null, ""));

            BTSTraceLogTree.GetJsonTree(list);            
            
        }
    }
}
