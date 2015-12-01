using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace IDAL
{
  public interface IbaseDAL<T> where  T:class,new()
    {
      //新增实体
      int Add(T model);

      //根据 id 删除
      int Del(T model);
      
      //根据条件删除
      int DelBy(Expression<Func<T,bool>> delWhere);

      //修改
      int Modify(T model,params string[] proNames);

      //根据条件修改
      int ModifyBy(T model,Expression<Func<T,bool>> whereLambda,params string[] modifyProNames);

      //根据条件查询
      List<T> GetListBy(Expression<Func<T,bool>> whereLambda);

      //根据条件查询并排序
      List<T> GetListBy<TKey>(Expression<Func<T,bool>> whereLambda,Expression<Func<T,TKey>> orderLambda);

      //分页查询
      List<T> GetPagedList(int pageIndex, int pageSize, Expression<Func<T, bool>> whereLambda, Func<T, object> orderLambda);

    
    }
}
