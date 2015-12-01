using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace DALMSSQL
{
    class DbContextFactory:IDAL.IDbContextFactory
    {
      

        public System.Data.Entity.DbContext GetDbContext()
        {

            DbContext dbcontext = CallContext.GetData(typeof(DbContextFactory).Name) as DbContext;
            if (dbcontext==null)
            {
                dbcontext = new MODEL.OAEntities();
                CallContext.SetData(typeof(DbContextFactory).Name, dbcontext);
            }
            return dbcontext;
        }
    }
}
