using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAL
{
    //EF上下文工厂
    public interface IDbContextFactory
    {
        DbContext GetDbContext();
    }
}
