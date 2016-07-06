using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InspectorWebApp.Controllers
{
    public class AccessDeniedController : Controller
    {
        //
        // GET: /AccessDenied/

        public ActionResult Index()
        {
            ViewData["UserName"] = User.Identity.Name.Split('\\').ElementAt(1);
            return View("AccessDenied");
        }

    }
}
