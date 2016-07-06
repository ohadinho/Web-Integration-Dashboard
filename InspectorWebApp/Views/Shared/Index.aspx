<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="InspectorWebApp.Views.Shared.Index" %>
<asp:Content ID="ContentHeader" ContentPlaceHolderID="headPh" runat="server">
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->  
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="bodyPh" runat="server">
<section id="container" class="">
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">            
              <!--overview start-->
			  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-laptop"></i> Dashboard</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="/Home">Home</a></li>
						<li><i class="fa fa-laptop"></i><%= ViewData["CurrentPage"]  %></li>						  	
					</ol>
				</div>
			</div>
              
				
			<div class="row">
               	
				<div class="col-lg-12 col-md-12">	
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2><i class="fa fa-newspaper-o"></i><strong><%= ViewData["NewsTitle"]%></strong></h2>
						</div>
						<div class="panel-body">	
                            <div class="panel panel-info">
                                <div class="panel-heading panelHeaderColor">
                                    <span class="panelHeaderDate"><%= ViewData["NewsDate0"]%></span>
							        <h2 class="panelHeaderTitle"><%= ViewData["NewsSubject0"]%></h2>                                    
						        </div>
                                <div class="panel-body" style="border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
							        <%= ViewData["NewsContent0"]%>
						        </div>
                            </div>
                            <div class="panel panel-info">
                                <div class="panel-heading panelHeaderColor">
                                    <span class="panelHeaderDate"><%= ViewData["NewsDate1"]%></span>
							        <h2 class="panelHeaderTitle"><%= ViewData["NewsSubject1"]%></h2>                                    
						        </div>
                                <div class="panel-body" style="border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
							        <%= ViewData["NewsContent1"]%>
						        </div>
                            </div>
                            <div class="panel panel-info">
                                <div class="panel-heading panelHeaderColor">
                                    <span class="panelHeaderDate"><%= ViewData["NewsDate2"]%></span>
							        <h2 class="panelHeaderTitle"><%= ViewData["NewsSubject2"]%></h2>                                    
						        </div>
                                <div class="panel-body" style="border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
							        <%= ViewData["NewsContent2"]%>
						        </div>
                            </div>
                            <div class="panel panel-info">
                                <div class="panel-heading panelHeaderColor">
                                    <span class="panelHeaderDate"><%= ViewData["NewsDate3"]%></span>
							        <h2 class="panelHeaderTitle"><%= ViewData["NewsSubject3"]%></h2>                                    
						        </div>
                                <div class="panel-body" style="border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
							        <%= ViewData["NewsContent3"]%>
						        </div>
                            </div>
                            <div class="panel panel-info">
                                <div class="panel-heading panelHeaderColor">
                                    <span class="panelHeaderDate"><%= ViewData["NewsDate4"]%></span>
							        <h2 class="panelHeaderTitle"><%= ViewData["NewsSubject4"]%></h2>                                    
						        </div>
                                <div class="panel-body" style="border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
							        <%= ViewData["NewsContent4"]%>
						        </div>
                            </div>
						</div>
					</div>	

				</div><!--/col-->

              </div>

          </section>
      </section>
      <!--main content end-->
  </section>
  
    <!-- javascripts -->
    <script src="/Resources/js/jquery.js"></script>
	<script src="/Resources/js/jquery-ui-1.10.4.min.js"></script>
    <script src="/Resources/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/Resources/js/jquery-ui-1.9.2.custom.min.js"></script>
    <!-- bootstrap -->
    <script src="/Resources/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="/Resources/js/jquery.scrollTo.min.js"></script>
    <script src="/Resources/js/jquery.nicescroll.js" type="text/javascript"></script>          
    <!-- jQuery full calendar -->
    <<script src="/Resources/js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
	<script src="/Resources/assets/fullcalendar/fullcalendar/fullcalendar.js"></script>
    <!--script for this page only-->
    <script src="/Resources/js/calendar-custom.js"></script>
	<script src="/Resources/js/jquery.rateit.min.js"></script>
    <!-- custom select -->
    <script src="/Resources/js/jquery.customSelect.min.js" ></script>
	<script src="/Resources/assets/chart-master/Chart.js"></script>
   
    <!--custome script for all page-->
    <script src="/Resources/js/scripts.js"></script>    	
  <script> 

      //custom select box

      $(function () {
          $('select.styled').customSelect();
      });



  </script>
</asp:Content>