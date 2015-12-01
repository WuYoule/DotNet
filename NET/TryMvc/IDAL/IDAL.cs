using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAL
{
 
       public partial interface IUserDAL:IbaseDAL<MODEL.USER> { };
       public partial interface IPermissionDAL : IbaseDAL<MODEL.PERMISSION> { };
       public partial interface ISchoolDAL : IbaseDAL<MODEL.SCHOOL> { };

}
