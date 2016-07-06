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
					<h3 class="page-header" style="margin-bottom: 4px"><i class="icon_documents_alt"></i><%= ViewData["CurrentPage"]  %> Failures</h3>					
				</div>
			  </div>

              <div class="panel-body">                                                                                              
                            <span id="spanIntegrationDummyEnv1">
                                <div id="divIntegrationDummyEnv1" style="padding-top:2em;">
                                    <div>                                        
					                    <h3 class="page-header" style="padding-bottom:0px;"><i class="fa fa-heartbeat"></i>DummyEnv1</h3>					
				                    </div> 
                                    <form class="navbar-form">
                                         <input id="searchDummyEnv1" class="form-control" data-table="tableIntegrationDummyEnv1" placeholder="Search" type="text" style="float:left">
                                    </form>
                                    <form class="navbar-form">
                                         <input id="dateIntegrationDummyEnv1" class="form-control form-dates DummyEnv1" data-table="tableIntegrationDummyEnv1" placeholder="Pick Dates" type="text" style="float:left">
                                    </form>
                                    <a id="refreshDummyEnv1" href="#"><i class="fa fa-refresh fa-2x  refresh-icon"></i></a>                                                                       
                                    <br />                      
                                    <br />
                                    <span id="spanTableIntegrationDummyEnv1">
                                    </span>                                    
                                </div>
                            </span> 
                            <span id="spanIntegrationDummyEnv2">
                                <div id="divIntegrationDummyEnv2" style="padding-top:2em;">
                                    <div>                                        
					                    <h3 class="page-header" style="padding-bottom:0px;"><i class="fa fa-heartbeat"></i>DummyEnv2</h3>					
				                    </div> 
                                    <form class="navbar-form">
                                         <input id="searchDummyEnv2" class="form-control" data-table="tableIntegrationDummyEnv2" placeholder="Search" type="text" style="float:left">
                                    </form>
                                    <form class="navbar-form">
                                         <input id="dateIntegrationDummyEnv2" class="form-control form-dates DummyEnv2" data-table="tableIntegrationDummyEnv2" placeholder="Pick Dates" type="text" style="float:left">
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
    <!--custome script for all page-->
    <script src="/Resources/js/scripts.js"></script>            
    <script src="/Resources/js/helpers.js"></script>  
  <script>
      // Ohad      
      $(document).ready(function() {
                // Opens the sub menu on the left that needs to be open
                setOpenMenu("<%= ViewData["MenuSection"]  %>"); 
                                                
                var dataPullDummyEnv1 = new dataPullInfo("Interfaces/Data","Integration","<%= ViewData["ProcessName"]  %>",'','','',onAjaxFirstSuccess,onAjaxRegularSuccess);
                var dataPullDummyEnv2 = new dataPullInfo("Interfaces/Data","Integration","<%= ViewData["ProcessName"]  %>",'','','',onAjaxFirstSuccess,onAjaxRegularSuccess);

                // Set options for list.js                
                var listOptionsDummyEnv1 = { valueNames: ['distID', 'senderCode', 'retrieveTime', 'fromRetrieveTimeStamp', 'application', 'applicationDestination', 'instituteCode', 'instituteCodeDestination'], searchClass: 'form-control', listClass: 'listDummyEnv1' };            
                var listOptionsDummyEnv2 = { valueNames: ['distID', 'senderCode', 'retrieveTime', 'fromRetrieveTimeStamp', 'application', 'applicationDestination', 'instituteCode', 'instituteCodeDestination'], searchClass: 'form-control', listClass: 'listDummyEnv2' };

                var envViews = new Array();                                                
                envViews["DummyEnv1"] = new envView("DummyEnv1",'spanIntegrationDummyEnv1','divIntegrationDummyEnv1','refreshDummyEnv1','spanTableIntegrationDummyEnv1','tableIntegrationDummyEnv1','searchDummyEnv1','dateIntegrationDummyEnv1','.form-control.form-dates.DummyEnv1',listOptionsDummyEnv1,dataPullDummyEnv1);                                                        
                envViews["DummyEnv2"] = new envView("DummyEnv2",'spanIntegrationDummyEnv2','divIntegrationDummyEnv2','refreshDummyEnv2','spanTableIntegrationDummyEnv2','tableIntegrationDummyEnv2','searchDummyEnv2','dateIntegrationDummyEnv2','.form-control.form-dates.DummyEnv2',listOptionsDummyEnv2,dataPullDummyEnv2);                                                        
                
                // Ohad - jQueryDatePicker      
                envViews["DummyEnv1"].initDatePicker();
                envViews["DummyEnv2"].initDatePicker(); 
                // Ohad - jQueryDatePicker end              
                                    
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

                    // define date change event
                    onDateChangeEventRegister(jsonObj.MetaData.env);
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
                        var key1Value = "<%= ViewData["Key1Value"]  %>";
                        var key2Value = "<%= ViewData["Key2Value"]  %>";
                        var key3Value = "<%= ViewData["Key3Value"]  %>";                        
                        //arrHtml[++j] = '<div><form class="navbar-form"><input class="form-control" data-table="' + tableId + '" placeholder="Search" type="text" style="float:left"></form><input type="text" id="datepicker' + tableId + '"></div>';
                        arrHtml[++j] =  '<table id="' + tableId + '" class="table bootstrap-datatable countries" ><thead><tr><th></th><th>MessageID</th><th>SrcMessageID</th><th>MessageDateTime</th><th>ProcessDateTime</th><th>SubjectID</th><th>' + key1Value + '</th><th>' + key2Value + '</th><th>' + key3Value + '</th><th>Link</th><th>Exception</th></tr></thead><tbody class="list' + jsonObj.MetaData.env + '">';                        
                        for(var i = 0; i < jsonObj.Data.length; i++) {
                            var obj = jsonObj.Data[i];
                            arrHtml[++j] = '<tr><td><i class="icon_document_alt"></td><td class="messageID">';
                            arrHtml[++j] = obj.MessageId;
                            arrHtml[++j] = '</td><td class="srcMessageID">';
                            arrHtml[++j] = obj.SrcMessageID;
                            arrHtml[++j] = '</td><td class="messageDateTime">';
                            arrHtml[++j] = obj.MessageDateTime;
                            arrHtml[++j] = '</td><td class="loadDate">';
                            arrHtml[++j] = obj.LoadDate;
                            arrHtml[++j] = '</td><td class="subjectId">';                            
                            arrHtml[++j] = obj.SubjectId;
                            arrHtml[++j] = '</td><td class="key1Value">';  
                            arrHtml[++j] = obj.Key1Value;
                            arrHtml[++j] = '</td><td class="key2Value">';
                            arrHtml[++j] = obj.Key2Value;
                            arrHtml[++j] = '</td><td class="key3Value">';
                            arrHtml[++j] = obj.Key3Value;
                            arrHtml[++j] = '</td><td class="archivePath"><a href="';                            
                            arrHtml[++j] = obj.ArchivePath;
                            arrHtml[++j] = '">' + obj.ArchivePath + '</a></td><td class="fullExceptionText">';                            
                            arrHtml[++j] = obj.FullExceptionText;
                            arrHtml[++j] = '</td></tr>';
                        }
                        arrHtml[++j] = '</tbody></table>';
                        document.getElementById(spanTableId).innerHTML = arrHtml.join('');                                             
                      }                                    
                  
                  // Search change is an automatic filter of list.js (NOT AN AJAX CALL)
                  function onSearchChangeEventRegister(list,env) {
                    list.on('updated', function () {
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
                   
                   // Date change is actually an Ajax Call
                   function onDateChangeEventRegister(env) {
                        var updateList = function(list,inputClass){
                                            var inputDate = $(envViews[env].dateClass).val().split(" - ");
                                            var startDate = inputDate[0];
                                            var endDate = inputDate[1];                                        
                                            envViews[env].dataPullInfoObj.startDate = startDate;
                                            envViews[env].dataPullInfoObj.endDate = endDate;                                           
                                            envViews[env].pullData();                                                                                        
                                            // Paging.js                                            
                                            envViews[env].loadPaging();
                            }
                                                                
                        $(envViews[env].dateClass).change(updateList);                                               
                  }                  

            }); // document.ready end                 


  </script>
</asp:Content>
