using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.Data;

namespace InspectorWebApp.Controllers
{
    public class NewsController : Controller
    {
        //
        // GET: /News/

        public ActionResult Labs()
        {
            ViewData["UserName"] = User.Identity.Name.Split('\\').ElementAt(1);
            ViewData["CurrentPage"] = "News";
            ViewData["NewsTitle"] = "Labs News";
            SetOwnerNews("Labs");

            return View("Index");
        }        

        public ActionResult Rentgen()
        {
            ViewData["UserName"] = User.Identity.Name.Split('\\').ElementAt(1);
            ViewData["CurrentPage"] = "News";
            ViewData["NewsTitle"] = "Rentgen News";
            SetOwnerNews("Rentgen");
            return View("Index");
        }

        public ActionResult ATD()
        {
            ViewData["UserName"] = User.Identity.Name.Split('\\').ElementAt(1);
            ViewData["CurrentPage"] = "News";
            ViewData["NewsTitle"] = "ATD News";
            SetOwnerNews("ATD");
            return View("Index");
        }

        public ActionResult Clicks()
        {
            ViewData["UserName"] = User.Identity.Name.Split('\\').ElementAt(1);
            ViewData["CurrentPage"] = "News";
            ViewData["NewsTitle"] = "Labs News";
            SetOwnerNews("Clicks");
            return View("Index");
        }

        public ActionResult Surgery()
        {            
            ViewData["UserName"] = User.Identity.Name.Split('\\').ElementAt(1);
            ViewData["CurrentPage"] = "News";
            ViewData["NewsTitle"] = "Surgery News";
            SetOwnerNews("Surgery");
            return View("Index");
        }


        private void SetOwnerNews(string owner)
        {
            BL.IntegrationBL integrationBL = new BL.IntegrationBL(ConfigurationManager.ConnectionStrings["IntegrationDev"].ConnectionString);
            DataTable dt = integrationBL.OwnerTopFiveNews(owner);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ViewData["NewsDate" + i.ToString()] = dt.Rows[i]["PublishedOn"];
                ViewData["NewsSubject" + i.ToString()] = dt.Rows[i]["Subject"];
                ViewData["NewsContent" + i.ToString()] = dt.Rows[i]["Content"];
            }
        }
    }
}
