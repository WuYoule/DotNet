using Spring.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DI
{
    public static class SpringHelper
    {
        public static T GetObject<T>(string name) where T : class
        {
            IApplicationContext ctx = Spring.Context.Support.ContextRegistry.GetContext();
            T t = (T)ctx.GetObject(name);
            return t;
        }
    }
}
