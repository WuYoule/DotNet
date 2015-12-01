using Spring.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace MVCOA.Logic
{
    public class HomeController : Controller
    {
        /// <summary>
        /// 测试数据
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            List<MODEL.Ou_Permission> bll = Helper.OperateContext.BLLSession.IOu_PermissionBLL.GetListBy(P => P.pIsDel == false);//DI.SpringHelper.GetObject<IBLL.IOu_PermissionBLL>("BLL");
            return View();


        }
    }
}
