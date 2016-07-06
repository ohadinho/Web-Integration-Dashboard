using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcApplication3.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["CurrentPage"] = "Dashboard";
            ViewData["NewsTitle"] = "Integration News";
            ViewData["UserName"] = User.Identity.Name.Split('\\').ElementAt(1);
            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
