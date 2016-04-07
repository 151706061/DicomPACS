function cnhg_resize () {

	function cmnModBtn(p_name_mod) {
		$("#myzaklhead").text(p_name_mod);
		$("#myzaklhead").append('<b style="float:right" class="caret"></b>');
	}

	$("#mkCR").click(function(){ cmnModBtn('CR');	});
	$("#mkDX").click(function(){ cmnModBtn('DX');	});
	$("#mkIO").click(function(){ cmnModBtn('IO');	});
	$("#mkMR").click(function(){ cmnModBtn('MR');	});
	$("#mkOT").click(function(){ cmnModBtn('OT');   });
	$("#mkRF").click(function(){ cmnModBtn('RF');	});
	$("#mkSC").click(function(){ cmnModBtn('SC');	});
	$("#mkXA").click(function(){ cmnModBtn('XA');	});
	$("#mkCT").click(function(){ cmnModBtn('CT');	});
	$("#mkES").click(function(){ cmnModBtn('ES');	});
	$("#mkMG").click(function(){ cmnModBtn('MG');   });
	$("#mkNM").click(function(){ cmnModBtn('NM');   });
	$("#mkPX").click(function(){ cmnModBtn('PX');	});
	$("#mkRG").click(function(){ cmnModBtn('RG');   });
	$("#mkUS").click(function(){ cmnModBtn('US');	});
	$("#mkXC").click(function(){ cmnModBtn('XC');	});
	$("#mkSR").click(function(){ cmnModBtn('SR');	});
	$("#mkECG").click(function(){ cmnModBtn('ECG');	});
	
	document.getElementById("mkCR").addEventListener('touchstart',function(){ cmnModBtn('CR');	});
	document.getElementById("mkDX").addEventListener('touchstart',function(){ cmnModBtn('DX');	});
	document.getElementById("mkIO").addEventListener('touchstart',function(){ cmnModBtn('IO');	});
	document.getElementById("mkMR").addEventListener('touchstart',function(){ cmnModBtn('MR');	});
	document.getElementById("mkOT").addEventListener('touchstart',function(){ cmnModBtn('OT'); });
	document.getElementById("mkRF").addEventListener('touchstart',function(){ cmnModBtn('RF');	});
	document.getElementById("mkSC").addEventListener('touchstart',function(){ cmnModBtn('SC');	});
	document.getElementById("mkXA").addEventListener('touchstart',function(){ cmnModBtn('XA');	});
	document.getElementById("mkCT").addEventListener('touchstart',function(){ cmnModBtn('CT');	});
	document.getElementById("mkES").addEventListener('touchstart',function(){ cmnModBtn('ES');	});
	document.getElementById("mkMG").addEventListener('touchstart',function(){ cmnModBtn('MG'); });
	document.getElementById("mkNM").addEventListener('touchstart',function(){ cmnModBtn('NM'); });
	document.getElementById("mkPX").addEventListener('touchstart',function(){ cmnModBtn('PX');	});
	document.getElementById("mkRG").addEventListener('touchstart',function(){ cmnModBtn('RG'); });
	document.getElementById("mkUS").addEventListener('touchstart',function(){ cmnModBtn('US');	});
	document.getElementById("mkXC").addEventListener('touchstart',function(){ cmnModBtn('XC');	});
	document.getElementById("mkSR").addEventListener('touchstart',function(){ cmnModBtn('SR');	});
	document.getElementById("mkECG").addEventListener('touchstart',function(){ cmnModBtn('ECG');	});

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
	$("#myfuturedfoot").css("top",(screenSize().h-40-40)+"px");
	$("#myfuturedfoot").css("left",(v_leftmy+v_min_width-v_btn_width)+"px");
	$("#myfuturedfoot").width(v_btn_width);
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
	window.open('http://www.medotrade.ru');	
}

function screenSize() {
    var w, h; // Объявляем переменные, w - длина, h - высота
    w = (window.innerWidth ? window.innerWidth : (document.documentElement.clientWidth ? document.documentElement.clientWidth : document.body.offsetWidth));
    h = (window.innerHeight ? window.innerHeight : (document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.offsetHeight));
    return {w:w, h:h};
}

