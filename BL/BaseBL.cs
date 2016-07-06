using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace BL
{
    public class BaseBL
    {
        #region DM

        public string connStr;
        protected DsConnection dsConn;

        #endregion

        #region Ctor - BaseBL

        public BaseBL(string connStr)
        {
            this.connStr = connStr;
            this.dsConn = new DAL.DsConnection();
        }

        #endregion
    }
}
