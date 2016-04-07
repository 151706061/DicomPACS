$(function() {
//	var v_ISQUERIES=0;
//	var v_ISCONCL=0;
//	var v_adm=0 
	if(v_ISQUERIES==0){		$("#myLocLstMenu").css("display","none");	}
	else	{		$("#myLocLstMenu").css("display","block");	}
	if(v_adm==0){		$("#MyadminMenu").css("display","none");	}
	else	{		$("#MyadminMenu").css("display","block");	}
	
	$("#chk_mod_mrgn").css("margin-left","98px");
	
	$("#myroutine").click(function () { // Плановые 1
		setActuality(1);
	});
	$("#myurgent").click(function () { // Срочные 2
		setActuality(2);
	});
	$("#mycurrent").click(function () { // Экстренное 3
		setActuality(3);
	});
	$("#myfinished").click(function () { // Завершено 4
		setActuality(4);
	});

	$("#li_hd_mnu_1").css("font-weight","bold"); // активный/текущая страница - первый пункт меню
	
	$("#mybtnhdgrid1").click(function () {	//	&nbsp
		AskData(1);
	});
    $("#mybtnhdgrid2").click(function () {	//	Карта
		AskData(2);
	});
    $("#mybtnhdgrid3").click(function () {	//	Пациент
		AskData(3);
	});
    $("#mybtnhdgrid4").click(function () {	//	Дата рождения
		AskData(4);
	});
    $("#mybtnhdgrid5").click(function () {	//	№
		AskData(5);
	});
    $("#mybtnhdgrid6").click(function () {	//	Тип
		AskData(6);
	});
    $("#mybtnhdgrid7").click(function () {	//	Описание
		AskData(7);
	});
    $("#mybtnhdgrid8").click(function () {	//	Дата
		AskData(8);
	});

	
	$("#myzklall").click(function () {
		setmyzakl(1);
	});
	document.getElementById('myzklall').addEventListener('touchstart',function(event) {
		setmyzakl(1);
	});
	
    $("#myzklwth").click(function () {
		setmyzakl(2);
	});
	document.getElementById('myzklwth').addEventListener('touchstart',function(event) {
		setmyzakl(2);
	});
	
    $("#myzklnot").click(function () {
		setmyzakl(3);
	});
	document.getElementById('myzklnot').addEventListener('touchstart',function(event) {
		setmyzakl(3);
	});
	
	$("#mytopall").click(function () {	
		$("#myzaklchain").text("Весь список");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');	
	});
	document.getElementById('mytopall').addEventListener('touchstart',function(event) {
		$("#myzaklchain").text("Весь список");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');
	});

	$("#mytopQueue").click(function () {			
		$("#myzaklchain").text("Очередь");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');	
	});
	document.getElementById('mytopQueue').addEventListener('touchstart',function(event) {
		$("#myzaklchain").text("Очередь");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');
	});

	$("#mytopRoutine").click(function () {	
		$("#myzaklchain").text("Плановые");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');	
	});
	document.getElementById('mytopRoutine').addEventListener('touchstart',function(event) {
		$("#myzaklchain").text("Плановые");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');	
	});

	$("#mytopUrgent").click(function () {			
		$("#myzaklchain").text("Срочные");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');	
	});
	document.getElementById('mytopUrgent').addEventListener('touchstart',function(event) {
		$("#myzaklchain").text("Срочные");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');
	});

	$("#mytopEmergency").click(function () {	
		$("#myzaklchain").text("Экстренные");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');	
	});
	document.getElementById('mytopEmergency').addEventListener('touchstart',function(event) {
		$("#myzaklchain").text("Экстренные");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');
	});

	$("#mytopFinished").click(function () {		
		$("#myzaklchain").text("Завершенные");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');	
	});
	document.getElementById('mytopFinished').addEventListener('touchstart',function(event) {
		$("#myzaklchain").text("Завершенные");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');	
	});

	$("#mytopInstalled").click(function () {			
		$("#myzaklchain").text("Установленные");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');	
	});
	document.getElementById('mytopInstalled').addEventListener('touchstart',function(event) {
		$("#myzaklchain").text("Установленные");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');
	});

	$("#mytopNotinstalled").click(function () {	
		$("#myzaklchain").text("Не установленные");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');	
	});
	document.getElementById('mytopNotinstalled').addEventListener('touchstart',function(event) {
		$("#myzaklchain").text("Не установленные");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');
	});

	$(".mysrchfields").keyup(function(event) {
		if(event.keyCode==13) {
			AskData(0);
			cnhg_resize();
		}
	});
	
	$(window).resize(function() {
		cnhg_resize();	
	});	
	
	var v_txtnam = '';	
	if (v_fam!='') v_txtnam = v_txtnam+v_fam;
	if (v_nam!='') v_txtnam = v_txtnam+" "+v_nam.substring(0,1)+". ";
	if (v_surn!='') v_txtnam = v_txtnam+" "+v_surn.substring(0,1)+". ";
	
	var htmlStr_tmp = $("#mybtnflogs").html();
	$("#myusername").remove();
	$("#mybtnflogs").remove();
	$("#myauth").append('<div id="myusername" class="myflft" style="padding-top:10px;max-width:130px;width:130px;">'+
						'<h5 style="font-weight:bold;color:#599DC0">'+v_txtnam+'</h5>'+
                        '</div>'+htmlStr_tmp);
	
	
	
	 $( "#dp1" ).datepicker({
		showOn: "button",
		buttonImage: "css/img/cal.png",
		buttonImageOnly: true
	});
	
	 $( "#dp2" ).datepicker({
		showOn: "button",
		buttonImage: "css/img/cal.png",
		buttonImageOnly: true
	});
	
	$( "#format1" ).buttonset();
	
	function set_clk() {
		$(".myrows").click(function () {
			$(".myrows").css("background-color","white");	
			$(this).css("background-color","#D0E6F1");
			v_sel_nmb = $(this).attr('id');
		});
	}
	
	
	set_clk();
	
function f_cb_emp (p_cb_id) {
	$( "#"+p_cb_id ).attr('checked',true).button("refresh");
}

function UnChecked (p_cb_id) {
	$( "#"+p_cb_id ).attr('checked',false).button("refresh");
}
	
function ClrData() {	//	сброс
		$("#patientname1").val("");
		$("#patientid1").val("");
		$("#accessionnumber1").val("");
		$("#dp1").val("");
		$("#dp2").val("");
		$("#fstudyuid1").val("");
		$("#fdescription1").val("");
		CheckedAll();
		
		$("#myzaklchain").text("Весь список");
		$("#myzaklchain").append('<b style="float:right" class="caret"></b>');
		
		//$( "#myzakluch" ).attr('checked',false);
		
		set_chk_def ();
	}

function CheckedAll(){
	for(var i=1; i<=18; i++){
		f_cb_emp("check"+i);
		}
}

function ClrChecked(){
	for(var i=1; i<=18; i++){
		UnChecked("check"+i);
		}
}
	
	$("#myclr").click(function () {
		ClrData();
	});
	
	$("#myRemoveAll").click(function () {
		ClrChecked();
	});
	$("#myCheckAll").click(function () {
		CheckedAll();
	});
	
	function f_cb_res (p_cb_id,p_nam) {
		if ($( "#"+p_nam ).is(':checked')) { // attr('checked')
			return p_cb_id+'=1&';
		} else {
			return p_cb_id+'=0&';
		}
	}
	
	function gridaddrecord (frecord) {
		v_flr = '<;>';
		v_curfld = frecord; 
		
		v_fpos=v_curfld.indexOf(v_flr);
		v_ID_CONCL = v_curfld.substr(0,v_fpos);				// ID conclusion
		v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
		
		v_fpos=v_curfld.indexOf(v_flr);
		v_P_PID = v_curfld.substr(0,v_fpos);				// Patient ID
		v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
		
		v_fpos=v_curfld.indexOf(v_flr);
		v_P_ENAME = v_curfld.substr(0,v_fpos);			// Name
		v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
		
		v_fpos=v_curfld.indexOf(v_flr);
		v_P_DATEBORN = v_curfld.substr(0,v_fpos);		// DateBorn
		v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	
		v_fpos=v_curfld.indexOf(v_flr);
		v_ACCESSIONNUMBER = v_curfld.substr(0,v_fpos);	// AccessionNumber
		v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	
		v_fpos=v_curfld.indexOf(v_flr);
		v_Mod = v_curfld.substr(0,v_fpos);				// Mod
		v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	
		v_fpos=v_curfld.indexOf(v_flr);
		v_StudyDate = v_curfld.substr(0,v_fpos);			// StudyDate
		v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
		
		if (v_StudyDate=='') v_StudyDate='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	
		v_fpos=v_curfld.indexOf(v_flr);
		v_StudyUID = v_curfld.substr(0,v_fpos);			// StudyUID
		v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	
		v_fpos=v_curfld.indexOf(v_flr);
		v_Description = v_curfld.substr(0,v_fpos);		// Description
		v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
		
		v_fpos=v_curfld.indexOf(v_flr);
		v_ACTUALITY = v_curfld.substr(0,v_fpos);		// ACTUALITY
		v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );

		if (v_Description=='') {
			v_Description='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		} else {
			v_Description = v_Description.substring(0,100);
		}
		//
		if (v_ACCESSIONNUMBER=='') v_ACCESSIONNUMBER='&nbsp;';
		//
		v_cur_grid_id++;
		v_arr_list[v_cur_grid_id]=v_StudyUID;
		//
		// собственно вставка записи
		var v_str_ins_tmp = "<div class='myrefr myrows myfloatleft' id='"+v_cur_grid_id+"' style='max-width:780px'>" ;
		if (v_ACTUALITY=='0') {	// 0-не установлено
			v_str_ins_tmp = v_str_ins_tmp + "<div class='myfloatleft tfld0' ><i aria-hidden='true'></i>&nbsp;</div>";
		} else if (v_ACTUALITY=='1') {	// 1-плановая
			v_str_ins_tmp = v_str_ins_tmp + "<div class='myfloatleft tfld0' style=''><i class='icon-clipboard-2 ' aria-hidden='true'></i></div>";
		} else if (v_ACTUALITY=='2') {	// 2-срочная
			v_str_ins_tmp = v_str_ins_tmp + "<div class='myfloatleft tfld0' style=''><i class='icon-map-pin-alt  ' aria-hidden='true'></i></div>";
		} else if (v_ACTUALITY=='3') {	// 3-экстренная
			v_str_ins_tmp = v_str_ins_tmp + "<div class='myfloatleft tfld0' style=''><i class='icon-power  ' aria-hidden='true'></i></div>";
		} else if (v_ACTUALITY=='4') {	// 4-завершенная
			v_str_ins_tmp = v_str_ins_tmp + "<div class='myfloatleft tfld0' style=''><i class='icon-checkmark-3 ' aria-hidden='true'></i></div>";
		}
		if (v_ID_CONCL=='0') {
			v_str_ins_tmp = v_str_ins_tmp + "<div class='myfloatleft tfld0' style=''>&nbsp;</div>";
		} else if (v_P_ENAME!='') {
			v_str_ins_tmp = v_str_ins_tmp + "<div class='myfloatleft tfld0' style=''><img src='css/img/check2.png' width='24' height='24'></div>";
		}
		v_str_ins_tmp = v_str_ins_tmp +
			"<div class='myfloatleft tfld1'>"+'&nbsp;'+v_P_PID+"</div>"+
			"<div class='myfloatleft tfld2'>"+'&nbsp;'+v_P_ENAME+"</div>"+
			"<div class='myfloatleft tfld3'>"+'&nbsp;'+v_P_DATEBORN+"</div>"+
			"<div class='myfloatleft tfld4'>"+'&nbsp;'+v_ACCESSIONNUMBER+"</div>"+
			"<div class='myfloatleft tfld5'>"+'&nbsp;'+v_Mod+"</div>"+
			"<div class='myfloatleft tfld6'>"+'&nbsp;'+v_Description+"</div>"+
			"<div class='myfloatleft tfld7'>"+'&nbsp;'+v_StudyDate+"</div>"+
			"</div>";
		//	
		$("#mytabrefr").append( v_str_ins_tmp );
	}
		
	// формирование временного массива из ответа сервера
	function frm_searcharr(fdata) {
		// очистка списка
		$(".myrefr").remove();
		// заполнение новыми данными
		v_pos=0;
		v_cur_str = '';
		v_cur_grid_id=0;
		v_lftstr = fdata;
		v_rcr = '<|>';
		while (v_pos>=0) {
			v_pos=v_lftstr.indexOf(v_rcr);
			if (v_pos!=-1) {	// найдено
				v_cur_str = v_lftstr.substr(0,v_pos);
				v_lftstr = v_lftstr.substr( v_pos+v_rcr.length, v_lftstr.length );
				gridaddrecord(v_cur_str);
			} else {	// не найдено
				gridaddrecord(v_lftstr);	// добавим остаток 
				break;						// и выйдем из цикла
			}
		}
		set_clk();
	}

	function AskData(p_s) {
		if (v_pr_sort==p_s) {
			v_pr_sort=(-1)*p_s;
		} else {
			v_pr_sort=p_s;
		}
		//
		v_asc  = '<div data-icon="&#xe0f3;"></div>';	//'<b style="float:right" class="caret">&#xe0f3;</b>';
		v_desc = '<div data-icon="&#xe0f2;"></div>';	//'<b style="float:right" class="caret">&#xe0f2;</b>';
		$("#mybtnhdgrid2").text("Карта");
		$("#mybtnhdgrid3").text("Пациент");
		$("#mybtnhdgrid4").text("Дата рождения");
		$("#mybtnhdgrid5").text("№");
		$("#mybtnhdgrid6").text("Тип");
		$("#mybtnhdgrid7").text("Описание");
		$("#mybtnhdgrid8").text("Дата");
		if (Math.abs(p_s)==1) {		//	&nbsp
			if (v_pr_sort<0) {
			} else {
			}
		} else
		if (Math.abs(p_s)==2) {		//	
			if (v_pr_sort>0) {
				$("#mybtnhdgrid2").append(v_asc);
			} else {
				$("#mybtnhdgrid2").append(v_desc);
			}
		} else
		if (Math.abs(p_s)==3) {		
			if (v_pr_sort>0) {
				$("#mybtnhdgrid3").append(v_asc);
			} else {
				$("#mybtnhdgrid3").append(v_desc);
			}
		} else
		if (Math.abs(p_s)==4) {		
			if (v_pr_sort>0) {
				$("#mybtnhdgrid4").append(v_asc);
			} else {
				$("#mybtnhdgrid4").append(v_desc);
			}
		} else
		if (Math.abs(p_s)==5) {		
			if (v_pr_sort>0) {
				$("#mybtnhdgrid5").append(v_asc);
			} else {
				$("#mybtnhdgrid5").append(v_desc);
			}
		} else
		if (Math.abs(p_s)==6) {		
			if (v_pr_sort>0) {
				$("#mybtnhdgrid6").append(v_asc);
			} else {
				$("#mybtnhdgrid6").append(v_desc);
			}
		} else
		if (Math.abs(p_s)==7) {		
			if (v_pr_sort>0) {
				$("#mybtnhdgrid7").append(v_asc);
			} else {
				$("#mybtnhdgrid7").append(v_desc);
			}
		} else
		if (Math.abs(p_s)==8) {		
			if (v_pr_sort>0) {
				$("#mybtnhdgrid8").append(v_asc);
			} else {
				$("#mybtnhdgrid8").append(v_desc);
			}
		} 
		//
		v_patientid1 = $("#patientid1").val();
		v_patientname1 = $("#patientname1").val();
		v_accessionnumber1 = $("#accessionnumber1").val();
		v_f_date1 = $("#dp1").val();
		v_f_date2 = $("#dp2").val();
		//
		v_ask_url = v_url+'STUDIES?';
		//
		v_ask_url = v_ask_url+'s='+v_pr_sort+'&';
		//
		v_studyuid = $("#fstudyuid1").val();
		if (v_studyuid!='')
			v_ask_url = v_ask_url+'studyuid='+v_studyuid+'&';
		v_description = $("#fdescription1").val();
		if (v_description!='')
			v_ask_url = v_ask_url+'description='+v_description+'&';
		if (v_accessionnumber1!='')
			v_ask_url = v_ask_url+'accessionnumber='+v_accessionnumber1+'&';
		if (v_patientid1!='')
			v_ask_url = v_ask_url+'patientid='+v_patientid1+'&';
		if (v_patientname1!='')
			v_ask_url = v_ask_url+'patientname='+v_patientname1+'&';
		if (v_f_date1!='')
			v_ask_url = v_ask_url+'date1='+v_f_date1+'&';
		if (v_f_date2!='')
			v_ask_url = v_ask_url+'date2='+v_f_date2+'&';
		// наличие заключения	
		v_ask_url = v_ask_url+'zakl='+getmyzakl()+'&';
		// условие на статус в очереди	
		v_ask_url = v_ask_url+'chain='+getchain()+'&';
		// modality	
		v_ask_url = v_ask_url+f_cb_res("CR","check1"); 
		v_ask_url = v_ask_url+f_cb_res("DX","check2");
		v_ask_url = v_ask_url+f_cb_res("IO","check3");
		v_ask_url = v_ask_url+f_cb_res("MR","check4");
		v_ask_url = v_ask_url+f_cb_res("OT","check5");
		v_ask_url = v_ask_url+f_cb_res("RF","check6");
		v_ask_url = v_ask_url+f_cb_res("SC","check7");
		v_ask_url = v_ask_url+f_cb_res("XA","check8");
		v_ask_url = v_ask_url+f_cb_res("CT","check9");
		v_ask_url = v_ask_url+f_cb_res("ES","check10"); 
		v_ask_url = v_ask_url+f_cb_res("MG","check11");
		v_ask_url = v_ask_url+f_cb_res("NM","check12"); 
		v_ask_url = v_ask_url+f_cb_res("PX","check13");
		v_ask_url = v_ask_url+f_cb_res("RG","check14");
		v_ask_url = v_ask_url+f_cb_res("US","check15");
		v_ask_url = v_ask_url+f_cb_res("XC","check16");
		v_ask_url = v_ask_url+f_cb_res("SR","check17");
		v_ask_url = v_ask_url+f_cb_res("ECG","check18");
		// for Internet Explorer  !!!
		$.support.cors = true;
		$.ajax({
		  crossDomain: true,	
		  url: v_ask_url,
		  cache: false, 
		  type:"GET",
		  datatype: "script",
		  timeout : 3000,
		  success: function(data) {
			  
			//  alert(data);
			  
			  frm_searcharr(data);
		  },
		  error: function(err) {
	//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
			  MyAlert('Ошибка получения данных с сервера '+err.statusText );
		  },
	  	  async:   false
		});
	}

	function fgetdata() {	// загрузка данных 
		if (v_sel_nmb!=0) {
			celValue = v_arr_list[v_sel_nmb];
			v_url_tmp = v_url+"IMAGES?STUDYUID="+celValue+'&fld1='+v_un+'&fld2='+v_up;
			// REDIRECT
			if (celValue!='') {
				window.open(v_url_tmp).focus();
			} else {
				MyAlert('Не выбрано исследование');
			}
		} else {
			MyAlert('Не выбрано исследование');
		}
	}
	
	AskData(0);
	cnhg_resize();
	
	$("#myAsk").click(function () {
		AskData(0);
		cnhg_resize();
	});
	
	$("#mytabrefr").dblclick(function(){
		fgetdata();
	});
	
	function fgetprot() {	// загрузка данных 
		if (v_sel_nmb!=0) {
			celValue = v_arr_list[v_sel_nmb];
			v_url_tmp = v_url+"CONCLUSIONS?STUDYUID="+celValue+'&fld1='+v_un+'&fld2='+v_up;
			// REDIRECT
			if (celValue!='') {
				window.open(v_url_tmp).focus();
			} else {
				MyAlert('Не выбрано исследование');
			}
		} else {
			MyAlert('Не выбрано исследование');
		}
	}
	//=========================== обработчики нажатий ===========
	$("#mygofrmsnimki").click(function(){
		fgetdata();
	});
	/*document.getElementById('mygofrmsnimki').addEventListener('touchstart',function(event) {
		fgetdata();
	});*/
	
	$("#mygofrmconcl").click(function(){
		fgetprot();
	});
	/*document.getElementById('mygofrmconcl').addEventListener('touchstart',function(event) {
		fgetprot();
	});*/
	
	$("#mygofrmusers").click(function(){
		redirectOnUSERLIST();
	});
	document.getElementById('mygofrmusers').addEventListener('touchstart',function(event) {
	redirectOnUSERLIST();//не убирать, иначе не будет работать на прикосновения
	});
	
	$("#mygofrmshablons").click(function(){
		redirectOnTEMPLLIST();
	});
	document.getElementById('mygofrmshablons').addEventListener('touchstart',function(event) {
	redirectOnTEMPLLIST();//не убирать, иначе не будет работать на прикосновения
	});
	
	$("#hospitallist").click(function(){
		var v_url_tmp = v_url+'LPULIST?fld1='+v_un+'&fld2='+v_up;
		window.open(v_url_tmp).focus();	// REDIRECT
	});

	//========================== конец обработчиков =============
	
	function redirectOnUSERLIST(){
		var v_url_tmp = v_url+'USERLIST?fld1='+v_un+'&fld2='+v_up;
		window.open(v_url_tmp).focus();	// REDIRECT
		
	}
	
	function redirectOnTEMPLLIST(){
		var v_url_tmp = v_url+'TEMPLLIST?fld1='+v_un+'&fld2='+v_up;
		window.open(v_url_tmp).focus();	// REDIRECT
	}
	
	function setActuality(p_act)
	{	
		if (v_sel_nmb!=0) {
			celValue = v_arr_list[v_sel_nmb];
			v_url_tmp = v_url+"SETACTUALITY?STUDYUID="+celValue+'&fld1='+v_un+'&fld2='+v_up+'&act='+p_act;
			// for Internet Explorer  !!!
			$.support.cors = true;
			$.ajax({
			  crossDomain: true,	
			  url: v_url_tmp,
			  cache: false, 
			  type:"GET",
			  datatype: "script",
			  timeout : 3000,
			  success: function(data) {
				  	AskData(0);
					cnhg_resize();
			  },
			  error: function(err) {
		//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
				  MyAlert('Ошибка получения данных с сервера '+err.statusText );
			  },
		  	  async:   false
			});			
		} else {
			MyAlert('Не выбрано исследование');
		}
	}
	
		
});


