using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TreeNodes
{
    /// <summary>
    /// Display hierarchical order according the serviceInstanceID's information.
    /// </summary>
    public class GUIDTree
    {
        #region Props

        public string ServiceInstanceId { get; set; }
        public string PrevServiceInstanceId { get; set; }
        public string NextServiceName { get; set; }

        #endregion

        #region Ctor GUIDTree

        public GUIDTree(string serviceInstanceId, string prevServiceInstanceId, string nextServiceName)
        {
            this.ServiceInstanceId = serviceInstanceId;
            this.PrevServiceInstanceId = prevServiceInstanceId;
            this.NextServiceName = nextServiceName;
        }

        #endregion
    }
}
