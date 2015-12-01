using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DALMSSQL
{
   public partial class DBSession:IDAL.IDBSession
    {
        

        IDAL.IBill_LeaveDAL iBill_LeaveDAL;
        public IDAL.IBill_LeaveDAL IBill_LeaveDAL
        {
            get
            {
                if (iBill_LeaveDAL==null)
                {
                    iBill_LeaveDAL = new DALMSSQL.Bill_LeaveDAL();
                  
                }
                return iBill_LeaveDAL;
            }
            set
            {
                iBill_LeaveDAL = value;
            }
        }

         IDAL.IOu_DepartmentDAL iOu_DepartmentDAL;
        public IDAL.IOu_DepartmentDAL IOu_DepartmentDAL
        {
            get
            {
                if (iOu_DepartmentDAL==null)
                {
                    iOu_DepartmentDAL = new DALMSSQL.Ou_DepartmentDAL();
                }
                return iOu_DepartmentDAL;
                     
            }
            set
            {

                iOu_DepartmentDAL = value;
            }
        }
        IDAL.IOu_PermissionDAL iOu_PermissionDAL;
        public IDAL.IOu_PermissionDAL IOu_PermissionDAL
        {
            get
            {
                if (iOu_PermissionDAL==null)
                {
                    iOu_PermissionDAL = new DALMSSQL.Ou_PermissionDAL();
                }
                return iOu_PermissionDAL;

            }
            set
            {
                iOu_PermissionDAL = value;
            }
        }

        IDAL.IOu_RoleDAL iOu_RoleDAL;
        public IDAL.IOu_RoleDAL IOu_RoleDAL
        {
            get
            {
                if (iOu_RoleDAL == null)
                {
                    iOu_RoleDAL = new DALMSSQL.Ou_RoleDAL();
                }
                return iOu_RoleDAL;

            }
            set
            {

                iOu_RoleDAL = value;
            }
        }
        IDAL.IOu_RolePermissonDAL iOu_RolePermissonDAL;
        public IDAL.IOu_RolePermissonDAL IOu_RolePermissonDAL
        {
            get
            {
                if (iOu_RolePermissonDAL == null)
                {
                    iOu_RolePermissonDAL = new DALMSSQL.Ou_RolePermissonDAL();
                }
                return iOu_RolePermissonDAL;

            }
            set
            {

                iOu_RolePermissonDAL = value;
            }
        }

        IDAL.IOu_UserInfoDAL iOu_UserInfoDAL;
        public IDAL.IOu_UserInfoDAL IOu_UserInfoDAL
        {
            get
            {
                if (iOu_UserInfoDAL == null)
                {
                    iOu_UserInfoDAL = new DALMSSQL.Ou_UserInfoDAL();
                }
                return iOu_UserInfoDAL;

            }
            set
            {

                iOu_UserInfoDAL = value;
            }
        }
        IDAL.IOu_UserRoleDAL iOu_UserRoleDAL;
        public IDAL.IOu_UserRoleDAL IOu_UserRoleDAL
        {
            get
            {
                if (iOu_UserRoleDAL == null)
                {
                    iOu_UserRoleDAL = new DALMSSQL.Ou_UserRoleDAL();
                }
                return iOu_UserRoleDAL;

            }
            set
            {

                iOu_UserRoleDAL = value;
            }
        }
        IDAL.IOu_UserVipPermissonDAL iOu_UserVipPermissionDAL;
        public IDAL.IOu_UserVipPermissonDAL IOu_UserVipPermissionDAL
        {
            get
            {
                if (iOu_UserVipPermissionDAL == null)
                {
                    iOu_UserVipPermissionDAL = new DALMSSQL.Ou_UserVipPermissonDAL();
                }
                return iOu_UserVipPermissionDAL;

            }
            set
            {

                iOu_UserVipPermissionDAL = value;
            }
        }

        IDAL.IWF_AutoTransactNodeDAL iWF_AutoTransactNodeDAL;
        public IDAL.IWF_AutoTransactNodeDAL IWF_AutoTransactNodeDAL
        {
            get
            {
                if (iWF_AutoTransactNodeDAL == null)
                {
                    iWF_AutoTransactNodeDAL = new DALMSSQL.WF_AutoTransactNodeDAL();
                }
                return iWF_AutoTransactNodeDAL;

            }
            set
            {

                iWF_AutoTransactNodeDAL = value;
            }
        }

        IDAL.IWF_BillFlowNodeDAL iWF_BillFlowNodeDAL;

        public IDAL.IWF_BillFlowNodeDAL IWF_BillFlowNodeDAL
        {
            get
            {
                if (iWF_BillFlowNodeDAL == null)
                {
                    iWF_BillFlowNodeDAL = new DALMSSQL.WF_BillFlowNodeDAL();
                }
                return iWF_BillFlowNodeDAL;

            }
            set
            {

                iWF_BillFlowNodeDAL = value;
            }
        }
        IDAL.IWF_BillFlowNodeRemarkDAL iWF_BillFlowNodeRemarkDAL;
        public IDAL.IWF_BillFlowNodeRemarkDAL IWF_BillFlowNodeRemarkDAL
        {
            get
            {
                if (iWF_BillFlowNodeRemarkDAL == null)
                {
                    iWF_BillFlowNodeRemarkDAL = new DALMSSQL.WF_BillFlowNodeRemarkDAL();
                }
                return iWF_BillFlowNodeRemarkDAL;

            }
            set
            {

                iWF_BillFlowNodeRemarkDAL = value;
            }
        }
        IDAL.IWF_BillStateDAL iWF_BillStateDAL;
        public IDAL.IWF_BillStateDAL IWF_BillStateDAL
        {
            get
            {
                if (iWF_BillStateDAL == null)
                {
                    iWF_BillStateDAL = new DALMSSQL.WF_BillStateDAL();
                }
                return iWF_BillStateDAL;

            }
            set
            {

                iWF_BillStateDAL = value;
            }
        }

        IDAL.IWF_NodeDAL iWF_NodeDAL;
        public IDAL.IWF_NodeDAL IWF_NodeDAL
        {
            get
            {
                if (iWF_NodeDAL == null)
                {
                    iWF_NodeDAL = new DALMSSQL.WF_NodeDAL();
                }
                return iWF_NodeDAL;

            }
            set
            {

                iWF_NodeDAL = value;
            }
        }

        IDAL.IWF_NodeStateDAL iWF_NodeStateDAL;
        public IDAL.IWF_NodeStateDAL IWF_NodeStateDAL
        {
            get
            {
                if (iWF_NodeStateDAL==null)
                {
                    iWF_NodeStateDAL = new DALMSSQL.WF_NodeStateDAL();
                }
                return iWF_NodeStateDAL;
            }
            set
            {
                iWF_NodeStateDAL = value;
            }
        }

        IDAL.IWF_WorkFlowDAL iWF_WorkFlowDAL;
        public IDAL.IWF_WorkFlowDAL IWF_WorkFlowDAL
        {
            get
            {
                if (iWF_WorkFlowDAL==null)
                {
                    iWF_WorkFlowDAL = new DALMSSQL.WF_WorkFlowDAL();
                }
                return iWF_WorkFlowDAL;
            }
            set
            {
                iWF_WorkFlowDAL = value;
            }
        }
        IDAL.IWF_WorkFlowNodeDAL iWF_WorkFlowNodeDAL;
        public IDAL.IWF_WorkFlowNodeDAL IWF_WorkFlowNodeDAL
        {
            get
            {
                if (iWF_WorkFlowNodeDAL==null)
                {
                    iWF_WorkFlowNodeDAL = new DALMSSQL.WF_WorkFlowNodeDAL();
                }
                return iWF_WorkFlowNodeDAL;

            }
            set
            {
                iWF_WorkFlowNodeDAL = value;
            }
        }
    }
}
