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
						<li><i class="icon_documents_alt"></i>Search</li>						  	
					</ol>
					<h3 class="page-header" style="margin-bottom: 4px"><i class="icon_documents_alt"></i>Search Message</h3>					
				</div>
			  </div>

              <div class="panel-body">                                                                  
                            <span id="spanIntegrationSearchMessage">
                                <div id="divIntegrationSearchMessage">                                    
                                    <div>                                        
					                    <h3 class="page-header" style="padding-bottom:0px"><i class="fa fa-search"></i>Search</h3>					
				                    </div>                                                                                                        
                                    <form id="formSearchMessage" class="navbar-form" action="">
                                    <div class="row">
                                      <div class="col-lg-8">
                                        <div class="row row-top">
                                            <div class="col-lg-2">
                                                <div class="dropdown ddl-size">   
                                                    <button class="btn btn-default dropdown-toggle btn-ddl" type="button" id="menuEnv" data-toggle="dropdown">
                                                        <i class="fa fa-heartbeat btn-ddl-icon"></i> 
                                                        <span id="spanTxtDdlEnv" class="btn-ddl-env">DummyEnv1</span>
                                                        <span class="caret btn-ddl-caret"></span>
                                                    </button>                              
                                                    <ul class="dropdown-menu ddl-menu-env">
                                                        <li><a>DummyEnv1</a></li>  
                                                        <li><a>DummyEnv2</a></li>                                     
                                                    </ul> 
                                                </div>
                                            </div>
                                            <div class="col-lg-2">
                                                <div class="dropdown ddl-size">   
                                                    <button class="btn btn-default dropdown-toggle btn-ddl" type="button" id="menuProcesses" data-toggle="dropdown">
                                                        <i class="fa fa-cogs btn-ddl-icon"></i> 
                                                        <span id="spanTxtDdlProcesses" class="btn-ddl-processes">HL7LabResults</span>
                                                        <span class="caret btn-ddl-caret"></span>
                                                    </button>                              
                                                    <ul id="ddlProcesses" class="dropdown-menu ddl-menu-processes">
                                                                                             
                                                    </ul> 
                                                </div>
                                            </div>
                                            <div class="col-lg-2">                                                    
                                                 <input id="patientID" name="patientID" data-rule-required="true" class="form-control" data-table="tableIntegrationSearchMessage" placeholder="Patient ID" type="text" style="float:left">
                                             </div>
                                             <div class="col-lg-2 searchMessageItems">
                                                <input class="form-control form-dates SearchMessage" id="dateIntegrationSearchMessage" data-table="tableIntegrationSearchMessage" placeholder="Pick Dates" type="text" style="float:left">                                                                                
                                             </div>
                                             <div class="col-lg-2 searchMessageItems">
                                                <a id="refreshSearchMessage" href="#"><i class="fa fa-hand-o-right fa-2x refresh-icon"></i></a>
                                             </div>
                                        </div> 
                                        </div>
                                        </div>                                                                                                                         
                                    </form>                                    
                                    <br />                      
                                    <br />
                                    <span id="spanTableIntegrationSearchMessage">
                                        <table id="tableIntegrationSearchMessage" class="table bootstrap-datatable countries" >                                            
                                            <tbody class="listSearchMessage"></tbody>
                                        </table>
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
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.14.0/jquery.validate.min.js"></script>
    <script src="/Resources/js/moment.min.js"></script>
    <script type="text/javascript" src="/Resources/js/daterangepicker.js"></script>    
    <script src="/Resources/js/list.min.js"></script>
    <script src="/Resources/js/paging.js"></script>    
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
      // document.ready start  
      $(document).ready(function() {            
                // Opens the sub menu on the left that needs to be open      
                setOpenMenu("<%= ViewData["MenuSection"]  %>"); 

                // Translates from processes ddl text to the real process name in Integration DB
                var translator = new Array();
                translator["HL7LabResults"] = "HL7LabResults";
                translator["CASDIM"] = "Results";
                // Translates from processes ddl text to the real process name in Integration DB end

                // Define jQuery validator on patientID field
                $.validator.addMethod('patientIDValidateNumeric', function (value,element) { 
                                                            return this.optional(element) || /^[0-9]+$/.test(value); 
                                                        }, 'PatientID is a numeric field');  
                                                                                                  
                $("#formSearchMessage").validate({
                    rules: {
                        patientID: {
					                required: true,
                                    patientIDValidateNumeric: true
				            }
			            },
                      errorElement: "div",
                      wrapper: "div",
                      errorPlacement: function(error, element) {
                        offset = element.offset();
                        error.insertAfter(element)
                        error.css('color','red');
                    },
                    messages: {
                        patientID: {
                                    required: "PatientID is required"
                        }
                    }                                           
                });
                // Define jQuery validator on patientID field end

                // Extract all processes received from server (Allowed processes to user), and put them in processes ddl
                var processes = "<%= ViewData["Processes"] %>".split(",");
                var ddlProcesses = document.getElementById("ddlProcesses");
                for (var i = 0; i < processes.length; i++) {
                    var li = document.createElement("li");   
                    var a = document.createElement("a");
                    a.appendChild(document.createTextNode(processes[i]));
                    li.appendChild(a);
                    ddlProcesses.appendChild(li);
                }
                // Extract all processes received from server (Allowed processes to user), and put them in processes ddl end

                // Setting initial value of menuEnv
                document.getElementById("menuEnv").value = document.getElementById("spanTxtDdlEnv").innerHTML;
                // Setting 'DummyEnv1' as initial value of menuEnv
                                
                // Define dataPull object
                var dataPullSearchMessage = new dataPullInfo("Interfaces/SearchMessageData","Integration",'','','','','',onAjaxRegularSuccess);                                                                                       
                // Define dataPull object end

                // Define envView object
                var envViews = new Array();                                
                envViews["SearchMessage"] = new envView("",'spanIntegrationSearchMessage','divIntegrationSearchMessage','refreshSearchMessage','spanTableIntegrationSearchMessage','tableIntegrationSearchMessage','','dateIntegrationSearchMessage','.form-control.form-dates.SearchMessage','',dataPullSearchMessage);                                         
                // Define envView object end
                
                // Ohad - jQueryDatePicker      
                envViews["SearchMessage"].initDatePicker();                
                // Ohad - jQueryDatePicker end                                                                           

                // On refresh click, we should revalidate the form, and use the data from each ddl & textbox
                $("#refreshSearchMessage").click(function() {
                  $("#formSearchMessage").validate();
                  
                  if ($("#formSearchMessage").valid())
                  {
                      // Set environment on dataPullInfoObj                 
                      envViews["SearchMessage"].env = document.getElementById("menuEnv").value;

                      // Set start & end dates on dataPullInfoObj
                      var inputDate = $(envViews["SearchMessage"].dateClass).val().split(" - ");
                      var startDate = inputDate[0];
                      var endDate = inputDate[1];                                                       
                      envViews["SearchMessage"].dataPullInfoObj.startDate = startDate;
                      envViews["SearchMessage"].dataPullInfoObj.endDate = endDate; 

                      // Set patientId on dataPullInfoObj
                      envViews["SearchMessage"].dataPullInfoObj.patientId = document.getElementById('patientID').value;
                      // Set process name on dataPullInfoObj
                      envViews["SearchMessage"].dataPullInfoObj.processName = document.getElementById("menuProcesses").value;

                      envViews["SearchMessage"].pullDataParams();                      
                  }

                  return false;
                });
                // On refresh click, we should revalidate the form, and use the data from each ddl & textbox - end                

                // Used for any ajax call success
                function onAjaxRegularSuccess(data) {
                    var jsonObj = JSON.parse(data);
                    ajaxSuccess(jsonObj);                                       
                }                                    
               
                    function ajaxSuccess(jsonObj) {                        
                        var spanTableId = envViews["SearchMessage"].spanTableId;
                        var tableId = envViews["SearchMessage"].tableId;
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
                            arrHtml[++j] = '</td><td class="archivePath">';                            
                            arrHtml[++j] = obj.ArchivePath;
                            arrHtml[++j] = '</td><td class="fullExceptionText">';                            
                            arrHtml[++j] = obj.FullExceptionText;
                            arrHtml[++j] = '</td></tr>';
                        }
                        arrHtml[++j] = '</tbody></table>';
                        document.getElementById(spanTableId).innerHTML = arrHtml.join('');                                             
                      } 
                                                                                                                                                                                 
                // Define onclick for environments ddl. Sets ddl value when user select one.
                $(".ddl-menu-env li a").click(function(){
                
                       document.getElementById("spanTxtDdlEnv").innerHTML = $(this).text();                                          
                       document.getElementById("menuEnv").value = $(this).text();

                });

                // Define onclick for processes ddl. Sets ddl value when user select one.
                $(".ddl-menu-processes li a").click(function(){
                
                       document.getElementById("spanTxtDdlProcesses").innerHTML = $(this).text();                                          
                       var ddlText = document.getElementById("spanTxtDdlProcesses").innerHTML;
                       var ddlValue = translator[ddlText];                       
                       document.getElementById("menuProcesses").value = ddlValue;

                });

            }); 
      // document.ready end                       
      // Ohad end

  </script>
</asp:Content>
