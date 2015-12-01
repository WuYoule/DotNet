using MODEL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial class UserDAL : baseDAL<MODEL.USER>, IDAL.IUserDAL { }
    public partial class PermissionDAL : baseDAL<MODEL.PERMISSION>, IDAL.IPermissionDAL { }
    public partial class SchoolDAL : baseDAL<MODEL.SCHOOL>, IDAL.ISchoolDAL { }
}
