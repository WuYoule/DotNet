using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace DALMSSQL
{
   public class DBSessionFactory:IDAL.IDBSessionFactory
    {
       //在线程中公用一个DBSession对象

        public IDAL.IDBSession GetSession()
        {
            IDAL.IDBSession dbsession = CallContext.GetData(typeof(DBSessionFactory).Name) as DBSession;
            if (dbsession == null)
            {
                dbsession = new DBSession();
                CallContext.SetData(typeof(DBSessionFactory).Name, dbsession);
            }
            return dbsession;
        }
    }
}
