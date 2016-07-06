<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="ContentHeaderInterfaces" ContentPlaceHolderID="headPh" runat="server">    
     <base href="/">
</asp:Content>

<asp:Content ID="ContentMainInterfaces" ContentPlaceHolderID="bodyPh" runat="server">
<section id="container" class="">
<!--main content start-->
      <section id="main-content">
          <section class="wrapper extended">          
              <div class="row">
				<div class="col-lg-12">
                    <ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="/Home">Home</a></li>
						<li><i class="icon_documents_alt"></i><%= ViewData["CurrentPage"]  %></li>						  	
					</ol>
					<h3 class="page-header" style="margin-bottom: 4px"><i class="icon_documents_alt"></i><%= ViewData["CurrentPage"]  %></h3>					
				</div>
			  </div>

              <div class="panel-body">                                                                                              
                            <span id="spanIntegrationDummyEnv1">
                                <div id="divIntegrationDummyEnv1"> 
                                    <div>                                        
					                    <h3 class="page-header" style="padding-bottom:0px;"><i class="fa fa-heartbeat"></i>DummyEnv1</h3>					
				                    </div> 
                                    <form class="navbar-form">
                                         <input id="searchDummyEnv1" class="form-control" data-table="tableIntegrationDummyEnv1" placeholder="Search" type="text" style="float:left">
                                    </form>
                                    <a id="refreshDummyEnv1" href="#"><i class="fa fa-refresh fa-2x  refresh-icon"></i></a>                                                                       
                                    <br />                      
                                    <br />
                                    <span id="spanTableIntegrationDummyEnv1">
                                    </span>                                    
                                </div>
                            </span>
                            <span id="spanIntegrationDummyEnv2">
                                <div id="divIntegrationDummyEnv2"> 
                                    <div>                                        
					                    <h3 class="page-header" style="padding-bottom:0px;"><i class="fa fa-heartbeat"></i>Center</h3>					
				                    </div> 
                                    <form class="navbar-form">
                                         <input id="searchDummyEnv2" class="form-control" data-table="tableIntegrationDummyEnv2" placeholder="Search" type="text" style="float:left">
                                    </form>
                                    <a id="refreshDummyEnv2" href="#"><i class="fa fa-refresh fa-2x  refresh-icon"></i></a>                                                                       
                                    <br />                      
                                    <br />
                                    <span id="spanTableIntegrationDummyEnv2">
                                    </span>                                    
                                </div>
                            </span>                    							
						</div>
          </section>
       </section>
     
    <!-- javascripts -->
    <script src="/Resources/js/jquery.js"></script>
	<script src="/Resources/js/jquery-ui-1.10.4.min.js"></script>
    <script src="/Resources/js/jquery-1.8.3.min.js"></script>    
    <script type="text/javascript" src="/Resources/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="/Resources/js/moment.min.js"></script>
    <script type="text/javascript" src="/Resources/js/daterangepicker.js"></script>    
    <script src="/Resources/js/list.min.js"></script>
    <script src="/Resources/js/paging.js"></script>
    <script src="/Resources/js/jquery.highlight.js"></script>  
    <!-- bootstrap -->
    <script src="/Resources/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="/Resources/js/jquery.scrollTo.min.js"></script>
    <script src="/Resources/js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- charts scripts -->
    <script src="/Resources/assets/jquery-knob/js/jquery.knob.js"></script>
    <script src="/Resources/js/jquery.sparkline.js" type="text/javascript"></script>
    <script src="/Resources/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
    <script src="/Resources/js/owl.carousel.js" ></script>
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
    <!-- custom script for this page-->
    <script src="/Resources/js/sparkline-chart.js"></script>
    <script src="/Resources/js/easy-pie-chart.js"></script>
	<script src="/Resources/js/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="/Resources/js/jquery-jvectormap-world-mill-en.js"></script>
	<script src="/Resources/js/xcharts.min.js"></script>
	<script src="/Resources/js/jquery.autosize.min.js"></script>
	<script src="/Resources/js/jquery.placeholder.min.js"></script>
	<script src="/Resources/js/gdp-data.js"></script>	
	<script src="/Resources/js/morris.min.js"></script>
	<script src="/Resources/js/sparklines.js"></script>	
	<script src="/Resources/js/charts.js"></script>
	<script src="/Resources/js/jquery.slimscroll.min.js"></script>        
    <script src="/Resources/js/helpers.js"></script>  
  <script>
      // Ohad      
      $(document).ready(function() {
                // Opens the sub menu on the left that needs to be open
                setOpenMenu("<%= ViewData["MenuSection"]  %>");

                // Set dataPull object for each environment                
                var dataPullDummyEnv1 = new dataPullInfo("Interfaces/"  + "<%= ViewData["CurrentPage"]  %>" + "Data","Integration",'','','','',onAjaxFirstSuccess,onAjaxRegularSuccess);
                var dataPullDummyEnv2 = new dataPullInfo("Interfaces/"  + "<%= ViewData["CurrentPage"]  %>" + "Data","Integration",'','','','',onAjaxFirstSuccess,onAjaxRegularSuccess);

                // Set options (including search fields) for list.js                
                var listOptionsDummyEnv1 = { valueNames: ['distID', 'senderCode', 'retrieveTime', 'fromRetrieveTimeStamp', 'application', 'applicationDestination', 'instituteCode', 'instituteCodeDestination'], searchClass: 'form-control', listClass: 'listDummyEnv1' };
                var listOptionsDummyEnv2 = { valueNames: ['distID', 'senderCode', 'retrieveTime', 'fromRetrieveTimeStamp', 'application', 'applicationDestination', 'instituteCode', 'instituteCodeDestination'], searchClass: 'form-control', listClass: 'listDummyEnv2' };
                
                var envViews = new Array();                                 
                envViews["DummyEnv1"] = new envView("DummyEnv1",'spanIntegrationDummyEnv1','divIntegrationDummyEnv1','refreshDummyEnv1','spanTableIntegrationDummyEnv1','tableIntegrationDummyEnv1','searchDummyEnv1','dateIntegrationDummyEnv1','.form-control.form-dates.DummyEnv1',listOptionsDummyEnv1,dataPullDummyEnv1);                                                        
                envViews["DummyEnv2"] = new envView("DummyEnv2",'spanIntegrationDummyEnv2','divIntegrationDummyEnv2','refreshDummyEnv2','spanTableIntegrationDummyEnv2','tableIntegrationDummyEnv2','searchDummyEnv2','dateIntegrationDummyEnv2','.form-control.form-dates.DummyEnv2',listOptionsDummyEnv2,dataPullDummyEnv2);                                                        
                                    
                // Ajax Calls
                envViews["DummyEnv1"].firstDataPull();                
                envViews["DummyEnv2"].firstDataPull();
                // End Ajax Calls

                function onAjaxFirstSuccess(data) {
                    // data from the server as parsed json object
                    var jsonObj = JSON.parse(data);
                    ajaxSuccess(jsonObj);

                    // Refresh Click Definition
                    envViews[jsonObj.MetaData.env].refreshClick();                    
                    // Refresh Click Definition End
                                        
                    // Loading list.js on the table
                    envViews[jsonObj.MetaData.env].loadListJS();

                    // Loading paging on the table
                    envViews[jsonObj.MetaData.env].loadPaging();

                    // define search change event
                    onSearchChangeEventRegister(envViews[jsonObj.MetaData.env].list,jsonObj.MetaData.env);
                }

                // Used for any ajax call success EXCEPT the first (init) call when loading the page
                function onAjaxRegularSuccess(data) {
                    var jsonObj = JSON.parse(data);
                    ajaxSuccess(jsonObj);                    
                    // Loading list.js on the table
                    envViews[jsonObj.MetaData.env].loadListJS(); 
                    // Loading paging on the table
                    envViews[jsonObj.MetaData.env].loadPaging();                     
                }                                    
               
                    function ajaxSuccess(jsonObj) {                        
                        var spanTableId = envViews[jsonObj.MetaData.env].spanTableId;
                        var tableId = envViews[jsonObj.MetaData.env].tableId;
                        var arrHtml = new Array();
                        var j = -1;                    
                        //arrHtml[++j] = '<div><form class="navbar-form"><input class="form-control" data-table="' + tableId + '" placeholder="Search" type="text" style="float:left"></form><input type="text" id="datepicker' + tableId + '"></div>';
                        arrHtml[++j] = '<table id="' + tableId + '" class="table bootstrap-datatable countries" ><thead><tr><th></th><th>DistID</th><th>SenderCode</th><th>LastRetrieveTime</th><th>LastResultTimeStamp</th><th>Application</th><th>ApplicationDestination</th><th>InstituteCode</th><th>InstituteCodeDestination</th></tr></thead><tbody class="list' + jsonObj.MetaData.env + '">';                        
                        for(var i = 0; i < jsonObj.Data.length; i++) {
                            var obj = jsonObj.Data[i];
                            arrHtml[++j] = '<tr><td><i class="icon_document_alt"></td><td class="distID">';
                            arrHtml[++j] = obj.DistID;
                            arrHtml[++j] = '</td><td class="senderCode">';
                            arrHtml[++j] = obj.SenderCode;
                            arrHtml[++j] = '</td><td class="retrieveTime">';
                            arrHtml[++j] = obj.RetrieveTime;
                            arrHtml[++j] = '</td><td class="fromRetrieveTimeStamp">';
                            arrHtml[++j] = obj.FromRetrieveTimeStamp;
                            arrHtml[++j] = '</td><td class="application">';
                            arrHtml[++j] = obj.Application;
                            arrHtml[++j] = '</td><td class="applicationDestination">';
                            arrHtml[++j] = obj.ApplicationDestination;
                            arrHtml[++j] = '</td><td class="instituteCode">';
                            arrHtml[++j] = obj.InstituteCode;
                            arrHtml[++j] = '</td><td class="instituteCodeDestination">';
                            arrHtml[++j] = obj.InstituteCodeDestination;
                            arrHtml[++j] = '</td></tr>';
                        }
                        arrHtml[++j] = '</tbody></table>';
                        document.getElementById(spanTableId).innerHTML = arrHtml.join('');                                                
                      }                                    
                  
                  function onSearchChangeEventRegister(list,env) {
                    list.on('searchComplete', function () {
                                                      // Paging.js
                                                     $('#' + envViews[env].tableId).paging('updatePaging'); 
                                                     
                                                     // Highlight searched text
                                                     var searchText = document.getElementById(envViews[env].searchId).value;
                                                     // First, unhighlight all td's values under current table
                                                     $('#' + envViews[env].tableId).find('td').unhighlight();
                                                     // Second, highlight "searchText" value in td's under current table
                                                     $('#' + envViews[env].tableId).find('td').highlight(searchText);   
                                                  });
                  }                                                                                    

            }); // document.ready end
                 

      //knob
      $(function () {
          $(".knob").knob({
              'draw': function () {
                  $(this.i).val(this.cv + '%')
              }
          })
      });

      //carousel
      $(document).ready(function () {
          $("#owl-slider").owlCarousel({
              navigation: true,
              slideSpeed: 300,
              paginationSpeed: 400,
              singleItem: true

          });
      });

      //custom select box

      $(function () {
          $('select.styled').customSelect();
      });      

  </script>
</asp:Content>
