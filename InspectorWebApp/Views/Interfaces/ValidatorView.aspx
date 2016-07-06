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
						<li><i class="fa fa-check"></i>Validator</li>						  	
					</ol>
					<h3 class="page-header" style="margin-bottom: 4px;margin-top: 30px"><i class="fa fa-check"></i>Validate Message</h3>					
				</div>
			  </div>

              <div class="panel-body">                                                                  
                            <span id="spanValidator">
                                <div id="divValidator">                                                                                                                                           
                                    <form id="formValidator" class="navbar-form" action="">
                                    <div class="row">
                                      <div class="col-lg-8">
                                        <div class="row row-top">
                                            <div class="col-lg-2">
                                                <div class="dropdown ddl-size">   
                                                    <button class="btn btn-default dropdown-toggle btn-ddl" type="button" id="menuMessageTypes" data-toggle="dropdown">
                                                        <i class="icon_document_alt btn-ddl-icon"></i> 
                                                        <span id="spanTxtDdlMessageTypes" class="btn-ddl-messsagetypes">Schema1 Type</span>
                                                        <span class="caret btn-ddl-caret"></span>
                                                    </button>                              
                                                    <ul class="dropdown-menu ddl-menu-messagetypes">
                                                        <li><a>Schema1</a></li>  
                                                        <li><a>Schema2</a></li>                                   
                                                    </ul> 
                                                </div>
                                            </div>
                                            <div id="fileUpload" class="col-lg-4 dropzone">
                                                <div class="dz-message"> 
                                                    Drag <span id="spanDzMessageType">Schema1</span> <span id="spanDzMessageExtension">(.xml)</span> file to upload
                                                 </div>
                                            </div>                                                                                         
                                        </div> 
                                        </div>  
                                        </div>                                                                                                                                                              
                                    </form>                                                                     
                                    <br />                      
                                    <br /> 
                                    <div id="validatorResult">
                                        <i id="validatorIcon" style="visibility:collapse">
                                            <span id="validatorText"></span>
                                        </i>
                                    </div>                                   
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
    <script src="/Resources/js/dropzone.js"></script>
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
                
                // Translates from messsageTypes ddl text to the file extension
                var translator = new Array();
                translator["Schema1"] = ".xml";
                translator["Schema2"] = ".xml";                
                // Translates from messsageTypes ddl text to the file extension
                
                // Dropzone config    
                Dropzone.autoDiscover = false;                                                                                                          

                var myDropzone = new Dropzone("div#fileUpload", { 
                url: "/Interfaces/ValidatorData", 
                maxFilesize: 2, 
                acceptedFiles: ".xml",
                headers: { "messageType": "SchemaType" } });                                

                myDropzone.on("addedfile", function(file) {
                        
                        if(this.files.length == 2)
                            myDropzone.removeFile(this.files[0]);                                                 
              });

              myDropzone.on("success", function(file, response) {

                          document.getElementById("validatorIcon").style.visibility = "visible";                          
                          document.getElementById("validatorText").style.fontSize = "0.5em";

                          if(response=='')
                          {                            
                            document.getElementById("validatorIcon").className = "fa fa-check fa-5x";
                            document.getElementById("validatorIcon").style.color = "Green";
                            document.getElementById("validatorText").innerHTML = "The file is valid !";
                          }
                          else
                          {
                            document.getElementById("validatorIcon").className="fa fa-times fa-5x";                            
                            document.getElementById("validatorIcon").style.color = "Red";
                            document.getElementById("validatorText").innerHTML = response;
                          }                                                                                                               
              });
              // Dropzone config

                // On refresh click, we should revalidate the form, and use the data from each ddl & textbox
                $("#refreshValidator").click(function() {                  
                  
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
                $(".ddl-menu-messagetypes li a").click(function(){
                       var messageTypeChosen = $(this).text();
                       document.getElementById("spanTxtDdlMessageTypes").innerHTML = messageTypeChosen;                                          
                       document.getElementById("menuMessageTypes").value = messageTypeChosen;
                       document.getElementById("spanDzMessageType").innerHTML = messageTypeChosen;
                       document.getElementById("spanDzMessageExtension").innerHTML = '(' + translator[messageTypeChosen] + ')';
                       myDropzone.options.acceptedFiles = translator[messageTypeChosen];
                       myDropzone.hiddenFileInput.accept = translator[messageTypeChosen];
                       myDropzone.options.headers.messageType = messageTypeChosen;
                });               

            }); 
      // document.ready end                       
      // Ohad end

  </script>
</asp:Content>
