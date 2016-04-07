/*
        MEDOTRADE LLC                          
        www.medotrade.ru
        MEDICAL INFORMATION SYSTEMS

        Medotrade LLC specializes in comprehensive IT solutions 
        for healthcare institutions. Our product portfolio includes 
        local and cloud computing systems to automate the activities 
        of health care facilities of all sizes. We offer specialized 
        solutions (MIS "Transfusiologiya", MIS "Sanatoriy", Portal of 
        the Ministry of Health), and complex products 
        (RMIS-PRO, MIS "Patient", etc). 
        Our system RMIS-PRO is recognized as the best regional health 
        information system in 2012.


        WADO (WEB ACCESS DICOM OBJECTS)	
        Developer : Fomin Alexander   ajfomin_gmail.com


*/

	function MyAlert(p_text) {
		$("#MyAlert").css("position","fixed");
		$("#MyAlert").css("top","0");
		$("#MyAlert").css("left","0");
		$("#MyAlert").css("height","35px");
		$("#MyAlert").css("width",(screenSize().w)+"px");
		$("#MyAlertText").css("padding-left",(screenSize().w-p_text.length)/2+"px");
		$("#MyAlertText").text(p_text);
		$("#MyAlert").css("display","block");
	}
	
	$("#MyAlert").click(function()   {	
		$("#MyAlert").css("display","none");
	});

	function MyActModal(pHtmlHeader,pHtmlBody) {
		$("#myModalLabel").text(pHtmlHeader);
		$("#MyBodyTmp").remove();
		$("#MyModalText").remove();
		$("#myModalBody").append(pHtmlBody);
		$("#myModal").modal('show');
	}
	
	function MyPromptText (p_procOk) {
		$("#MyOtmModalBtn").click(function()   {
			$("#MySavModalBtn").click(function()   {});
			$("#MyOtmModalBtn").click(function()   {});
			$("#MyModalText").remove();
			$("#myModal").modal('hide');
		});
		$("#MySavModalBtn").click(function()   {
			var v_text = $("#MyModalText").val();
			$("#MyModalText").val("");
			$("#myModal").modal('hide');
			p_procOk( v_text );
		});
		MyActModal("Введите Текст","<input type='text' style='width:300px;background-color:#D0E6F1;border:none;' id='MyModalText'>");
	}


	