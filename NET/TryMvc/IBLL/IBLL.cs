using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IBLL
{
    public partial interface IUserBLL : IbaseBLL<MODEL.USER> { }
    public partial interface IPermissionBLL : IbaseBLL<MODEL.PERMISSION> { }
    public partial interface ISchoolBLL : IbaseBLL<MODEL.SCHOOL> { }
}
