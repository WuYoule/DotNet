using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using System.Threading.Tasks;
using System.Data.Entity.Infrastructure;
using System.Reflection;

namespace DAL
{
   public class baseDAL<T>:IDAL.IbaseDAL<T> where T:class,new()
    {
       DbContext db =new MODEL.COEntities();

        public int Add(T model)
        {
            db.Set<T>().Add(model);
            return db.SaveChanges();
        }

        public int Del(T model)
        {
            db.Set<T>().Attach(model);
            db.Set<T>().Remove(model);
            return db.SaveChanges();
        }

        public int DelBy(System.Linq.Expressions.Expression<Func<T, bool>> delWhere)
        {
            List<T> listDeleting = db.Set<T>().Where(delWhere).ToList();
            listDeleting.ForEach(u => {
                db.Set<T>().Attach(u);
                db.Set<T>().Remove(u);
            
            });
            return db.SaveChanges();
        }

        public int Modify(T model, params string[] proNames)
        {
            DbEntityEntry entry = db.Entry<T>(model);
            entry.State = System.Data.EntityState.Unchanged;
            foreach (string item in proNames)
            {
                entry.Property(item).IsModified = true;
            }
            return db.SaveChanges();
        }

        public int ModifyBy(T model, System.Linq.Expressions.Expression<Func<T, bool>> whereLambda, params string[] modifyProNames)
        {
            List<T> listModifing = db.Set<T>().Where(whereLambda).ToList();
            Type t=typeof(T);
            List<PropertyInfo> proInfos = t.GetProperties(BindingFlags.Instance|BindingFlags.Public).ToList();
            Dictionary<string, PropertyInfo> dicPros = new Dictionary<string, PropertyInfo>();
            proInfos.ForEach(p => {
                if (modifyProNames.Contains(p.Name))
                {
                    dicPros.Add(p.Name,p);
                }
            
            });
            foreach (string proName in modifyProNames)
            {
                //判断 要修改的属性名是否在 实体类的属性集合中存在
                if (dicPros.ContainsKey(proName))
                {
                    //如果存在，则取出要修改的 属性对象
                    PropertyInfo proInfo = dicPros[proName];
                    //取出 要修改的值
                    object newValue = proInfo.GetValue(model, null); //object newValue = model.uName;

                    //4.4批量设置 要修改 对象的 属性
                    foreach (T usrO in listModifing)
                    {
                        //为 要修改的对象 的 要修改的属性 设置新的值
                        proInfo.SetValue(usrO, newValue, null); //usrO.uName = newValue;
                    }
                }
            }
            //4.4一次性 生成sql语句到数据库执行
            return db.SaveChanges();
        }

        public List<T> GetListBy(System.Linq.Expressions.Expression<Func<T, bool>> whereLambda)
        {
            return db.Set<T>().Where(whereLambda).ToList();
           
        }

        public List<T> GetListBy<TKey>(System.Linq.Expressions.Expression<Func<T, bool>> whereLambda, System.Linq.Expressions.Expression<Func<T, TKey>> orderLambda)
        {
            return db.Set<T>().Where(whereLambda).OrderBy(orderLambda).ToList();
        }

        public List<T> GetPagedList(int pageIndex, int pageSize, System.Linq.Expressions.Expression<Func<T, bool>> whereLambda, Func<T, object> orderLambda)
        {
            return db.Set<T>().Where(whereLambda).OrderBy(orderLambda).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
        }






    }
}