function getmyzakl () {
	if ($("#myzaklhead").text()=="Весь список") {
		return 1;
	} else
	if ($("#myzaklhead").text()=="С заключением") {
		return 2;
	} else
	if ($("#myzaklhead").text()=="Без заключения") {
		return 3;
	}
}

function getchain() {
	if ($("#myzaklchain").text()=="Весь список") {
		return 0;
	} else
	if ($("#myzaklchain").text()=="Очередь") {
		return 1;
	} else
	if ($("#myzaklchain").text()=="Плановые") {
		return 2;
	} else
	if ($("#myzaklchain").text()=="Срочные") {
		return 3;
	} else
	if ($("#myzaklchain").text()=="Экстренные") {
		return 4;
	} else
	if ($("#myzaklchain").text()=="Завершенные") {
		return 5;
	} else
	if ($("#myzaklchain").text()=="Установленные") {
		return 6;
	} else
	if ($("#myzaklchain").text()=="Не установленные") {
		return 7;
	} else
		return 0;
}

function set_chk_def () {
		$("#myzaklhead").text("Весь список");
		$("#myzaklhead").append('<b style="float:right" class="caret"></b>');
}

function setmyzakl ( p_nmb ) {
	if ( p_nmb==1 ) {
		set_chk_def ();
	} else
	if ( p_nmb==2 ) {
		$("#myzaklhead").text("С заключением");
		$("#myzaklhead").append('<b style="float:right" class="caret"></b>');
	} else
	if ( p_nmb==3 ) {
		$("#myzaklhead").text("Без заключения");
		$("#myzaklhead").append('<b style="float:right" class="caret"></b>');
	}
}

function remedotrade() {
	window.open('http://www.medotrade.ru');	
}

function screenSize() {
    var w, h; // Объявляем переменные, w - длина, h - высота
    w = (window.innerWidth ? window.innerWidth : (document.documentElement.clientWidth ? document.documentElement.clientWidth : document.body.offsetWidth));
    h = (window.innerHeight ? window.innerHeight : (document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.offsetHeight));
    return {w:w, h:h};
}

function cnhg_resize () {
	var v_tmp_w = screenSize().w;
	var v_tmp_h = screenSize().h;
	
	$('body').height(v_tmp_h);
	
	$("#myLocLstMenu").css("width","669px");
	$(".myurgmenu").css("width","130px");
	
	if (v_tmp_h>800) {
		$("#mycmnfooter").css("display","block");
	} else {
		$("#mycmnfooter").css("display","none");
	}
	

}
	
