using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace MvcMy.Controllers
{
    public class IndexController : Controller
    {
        #region 定义的格式模板
        string startSecondTemplate = "<ul class='nav nav-second-level'>";
        string endSecondTemplate = "</ul>";
        string startThirdTemplate = "<ul class='nav nav-third-level'>";
        string endThirdTemplate = "</ul>";
        string startLiTag = "<li>";
        string endLiTag = "</li>";


        string firstTemplateNoChild =
                           @"
                               <li>
                                  <a href='{0}'><i class='fa fa-dashboard fa-fw'></i> {1}</a>
                               </li>";
        string firstTemplateWithChild =
                            " <a href='#'><i class='fa fa-bar-chart-o fa-fw'></i> {0}<span class='fa arrow'></span></a>";

        string commonTemplate =
                           @"
                               <li>
                                  <a href='/Index/{0}'>{1}</a>
                               </li>     
                             ";

        #endregion
        BLL.SchoolBLL sbll = new BLL.SchoolBLL();

        #region 展示首页面
        public ActionResult Index()
        {


            if (IsLogin())
            {
                ViewBag.MenuData = Session["menu"];
                return View();
            }
            else
            {
                return Redirect("/Login/Login");
            }



        }
        #endregion
        #region 展示学校数据页面
        public ActionResult School()
        {

            if (IsLogin())
            {
                ViewBag.MenuData = Session["menu"];
                return View();
            }
            else
            {
                return Redirect("/Login/Login");
            }


        }
        #endregion

        #region 获取学校数据（初始化和分页）
        public ActionResult GetSchoolData()
        {

            int pageIndex = Request["page"] == null ? 1 : int.Parse(Request["page"]);
            int pageSize = Request["rows"] == null ? 10 : int.Parse(Request["rows"]);
            List<MODEL.SCHOOL> list =
                sbll.GetPagedList(pageIndex, pageSize, s => s.SCHOOL_ID != "0", s => int.Parse(s.SCHOOL_ID)).Select(s => s.TOPOCO()).ToList();

            List<MODEL.SCHOOL> all = sbll.GetListBy(s => s.SCHOOL_ID != "0").Select(s => s.TOPOCO()).ToList();
            MODEL.DataModel.DataGridModel dgModel = new MODEL.DataModel.DataGridModel
            {
                total = all.Count,
                rows = list

            };
            return Json(dgModel); ;
        }
        #endregion
        #region 添加学校

        public ActionResult AddSchool()
        {
            List<MODEL.SCHOOL> list = sbll.GetListBy(s => s.SCHOOL_ID != "0").OrderByDescending(s => int.Parse(s.SCHOOL_ID)).Select(s => s.TOPOCO()).ToList();
            string maxSchoolID = "";
            if (list.Count > 0)
            {
                maxSchoolID = (int.Parse(list[0].SCHOOL_ID) + 1).ToString();
            }
            else
            {
                maxSchoolID = "1";
            }
            MODEL.SCHOOL school = new MODEL.SCHOOL()
            {
                SCHOOL_NAME = Request["schoolname"],
                SCHOOL_N = Request["schooln"],
                SCHOOL_AREA = Request["schoolarea"],
                SCHOOL_TYPE = Request["schooltype"],
                SCHOOL_ID = maxSchoolID
            };
            if (sbll.Add(school) > 0)
            {
                return Content("Y");
            }
            else
            {
                return Content("N");
            }
        }
        #endregion
        #region 修改学校数据之前加载数据

        public ActionResult editSchoolBefore()
        {
            string schoolId = Request["schoolId"];
            MODEL.SCHOOL school = sbll.GetListBy(s => s.SCHOOL_ID == schoolId).Select(s => s.TOPOCO()).FirstOrDefault();
            return Json(school);

        }
        #endregion
        #region 删除一条数据
        public ActionResult delSchool()
        {
            string schoolId = Request["id"];
            if (sbll.DelBy(s => s.SCHOOL_ID == schoolId) > 0)
            {
                return Content("Y");
            }
            else
            {
                return Content("N");
            }
        }
        #endregion
        #region 提交要修改的学校数据
        public ActionResult editSchool()
        {

            MODEL.SCHOOL school = new MODEL.SCHOOL()
            {
                SCHOOL_ID = Request["schoolId"],
                SCHOOL_NAME = Request["schoolname_edit"],
                SCHOOL_N = Request["schooln_edit"],
                SCHOOL_AREA = Request["schoolarea_edit"],
                SCHOOL_TYPE = Request["schooltype_edit"]
            };
            if (sbll.Modify(school, "SCHOOL_NAME", "SCHOOL_N", "SCHOOL_TYPE", "SCHOOL_AREA") > 0)
            {
                return Content("Y");
            }
            else
            {
                return Content("N");
            }
        }
        #endregion
        #region 判断登陆
        public bool IsLogin()
        {
            if (Session["userinfo"] == null)
            {
                if (Request.Cookies["userinfo"] == null)
                {
                    return false;
                }
                else
                {
                    GetMenuData();
                    return true;
                }

            }
            else
            {
                GetMenuData();
                return true;

            }

        }
        #endregion
        #region 获取菜单数据
        public string GetMenuData()
        {
            BLL.PermissionBLL per = new BLL.PermissionBLL();
            List<MODEL.PERMISSION> allPerlists = per.GetListBy(p => p.RID == 3).ToList();

            string sbp = "";
            string sbc = "";

            allPerlists.ForEach(p =>
            {
                int temp = per.GetListBy(t => t.ParentID == p.PID).Count;

                if (p.ParentID == 0 && temp == 0)
                {

                    sbp += string.Format(firstTemplateNoChild, p.PN, p.PNAMN);
                }
                else if (p.ParentID == 0 && temp != 0)
                {
                    List<MODEL.PERMISSION> childLists = per.GetListBy(t => t.ParentID == p.PID).ToList();
                    sbc += startLiTag;
                    sbc += string.Format(firstTemplateWithChild, p.PNAMN);
                    sbc += startSecondTemplate;
                    childLists.ForEach(c =>
                    {
                        sbc += string.Format(commonTemplate, c.PN, c.PNAMN);

                    });
                    sbc += endSecondTemplate;
                    sbc += endLiTag;
                }

            });
            Session["menu"] = sbp + sbc;
            return sbp + sbc;

        }

        #endregion

        #region 批量删除
        
       
        public ActionResult moreDelSchool() {
            string moreid = Request["moreid"];
            string[] ids= moreid.Split(',');
            try
            {
                foreach (string item in ids)
                {
                    sbll.DelBy(s => s.SCHOOL_ID == item);
                }
                return Content("Y");
            }
            catch (Exception)
            {

                return Content("N") ;
            }
           
           
                
        }
        #endregion


    }
}
