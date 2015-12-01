using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLLA
{
    public partial class BLLSession : IBLL.IBLLSession
    {
        IBLL.IBill_LeaveBLL iBill_LeaveBLL;
        public IBLL.IBill_LeaveBLL IBill_LeaveBLL
        {
            get
            {
                if (iBill_LeaveBLL == null)
                {
                    iBill_LeaveBLL = new BLLA.Bill_Leave();
                 
                   
                  
                }
                return iBill_LeaveBLL;
            }
            set
            {
                iBill_LeaveBLL = value;
            }
        }
        IBLL.IOu_DepartmentBLL iOu_DepartmentBLL;
        public IBLL.IOu_DepartmentBLL IOu_DepartmentBLL
        {
            get
            {
                if (iOu_DepartmentBLL == null)
                {
                    iOu_DepartmentBLL = new BLLA.Ou_Department();
                }
                return iOu_DepartmentBLL;
            }
            set
            {
                iOu_DepartmentBLL = value;
            }
        }

        IBLL.IOu_PermissionBLL iOu_PermissionBLL;
        public IBLL.IOu_PermissionBLL IOu_PermissionBLL
        {
            get
            {
                if (iOu_PermissionBLL == null)
                {
                    iOu_PermissionBLL = new BLLA.Ou_Permission();
                }
                return iOu_PermissionBLL;
            }
            set
            {
                iOu_PermissionBLL = value;
            }
        }

        IBLL.IOu_RoleBLL iOu_RoleBLL;
        public IBLL.IOu_RoleBLL IOu_RoleBLL
        {
            get
            {
                if (iOu_RoleBLL == null)
                {
                    iOu_RoleBLL = new BLLA.Ou_Role();
                }
                return iOu_RoleBLL;
            }
            set
            {
                iOu_RoleBLL = value;
            }
        }

        IBLL.IOu_RolePermissonBLL iOu_RolePermissonBLL;
        public IBLL.IOu_RolePermissonBLL IOu_RolePermissonBLL
        {
            get
            {
                if (iOu_RolePermissonBLL == null)
                {
                    iOu_RolePermissonBLL = new BLLA.Ou_RolePermisson();
                }
                return iOu_RolePermissonBLL;
            }
            set
            {
                iOu_RolePermissonBLL = value;
            }
        }
        IBLL.IOu_UserInfoBLL iOu_UserInfoBLL;
        public IBLL.IOu_UserInfoBLL IOu_UserInfoBLL
        {
            get
            {
                if (iOu_UserInfoBLL == null)
                {
                    iOu_UserInfoBLL = new BLLA.Ou_UserInfo
                        ();
                }
                return iOu_UserInfoBLL;
            }
            set
            {
                iOu_UserInfoBLL = value;
            }
        }


        IBLL.IOu_UserRoleBLL iOu_UserRoleBLL;
        public IBLL.IOu_UserRoleBLL IOu_UserRoleBLL
        {
            get
            {
                if (iOu_UserRoleBLL == null)
                {
                    iOu_UserRoleBLL = new BLLA.Ou_UserRole
                        ();
                }
                return iOu_UserRoleBLL;
            }
            set
            {
                iOu_UserRoleBLL = value;
            }
        }

        IBLL.IOu_UserVipPermissonBLL iOu_UserVipPermissonBLL;
        public IBLL.IOu_UserVipPermissonBLL IOu_UserVipPermissonBLL
        {
            get
            {
                if (iOu_UserVipPermissonBLL == null)
                {
                    iOu_UserVipPermissonBLL = new BLLA.Ou_UserVipPermisson
                        ();
                }
                return iOu_UserVipPermissonBLL;
            }
            set
            {
                iOu_UserVipPermissonBLL = value;
            }
        }

        IBLL.IWF_AutoTransactNodeBLL iWF_AutoTransactNodeNLL;
        public IBLL.IWF_AutoTransactNodeBLL IWF_AutoTransactNodeNLL
        {
            get
            {
                if (iWF_AutoTransactNodeNLL == null)
                {
                    iWF_AutoTransactNodeNLL = new BLLA.WF_AutoTransactNode
                        ();
                }
                return iWF_AutoTransactNodeNLL;
            }
            set
            {
                iWF_AutoTransactNodeNLL = value;
            }
        }

        IBLL.IWF_BillFlowNodeBLL iWF_BillFlowNodeBLL;
        public IBLL.IWF_BillFlowNodeBLL IWF_BillFlowNodeBLL
        {
            get
            {
                if (iWF_BillFlowNodeBLL == null)
                {
                    iWF_BillFlowNodeBLL = new BLLA.WF_BillFlowNode
                        ();
                }
                return iWF_BillFlowNodeBLL;
            }
            set
            {
                iWF_BillFlowNodeBLL = value;
            }
        }


        IBLL.IWF_BillFlowNodeRemarkBLL iWF_BillFlowNodeRemarkBLL;
        public IBLL.IWF_BillFlowNodeRemarkBLL IWF_BillFlowNodeRemarkBLL
        {
            get
            {
                if (iWF_BillFlowNodeRemarkBLL == null)
                {
                    iWF_BillFlowNodeRemarkBLL = new BLLA.WF_BillFlowNodeRemark
                        ();
                }
                return iWF_BillFlowNodeRemarkBLL;
            }
            set
            {
                iWF_BillFlowNodeRemarkBLL = value;
            }
        }


        IBLL.IWF_BillStateBLL iWF_BillStateBLL;
        public IBLL.IWF_BillStateBLL IWF_BillStateBLL
        {
            get
            {
                if (iWF_BillStateBLL == null)
                {
                    iWF_BillStateBLL = new BLLA.WF_BillState
                        ();
                }
                return iWF_BillStateBLL;
            }
            set
            {
                iWF_BillStateBLL = value;
            }
        }


        IBLL.IWF_NodeBLL iWF_NodeBLL;
        public IBLL.IWF_NodeBLL IWF_NodeBLL
        {
            get
            {
                if (iWF_NodeBLL == null)
                {
                    iWF_NodeBLL = new BLLA.WF_Node
                        ();
                }
                return iWF_NodeBLL;
            }
            set
            {
                iWF_NodeBLL = value;
            }
        }


        IBLL.IWF_NodeStateBLL iWF_NodeStateBLL;
        public IBLL.IWF_NodeStateBLL IWF_NodeStateBLL
        {
            get
            {
                if (iWF_NodeStateBLL == null)
                {
                    iWF_NodeStateBLL = new BLLA.WF_NodeState
                        ();
                }
                return iWF_NodeStateBLL;
            }
            set
            {
                iWF_NodeStateBLL = value;
            }
        }


        IBLL.IWF_WorkFlowBLL iWF_WorkFlowBLL;
        public IBLL.IWF_WorkFlowBLL IWF_WorkFlowBLL
        {
            get
            {
                if (iWF_WorkFlowBLL == null)
                {
                    iWF_WorkFlowBLL = new BLLA.WF_WorkFlow
                        ();
                }
                return iWF_WorkFlowBLL;
            }
            set
            {
                iWF_WorkFlowBLL = value;
            }
        }


        IBLL.IWF_WorkFlowNodeBLL iWF_WorkFlowNodeBLL;
        public IBLL.IWF_WorkFlowNodeBLL IWF_WorkFlowNodeBLL
        {
            get
            {
                if (iWF_WorkFlowNodeBLL == null)
                {
                    iWF_WorkFlowNodeBLL = new BLLA.WF_WorkFlowNode
                        ();
                }
                return iWF_WorkFlowNodeBLL;
            }
            set
            {
                iWF_WorkFlowNodeBLL = value;
            }
        }
    }
}
