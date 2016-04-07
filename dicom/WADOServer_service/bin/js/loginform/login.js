function gt_charcode (val) {
	var v_res_tmp=''; 
	var v_ch='';
	for (i=0;i<val.length;i++) {
		v_ch = val.charCodeAt(i)+'f';
		v_res_tmp=v_res_tmp+v_ch;
	}
	return v_res_tmp;
}

function Autorize() {
	
	var v_username_tmp = gt_charcode( $("#fusername").val() );
	var v_password_tmp = gt_charcode( $("#fpasswords").val() );

	var v_ask_url = v_url+'STUDYLIST?';

	v_ask_url = v_ask_url+'fld1='+v_username_tmp+'&';
	v_ask_url = v_ask_url+'fld2='+v_password_tmp;
	
	
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
			var v_str_tmp = data.substring(0,2);  
			if (v_str_tmp=='-1') {
				$("#loginmessage").text('Неверный логин/пароль');
			} else
			  window.location.href = v_ask_url ;
		  },
		  error: function(err) {
			  alert('Ошибка получения данных с сервера '+err.statusText );
		  }
		});
	
}

function getClientWidth()
{
  return document.compatMode=='CSS1Compat' && !window.opera?document.documentElement.clientWidth:document.body.clientWidth;
}
function getClientHeight()
{
  return document.compatMode=='CSS1Compat' && !window.opera?document.documentElement.clientHeight:document.body.clientHeight;
}

function cntr_scr () {

	var v_h = 250;
	var v_w = 370;
	var v_pad = 10;
	var v_w_r = 300;
	
//	$("#btmmsg").width(v_w_r);
	
	$("#horiz").width(v_w);
	$(".login_main_div").css("padding",v_pad+"px");

	$("#logo").height(v_h);
	$("#logo").width(v_w-v_w_r-10);
	
//	$("#id_logo").height(v_h);
	
//	$(".login_main_div").css("height",(v_h)+"px");
//	$(".login_main_div").css("width",(v_w)+"px");
	
//	$(".login_main_div").css("margin-top","-"+Math.floor(v_h/2)+"px;"); /* высота картинки пополам */
//	$(".login_main_div").css("margin-left","-"+Math.floor(v_w/2)+"px;"); /* ширина картинки пополам */
	
	
//	$("#id_logo").css("height","200px");

	// logo - логотип
	// mydiv - форма авторизации

//	$(".mydiv").css("top",10+"px");
//	$(".mydiv").css("left",10+"px");
	
	
//	$("#id_logo").css("width",30+"%");
//	$("#logo").css("top",30+"px");
//	$("#id_logo").css("left",20+"px");
	
	
	
}

$(document).ready(function() {
	// центровка окна
	cntr_scr();
	$(window).resize(function() {
		cntr_scr();
	});
	
	$("#fpasswords").keyup(function(event) 
	{
		if(event.keyCode==13) 
		{
			Autorize();
			}		
	});
});

