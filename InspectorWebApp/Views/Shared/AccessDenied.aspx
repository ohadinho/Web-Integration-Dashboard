<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="ContentHeaderAccessDenied" ContentPlaceHolderID="headPh" runat="server">
    <base href="/">
</asp:Content>

<asp:Content ID="ContentMainAccessDenied" ContentPlaceHolderID="bodyPh" runat="server">
    <section id="container" class="">
<!--main content start-->
      <section id="main-content">
          <section class="wrapper" style="padding:0"> 
                <div class="row"  style="background-color:#F5DA81;border-bottom:solid 2px #F5A000; padding:1em">
                    <div class="col-lg-12">
                        <div>
                            <i class="fa fa-exclamation-triangle fa-3x"></i>
                            <span style="font-size:2em">
                                401 - Unauthorized
                            </span>
                        </div>
                    </div>                    
                </div>
                <div class="row" style="padding: 2em 0 0 2em">
                    Please contact the system administrator for more details: <a href="mailto:ohadav@clalit.org.il">ohadav@clalit.org.il</a>
                </div>
          </section>
       </section>
    </section>
</asp:Content>
