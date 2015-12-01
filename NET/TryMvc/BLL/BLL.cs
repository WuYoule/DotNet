using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public partial class UserBLL : baseBLL<MODEL.USER>, IBLL.IUserBLL
    {

        public override void SetDAL()
        {
            DAL.UserDAL dal = new DAL.UserDAL();
            idal = dal;
        }

    }
    public partial class PermissionBLL : baseBLL<MODEL.PERMISSION>, IBLL.IPermissionBLL
    {

        public override void SetDAL()
        {
            DAL.PermissionDAL dal = new DAL.PermissionDAL();
            idal = dal;
        }


    }
    public partial class SchoolBLL : baseBLL<MODEL.SCHOOL>, IBLL.ISchoolBLL {

        public override void SetDAL()
        {
            DAL.SchoolDAL dal = new DAL.SchoolDAL();
            idal = dal;
        }

    }
}
