using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAL
{
    //数据仓储工厂
    public interface IDBSessionFactory
    {
        IDAL.IDBSession GetSession();
    }
}
