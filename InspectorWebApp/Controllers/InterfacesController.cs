using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using BL;

namespace InspectorWebApp.Controllers
{
    public class InterfacesController : Controller
    {
        // GET: /Interfaces/SubInterfaceDummy        
        public ActionResult SubInterfaceDummyA()
        {
            ViewData["UserName"] = User.Identity.Name.Split('\\').ElementAt(1);
            ViewData["Key1Value"] = "1";
            ViewData["Key2Value"] = "2";
            ViewData["Key3Value"] = "3";
            ViewData["MenuSection"] = "InterfacesA";
            ViewData["CurrentPage"] = "SubInterfaceA";
            ViewData["ProcessName"] = "SubInterfaceName";            
            return View("OldEnvView");
        }

        // GET: /Interfaces/SearchMessage        
        public ActionResult SearchMessage()
        {
            ViewData["UserName"] = User.Identity.Name.Split('\\').ElementAt(1);
            ViewData["Key1Value"] = "1";
            ViewData["Key2Value"] = "2";
            ViewData["Key3Value"] = "3";
            ViewData["MenuSection"] = "Interfaces";
            ViewData["CurrentPage"] = "SearchMessage";

            return View("SearchMessageView");
        }

        // GET: /Interfaces/Validator
        [Authorize(Roles = "CLALIT\\BTAdmins")]
        public ActionResult Validator()
        {
            ViewData["MenuSection"] = "Interfaces";
            ViewData["CurrentPage"] = "Validator";
            ViewData["ProcessName"] = "Validator";
            return View("ValidatorView");
        }

        // POST: /Interfaces/Data
        [HttpPost]
        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult Data(string env,string db, string processName, string startDate, string endDate)
        {
            string connStrName = Request.Form["db"] + Request.Form["env"];
            string connStr = ConfigurationManager.ConnectionStrings[connStrName].ConnectionString;
            BL.IntegrationBL integrationBL = new BL.IntegrationBL(connStr);
            string json = integrationBL.ProcessFailuresBetweenDates(processName, System.DateTime.Parse(startDate), System.DateTime.Parse(endDate));

            json = AddMetaDataToJson(json, env, connStrName);
            JsonResult jsonResult = new JsonResult();           
          //  jsonResult.Data = sb.ToString();            
            jsonResult.Data = json;            
            return jsonResult;
        }


        // POST: /Interfaces/Data
        [HttpPost]
        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult SearchMessageData(string env, string db, string processName, string startDate, string endDate, string patientId)
        {
            string connStrName = db + env;
            string connStr = ConfigurationManager.ConnectionStrings[connStrName].ConnectionString;
            BL.IntegrationBL integrationBL = new BL.IntegrationBL(connStr);
            string json = integrationBL.MessageSearch(processName, System.DateTime.Parse(startDate), System.DateTime.Parse(endDate),patientId);
            
            json = AddMetaDataToJson(json, env, connStrName);
            JsonResult jsonResult = new JsonResult();                       
            jsonResult.Data = json;
            return jsonResult;
        }


        // POST: /Interfaces/ValidatorData
        [HttpPost]
        [AcceptVerbs(HttpVerbs.Post)]
        public string ValidatorData()
        {            
            string type = Request.Headers["messageType"];
            string input = Helpers.MessageTypesOperations.ReadFileOfMessageType(type, Request.Files[0].InputStream);
            string errorDesc = Helpers.MessageTypesOperations.Validate(type, input);
            return errorDesc;
        }

        // POST: /Interfaces/ProcessGraphData
        [HttpPost]
        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult ProcessGraphData(string env, string processInstanceID)
        {
            string db = "Integration";
            string connStrName = db + env;
            string connStr = ConfigurationManager.ConnectionStrings[connStrName].ConnectionString;
            BL.IntegrationBL integrationBL = new BL.IntegrationBL(connStr);
            List<BTSTraceLog> listBtl = integrationBL.ProcessIDFromTrace(processInstanceID);
            JsonResult jsonResult = new JsonResult();
            jsonResult.Data = BTSTraceLogTree.GetJsonTree(listBtl);
            return jsonResult;
        }

        public ActionResult ProcessGraphExample()
        {
            JsonResult jsonResult = new JsonResult();
            string jsonStrExample = "{\"chart\":{\"container\":\"#custom-colored\",\"nodeAlign\":\"BOTTOM\",\"connectors\":{\"type\":\"step\"},\"node\":{\"HTMLclass\":\"nodeExample1\"}},\"nodeStructure\":{\"text\":{\"name\":\"Process 1\",\"title\":\"\"},\"HTMLclass\":\"light-green\",\"children\":[{\"text\":{\"name\":\"Process 1.1\",\"title\":\"SrvKey1: \\\\\\\\Path\\\\To\\\\File, \"},\"HTMLclass\":\"light-green\",\"children\":[{\"text\":{\"name\":\"Process 1.1.1\",\"title\":\"Details: Here are the details, \"},\"HTMLclass\":\"light-green\",\"children\":[{\"text\":{\"name\":\"Process 1.1.1.1\",\"title\":\"\"},\"HTMLclass\":\"light-coral\"},{\"text\":{\"name\":\"Process 1.1.1.2\",\"title\":\"\"},\"HTMLclass\":\"light-coral\"}]}]}]}}";
            jsonResult.Data = jsonStrExample;
            ViewData["jsonStr"] = jsonStrExample;
            return View("ProcessGraphView");
        }      

        private string AddMetaDataToJson(string json,string env,string connStrName)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder(json);
            string insertToStart = string.Format("{{\"MetaData\" : {{ \"env\": \"{0}\", \"connStrName\": \"{1}\" }} ,\"Data\" : ", env, connStrName);
            sb = sb.Insert(0, insertToStart);
            sb = sb.Append("}");

            return sb.ToString();
        }

        private bool CheckUserGroup(string userName, string userGroup)
        {
            var wi = new System.Security.Principal.WindowsIdentity(userName);
            var wp = new System.Security.Principal.WindowsPrincipal(wi);

            bool isInRole = wp.IsInRole(userGroup);

            return isInRole;
        }

    }
}
