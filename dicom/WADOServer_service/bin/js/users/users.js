$(function() {
	$("#chk_mod_mrgn").css("margin-left","110px");
	
	$("#li_hd_mnu_2").css("display","none");
	$("#li_hd_mnu_3").css("display","none");
	$("#li_hd_mnu_1").css("font-weight","normal"); // активный/текущая страница - первый пункт меню
	
	$("#chk_mod").css('height','300px');
	
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
                        
                        
    $( "#format1" ).buttonset();
    $( "#format2" ).buttonset();
    
    $("#myAsk").click(function () {
		AskData(0);
		//cnhg_resize();
		f_resize();
	});
	
	$("#myclr").click(function () {
		ClrData();
	}); 
	
	$("#myRemoveAll").click(function () {
		ClrChecked();
	});
	$("#myCheckAll").click(function () {
		CheckedAll();
	});
	//====================== Обработчики главного меню ===========================	
	$("#mygofrmusers").click(function(){
		redirectOnUSERLIST();
	});
	
	$("#mygofrmshablons").click(function(){
		redirectOnTEMPLLIST();
	});
	
	
   	$("#mygofrmconcl").click(function(){
		fgetprot();
	});
	document.getElementById('mygofrmconcl').addEventListener('touchstart',function(event) {
	fgetprot();
	});
	
	document.getElementById('mygofrmusers').addEventListener('touchstart',function(event) {
	redirectOnUSERLIST()
	});
	
	document.getElementById('mygofrmshablons').addEventListener('touchstart',function(event) {
	redirectOnTEMPLLIST();
	});
	
	//========================== конец обработчиков =============
	
	// сортировка
	$("#mybtnhdgrid1q").click(function () {	//	&nbsp
		AskData(0);
	});
    $("#mybtnhdgrid2q").click(function () {	//	
		AskData(1);
	});
    $("#mybtnhdgrid3q").click(function () {	//	
		AskData(2);
	});                   
    $("#mybtnhdgrid4q").click(function () {	//	
		AskData(3);
	});   
	
	
	$("#hospitallist").click(function(){
		var v_url_tmp = v_url+'LPULIST?fld1='+v_un+'&fld2='+v_up;
		window.open(v_url_tmp).focus();	// REDIRECT
	});
	
	$("#mysavusers").click(function()   {
		if ( ($('#FC_PSW1').val()!='') 
		     &&
		     ( $('#FC_PSW1').val()==$('#FC_PSW_D1').val() )
		   ) 
		{    
			if ((v_sel_nmb>0) || (!v_is_edt)) {
				if (v_is_edt) {
					v_ask_url = v_url+'ADDUSER?fld1='+v_un+'&fld2='+v_up+'&id='+v_arr_list[v_sel_nmb][0];
				} else {
					v_ask_url = v_url+'ADDUSER?fld1='+v_un+'&fld2='+v_up+'&id=-1';
				}
				v_ask_url=v_ask_url+'&FAM='+$('#FC_FAM1').val()+
									'&IM='+$('#FC_IM1').val()+
									'&OTCH='+$('#FC_OTCH1').val()+
									'&FIRMA='+$('#FC_FIRMA1').val()+
									'&DOLJN='+$('#FC_DOLJN1').val()+
									'&USLUGI='+$('#FC_USLUGI1').val()+
									'&SPEC='+$('#FC_SPECIALIZATIONS1').val()+
									'&LOGIN='+$('#FC_LOGIN1').val();
				v_ask_url = v_ask_url+'&'+f_cb_res("CR","chCR"); 
				v_ask_url = v_ask_url+'&'+f_cb_res("DX","chDX");
				v_ask_url = v_ask_url+'&'+f_cb_res("IO","chIO");
				v_ask_url = v_ask_url+'&'+f_cb_res("MR","chMR");
				v_ask_url = v_ask_url+'&'+f_cb_res("OT","chOT");
				v_ask_url = v_ask_url+'&'+f_cb_res("RF","chRF");
				v_ask_url = v_ask_url+'&'+f_cb_res("SC","chSC");
				v_ask_url = v_ask_url+'&'+f_cb_res("XA","chXA");
				v_ask_url = v_ask_url+'&'+f_cb_res("CT","chCT");
				v_ask_url = v_ask_url+'&'+f_cb_res("ES","chES"); 
				v_ask_url = v_ask_url+'&'+f_cb_res("MG","chMG");
				v_ask_url = v_ask_url+'&'+f_cb_res("NM","chNM"); 
				v_ask_url = v_ask_url+'&'+f_cb_res("PX","chPX");
				v_ask_url = v_ask_url+'&'+f_cb_res("RG","chRG");
				v_ask_url = v_ask_url+'&'+f_cb_res("US","chUS");
				v_ask_url = v_ask_url+'&'+f_cb_res("XC","chXC");
				v_ask_url = v_ask_url+'&'+f_cb_res("SR","chSR");
				v_ask_url = v_ask_url+'&'+f_cb_res("ECG","chECG");
				// v_FN_ISQUERIES
			    if ($("#FN_ISQUERIES1").prop('checked')) {
			    	v_ask_url = v_ask_url+'&isqr=1';
			    } else {
			    	v_ask_url = v_ask_url+'&isqr=0';
			    }
				// v_FN_ISCONCL
				if ($("#FN_ISCONCL1").prop('checked')) {
			    	v_ask_url = v_ask_url+'&ISCONCL=1';
			    } else {
			    	v_ask_url = v_ask_url+'&ISCONCL=0';
			    }
			    if ($('#FC_PSW1').val()!='')
			    	v_ask_url = v_ask_url+'&FC_PSW='+$('#FC_PSW1').val();
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
					AskData(0);	//	обновить список
					v_sel_nmb=0;  
				  },
				  error: function(err) {
			//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
					  MyAlert('Ошибка получения данных с сервера '+err.statusText );
				  }
					});
			}
			$('#FC_FAM1').val("");
			$('#FC_IM1').val("");
			$('#FC_OTCH1').val("");
			$('#FC_FIRMA1').val("");
			$('#FC_DOLJN1').val("");
			$('#FC_USLUGI1').val("");
			$('#FC_SPECIALIZATIONS1').val("");
			// v_FN_ISQUERIES
			$("#FN_ISQUERIES1").prop('checked', false );
			// v_FN_ISCONCL
			$("#FN_ISCONCL1").prop('checked', false );
			// --------------------------------------------------------------
			$( "#chCR" ).attr('checked','checked').button("refresh");
			$( "#chDX" ).attr('checked','checked').button("refresh");
			$( "#chIO" ).attr('checked','checked').button("refresh");
			$( "#chMR" ).attr('checked','checked').button("refresh");
			$( "#chOT" ).attr('checked','checked').button("refresh");
			$( "#chSC" ).attr('checked','checked').button("refresh");
			$( "#chXA" ).attr('checked','checked').button("refresh");
			$( "#chCT" ).attr('checked','checked').button("refresh");
			$( "#chES" ).attr('checked','checked').button("refresh");
			$( "#chMG" ).attr('checked','checked').button("refresh");
			$( "#chNM" ).attr('checked','checked').button("refresh");
			$( "#chPX" ).attr('checked','checked').button("refresh");
			$( "#chRG" ).attr('checked','checked').button("refresh");
			$( "#chUS" ).attr('checked','checked').button("refresh");
			$( "#chXC" ).attr('checked','checked').button("refresh");
			$( "#chRF" ).attr('checked','checked').button("refresh");
			$('#FC_LOGIN1').val("");
			$('#FC_PSW1').val("");
			$('#FC_PSW_D1').val("");
			$('#myfuturedfon').css("display","none");
		} else
			MyAlert('Введен разный(или пустой) пароль');
	});
	
	$("#myotmsavusers").click(function()   {	
		$('#FC_FAM1').val("");
		$('#FC_IM1').val("");
		$('#FC_OTCH1').val("");
		$('#FC_FIRMA1').val("");
		$('#FC_DOLJN1').val("");
		$('#FC_USLUGI1').val("");
		$('#FC_SPECIALIZATIONS1').val("");
		// v_FN_ISQUERIES
		$("#FN_ISQUERIES1").prop('checked', false );
		// v_FN_ISCONCL
		$("#FN_ISCONCL1").prop('checked', false );
		// --------------------------------------------------------------
		$( "#chCR" ).attr('checked','checked').button("refresh");
		$( "#chDX" ).attr('checked','checked').button("refresh");
		$( "#chIO" ).attr('checked','checked').button("refresh");
		$( "#chMR" ).attr('checked','checked').button("refresh");
		$( "#chOT" ).attr('checked','checked').button("refresh");
		$( "#chSC" ).attr('checked','checked').button("refresh");
		$( "#chXA" ).attr('checked','checked').button("refresh");
		$( "#chCT" ).attr('checked','checked').button("refresh");
		$( "#chES" ).attr('checked','checked').button("refresh");
		$( "#chMG" ).attr('checked','checked').button("refresh");
		$( "#chNM" ).attr('checked','checked').button("refresh");
		$( "#chPX" ).attr('checked','checked').button("refresh");
		$( "#chRG" ).attr('checked','checked').button("refresh");
		$( "#chUS" ).attr('checked','checked').button("refresh");
		$( "#chXC" ).attr('checked','checked').button("refresh");
		$( "#chRF" ).attr('checked','checked').button("refresh");
		$('#FC_LOGIN1').val("");
		$('#FC_PSW1').val("");
		$('#FC_PSW_D1').val("");
		$('#myfuturedfon').css("display","none");
	});
	
	$("#myadduser").click(function()   {
		$('#myedtconcldt').text("Добавление нового пользователя");
		v_is_edt = false;
		// проинициализируем поля
			// --------------------------------------------------------------
			$('#FC_FAM1').val("");
			$('#FC_IM1').val("");
			$('#FC_OTCH1').val("");
			$('#FC_FIRMA1').val("");
			$('#FC_DOLJN1').val("");
			$('#FC_USLUGI1').val("");
			$('#FC_SPECIALIZATIONS1').val("");
			// v_FN_ISQUERIES
			$("#FN_ISQUERIES1").prop('checked', false );
			// v_FN_ISCONCL
			$("#FN_ISCONCL1").prop('checked', false );
			// --------------------------------------------------------------
			$( "#chCR" ).attr('checked','checked').button("refresh");
			$( "#chDX" ).attr('checked','checked').button("refresh");
			$( "#chIO" ).attr('checked','checked').button("refresh");
			$( "#chMR" ).attr('checked','checked').button("refresh");
			$( "#chOT" ).attr('checked','checked').button("refresh");
			$( "#chSC" ).attr('checked','checked').button("refresh");
			$( "#chXA" ).attr('checked','checked').button("refresh");
			$( "#chCT" ).attr('checked','checked').button("refresh");
			$( "#chES" ).attr('checked','checked').button("refresh");
			$( "#chMG" ).attr('checked','checked').button("refresh");
			$( "#chNM" ).attr('checked','checked').button("refresh");
			$( "#chPX" ).attr('checked','checked').button("refresh");
			$( "#chRG" ).attr('checked','checked').button("refresh");
			$( "#chUS" ).attr('checked','checked').button("refresh");
			$( "#chXC" ).attr('checked','checked').button("refresh");
			$( "#chRF" ).attr('checked','checked').button("refresh");
			$('#FC_LOGIN1').val("");
			$('#FC_PSW1').val("");
			$('#FC_PSW_D1').val("");
			// --------------------------------------------------------------
			$('#myfuturedfon').css("display","block");
	});                
	
	function set_chk (n,nam) {
		if (v_arr_list[v_sel_nmb][n]=='1') {
			$( "#"+nam ).attr('checked','checked').button("refresh"); 
		} else {
			$( "#"+nam ).removeAttr('checked').button("refresh");
		}
	}
			
	function edt_user_cmn () {
		if (v_sel_nmb>0) {
			$('#myedtconcldt').text("Редактирование пользователя");
			v_is_edt = true;
			// проинициализируем поля
			// --------------------------------------------------------------
			$('#FC_FAM1').val(v_arr_list[v_sel_nmb][1]);
			$('#FC_IM1').val(v_arr_list[v_sel_nmb][2]);
			$('#FC_OTCH1').val(v_arr_list[v_sel_nmb][3]);
			$('#FC_FIRMA1').val(v_arr_list[v_sel_nmb][6]);
			$('#FC_DOLJN1').val(v_arr_list[v_sel_nmb][7]);
			$('#FC_USLUGI1').val(v_arr_list[v_sel_nmb][8]);
			$('#FC_SPECIALIZATIONS1').val(v_arr_list[v_sel_nmb][9]);
			// v_FN_ISQUERIES
			$("#FN_ISQUERIES1").prop('checked', (v_arr_list[v_sel_nmb][4]=='1'));
			// v_FN_ISCONCL
			$("#FN_ISCONCL1").prop('checked', (v_arr_list[v_sel_nmb][5]=='1'));
			// --------------------------------------------------------------
			set_chk(10,"chCR");
			set_chk(11,"chDX");
			set_chk(12,"chIO");
			set_chk(13,"chMR");
			set_chk(14,"chOT");
			set_chk(15,"chSC");
			set_chk(16,"chXA");
			set_chk(17,"chCT");
			set_chk(18,"chES");
			set_chk(19,"chMG");
			set_chk(20,"chNM");
			set_chk(21,"chPX");
			set_chk(22,"chRG");
			set_chk(23,"chUS");
			set_chk(24,"chXC");
			set_chk(25,"chRF");
			$('#FC_LOGIN1').val(v_arr_list[v_sel_nmb][26]);
			$('#FC_PSW1').val("");
			$('#FC_PSW_D1').val("");
			// --------------------------------------------------------------
			$('#myfuturedfon').css("display","block");
		} else {
			MyAlert('Запись не выбрана');	
		}
	}
	
	$("#myedtuser").click(function()   {
		edt_user_cmn ();
	});                
	
	$("#mydltuser").click(function()   {
		if (v_sel_nmb>0) {
			if (confirm('Удалить запись ?')) {
				v_ask_url = v_url+'DELUSER?fld1='+v_un+'&fld2='+v_up+'&id='+v_arr_list[v_sel_nmb][0];
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
					AskData(0);	//	обновить список
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
		
    AskData(0); // начальная загрузка 
    
    f_resize();
    $(window).resize(function() {
		CMNcnhg_resize();
		f_resize();	
	});
    
    $(".myrows").dblclick(function(){
		edt_user_cmn ();
	});
    
});

function redirectOnUSERLIST(){
	var v_url_tmp = v_url+'USERLIST?fld1='+v_un+'&fld2='+v_up;
	window.open(v_url_tmp).focus();	// REDIRECT
}

function redirectOnTEMPLLIST(){
	var v_url_tmp = v_url+'TEMPLLIST?fld1='+v_un+'&fld2='+v_up;
	window.open(v_url_tmp).focus();	// REDIRECT
}
	
function f_resize()
{
	var v_min_edt_width = 700;
	/*if (screenSize().w<=v_min_edt_width+50) {
		var v_min_width = v_min_edt_width;
	} else {
		var v_min_width = screenSize().w*0.8;
	}*/
	
	var v_min_width = v_min_edt_width;
	
	var v_leftmy = Math.floor(((screenSize().w-v_min_width)/2));
	
	var v_inner_height = screenSize().h-40-30-30-5 ;
	var v_pad_lft = $(".edtflduser").css("padding-left");
	var v_inner_width = v_min_width-2-v_pad_lft.replace("px","");
	
	$(".edtflduser").css("width",v_inner_width+"px");
	$(".xtedtflddiv").css("width",v_inner_width+"px");
	
/*	$("#leftEdtUser").css("width",v_inner_width+"px");
	$("#leftEdtUser").css("height",v_inner_height+"px");
	
	$("#rightEdtUser").css("width",v_inner_width+"px");
	$("#rightEdtUser").css("height",v_inner_height+"px");	*/
	
	$("#myfuturedhead").css("top","0");
	$("#myfuturedhead").css("left",v_leftmy+"px");
	$("#myfuturedhead").width(v_min_width);
	$("#myfuturedhead").height(25);
	
	$("#myfutured").css("top","30px");	
	$("#myfutured").css("left",v_leftmy+"px");
	
	$("#myfutured").width(v_min_width);
	$("#myfutured").height(screenSize().h-40-30);
	
	$("#myfuturedfon").width(screenSize().w);
	$("#myfuturedfon").height(screenSize().h-40);
	
	$("#myfuturedfon").css("left","0");
	$("#myfuturedfon").css("top","0");
	
	var v_btn_width = 366;
	$("#myfuturedfoot").css("top",(screenSize().h-40-30)+"px");
	$("#myfuturedfoot").css("left",(v_leftmy+v_min_width-v_btn_width)+"px");
	$("#myfuturedfoot").width(v_btn_width);
	$("#myfuturedfoot").height(30);

}

function f_cb_emp (p_cb_id) {
	$( "#"+p_cb_id ).attr('checked',true).button("refresh");
}

function UnChecked (p_cb_id) {
	$( "#"+p_cb_id ).attr('checked',false).button("refresh");
}
	
function set_clk() {
	$(".myrows").click(function () {
		$(".myrows").css("background-color","white");	
		$(this).css("background-color","#D0E6F1");
		v_sel_nmb = $(this).attr('id');
	});
}

set_clk();
		
function ClrData()
{
	$("#username1").val("");
	$("#spec1").val("");
	$("#uslugi1").val("");
	$("#org1").val("");
	$("#doljn1").val("");
	CheckedAll();
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
	
	v_cur_grid_id++;
	// v_FC_FAM
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][1] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FC_IM
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][2] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FC_OTCH
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][3] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// FK_ID
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][0] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_ISQUERIES
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][4] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_ISCONCL
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][5] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FC_FIRMA
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][6] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FC_DOLJN
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][7] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FC_USLUGI
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][8] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FC_SPECIALIZATIONS
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][9] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_CR
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][10] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_DX
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][11] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_IO
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][12] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_MR
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][13] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_OT
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][14] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_SC
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][15] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_XA
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][16] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_CT
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][17] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_ES
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][18] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_MG
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][19] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_NM
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][20] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_PX
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][21] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_RG
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][22] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_US
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][23] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_XC
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][24] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// v_FN_RF
	v_fpos=v_curfld.indexOf(v_flr);
	v_arr_list[v_cur_grid_id][25] = v_curfld.substr(0,v_fpos);				
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	// 
	// FC_LOGIN 
	v_arr_list[v_cur_grid_id][26] = v_curfld;
	//
	v_fio = v_arr_list[v_cur_grid_id][1]||' '||v_arr_list[v_cur_grid_id][2]||' '||v_arr_list[v_cur_grid_id][3];
	v_FC_FIRMA=v_arr_list[v_cur_grid_id][6];
	v_FC_USLUGI=v_arr_list[v_cur_grid_id][8];
	if (v_fio=='') v_fio='&nbsp;';
	if (v_FC_FIRMA=='') v_FC_FIRMA='&nbsp;';
	if (v_FC_USLUGI=='') v_FC_USLUGI='&nbsp;';
	
	
	// собственно вставка записи
	var v_str_ins_tmp = '<div id="'+v_cur_grid_id+'" class="myrefr myrows myfloatleft" style="width:645px !important">'; 
    v_str_ins_tmp = v_str_ins_tmp + "<div class='myfloatleft tufld0' style=''>&nbsp;</div>";
	v_str_ins_tmp = v_str_ins_tmp +
		"<div class='myfloatleft tufld1'>"+v_fio+"</div>"+
		"<div class='myfloatleft tufld2'>"+v_FC_FIRMA+"</div>"+
		"<div class='myfloatleft tufld3'>"+v_FC_USLUGI+"</div>"+
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
		v_asc  = '<div id="iddsc" data-icon="&#xe0f3;"></div>';	
		v_desc = '<div id="iddsc" data-icon="&#xe0f2;"></div>';	
		$("#iddsc").remove();
		if (Math.abs(p_s)==0) {		//	&nbsp
			if (v_pr_sort<0) {
			} else {
			}
		} else
		if (Math.abs(p_s)==1) {		//	
			if (v_pr_sort>0) {
				$("#mybtnhdgrid2q").append(v_asc);
			} else {
				$("#mybtnhdgrid2q").append(v_desc);
			}
		} else
		if (Math.abs(p_s)==2) {		
			if (v_pr_sort>0) {
				$("#mybtnhdgrid3q").append(v_asc);
			} else {
				$("#mybtnhdgrid3q").append(v_desc);
			}
		} else
		if (Math.abs(p_s)==3) {		
			if (v_pr_sort>0) {
				$("#mybtnhdgrid4q").append(v_asc);
			} else {
				$("#mybtnhdgrid4q").append(v_desc);
			}
		}
		//
		var username_tmp  = $("#username1").val();
		var spec_tmp	  = $("#spec1").val();
		var uslugi_tmp	  = $("#uslugi1").val();
		var org_tmp	      = $("#org1").val();
		var doljn_tmp     = $("#doljn1").val(); 
		//
		v_ask_url = v_url+'USERLISTDATA?';
		//
		v_ask_url = v_ask_url+'s='+v_pr_sort+'&';
		//
		if (username_tmp!='')
			v_ask_url = v_ask_url+'username='+username_tmp+'&';
		if (spec_tmp!='')
			v_ask_url = v_ask_url+'spec='+spec_tmp+'&';
		if (uslugi_tmp!='')
			v_ask_url = v_ask_url+'uslugi='+uslugi_tmp+'&';
		if (org_tmp!='')
			v_ask_url = v_ask_url+'org='+org_tmp+'&';	
		if (doljn_tmp!='')
			v_ask_url = v_ask_url+'doljn='+doljn_tmp+'&';	
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
			  frm_searcharr(data);
		  },
		  error: function(err) {
	//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
			  MyAlert('Ошибка получения данных с сервера '+err.statusText );
		  },
	  	  async:   false
		});
	}




