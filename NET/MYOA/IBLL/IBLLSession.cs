using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IBLL
{
    public partial interface IBLLSession
    {
        IBill_LeaveBLL IBill_LeaveBLL { get; set; }
        IOu_DepartmentBLL IOu_DepartmentBLL { get; set; }
        IOu_PermissionBLL IOu_PermissionBLL { get; set; }
        IOu_RoleBLL IOu_RoleBLL { get; set; }
        IOu_RolePermissonBLL IOu_RolePermissonBLL { get; set; }
        IOu_UserInfoBLL IOu_UserInfoBLL { get; set; }
        IOu_UserRoleBLL IOu_UserRoleBLL { get; set; }
        IOu_UserVipPermissonBLL IOu_UserVipPermissonBLL { get; set; }
        IWF_AutoTransactNodeBLL IWF_AutoTransactNodeNLL { get;set;}
        IWF_BillFlowNodeBLL IWF_BillFlowNodeBLL { get; set; }
        IWF_BillFlowNodeRemarkBLL IWF_BillFlowNodeRemarkBLL { get; set; }
        IWF_BillStateBLL IWF_BillStateBLL { get; set; }
        IWF_NodeBLL IWF_NodeBLL { get; set; }
        IWF_NodeStateBLL IWF_NodeStateBLL { get; set; }
        IWF_WorkFlowBLL IWF_WorkFlowBLL { get; set; }
        IWF_WorkFlowNodeBLL IWF_WorkFlowNodeBLL { get; set; }
    }

}
