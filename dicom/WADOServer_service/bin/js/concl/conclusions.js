$(function() {
//	var v_ISQUERIES=0;
//	var v_ISCONCL=0;
//	var v_adm=0 
	
if(v_adm==0){		$("#MyadminMenu").css("display","none");	}
else	{		$("#MyadminMenu").css("display","block");	}
	
if(v_ISCONCL==0){
$("#editMenu").hide();
}
else{
$("#editMenu").show();
}
/*
if(v_adm==0){
$("#adminMenu").modal(‘hide’);				//.css("display","none");		//.attr("disabled", "disabled");
}
else{
$("#adminMenu").modal('show');								//.css("display","line");
}*/
	$("#li_hd_mnu_3").css("font-weight","bold"); // активный/текущая страница - первый пункт меню
	var editor;
	// Create a new editor inside the <div id="editor">, setting its value to html
	// The instanceReady event is fired, when an instance of CKEditor has finished
	// its initialization.
	CKEDITOR.on( 'instanceReady', function( ev ) {
		editor = ev.editor;	
		cnhg_resize();		
	});
		
	
	function set_mod_scr () {
			v_h_tmp=screenSize().h;
			$("#mymdfrmhead").height(30);
			$("#concltextarea1").height(v_h_tmp-116);
			$("#concltextarea1").width( screenSize().w*0.6-60 );
	}

//	cnhg_resize();
	$(window).resize(function() {
		cnhg_resize();
		set_mod_scr();	
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
	
	

   
   $(".myconclchk").click(function()   {
	   
		$(".myconclchk").css("border","2px solid #D0E7F2");
		v_sel_nmb=0;
		
		$(this).css("border","2px solid red");
		v_sel_nmb = $(this).attr('id');
	   
	});
	
	$("#myotmsavconcl").click(function()   {	
		$('#concltextarea1').val('');
	//	$('#myModal').modal('hide');
		$('#myfuturedfon').css("display","none");
	});
	
	$("#mysavconcl").click(function()   {
		savconcl(0);
	});
	
	$("#mycomplconcl").click(function()   {
		savconcl(1);
	});
	
	
	refr_concl();	// обновить список заключений	

	function gt_template() {
		v_ask_url = v_url+"FULLTEMPLATESMOD?MOD="+v_mod+'&ui='+v_ui;
		// for Internet Explorer  !!!
		$.support.cors = true;
		$.ajax({
		  crossDomain: true,	
		  url: v_ask_url,
		  cache: false, 
		  type:"GET",
		  datatype: "script",
		  timeout : 6000,
		  success: function(data) {
			 editor.setData( v_emp1+data+v_emp2 ); 
			 $('#myfuturedfon').css("display","block"); 
		  },
		  error: function(err) {
			  v_amm_err++;
			  if (v_amm_err>50 ) {
				  $("#mymainscrollconcl").append( p1+'Ошибка получения данных '+err.statusText+p2 );
			  } else {
				  get_concl_full();
			  }
	//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
		  },
		  async:   false
		});
	}

	$("#myaddconcl").click(function()   {
		set_mod_scr();	
		v_is_edt = false;
		//editor.setData( '' );
		var CurrentDate = new Date();
		var MonthName = new Array('01','02','03','04','05','06','07','08','09','10','11','12');
		var v_dt_tmp = CurrentDate.getDate() + '.' + MonthName[CurrentDate.getMonth()] + '.' + 
			(CurrentDate.getYear() < 200 ? CurrentDate.getYear() + 1900 : CurrentDate.getYear()) ;
		var v_h = CurrentDate.getHours();
		var v_m = CurrentDate.getMinutes();
		v_h=v_h+'';
		v_m=v_m+'';
		if (v_h.length==1) {v_h='0'+v_h}
		if (v_m.length==1) {v_m='0'+v_m}
		$('#myedtconcldt').text(v_dt_tmp + ' ' + v_h +':'+ v_m );
        $('#myedtconclnam').text(v_fam + ' ' + v_nam + ' ' + v_surn);
		// ---------------------------------------------------------------------
		// вставить шаблон
		gt_template();
		// ---------------------------------------------------------------------
	});

	$("#myedtconcl").click(function()   {
		if (v_sel_nmb>0) {
			set_mod_scr();	
			v_is_edt = true;
			$('#myedtconcldt').text(v_sel_date);
            $('#myedtconclnam').text(v_sel_doctor);
			editor.setData( v_sel_val );	
			$('#myfuturedfon').css("display","block");
		} else {
			MyAlert('Заключение не выбрано');	
		}
	});

	$("#mydltconcl").click(function()   {
		if (v_sel_nmb>0) {
			if (confirm('Удалить запись ?')) {
				v_ask_url = v_url+'DELCONCLUSION?studyuid='+v_main_studyuid+'&ui='+v_ui+'&id='+v_arr_list[0][v_sel_nmb];
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
				//	$("#"+v_arr_list[0][v_sel_nmb]).remove();
					refr_concl();	// обновить список заключений
					v_sel_nmb=0;  
				  },
				  error: function(err) {
			//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
					  MyAlert('Ошибка получения данных с сервера '+err.statusText );
				  }
				});
			}
		} else {
			MyAlert('Заключение не выбрано');	
		}
	});
	
	
	//====================== Обработчики главного меню ===========================	
	$("#hospitallist").click(function(){
		var v_url_tmp = v_url+'LPULIST?fld1='+v_un+'&fld2='+v_up;
		window.open(v_url_tmp).focus();	// REDIRECT
	});
	
	$("#mygofrmusers").click(function(){
		redirectOnUSERLIST();
	});
	
	$("#mygofrmshablons").click(function(){
		redirectOnTEMPLLIST();
	});
	
	document.getElementById('mygofrmusers').addEventListener('touchstart',function(event) {
	redirectOnUSERLIST()
	});
	
	document.getElementById('mygofrmshablons').addEventListener('touchstart',function(event) {
	redirectOnTEMPLLIST();
	});
	
	$("#mygofrmsnimki").click(function(){
		v_url_tmp = v_url+"IMAGES?STUDYUID="+v_main_studyuid+'&fld1='+v_un+'&fld2='+v_up;
		window.open(v_url_tmp);		
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

	
function savconcl(p_is_compl) {
	v_text =  editor.getData();
	if (v_is_edt) {
		v_ask_url = v_url+'SAVECONCLUSION?studyuid='+v_main_studyuid+'&ui='+v_ui+'&id='+v_arr_list[0][v_sel_nmb];
	} else {
		v_ask_url = v_url+'SAVECONCLUSION?studyuid='+v_main_studyuid+'&ui='+v_ui+'&id=-1';
	}
	// for Internet Explorer  !!!
	$.support.cors = true;
	$.ajax({                                       
		  type: "POST",
		  url: v_ask_url,           
		  data: v_text,
		  cache: false,
		  dataType: "html",           
		  timeout : 3000,
		  success: function(data) {  
			$('#myfuturedfon').css("display","none");
			if (p_is_compl==1) {	// завершить исследование
				set_status_study(4); // завершенная
			} else {
				refr_concl(); // обновить список заключений
			}	
		  },
		  error: function(err) {
	//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
			  MyAlert('Ошибка получения данных с сервера '+err.statusText );
		  }	
	});
}
	
   
});


	
function cnhg_resize () {

	var v_h_tmp = screenSize().h-$("#mymainmenu").height()-$("#mymainhd").height()-40-90;

	$(".myheadt").css("width",screenSize().w+"px");
	$("#mymaincntrprt").css("height",v_h_tmp+"px");
	
	$("#mycmnfooter").css("top",(screenSize().h-40)+"px");
	
	$("#mybodyconcl").css("height",v_h_tmp+"px");

	$(".t_hgh_gr").css("height",(v_h_tmp-30)+"px");
	$(".t_hgh_gr").css("min-height",(v_h_tmp-30)+"px");
	$(".t_hgh_gr").css("max-height",(v_h_tmp-30)+"px");
	
	var v_h1_tmp = v_h_tmp-120-50 ;
	
	$(".t_hgh_gr1").css("height",v_h1_tmp+"px");
	$(".t_hgh_gr1").css("min-height",v_h1_tmp+"px");
	$(".t_hgh_gr1").css("max-height",v_h1_tmp+"px");
	
	var v_min_edt_width = 700;
	if (screenSize().w<=v_min_edt_width+50) {
		var v_min_width = v_min_edt_width;
	} else {
		var v_min_width = screenSize().w*0.8;
	}
	
	var v_leftmy = Math.floor(((screenSize().w-v_min_width)/2));
	
	var v_d_tmp=10;
	
	var v_width_tmp = document.getElementById("myconclforummn").offsetWidth-20-195;
	$(".tufld2").width(v_width_tmp-30);
	
	var v_myheight_tmp = 670;
	$("#myconclforummn").css("min-height",(v_myheight_tmp+40)+"px");
	$("#myconclforummn").css("max-height",(v_myheight_tmp+40)+"px");
	$("#myconclforummn").css("height",(v_myheight_tmp+40)+"px");
	$("#mymainscrollconcl").css("min-height",v_myheight_tmp+"px");
	$("#mymainscrollconcl").css("max-height",v_myheight_tmp+"px");
	$("#mymainscrollconcl").css("height",v_myheight_tmp+"px");
	
	
	$("#myfuturedhead").css("top","0");
	$("#myfuturedhead").css("left",v_leftmy+"px");
	$("#myfuturedhead").width(v_min_width);
	$("#myfuturedhead").height(40);
	
	$("#myfutured").css("top","40px");	
	$("#myfutured").css("left",v_leftmy+"px");
	
	$("#myfutured").width(v_min_width);
	$("#myfutured").height(screenSize().h-40-30-v_d_tmp);
	
	$("#myfuturedfon").width(screenSize().w);
	$("#myfuturedfon").height(screenSize().h-40);
	
	$("#myfuturedfon").css("left","0");
	$("#myfuturedfon").css("top","0");
	
	var v_btn_width = 366;
	var v_btn_w_tmp = 185;
	$("#myfuturedfoot").css("top",(screenSize().h-40-40)+"px");
	$("#myfuturedfoot").css("left",(v_leftmy+v_min_width-v_btn_width-v_btn_w_tmp)+"px");
	$("#myfuturedfoot").width(v_btn_width+v_btn_w_tmp);
	$("#myfuturedfoot").height(30);
	
	var v_h=screenSize().h;
	if (v_h>=900) {
		v_edt_h = v_h-40-30-v_d_tmp - $("#cke_1_top").height()-200;
	} else {
		v_edt_h = v_h-40-30-v_d_tmp - $("#cke_1_top").height()-200-60;		
	}
	// screenSize().h-40-30-$("#cke_1_top").height()-10 - 40 -30 - 70 - 50-v_d_tmp; 

	v_edt_f = screenSize().h-40-30 -10 ; 
	for (var i = 1; i < 10; i++) {
		$("#cke_"+i+"_contents").height( v_edt_h + "px");
		$("#cke_"+i+"_contents").css( "height" , v_edt_h + "px");
		$("#cke_"+i+"_contents").css( "max-height" , v_edt_h + "px");
	}
	
	$("#mytmpfooter").width(screenSize().w);
	$("#mytmpfooter").height(40);
	$("#mytmpfooter").css("left","0");
	$("#mytmpfooter").css("top",(screenSize().h-39)+"px");
	$("#mytmpfooter").css("padding-left",( (screenSize().w-v_min_width)/2+v_min_width-150 )+"px");
	// в конце - отобразим элементы
	$("#mytmpfooter").css("display","block");
}	

function remedotrade() {
	window.open('http://www.medotrade.ru').focus();	
}

function clcconclset () {
	$(".myconclchk").click(function()   {
	   
		$(".myconclchk").css("border","2px solid #D0E7F2");
		v_sel_nmb=0;
		
		$(this).css("border","2px solid red");
		
		v_sel_nmb = $(this).attr('id');
		v_sel_date = $('#mydt'+v_sel_nmb).text();
		v_sel_doctor = $('#mydoct'+v_sel_nmb).text();
		
		v_sel_val = $('#myvalsta'+v_sel_nmb).html();

	//	v_sel_val = v_sel_val.replace('\n','<br>');
		
		i=1;
	});	
}

function screenSize() {
    var w, h; // Объявляем переменные, w - длина, h - высота
    w = (window.innerWidth ? window.innerWidth : (document.documentElement.clientWidth ? document.documentElement.clientWidth : document.body.offsetWidth));
    h = (window.innerHeight ? window.innerHeight : (document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.offsetHeight));
    return {w:w, h:h};
}

function get_concl_full(iii,p1,p2) {
	v_ask_url = v_url+"FULLCONCLUSION?ID="+iii+'&studyuid='+v_main_studyuid+'&ui='+v_ui;
	// for Internet Explorer  !!!
	$.support.cors = true;
	$.ajax({
	  crossDomain: true,	
	  url: v_ask_url,
	  cache: false, 
	  type:"GET",
	  datatype: "script",
	  timeout : 6000,
	  success: function(data) {
		  $("#mymainscrollconcl").append( p1+data+p2 );
		  clcconclset (); 
	  },
	  error: function(err) {
		  v_amm_err++;
		  if (v_amm_err>50 ) {
			  $("#mymainscrollconcl").append( p1+'Ошибка получения данных '+err.statusText+p2 );
		  } else {
			  get_concl_full(iii,p1,p2);
		  }
//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
	  },
	  async:   false
	});
	
}

function gridconcladdrecord (frecord) 
{
	v_flr = '<;>';
	v_curfld = frecord;
	
	v_nn++;

	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[0][v_nn] = v_curfld.substr(0,v_fpos);				// FK_ID
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[1][v_nn] = v_curfld.substr(0,v_fpos);			// FD_DATE
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[2][v_nn] = v_curfld.substr(0,v_fpos);		// FK_USERID
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );

	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[3][v_nn] = v_curfld.substr(0,v_fpos);	// FC_FAM
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );

	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[4][v_nn] = v_curfld.substr(0,v_fpos);				// FC_IM
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );

	// остаток - загоняем в FC_OTCH
	v_arr_list[5][v_nn] = v_curfld;
	
	// -----------------------------------------------------------------------------
	get_concl_full( v_arr_list[0][v_nn],  
		'<div id="'+v_nn+'" class="myconclchk" >'+
			'<div style="height:20px;padding:2px;background-color:#D0E7F2;" class="">'+
			'    <div class="span2 " style="color:#599DC0"><H4 id="mydt'+v_nn+'"><strong> '+v_arr_list[1][v_nn]+' </strong></H4></div>'+
			'    <div class="span9 " style="color:#599DC0"><H4 id="mydoct'+v_nn+'"><strong> '+
							v_arr_list[3][v_nn]+' '+v_arr_list[4][v_nn]+' '+v_arr_list[5][v_nn]+' </strong></H4></div>'+
			'</div>'+
			'<div id="myvalsta'+v_nn+'" style="padding:10px;border:2px solid #D0E7F2" class="">'+
			'    <p>',
			'    </p>'+
			'</div>'+
		'</div>'
			);
	// -----------------------------------------------------------------------------
}

