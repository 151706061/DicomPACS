function screenSize() {
    var w, h; // Объявляем переменные, w - длина, h - высота
    w = (window.innerWidth ? window.innerWidth : (document.documentElement.clientWidth ? document.documentElement.clientWidth : document.body.offsetWidth));
    h = (window.innerHeight ? window.innerHeight : (document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.offsetHeight));
    return {w:w, h:h};
}

function remedotrade() {
	window.open('http://www.medotrade.ru');	
}

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
	var v_password_tmp = gt_charcode( $("#fpassword").val() );

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
		//  data:"123",
		  timeout : 3000,
		  success: function(data) {
			var v_str_tmp = data.substring(0,2);  
			if (v_str_tmp=='-1') {
				//alert('Неверный логин/пароль');
				$("#errpassw").css("display","block");
//				$("#loginmessage").text('Неверный логин/пароль');
			} else
			  window.location.href = v_ask_url ;
		  },
		  error: function(err) {
			  MyAlert('Ошибка получения данных с сервера '+err.statusText );
		  }
		});
	
}

function cnhg_resize () {
	v_w = screenSize().w;
	v_h = screenSize().h;
	if (v_w>=985) {
		$("#my1lev3pos").css("display","block");
	} else {
		$("#my1lev3pos").css("display","none");
	}
	if (v_w>=1200) {
		$("#myprofilv").css("display","block");
	} else {
		$("#myprofilv").css("display","none");
	}
	if (v_w>1024) {
		$("#mycont2").css("display","block");
		$("#mylftsp1").css("padding-left","70px");
	} else {
		$("#mycont2").css("display","none");
		$("#mylftsp1").css("padding-left","0");
	}
	if (v_w>1010) {
		$("#myauthfrm").css("margin","0");
		$("#myheadh").remove();
		$("#myhdnadp").append('<h1 id="myheadh" style="color: white;"><p>ЦЕНТР <br>МЕДИЦИНСКИХ <br>ИЗОБРАЖЕНИЙ</p></h1>');
	} else if (v_w>900) {
		$("#myauthfrm").css("margin-left","-70px");
		$("#myheadh").remove();
		$("#myhdnadp").append('<h2 id="myheadh" style="color: white;"><p>ЦЕНТР <br>МЕДИЦИНСКИХ <br>ИЗОБРАЖЕНИЙ</p></h2>');
	} else {
		$("#myauthfrm").css("margin-left","-100px");
		$("#myheadh").remove();
		$("#myhdnadp").append('<h3 id="myheadh" style="color: white;"><p>ЦЕНТР <br>МЕДИЦИНСКИХ <br>ИЗОБРАЖЕНИЙ</p></h3>');
	}
	
	$("#mycmnfooter").css("top",(screenSize().h-40)+"px");
}

$(document).ready(function() {
	cnhg_resize();
	$(window).resize(function() {
		cnhg_resize();	
	});
	
	$("#fpassword").keyup(function(event) 
	{
		if(event.keyCode==13) 
		{
			Autorize();
			}		
	});
	
	$("#mymains").click(function() {
		$("#errpassw").css("display","none");
	});
	
});