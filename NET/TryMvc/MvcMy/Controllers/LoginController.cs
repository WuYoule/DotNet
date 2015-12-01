using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcMy.Controllers
{
    public class LoginController : Controller
    {


        [HttpGet]
        public ActionResult Login()
        {
          
            return View();
        }
        [HttpPost]
        public ActionResult Login(MODEL.ViewModel.LoginUser user)
        {
            BLL.UserBLL ubll = new BLL.UserBLL();
            MODEL.USER utemp = ubll.GetListBy(u => u.USER_N == user.LoginName && u.USER_PWD == user.Pwd).FirstOrDefault();
            if (utemp != null)
            {

                if (user.IsAlways)
                {

                    HttpCookie cookie = new HttpCookie("userinfo", utemp.USER_ID);
                    cookie.Expires = DateTime.Now.AddDays(1);

                    Response.Cookies.Add(cookie);
                }
                Session["userinfo"] = utemp;
                return Content("ok");

            }

            else
            {
                return Content("error");
            }

        }
    }
}
