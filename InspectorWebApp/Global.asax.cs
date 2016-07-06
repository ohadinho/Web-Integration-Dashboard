using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace InspectorWebApp
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
               "HL7Interface", // Route name
               "Interfaces/HL7", // URL with parameters
               new { controller = "Interfaces", action = "HL7", id = UrlParameter.Optional } // Parameter defaults
           );

            routes.MapRoute(
               "CASDIMInterface", // Route name
               "Interfaces/CASDIM", // URL with parameters
               new { controller = "Interfaces", action = "CASDIM", id = UrlParameter.Optional } // Parameter defaults
           );            

            routes.MapRoute(
               "CDAInterface", // Route name
               "Interfaces/CDA", // URL with parameters
               new { controller = "Interfaces", action = "CDA", id = UrlParameter.Optional } // Parameter defaults
           );

            routes.MapRoute(
               "ATDInterface", // Route name
               "Interfaces/ATD", // URL with parameters
               new { controller = "Interfaces", action = "ATD", id = UrlParameter.Optional } // Parameter defaults
           );

            routes.MapRoute(
               "ATDMokedInterface", // Route name
               "Interfaces/ATDMoked", // URL with parameters
               new { controller = "Interfaces", action = "ATDMoked", id = UrlParameter.Optional } // Parameter defaults
           );

            routes.MapRoute(
               "SurgeryInterface", // Route name
               "Interfaces/Surgery", // URL with parameters
               new { controller = "Interfaces", action = "Surgery", id = UrlParameter.Optional } // Parameter defaults
           );            

            routes.MapRoute(
               "ResultsRetrievalDist", // Route name
               "Interfaces/ResultsRetrievalDist", // URL with parameters
               new { controller = "Interfaces", action = "ResultsRetrievalDist", id = UrlParameter.Optional } // Parameter defaults
           );

            routes.MapRoute(
               "RentgenRetrievalDist", // Route name
               "Interfaces/RentgenRetrievalDist", // URL with parameters
               new { controller = "Interfaces", action = "RentgenRetrievalDist", id = UrlParameter.Optional } // Parameter defaults
           );

            routes.MapRoute(
               "InterfaxSubscribers", // Route name
               "Interfaces/InterfaxSubscribers", // URL with parameters
               new { controller = "Interfaces", action = "InterfaxSubscribers", id = UrlParameter.Optional } // Parameter defaults
           );

            routes.MapRoute(
               "SearchMessage", // Route name
               "Interfaces/SearchMessage", // URL with parameters
               new { controller = "Interfaces", action = "SearchMessage", id = UrlParameter.Optional } // Parameter defaults
           );

            routes.MapRoute(
               "Validator", // Route name
               "Interfaces/Validator", // URL with parameters
               new { controller = "Interfaces", action = "Validator", id = UrlParameter.Optional } // Parameter defaults
           );

            routes.MapRoute(
               "ProcessGraph", // Route name
               "Interfaces/ProcessGraph", // URL with parameters
               new { controller = "Interfaces", action = "ProcessGraph", id = UrlParameter.Optional } // Parameter defaults
           );

            routes.MapRoute(
               "AccessDenied", // Route name
               "AccessDenied", // URL with parameters
               new { controller = "AccessDenied", action = "Index", id = UrlParameter.Optional } // Parameter defaults
           );

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );            
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterRoutes(RouteTable.Routes);

          //  ValueProviderFactories.Factories.Add(new System.Web.Mvc.JsonValueProviderFactory());
        }

        protected void Application_EndRequest(Object sender, EventArgs e)
        {
            if (HttpContext.Current.Response.Status.StartsWith("401"))
            {
                HttpContext.Current.Response.ClearContent();
                Response.Redirect("~/AccessDenied");
            }
        }
    }
}