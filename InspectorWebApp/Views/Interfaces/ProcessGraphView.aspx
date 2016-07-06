<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ProcessGraphView</title>        
    <!-- Treant -->
    <link rel="stylesheet" type="text/css" href="/Resources/css/treant.css">    
    <link rel="stylesheet" type="text/css" href="/Resources/css/perfect-scrollbar.css">
    <link rel="stylesheet" type="text/css" href="/Resources/css/custom-colored.css">
     <!-- font icon -->
    <link href="/Resources/css/elegant-icons-style.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">    
    <!-- Bootstrap CSS -->    
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 	
    <script type="text/javascript" src="/Resources/js/jquery-1.8.3.min.js"></script>    
    <script type="text/javascript" src="/Resources/js/jquery-ui-1.9.2.custom.min.js"></script>    
    <script src="/Resources/js/moment.min.js"></script>
    <script src="/Resources/js/jquery.highlight.js"></script>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.7/d3.min.js"></script>   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.4/raphael-min.js"></script>       
    <script src="/Resources/js/Treant.min.js"></script>       
    <script src="/Resources/js/perfect-scrollbar.js"></script>     
    <script src="/Resources/js/jquery.mousewheel.js"></script>            
    <!-- bootstrap -->
    <script src="/Resources/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="/Resources/js/jquery.scrollTo.min.js"></script>
    <script src="/Resources/js/jquery.nicescroll.js" type="text/javascript"></script>                	       
    <!--custom script for all page-->
    <script src="/Resources/js/scripts.js"></script>                    

    <script>
      // Ohad
        // document.ready start

        $(document).ready(function () {
            document.getElementById("custom-colored").style.display = "none";
            var spinner = '<br><br><div class="row"><div class="col-lg-6 text-center" style="margin-left:12em"><i class="fa fa-refresh fa-3x fa-spin"></div><div class="col-lg-6 text-center"></div></div>';
            var spanObject = document.getElementById('spanSpinner');
            spanObject.innerHTML = spinner;

            //            $.ajax({
            //                    type: "POST",
            //                    url: '/Interfaces/ProcessGraphData',
            //                    data: { env: "<%= ViewData["env"]  %>", processInstanceID: "<%= ViewData["processInstanceID"]  %>" },
            //                    dataType: "json",
            //                    contentType: "application/x-www-form-urlencoded",
            //                    success: successFunc
            //                });

            successFunc(document.getElementById('jsonData').value);

            function successFunc(graph) {
                document.getElementById("spanSpinner").style.display = "none";
                document.getElementById("custom-colored").style.display = "block";
                var chart_config = JSON.parse(graph);
                var org_chart = new Treant(chart_config);
                $(".node-title").each(
                                function () {
                                    var htmlContent = $(this).html();
                                    $(this).parent().attr('data-toggle', 'popover');
                                    $(this).parent().attr('data-content', htmlContent);
                                    $(this).parent().css('cursor', 'pointer');
                                    $(this).html('');
                                }
                            )


                var popOver = $('[data-toggle="popover"]').popover();
                popOver.on("shown.bs.popover", function (e) {
                    $(".popover").css({ "max-width": "none" });
                    $(".popover").css({ "word-break": "break-word" });
                });
            }

        });
    </script>
</head>
<body>    
    <span id="spanSpinner"></span>
    <div id="custom-colored" class="chart">          
          <a href='http://www.treant-js.com/'> Treant.js - tree visualization library </a>                    
     </div>              
    
    
    <input id="jsonData" type="hidden" value='<%= ViewData["jsonStr"] %>' />
</body>
</html>