function del_concl() //Удалить 
{
    selRowId = $('#concl_lst').jqGrid ('getGridParam', 'selrow');
    celValue = v_arr_concl_FK_ID[selRowId];
	if (celValue>0) {
		var r=confirm("Удалить запись ?");
		if (r==true)
		{
			v_ask_url = v_url+'DELCONCLUSION?studyuid='+studyUID[v_cur_pos]+'&ui='+v_ui+'&id='+celValue;
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
				//  alert('Запись удалена');
					$('#concltextarea').val( '' );
					refr_concl(); // обновить список заключений
			  },
			  error: function(err) {
		//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
				  MyAlert('Ошибка получения данных с сервера '+err.statusText );
			  }
			});
		}
	}
}

function gridtempladdrecord (frecord) 
{
	v_flr = '<;>';
	v_curfld = frecord;

	v_nn++;
	
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[0][v_nn] = v_curfld.substr(0,v_fpos);				// FK_ID
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[1][v_nn] = v_curfld.substr(0,v_fpos);			// STUDIES_IMAGE_TYPE
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	
	v_arr_list[2][v_nn] = v_curfld;			// COMMENT
	
	// -----------------------------------------------------------------------------
//	$("#mymainscrollconcl").append('<div id="1" class="myconclchk">');
    $("#mymainscrollconcl").append('  <div id="'+v_nn+'" style="border:2px solid color:#D0E7F2;background-color:#D0E7F2;height:20px;" class="myselval mydelf">'+
	                               '    <div class="mysel myfloatleft tufld0 " style="height:20px" >&nbsp;</div>'+
	                               '    <div class=" myfloatleft tufld1 " style="height:20px">&nbsp;'+v_arr_list[1][v_nn]+'</div>'+
	                               '    <div id="myfldcomm" class=" myfloatleft tufld2 " style="height:20px;width:100px">&nbsp;'+v_arr_list[2][v_nn]+'</div>'+
                                   '  </div>');
//    $("#mymainscrollconcl").append('</div>');
	// -----------------------------------------------------------------------------
	$(".myselval").click(function()   {
		$(".myselval").css("border","none");
		$(".myselval").css("border","2px solid color:#D0E7F2");
		v_sel_nmb=0;
		$(this).css("border","2px solid red");
		v_sel_nmb = $(this).attr('id');
	});
	
}

function frm_search_templates(fdata)	//	парсинг ответа от сервера со списком 
{	// очистка старых данных
	$(".mydelf").remove();
	// заполнение новыми данными
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
			gridtempladdrecord(v_cur_str);
			v_amm_tmp++;
		} else {	// не найдено
			if ((v_lftstr!='') && (v_lftstr!='\r\n'))
			{
				gridtempladdrecord(v_lftstr);	// добавим остаток 
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
	$(".mydelf").remove();
	v_amm_concl = 0;
	// запрос
	v_ask_url = v_url+'JQRTEMPL?fld1='+v_un+'&fld2='+v_up;
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
		frm_search_templates(data);
		cnhg_resize ();
	  },
	  error: function(err) {
//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
		  MyAlert('Ошибка получения данных с сервера '+err.statusText );
	  },
	  async:   false
	});
}	
	
