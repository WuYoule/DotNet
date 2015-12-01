using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web.Security;


namespace MVCOA.BackStage
{
    public class AdminController : Controller
    {
        [HttpGet]
        public ActionResult login()
        {
            return View();

        }

        [HttpPost]
        public ActionResult login(FormCollection form)
        {
            string name = form["txtname"];
            string pwd = form["txtpwd"];
            MODEL.Ou_UserInfo user = Helper.OperateContext.BLLSession.IOu_UserInfoBLL.GetListBy(u => u.uLoginName == name).First();
            if (user != null && user.uPwd == System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pwd, "MD5"))
            {
                return Content("ok");

            }
            return Content("no");

        }

    }
}