function frm_searchconcl(fdata)	//	парсинг ответа от сервера со списком заключений
{	// заполнение новыми данными
	v_pos=0;
	v_cur_str = '';
	v_cur_grid_id=0;
	v_amm_err=0;
	v_lftstr = fdata;
	v_rcr = '<|>';
	v_nn = 0;
	var v_amm_tmp = 0;
	while (v_pos>=0) {
		v_pos=v_lftstr.indexOf(v_rcr);
		if (v_pos!=-1) {	// найдено
			v_cur_str = v_lftstr.substr(0,v_pos);
			v_lftstr = v_lftstr.substr( v_pos+v_rcr.length, v_lftstr.length );
			gridconcladdrecord(v_cur_str);
			v_amm_tmp++;
		} else {	// не найдено
			if ((v_lftstr!='') && (v_lftstr!='\r\n'))
			{
				gridconcladdrecord(v_lftstr);	// добавим остаток 
				v_amm_tmp++;
			}
			break;						// и выйдем из цикла
		}
	}
	if (v_amm_tmp==0) {
		$("#mymainscrollconcl").append( 
		'<div id="0" style="padding-left:10px">'+
			'<p>Список пуст</p>'+
		'</div>');
	}
}

function refr_concl() // обновить список заключений
{	// очистка списка
	$(".myconclchk").remove();
	v_amm_concl = 0;
	// запрос
	v_ask_url = v_url+'JQRCONCL?studyuid='+v_main_studyuid+'&ui='+v_ui;
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
		  frm_searchconcl(data);
	  },
	  error: function(err) {
//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
		  MyAlert('Ошибка получения данных с сервера '+err.statusText );
	  },
	  async:   false
	});
}	

function set_status_study(p_status_study) {
	v_ask_url = v_url+'NEXTCONCLUSION?studyuid='+v_main_studyuid+'&setstatus=4';
	// for Internet Explorer  !!!
	$.support.cors = true;
	$.ajax({                                       
		  type: "GET",
		  url: v_ask_url,           
		//  data: v_text,
		  cache: false,
		  dataType: "html",           
		  timeout : 3000,
		  success: function(data) { 
		  	data=data.replace("\r\n",""); 
		  	if (data!='') {
				v_main_studyuid=data; 	//	redirect на страницу исследования со снимками 
				v_url_tmp = v_url+"IMAGES?STUDYUID="+v_main_studyuid+'&fld1='+v_un+'&fld2='+v_up;
				window.open(v_url_tmp).focus();
			//	refr_concl(); // обновить список заключений
			}
		  },
		  error: function(err) {
	//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
			  MyAlert('Ошибка получения данных с сервера '+err.statusText );
		  }	
	});
}

	