$(function() {
	
	$("#li_hd_mnu_3").css("font-weight","bold"); // активный/текущая страница - первый пункт меню
	
	$("#mygofrmsnimki").css("display","none");
	$("#mygofrmconcl").css("display","none");
	
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
	
	
	$("#mygofrmsnimki").click(function(){
		v_url_tmp = v_url+"IMAGES?STUDYUID="+v_main_studyuid+'&fld1='+v_un+'&fld2='+v_up;
		window.open(v_url_tmp);		
	});
	
   
   $(".myconclchk").click(function()   {
	   
		$(".myconclchk").css("border","2px solid #D0E7F2");
		v_sel_nmb=0;
		
		$(this).css("border","2px solid red");
		v_sel_nmb = $(this).attr('id');
	   
	});
	
	$("#myotmsavconcl").click(function()   {	
		$('#myfuturedfon').css("display","none");
	});
	
	$("#mysavconcl").click(function()   {
		v_text =  editor.getData();
		v_STUDIES_IMAGE_TYPE = $('#myzaklhead').text();
		v_COMM = $('#comment1').val();
		if (v_is_edt) {
			v_ask_url = v_url+'SAVETEMPLATE?ui='+v_ui+'&id='+v_arr_list[0][v_sel_nmb]+'&MOD='+v_STUDIES_IMAGE_TYPE+'&COMM='+v_COMM;
		} else {
			v_ask_url = v_url+'SAVETEMPLATE?ui='+v_ui+'&id=-1&MOD='+v_STUDIES_IMAGE_TYPE+'&COMM='+v_COMM;
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
				refr_concl(); // обновить список заключений	
			  },
			  error: function(err) {
		//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
				  MyAlert('Ошибка получения данных с сервера '+err.statusText );
			  }	
		});
	});
	
	refr_concl();	// обновить список заключений	

	$("#myaddconcl").click(function()   {
		set_mod_scr();	
		v_is_edt = false;
		editor.setData( v_emp_editor_str );
		$('#comment1').val('');
		$("#myzaklhead").text('CR');
		$("#myzaklhead").append('<b style="float:right" class="caret"></b>');
		$('#myfuturedfon').css("display","block");
	});

	function get_concl_full() {
		v_ask_url = v_url+"FULLTEMPLATES?ID="+v_arr_list[0][v_sel_nmb]+'&ui='+v_ui;
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
			// editor.setData( v_emp1+'456'+v_emp2 ); 
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

	$("#myedtconcl").click(function()   {
		v_amm_err=0;
		if (v_sel_nmb>0) {
			set_mod_scr();	
			v_is_edt = true;
			
			v_comm = v_arr_list[2][v_sel_nmb];
			v_mod  = v_arr_list[1][v_sel_nmb];
			
			$('#comment1').val(v_comm);
			$('#myzaklhead').text(v_mod);
			$("#myzaklhead").append('<b style="float:right" class="caret"></b>');		
			
		//	$('#myfuturedfon').css("display","block"); 
			
			//editor.setData( v_emp_editor_str );
		//	editor.setData( v_emp1+'123'+v_emp2 ); 
			get_concl_full();
		} else {
			MyAlert('Запись не выбрана');	
		}
	});

	$("#mydlttempl").click(function()   {
		if (v_sel_nmb>0) {
			if (confirm('Удалить запись ?')) {
				v_ask_url = v_url+'DELTEMPL?id='+v_arr_list[0][v_sel_nmb];
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
					$("#"+v_sel_nmb).remove();
				//	refr_concl();	// обновить список заключений
					v_sel_nmb=0;  
				  },
				  error: function(err) {
			//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
					  MyAlert('Ошибка получения данных с сервера '+err.statusText );
				  }
				});
			}
		} else {
			MyAlert('Запись не выбрана');	
		}
	});
	
	$("#hospitallist").click(function(){
		var v_url_tmp = v_url+'LPULIST?fld1='+v_un+'&fld2='+v_up;
		window.open(v_url_tmp);	// REDIRECT
	});
	
	
	$("#mygofrmusers").click(function(){
		redirectOnUSERLIST();
	});
	
	$("#mygofrmshablons").click(function(){
		redirectOnTEMPLLIST();
	});
	//======================= обработчики прикосновений ==============
	document.getElementById('mygofrmusers').addEventListener('touchstart',function(event) {
	redirectOnUSERLIST()
	});
	
	document.getElementById('mygofrmshablons').addEventListener('touchstart',function(event) {
	redirectOnTEMPLLIST();
	});
	//========================== конец обработчиков =============
	
	function redirectOnUSERLIST(){
		var v_url_tmp = v_url+'USERLIST?fld1='+v_un+'&fld2='+v_up;
		window.open(v_url_tmp);	// REDIRECT
	}
	
	function redirectOnTEMPLLIST(){
		var v_url_tmp = v_url+'TEMPLLIST?fld1='+v_un+'&fld2='+v_up;
		window.open(v_url_tmp);	// REDIRECT
	}
	
   
});