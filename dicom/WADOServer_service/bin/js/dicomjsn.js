$(document).ready(function() {

//	var v_ISQUERIES=0;
//	var v_ISCONCL=0;
//	var v_adm=0 
	if(v_adm==0){		$("#MyadminMenu").css("display","none");	}
	else	{		$("#MyadminMenu").css("display","block");	}

	var v_pageX_cmn = -1;
	var v_pageY_cmn = -1;
	var v_pageX = -1;
	var v_pageY = -1;
	var v_pageX_cmn1 = -1;
	var v_pageY_cmn1 = -1;
	var v_pageX1 = -1;
	var v_pageY1 = -1;
	
	var v_len_cmn = -1;
	var v_len = -1;
	
	//============================= обработчики глав меню ======================
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
	
	//========================== конец обработчиков =============
	
	function redirectOnUSERLIST(){
		var v_url_tmp = v_url+'USERLIST?fld1='+v_un+'&fld2='+v_up;
		window.open(v_url_tmp).focus();	// REDIRECT
	}
	
	function redirectOnTEMPLLIST(){
		var v_url_tmp = v_url+'TEMPLLIST?fld1='+v_un+'&fld2='+v_up;
		window.open(v_url_tmp).focus();	// REDIRECT
	}
	$("#draw").click(function(e){
	   draw_click(e);
	});
   /*document.getElementById('draw').addEventListener('touchstart',function(event) {
		draw_click( event,
			        event.touches[0].pageX,
			        event.touches[0].pageY
			      );
	});*/

	$("#draw").mousemove(function(e){
		drawmousemove(e);
	});	
	document.getElementById('draw').addEventListener('touchmove',function(event) {
		if (v_fdraw_rejim==3)	{	// перемещение
			v_ismousedown=1;
			drawmousemove(event,
			        event.touches[0].pageX,
			        event.touches[0].pageY);
		}
	});
	//  ----------------------------------------------------
   // предыдущий 
   $("#mybtnPreviousPicture").click(function()   {
   		myCmnTouchFunc(myprevimg);
   });
   document.getElementById('mybtnPreviousPicture').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(myprevimg);
	});
	
   // следующий
   $("#mybtnNextPicture").click(function()   {
   		myCmnTouchFunc(mynextimg);
   });
   document.getElementById('mybtnNextPicture').addEventListener('touchstart',function(event) {
   		myCmnTouchFunc(mynextimg);
	});

   // следующий пациент
	function mybtnNextPeople() {
	    changeStudy(true);
	}
   $("#mybtnNextPeople").click(function()   {
   		myCmnTouchFunc(mybtnNextPeople);
   });
   document.getElementById('mybtnNextPeople').addEventListener('touchstart',function(event) {
   		myCmnTouchFunc(mybtnNextPeople);
	});

   // предыдущий пациент
	function mybtnPreviousPeople() {
	    changeStudy(false);
	}
   $("#mybtnPreviousPeople").click(function()   {
		myCmnTouchFunc(mybtnPreviousPeople);
   });
   document.getElementById('mybtnPreviousPeople').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(mybtnPreviousPeople);
	});
	
   // пред серия
	$("#mybtnPreviousSeries").click(function()   {
		myCmnTouchFunc(PreviousSeries);
	});
   document.getElementById('mybtnPreviousSeries').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(PreviousSeries);
	});
	
	// след серия
	$("#mybtnNextSeries").click(function()   {
		myCmnTouchFunc(NextSeries);
	});
   document.getElementById('mybtnNextSeries').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(NextSeries);
	});

	//  ----------------------------------------------------
	function mybtnDelInfo() {
	    v_show_label = !v_show_label ;
		repaint_all(0);
	}
	$("#mybtnDelInfo").click(function()   {
		myCmnTouchFunc(mybtnDelInfo);
	});
   document.getElementById('mybtnDelInfo').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(mybtnDelInfo);
	});
	
	function mybtnBrightPlus() {
	   img_bright(10);
	   v_corr_light[v_cur_img-1]=v_corr_light[v_cur_img-1]+10;
	}
	$("#mybtnBrightPlus").click(function()   {
		myCmnTouchFunc(mybtnBrightPlus);
	});
	document.getElementById('mybtnBrightPlus').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(mybtnBrightPlus);
	});
	
	function mybtnBrightMinus() {
	   img_bright(-10);
	   v_corr_light[v_cur_img-1]=v_corr_light[v_cur_img-1]-10;
	}
	$("#mybtnBrightMinus").click(function()   {
		myCmnTouchFunc(mybtnBrightMinus);
	});
	document.getElementById('mybtnBrightMinus').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(mybtnBrightMinus);
	});
	
	function mybtnContrastPlus() {
	   img_contrast(10);
	   v_corr_contrast[v_cur_img-1]=v_corr_contrast[v_cur_img-1]+10;
	}
	$("#mybtnContrastPlus").click(function()   {
	   myCmnTouchFunc(mybtnContrastPlus);
	});
    document.getElementById('mybtnContrastPlus').addEventListener('touchstart',function(event) {
	   myCmnTouchFunc(mybtnContrastPlus);
	});
	         
	function mybtnBrightMinus() {
	   img_contrast(-10);
	   v_corr_contrast[v_cur_img-1]=v_corr_contrast[v_cur_img-1]-10;
	}
	$("#mybtnContrastMinus").click(function()   {
	   myCmnTouchFunc(mybtnBrightMinus);
	});
    document.getElementById('mybtnContrastMinus').addEventListener('touchstart',function(event) {
	   myCmnTouchFunc(mybtnBrightMinus);
	});
	//  ----------------------------------------------------
	
	//  ----------------------------------------------------
	$("#mybtnOkrujnost").click(function()   {
		myCmnTouchFunc(Krug);
	});	
   document.getElementById('mybtnOkrujnost').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(Krug);
	});
	
   //Зона интереса - многоугольник
   $("#mybtnmnogoug").click(function()   {
	   myCmnTouchFunc(mnogoug);
   });
   document.getElementById('mybtnmnogoug').addEventListener('touchstart',function(event) {
	   myCmnTouchFunc(mnogoug);
	});
   
   // Текст
   $("#mybtnText").click(function()   {
	   myCmnTouchFunc(ShapeText);
   });
   document.getElementById('mybtnText').addEventListener('touchstart',function(event) {
	   myCmnTouchFunc(ShapeText);
	});
   
   // Добавить новое окно
   $("#mybtnDivide").click(function()   {
	   DivideWindow();
   });
   document.getElementById('mybtnDivide').addEventListener('touchstart',function(event) {
		DivideWindow();
	});
	//  ----------------------------------------------------
	
	//  ----------------------------------------------------
   // Отрезок
   $("#mybtnline").click(function()   {
	   myCmnTouchFunc(drw_line);
   });
   document.getElementById('mybtnline').addEventListener('touchstart',function(event) {
	   myCmnTouchFunc(drw_line);
	});
   
   // Стрелка с текстом
   $("#mybtnstrela").click(function()   {
	   myCmnTouchFunc(strelatext);
   });
   document.getElementById('mybtnstrela').addEventListener('touchstart',function(event) {
	   myCmnTouchFunc(strelatext);
	});
   
   // Угол
   $("#mybtnugol").click(function()   {
	   myCmnTouchFunc(ugol);
   });
   document.getElementById('mybtnugol').addEventListener('touchstart',function(event) {
		ugol();
	});
	//  ----------------------------------------------------
   
	// Перемещение ----------------------------------------------------
	$("#mybtnMove").click(function()   {
		myCmnTouchFunc(ShapeMove);
	});
	document.getElementById('mybtnMove').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(ShapeMove);
	});
	// Перемещение ----------------------------------------------------
   
	// Лупа ----------------------------------------------------
	$("#mybtnlupa").click(function()   {
		myCmnTouchFunc(set_lupa);
	});
	document.getElementById('mybtnlupa').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(set_lupa);
	});
	// Лупа ----------------------------------------------------

	// Увеличение/Уменьшение ----------------------------------------------------
	// Увеличение
	$("#mybtnlarge").click(function()   {
		myCmnTouchFunc(large);
	});
	document.getElementById('mybtnlarge').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(large);
	});
	// ----------------------------------------------------------------------------------
	document.getElementById('draw').addEventListener('touchmove',function(event) {
				v_is_execute = true;
				//var v_x_tmp = "";
				var v_amm_fingers = event.targetTouches.length;
				v_pageX= event.touches[0].pageX;
				v_pageY= event.touches[0].pageY;
		  		if ( v_amm_fingers != 1) {
		  			v_pageX1= event.touches[1].pageX;
	        		v_pageY1= event.touches[1].pageY;
	        		if (v_pageX1>0) {	        		
		  				v_len  = gt_len_otr(v_pageX,v_pageY,v_pageX1,v_pageY1);
		  			//	var v_width = Math.floor($("#main").css("width").replace('px',''));
		  			//	var v_height = Math.floor($("#main").css("height").replace('px',''));
		  				if (v_len<v_len_cmn) {	//	Щипок		(v_pageY>v_pageY_cmn) && (v_pageY1<v_pageY_cmn1)
		  			//		var v_width = v_width -1;
		  			//		var v_height = v_height -1;
		  					small();
		  				} else
		  				if (v_len>v_len_cmn) {	//	Щипок от центра	(v_pageY<v_pageY_cmn) && (v_pageY1>v_pageY_cmn1)
		  			//		var v_width = v_width +1;
		  			//		var v_height = v_height +1;
		  					large();
		  				} else { // 2 пальца вместе
		  			//		$("#main").css("top",v_pageY+"px");
		  			//		$("#main").css("left",v_pageX+"px");
		  				}		  				
		  			//	$("#main").css("width",v_width+"px");
		  			//	$("#main").css("height",v_height+"px");
						v_pageX_cmn = v_pageX;
						v_pageY_cmn = v_pageY;
						v_pageX_cmn1 = v_pageX1;
						v_pageY_cmn1 = v_pageY1;
						v_len_cmn = v_len;
					}
	  			} else {	//	просто перемещение	
		  			if (v_pageX_cmn!=-1) {
		  			//	$("#main").css("top",v_pageY+"px");
		  			//	$("#main").css("left",v_pageX+"px");
		  			}
					v_pageX_cmn = v_pageX;
					v_pageY_cmn = v_pageY;
				}
				v_is_execute = false;
			}
		//}
		, false);
	// ----------------------------------------------------------------------------------
	   
	// Уменьшение
	$("#mybtnsmall").click(function()   {
		myCmnTouchFunc(small);
	});
	document.getElementById('mybtnsmall').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(small);
	});
	// Увеличение/Уменьшение ----------------------------------------------------

	// зеркало ----------------------------------------------------	
	// Вертикальное зеркало
	function vertZerk () {
		upDn();
		v_vert_mirror[v_cur_img-1] = !v_vert_mirror[v_cur_img-1];
	}
	$("#mybtnupDn").click(function()   {
		myCmnTouchFunc(vertZerk);
	});
	document.getElementById('mybtnupDn').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(vertZerk);
	});
	   
	// Горизонтальное зеркало
	function horizZerk () {
		LfRg();
		v_horiz_mirror[v_cur_img-1] = !v_horiz_mirror[v_cur_img-1];
	}
	$("#mybtnLfRg").click(function()   {
		myCmnTouchFunc(horizZerk);
	});
	document.getElementById('mybtnLfRg').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(horizZerk);
	});
	// зеркало ----------------------------------------------------
   
   
	// Поворот ----------------------------------------------------
	// Поворот 90 градусов против часовой стрелке
	$("#mybtnrotatem").click(function()   {
		myCmnTouchFunc(rotatem);		
	});
	document.getElementById('mybtnrotatem').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(rotatem);		
	});
	   
	// Поворот 90 градусов по часовой стрелке
	$("#mybtnrotatep").click(function()   {
		myCmnTouchFunc(rotatep);		
	});
	document.getElementById('mybtnrotatep').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(rotatep);		
	});
	// Поворот ----------------------------------------------------
	
	// Инверсия ----------------------------------------------------
	function inversion() {
		invert();
		v_inversion[v_cur_img-1]=!v_inversion[v_cur_img-1];
	}
	
	$("#mybtninv").click(function()   {
		myCmnTouchFunc(inversion);
	});
	document.getElementById('mybtninv').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(inversion);
	});
	// Инверсия ----------------------------------------------------

	// убрать измерения ----------------------------------------------------
	$("#mybtnclr").click(function()   {
		myCmnTouchFunc(btnclr);
	});
	document.getElementById('mybtnclr').addEventListener('touchstart',function(event) {
		myCmnTouchFunc(btnclr);
	});
	// убрать измерения ----------------------------------------------------

// -------------------------------------------------------------------------------------------------
	$('#draw').mousewheel(function(event, delta) {
        if (delta>0) {	// Up
        	myprevimg();
        } else {		// Down
        	mynextimg();
        }
        return false;
    });
// -------------------------------------------------------------------------------------------------
	
	$("#li_hd_mnu_2").css("font-weight","bold"); // активный/текущая страница - первый пункт меню
	
	canvas = document.getElementById("draw");
	ctx = canvas.getContext('2d');
	v_canvas_w=ctx.canvas.width;
	v_canvas_h=ctx.canvas.height;
	
	myresize ();
	
	$("#bigpicture").attr("src", imgarr[0] );	
	// инициализация
	drawbox(v_cur_pos);
	//f_paintimg(v_cur_pos);
	repaint_all(1);

	$(window).resize(function() {
		myresize();
		drawbox(v_cur_pos);
		//f_paintimg(v_cur_pos);
		repaint_all(0);
	});
	
	
	$(".picture").click(function()   {
	 clrbox(v_cur_pos);
	 v_cur_img = $(this).attr("id").substring(1);
	 drawbox(v_cur_img);
	 f_paintimg(v_cur_img);
	 v_cur_pos = v_cur_img ;
   });
   
   // следующий
   function mynextimg() {
   		if (v_cur_img<v_max_pos) {
   			clrbox(v_cur_pos);
   			v_cur_img++;
   			v_cur_pos=v_cur_img;
   			drawbox(v_cur_img);
	 		f_paintimg(v_cur_img);
   		}
   }
   
   // предыдущий
   function myprevimg() {
   		if (v_cur_img>1) {
   			clrbox(v_cur_pos);
   			v_cur_img--;
   			v_cur_pos=v_cur_img;
   			drawbox(v_cur_img);
	 		f_paintimg(v_cur_img);
   		}
   }
   
   // --------------------------------------------------------
   
	function changeStudy (p_is_next) {
		if (p_is_next) {
			var v_proc_tmp = "NEXTCONCLUSION";
		} else {
			var v_proc_tmp = "PREVCONCLUSION";
		}
		v_ask_url = v_url+v_proc_tmp+'?studyuid='+v_main_studyuid;
		// for Internet Explorer  !!!
		$.support.cors = true;
		$.ajax({                                       
			  type: "GET",
		  url: v_ask_url,           
		  cache: false,
		  dataType: "html",           
		  timeout : 3000,
		  success: function(data) { 
		  	data=data.replace("\r\n",""); 
		  	if (data!='') {
				v_main_studyuid=data; 	//	redirect на страницу исследования со снимками 
				v_url_tmp = v_url+"IMAGES?STUDYUID="+v_main_studyuid+'&fld1='+v_un+'&fld2='+v_up;
				window.location=v_url_tmp;
			//	refr_concl(); // обновить список заключений
			}
		  },
		  error: function(err) {
		//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
			  MyAlert('Ошибка получения данных с сервера '+err.statusText );
			  }	
		});
	
	}

  $("#draw").mousedown(function(e){	// нажатие мыши
	v_ismousedown = 1;
	fcanvas = $('#draw');
	canvasPosition = {
		x: fcanvas.offset().left,
		y: fcanvas.offset().top
	};
	mouse = {
		x: (e.pageX - canvasPosition.x),
		y: (e.pageY - canvasPosition.y)
	}
	x1 = Math.floor(mouse.x );
	y1 = Math.floor(mouse.y );
	
	v_pos_x_move = x1;
	v_pos_y_move = y1;
    if (v_fdraw_rejim==3) {
		fcanvas = $('#draw');
		canvasPosition = {
			x: fcanvas.offset().left,
			y: fcanvas.offset().top
		};
		mouse = {
			x: e.pageX - canvasPosition.x,
			y: e.pageY - canvasPosition.y
		}
		x1 = Math.floor(mouse.x );
		y1 = Math.floor(mouse.y );
		
		v_pos_x_move = x1;
		v_pos_y_move = y1;

		$('#draw').css('cursor', 'pointer');
	}
  });
  
  $(window).mouseup(function(e){	// отжатие мыши
	v_ismousedown = 0;
	if (v_fdraw_rejim==3) {	
		$('#draw').css('cursor', 'default');
	}
  });
  
  $("#lupabrd").mousemove(function(e){
  	v_is_focus = true;
  	v_focus_x = e.pageX ;
  	v_focus_y = e.pageY ;
  	$("#draw").mousemove();
  });
   
   	function fgetprot() {	// загрузка данных 
		if (studyUID[0]!='') {
			v_url_tmp = v_url+"CONCLUSIONS?STUDYUID="+studyUID[0]+'&fld1='+v_un+'&fld2='+v_up;
			// REDIRECT
			window.open(v_url_tmp).focus();
		}
	}
	
	$("#mygofrmconcl").click(function(){
		fgetprot();
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
   
   if ((v_up=='') && (v_un=='')) {
		$("#myheadt_all").css('display','none');
		$("#myhd_menu_t").css('display','none');
		$("#mycmnfooter").css('display','none');
		v_is_from_rmis = true;
   } else {
//		$("#mycmnfooter").css('display','block');
   }
   
   $("#hospitallist").click(function(){
		var v_url_tmp = v_url+'LPULIST?fld1='+v_un+'&fld2='+v_up;
		window.open(v_url_tmp).focus();	// REDIRECT
	});
	
});

	function myCmnTouchFunc(p_func) {
		d = new Date();
		var v_d_tmp = d.getTime()-v_dt_touch;
		if ( v_d_tmp>v_dt_time_check ) {
		    p_func();
		}
		d = new Date();
		v_dt_touch = d.getTime();	
	}

   function f_mychk_otm_ugol (p_cur_obj,p_x,p_y) {				
		var v_l1_tmp = gt_length_to_otrezok(p_x,p_y, v_obj_list[1][p_cur_obj], v_obj_list[2][p_cur_obj], v_obj_list[3][p_cur_obj],v_obj_list[4][p_cur_obj] );
		var v_l2_tmp = gt_length_to_otrezok(p_x,p_y, v_obj_list[3][p_cur_obj],v_obj_list[4][p_cur_obj], v_obj_list[6][p_cur_obj],v_obj_list[7][p_cur_obj] );
		var v_min_tmp = screenSize().w;
		if (v_min_tmp>v_l1_tmp) v_min_tmp=v_l1_tmp;
		if (v_min_tmp>v_l2_tmp) v_min_tmp=v_l2_tmp;
		if (v_min_tmp<v_otm_len_to_obj*v_scale_set[v_cur_img-1]) {
			repaint_all (0);
			canvas=document.getElementById("draw");
			x=canvas.getContext("2d");			
			x.lineWidth = v_lineWidth;  // set the line width to 10 pixels			
			x.strokeStyle = v_color_otm;
			pnt_ugol(p_cur_obj);
			return false;
		} else {
			return true;
		}
   }
   
  
   
   function f_mychk_otm_strela (p_cur_obj, p_x,p_y)
	{
		var v_x1_tmp = v_obj_list[1][p_cur_obj];
		var v_x2_tmp = v_obj_list[3][p_cur_obj];
		var v_y1_tmp = v_obj_list[2][p_cur_obj];
		var v_y2_tmp = v_obj_list[4][p_cur_obj];
		//
		var v_len_tmp = gt_length_to_otrezok(p_x,p_y,v_x1_tmp,v_y1_tmp,v_x2_tmp,v_y2_tmp);				
		if (v_len_tmp<v_otm_len_to_obj*v_scale_set[v_cur_img-1]) {
			// перерисуем отрезок другим цветом
			repaint_all (0);
			canvas=document.getElementById("draw");
			x=canvas.getContext("2d");			
			x.lineWidth = v_lineWidth;  // set the line width to 10 pixels			
			x.strokeStyle = v_color_otm;
			pnt_strela(p_cur_obj);
			return false;
		} else {
			return true;
		}
	} 
   
    function f_mychk_otm_mnogoug (i, p_x,p_y)
	{
		var v_len_tmp = screenSize().w;
		var v_len_tmp1 = 0;
		if (v_cur_nnn>1)
		for ( j=2; j<=v_cur_nnn; j++ ) {
			var t1 =	v_obj_manip_list[0][j];
			var t2 =	v_obj_manip_list[0][j-1];
			var t3 =	v_obj_manip_list[2][j];
			var t4 =	v_obj_manip_list[2][j-1];			
			if ((v_obj_manip_list[0][j]==7) && (v_obj_manip_list[2][j]==i) &&
				(v_obj_manip_list[0][j-1]==7) && (v_obj_manip_list[2][j-1]==i)					
			   ) {
				v_len_tmp1 = gt_length_to_otrezok( p_x,p_y, v_obj_manip_list[3][j-1],v_obj_manip_list[4][j-1], v_obj_manip_list[3][j],v_obj_manip_list[4][j] );
				if (v_len_tmp>v_len_tmp1) v_len_tmp=v_len_tmp1;
			}
		}
		if (v_len_tmp<v_otm_len_to_obj*v_scale_set[v_cur_img-1]) {
			// перерисуем отрезок другим цветом
			repaint_all (0);
			canvas=document.getElementById("draw");
			x=canvas.getContext("2d");			
			x.lineWidth = v_lineWidth;  // set the line width to 10 pixels			
			x.strokeStyle = v_color_otm;
			pnt_mnogoug(i);
			return false;
		} else {
			return true;
		}
	} 

	function f_mychk_otm_text (p_cur_obj, x1, y1)
	{
		var v_x1 = v_obj_list[1][p_cur_obj];	// начало - x
		var v_y1 = v_obj_list[2][p_cur_obj];	// начало - y
		//
		var v_width_tmp = x.measureText(v_obj_list[5][p_cur_obj]).width ;
		//
		var v_x2 = v_x1+v_width_tmp;	
		var v_y2 = v_y1;	
		//
		var v_x3 = v_x1+v_width_tmp;	
		var v_y3 = v_y1+v_h_text;	
		//
		var v_x4 = v_x1;	
		var v_y4 = v_y1+v_h_text;	
		//
		var v_l1_tmp = gt_length_to_otrezok(x1, y1, v_x1,v_y1, v_x2,v_y2 );
		var v_l2_tmp = gt_length_to_otrezok(x1, y1, v_x2,v_y2, v_x3,v_y3 );
		var v_l3_tmp = gt_length_to_otrezok(x1, y1, v_x3,v_y3, v_x4,v_y4 );
		var v_l4_tmp = gt_length_to_otrezok(x1, y1, v_x4,v_y4, v_x1,v_y1 );
		//
		var v_min_tmp = screenSize().w;
		if (v_min_tmp>v_l1_tmp) v_min_tmp=v_l1_tmp;
		if (v_min_tmp>v_l2_tmp) v_min_tmp=v_l2_tmp;
		if (v_min_tmp>v_l3_tmp) v_min_tmp=v_l3_tmp;
		if (v_min_tmp>v_l4_tmp) v_min_tmp=v_l4_tmp;
		//
		if (v_min_tmp<v_otm_len_to_obj*v_scale_set[v_cur_img-1]) {
			pnt_text( p_cur_obj, v_color_otm );
			return false;
		} else {
			return true;
		}
	} 

function setEventLftBtn (rejim, divIdName) {
	if (v_fdraw_rejim==rejim) {
		clr_drw_rejim ();
	} else {
		clr_drw_rejim ();
		v_fdraw_rejim = rejim; // отрезок	
		setBorderLeftBtn(divIdName);
	}
}

function fnull(p,v) 
{
	if (p==0) {
		return v;
	} else { 
		return p;
	}
}

function my_str_to_nmb_repl (p_str) {
	v_str_tmp = p_str;
	v_str_tmp = v_str_tmp.replace('px','') ;
	v_str_tmp = v_str_tmp.replace('auto','') ;
	v_str_tmp = v_str_tmp.replace('%','') ;
	return Math.floor(v_str_tmp) ;
}

function clr_chk() {
	$(".mylftbtnclr").css("border",v_css_border_uncheck_button);
}

function clr_drw_rejim () {
	v_fdraw_rejim=0;
	$("#lupabrd").css("display","none");
	clr_chk();
}

function delay(x) {
	var d = new Date();
	var c, diff;
	while (1) {
	    c=new Date();
	    diff = c-d;
	    if (diff > x) break;
	}
}

// вывод прямоугольника вокруг текста
function sh_text( p_x, p_name, p_x0, p_y0, p_bg, p_fl ) {
	var v_width_tmp = x.measureText(p_name).width ;
	p_x.fillStyle = p_bg;					// v_bgfill - цвет фона
	p_x.fillRect( p_x0-v_padding+1, p_y0-v_h_text+v_padding+1, v_width_tmp+2*v_padding, v_h_text );	// v_h_text - высота текста
	p_x.fillStyle=p_fl;
	p_x.fillText( p_name, p_x0, p_y0);
}

function remedotrade() {
	window.open('http://www.medotrade.ru').focus();	
}

function gt_len_otr (x1,y1,x2,y2) {
	v_xF   = Math.abs(x2 - x1)*PixelSpacingX[v_cur_img-1]/v_koeff_img;   // SCRX              
	v_yF   = Math.abs(y2 - y1)*PixelSpacingY[v_cur_img-1]/v_koeff_img;   // SCRY          
	return 	Math.sqrt(v_xF*v_xF + v_yF*v_yF) ;		
}

function canvas_arrow(context, fromx, fromy, tox, toy){
	var headlen = 10; // length of head in pixels
	var dx = tox-fromx;
	var dy = toy-fromy;
	var angle = Math.atan2(dy,dx);
	context.moveTo(fromx, fromy);
	context.lineTo(tox, toy);
	context.lineTo(tox-headlen*Math.cos(angle-Math.PI/6),toy-headlen*Math.sin(angle-Math.PI/6));
	context.moveTo(tox, toy);
	context.lineTo(tox-headlen*Math.cos(angle+Math.PI/6),toy-headlen*Math.sin(angle+Math.PI/6));
} 

function radian_to_grad(rad) {
	return rad*(180/Math.PI);	
}

function grad_to_radian(grad) {
	return grad*(Math.PI/180);	
}


function screenSize() {
    var w, h; // Объявляем переменные, w - длина, h - высота
    w = (window.innerWidth ? window.innerWidth : (document.documentElement.clientWidth ? document.documentElement.clientWidth : document.body.offsetWidth));
    h = (window.innerHeight ? window.innerHeight : (document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.offsetHeight));
    return {w:w, h:h};
}

function myresize () {
	$("#mycmnfooter").css("display","none");
//	clr_drw_rejim ();
	var v_tmp_w = screenSize().w;
	var v_tmp_h = screenSize().h;
	if (v_tmp_w<990) {
		$("#myheadstrinfo").css("font-size","16px");
	} else {
		$("#myheadstrinfo").css("font-size","20px");
	}
	var v_mycmnfooter = $("#mycmnfooter");
	if (v_tmp_w<810) {
		$("#mylfthordiv_1").width("27%");
		$("#mylfthordiv_3").width("12.5%");
		v_mycmnfooter.css("min-height","27px");
		v_mycmnfooter.height(27);
	} else 
	if ((v_tmp_w<1090) && (v_tmp_w>=810)) {
		$("#mylfthordiv_1").width("25%");
		$("#mylfthordiv_3").width("13.77%");
		v_mycmnfooter.css("min-height","40px");
		v_mycmnfooter.height(40);
	} else {
		$("#mylfthordiv_1").width("20%");
		$("#mylfthordiv_3").width("19.00%");
		v_mycmnfooter.css("min-height","40px");
		v_mycmnfooter.height(40);
	}
	canvas = document.getElementById("draw");
	ctx = canvas.getContext('2d');
	v_canvas_w=ctx.canvas.width;
	v_canvas_h=ctx.canvas.height;
}

function FNext() {
	$("#mynmbframe").html("FRAME "+v_cur_frame_nn+'/'+FrameCount[v_cur_pos-1]);
	$(".mypctframes").css("display","none");
	$("#frame"+v_cur_frame_nn).css("display","block");
	if (v_play_forward) {
		v_cur_frame_nn++;
	} else {
		v_cur_frame_nn--;
	}
	if ((v_cur_frame_nn>FrameCount[v_cur_pos-1]) || (v_cur_frame_nn<1) || (!v_start_play_video) ) {
		clearInterval(v_id_fnext_tmp);
		$(".mypctframes").css("display","none");
		$("#draw").css("display","block");
		$("#myspbtn1").html("&#xe10d;");
		v_cur_frame_nn=1;
		f_to_canvas(0,v_cur_frame_nn);
	}
}

function window_paint (p_cur_wnd) {	//	недоделано 
	
}

function f_to_canvas ( p_is_ld, p_id_frame ) {
	$("#etcdiv").css("background-color",""); 
	$("#etcdiv").css("margin",""); 
	var vH = $("#mycmnfld").height()-$("#fidscroll").height();
	if (v_etctype[v_cur_pos-1]==2)	// отображение structured report 
	{
		$("#MyadminMenu").css("display","none");
		$("#draw").css("display","none");
		$("#etcdiv").css("display","");
	//	$("#etcdiv").css("background-color","white"); 
		$("#etcdiv").css("margin","15px"); 
	//	$("#etcdiv").css("height", vH+"px"); 
		var vH = $("#mycmnfld").height()-$("#fidscroll").height()-30;
		var v_ask_url = v_etcstr[v_cur_pos-1];
		
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
			  $("#etcdiv").html('<font color="grey"><div style="overflow: auto; height:'+vH+'px">'+data+'</div></font>');
		  },
		  error: function(err) {
	//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
			  alert('Ошибка получения данных с сервера '+err.statusText );
		  }
		});
		
		/*$("#etcdiv").html("<p>" +
				'<link rel="import" href="'+v_etcstr[v_cur_pos-1]+'">'+
				"</p>");*/
	} else if (v_etctype[v_cur_pos-1]==1)	// отображение PDF 
	{
		$("#MyadminMenu").css("display","none");
		$("#draw").css("display","none");
		$("#etcdiv").css("display","");
		$("#etcdiv").html("<p>" +
				'<object id="pdfobj" data="'+v_etcstr[v_cur_pos-1]+'" type="application/pdf" width="'+$("#mycmnfld").width()+'" height="'+vH+'">'+  
				'alt: <a href="'+v_etcstr[v_cur_pos-1]+'">Encapsulated PDF</a>'+
				'</object>'+
				"</p>");
		//<div id="etcdiv" style="display:none">&nbsp;</div>
	//	v_height_tmp = $("#mycmnfld").attr("height");
	//	$("#etcdiv").height= v_height_tmp;
	//	$("#pdfobj").height= v_height_tmp;
		
	} else if (v_etctype[v_cur_pos-1]==3)	// отображение ECG 
	{
		$("#MyadminMenu").css("display","none");
		$("#draw").css("display","none");
		$("#etcdiv").css("display","");              
		$("#etcdiv").html('<div class="scrollable" style="overflow: auto; height:'+vH+'px"><p>'+
				'<object id="pdfobj" data="'+v_etcstr[v_cur_pos-1]+'" type="image/jpeg" >'+  
				'alt: <a href="'+v_etcstr[v_cur_pos-1]+'">Encapsulated PDF</a>'+
				'</object>'+
				'</p></div>'
				);
		//<div id="etcdiv" style="display:none">&nbsp;</div>
	//	v_height_tmp = $("#mycmnfld").attr("height");
	//	$("#etcdiv").height= v_height_tmp;
	//	$("#pdfobj").height= v_height_tmp;
		
	} else	
	{	
		$("#MyadminMenu").css("display","");
		$("#draw").css("display","");
		$("#etcdiv").css("display","none");
		$("#etcdiv").html("");
		var v_draw_tmp = $("#draw");
		// определение разметки области 
		// mycmnfld размножаем 
		// v_amm_windows - количество окон 
		v_cur_rotate_gr = 0;	//	значение градусов поворота - текущее
		if (v_is_from_rmis) {
			v_height_tmp = screenSize().h-120;
		} else {
			v_height_tmp = screenSize().h-241;
		} 
		v_draw_tmp.attr("height", v_height_tmp+"px");
		//Ссылаемся на картинку
		if (FrameCount[v_cur_pos-1]<=1) {
			img=document.getElementById('bigpicture');
		} else {
			img=document.getElementById('frame'+v_cur_frame_nn);
		}
		// размер выводим по первому снимку
		v_draw_width = ImgWidth[0];
		v_draw_height = ImgHeight[0];
		//
		v_koeff_img = v_height_tmp/v_draw_height;	
		v_koeff_fnt = 1; 
		v_draw_tmp.attr("width", Math.floor(v_draw_width*v_koeff_img)+"px");
		canvas=document.getElementById("draw");
		x=canvas.getContext("2d");
		// ширина и высота canvas
	    v_width =  v_draw_tmp.attr("width");
	    v_height =  v_draw_tmp.attr("height");
		// выведем аттрибуты DICOM на канве и подчистим канву
	    x.clearRect(0, 0, canvas.width, canvas.height); // Очиста всего холста  
		x.strokeStyle = '#000'; // Цвет обводки
	    x.lineWidth = 1; 		// Ширина линии
	    x.fillStyle = '#000';   // Цвет заливки
		x.fillRect(0, 0, canvas.width, canvas.height);
		// вывод рисунка
		var v_xmy_tmp = v_pos_x[v_cur_img-1];
		var v_ymy_tmp = v_pos_y[v_cur_img-1];
		x.scale(v_scale_set[v_cur_img-1], v_scale_set[v_cur_img-1]); //Уменьшение
		x.drawImage( img,
			         fnull(v_xmy_tmp,0),
			         fnull(v_ymy_tmp,0), 
			         x.canvas.width, 
			         x.canvas.height);
		v_tmpf = v_draw_tmp.attr("width");
		$(".fscroll").width( $("#mycmnfld").width() );
		var v_width = 100*v_max_pos+15;
		$(".fscroll_child").width(v_width+"px");
		v_draw_tmp.css("margin-left",(($("#mycmnfld").width()-canvas.width)/2)+"px");
		$(".mhbdcm").css( "height", (120+canvas.height) + "px" );
		$(".mhbdcm").css( "max-height",  (120+canvas.height) + "px" );
		$(".mypnldev").css( "height",  (118+canvas.height) + "px" );
		// для вывода текста
		if (!v_show_label) {
			$(".mydcmtags").remove();
		} 
		var v_left_x  = 5;
		var v_right_x = 5;
		
		var v_top_1_y = document.getElementById("draw").offsetTop +5;
		var v_bottom_y = document.getElementById("draw").offsetTop+document.getElementById("draw").offsetHeight-v_h_btw_l*3
		
		var v_h_btw_l = 15;
		$(".mydcmtags").remove();
		var v_mycmnfld_tmp = $("#mycmnfld");
		// top left 
		if (v_show_label) {
			v_mycmnfld_tmp.append('<div class="mydcmtags" style="top:'+
						(v_top_1_y)+'px;padding-left:'+v_left_x+'px">StudyUID: '+ studyUID[v_cur_pos-1]      +'</div>');
			v_mycmnfld_tmp.append('<div class="mydcmtags" style="top:'+
						(v_top_1_y+v_h_btw_l)+'px;padding-left:'+v_left_x+'px">'+ 'W: '+v_draw_width+' L: '+v_draw_height+'</div>');
			v_mycmnfld_tmp.append('<div class="mydcmtags" style="top:'+
						(v_top_1_y+v_h_btw_l*2)+'px;padding-left:'+v_left_x+'px">'+ 'Z: '+v_koeff_fnt.toFixed(2)+'</div>');
			v_mycmnfld_tmp.append('<div class="mydcmtags" style="top:'+
						(v_top_1_y+v_h_btw_l*3)+'px;padding-left:'+v_left_x+'px">'+ 'SeriesUID: '+SeriesUID[v_cur_pos-1]+'</div>');
			v_mycmnfld_tmp.append('<div class="mydcmtags" style="top:'+
						(v_top_1_y+v_h_btw_l*4)+'px;padding-left:'+v_left_x+'px">'+ 'InstanceUID: '+StudyInstanceUID[v_cur_pos-1]+'</div>');
		}				
		// top right 
		var v_fio = p_ename[v_cur_pos-1];
		var v_len_tmp = v_fio.toString().length;
		v_left_pos = Math.floor(mycmnfld.offsetWidth)-v_len_tmp*12-50;
		if (v_show_label) {	
			v_mycmnfld_tmp.append('<div class="mydcmtags" style="top:'+
						v_top_1_y+'px;padding-left:'+v_left_pos+'px">'+ p_ename[v_cur_pos-1]       +'</div>');
			v_mycmnfld_tmp.append('<div class="mydcmtags" style="top:'+
						(v_top_1_y+v_h_btw_l)+'px;padding-left:'+v_left_pos+'px">'+ patientid[v_cur_pos-1]     +'</div>');
			v_mycmnfld_tmp.append('<div class="mydcmtags" style="top:'+
						(v_top_1_y+v_h_btw_l*2)+'px;padding-left:'+v_left_pos+'px">'+ p_databrn[v_cur_pos-1]     +'</div>');
		}
		if (v_actuality==0) {			// 0-не установлено
			v_act_str='';
		} else if (v_actuality==1) {	// 1-плановая		
			v_act_str='плановая';
		} else if (v_actuality==2) {	// 2-срочная	
			v_act_str='срочная';
		} else if (v_actuality==3) { 	// 3-экстренная
			v_act_str='экстренная';
		} else if (v_actuality==4) { 	// 4-завершенная	
			v_act_str='завершенная';
		}
		if (v_act_str!='') {
			if (v_show_label) {
				v_mycmnfld_tmp.append('<div class="mydcmtags" style="top:'+
					(v_top_1_y+v_h_btw_l*3)+'px;padding-left:'+v_left_pos+'px">'+ v_act_str     +'</div>');	//	'Актуальность: '+
				}
		}			
		// bottom left
		if (FrameCount[v_cur_pos-1]>1) { 
			v_mycmnfld_tmp.append('<div id="mynmbframe" class="mydcmtags" style="top:'+
					(v_top_1_y+canvas.height-v_h_btw_l*8)+'px;padding-left:'+v_left_x+'px">FRAME 1/'+FrameCount[v_cur_pos-1]+'</div>');
			v_mycmnfld_tmp.append('<div class="mydcmtags" style="top:'+
					(v_top_1_y+canvas.height-v_h_btw_l*6)+'px;padding-left:'+v_left_x+'px">VIDEO</div>');
			v_mycmnfld_tmp.append('<div class="mydcmtags" style="top:'+
					(v_top_1_y+canvas.height-v_h_btw_l*4-5)+'px;left:auto;float:left;width:120px;height:80px">'+
					'<button id="mybtnT1" class="win-command myfbtn" title="Показать видео" style="left:auto;float:left;width:40px;min-width:40px;max-width:40px">'+
						'<span id="myspbtn1" class="win-commandimage win-commandring myfbtn1">&#xe10d;</span>'+
					'</button>'+
					'<button id="mybtnT2" class="win-command myfbtn" title="Изменить направление просмотра" style="left:auto;float:left;width:40px;min-width:40px;max-width:40px">'+
						'<span id="myspbtn2" class="win-commandimage win-commandring myfbtn1">&#xe055;</span>'+
					'</button>'+
	//					'<div class="fs1" data-icon="&#xe05d;" aria-hidden="true" style="width:20px;height:20px;font-size:20pt;left:auto;float:left;border:1px solid while"></div>'+
					'</div>');
			$("#mybtnT1").click(function()   { // проигрывание видео
				v_start_play_video = !v_start_play_video;
				if (v_start_play_video) {
					$("#myspbtn1").html("&#xe10c;");					
					// проигрывание видео
					v_draw_tmp.css("display","none");
					v_id_fnext_tmp=setInterval("FNext();", 40);
				}				
		    }); 
			$("#mybtnT2").click(function()   { // смена направления проигрывания видео
				if (v_play_forward) {
					$("#myspbtn2").html("&#xe051;");
					v_play_forward=false;
				} else {
					$("#myspbtn2").html("&#xe055;");
					v_play_forward=true;
				}
		    });
			if ( p_is_ld ) {
				// добавим невидимые image для фреймов
				$("#frames").remove();	//	удалим все старые фреймы
				$("#myframes").append('<div id="frames" ></div>'); 
				// цикл по фреймам
				for (var v_i=0;v_i<=FrameCount[v_cur_pos-1];v_i++) {
					v_loaded_frames[v_cur_img][v_i]=0;		
				}
				var v_proczagr_tmp = $("#proczagr"); 
				v_proczagr_tmp.css("display","block");
				$("#myimgld").css("display","block");
				$("#z1").css("display","block");
				var v_wdth_tmp = screenSize().w;
				var v_left_canvas_tmp = Math.floor( mylfthordiv_1.offsetWidth+(mycmnfld.offsetWidth-canvas.width)/2 );
				for (var i_tmp=1;i_tmp<=FrameCount[v_cur_pos-1];i_tmp++) {
					$("#frames").append('<img style="display:none;position:fixed;'+
	                    'left:'+v_left_canvas_tmp+'px;top:231px;width:'+canvas.width+'px;" src="'+
						imgarr[v_cur_pos-1]+'&frame='+i_tmp+
						'" alt="" class="picture mypctframes" id="frame'+i_tmp+'" onload="myclcldr('+i_tmp+');" />');
				}
				// выведем круг загрузки
				v_proczagr_tmp.css("display","block");
				v_proczagr_tmp.css("top",(v_top_1_y+canvas.height-v_h_btw_l*6)+"px");
				v_proczagr_tmp.css("left",(v_left_x+Math.floor(mylfthordiv_1.offsetWidth)+50)+"px");
				
				
			}
		}
	}	
}

// функция обновления сообщения о загрузке
function myclcldr(p_frame_tmp) {
	$("#mydcmtags").css("display","block");
	v_loaded_frames[v_cur_img][p_frame_tmp]=1;
	var v_amm_tmp = 0;
	for (var v_i=0;v_i<=FrameCount[v_cur_pos-1];v_i++) {
		var v_cur_tmp = v_loaded_frames[v_cur_img][v_i];
		if (v_cur_tmp==1) {
			v_amm_tmp++;
		} else {
			var v_ii_tmp = 0;
		}		
	}
	var v_real_tmp = Math.floor( (v_amm_tmp/FrameCount[v_cur_pos-1])*100 );
	$("#z1").html(v_real_tmp+"%");
	if (v_real_tmp==100) {
		$("#proczagr").css("display","none");
		$("#myimgld").css("display","none");
		$("#z1").css("display","none");
	}
}

function clrbox(p_id) {
	$(".picture#p"+p_id).css("border","none");
}

function drawbox (p_id) {
	$(".picture#p"+p_id).css("border","1px solid red");
}

function f_paintimg(p_id_img) {
    $("#bigpicture").attr("src", imgarr[p_id_img-1] );	
}

function sleep(ms) {
	ms += new Date().getTime();
	while (new Date() < ms){}
} 

function LfRg () {	// зеркало
	clr_drw_rejim ();
	var cnvobj=document.getElementById("draw");
	var razmer=parseInt(cnvobj.width/2);
    var  ctx=cnvobj.getContext("2d");
    for (i=0;i<=razmer;i++)
    {
         imgd = ctx.getImageData(i,0, 1, cnvobj.height);
         imgd1 = ctx.getImageData((cnvobj.width-i),0, 1, cnvobj.height);
         ctx.putImageData(imgd, (cnvobj.width-i), 0);
         ctx.putImageData(imgd1, i, 0);
    }
}

function upDn () {	// зеркало
	clr_drw_rejim ();
	var cnvobj=document.getElementById("draw");
	var razmer=parseInt(cnvobj.height/2);
    var  ctx=cnvobj.getContext("2d");
    for (i=0;i<=razmer;i++)
    {
         imgd = ctx.getImageData(0,i, cnvobj.width, 1);
         imgd1 = ctx.getImageData(0,(cnvobj.height-i), cnvobj.width, 1);
         ctx.putImageData(imgd, 0, (cnvobj.height-i));
         ctx.putImageData(imgd1, 0, i);
    }
}

function large () {
	v_scale_set[v_cur_img-1] += 0.01;
	repaint_all (0);
}

function small () {
	v_scale_set[v_cur_img-1] -= 0.01;
	repaint_all (0);
}

// рисуем отрезок
function drw_line() {
	setEventLftBtn (1, "mybtnline1");  // отрезок
}
// лупа
function set_lupa() {
	$("#lupabrd").css("display","none");
	$("#lupabrd").css("height",0+"px");
	$("#lupabrd").css("width",0+"px");
	$("#lupabrd").css("border",0+"px");
//	$("#lupabrd").css("height",iZoomRadius+"px");
//	$("#lupabrd").css("width",iZoomRadius+"px");
	setEventLftBtn (2, "mybtnlupa1");  // лупа
}

function ShapeMove() {
	setEventLftBtn (3, "mybtnMove1");  // перемещение
}

function ShapeText() {	// ТЕКСТ
	setEventLftBtn (4, "mybtnText1");  // ТЕКСТ
}

function strelatext() {	//	Стрелка с текстом
	setEventLftBtn (5, "mybtnstrela1");  // Стрелка с текстом
}

function ugol() {	// УГОЛ
	setEventLftBtn (6, "mybtnugol1");  // УГОЛ
}

function mnogoug () {	// многоугольник - площадь
	setEventLftBtn (7, "mybtnmnogoug1");  // многоугольник
}

function Krug() {	//	круг
	setEventLftBtn (11, "mybtnOkrujnost1");  // круг
}

// функция добавления нового окна отображения снимка в браузере
function DivideWindow() {
	v_amm_windows++;
	MyAlert("under construction");
}

// инверсия   
function invert () {	// ИНВЕРСИЯ
	clr_drw_rejim ();
	myCanvas=document.getElementById("draw");
	ctx = myCanvas.getContext("2d");
	WIDTH = myCanvas.width;
	HEIGHT = myCanvas.height;
	imgData = ctx.getImageData(0,0,WIDTH, HEIGHT); 
	pixels = imgData.data;
	for ( i = 0; i < pixels.length; i += 4) {
		pixels[i]   = 255-pixels[i ];
		pixels[i+1] = 255-pixels[i+1];
		pixels[i+2] = 255-pixels[i+2]; 
	}
	ctx.putImageData(imgData,0,0);
}
	
function rotateCMN(gragus) {	// Поворот 90 градусов по часовой стрелке
		v_cur_rotate_gr=v_cur_rotate_gr+gragus;
		if (v_cur_rotate_gr>=360) v_cur_rotate_gr=v_cur_rotate_gr-360; 
		if (v_cur_rotate_gr<0)   v_cur_rotate_gr=v_cur_rotate_gr+360; 
		if (v_cur_rotate_gr==0) {
			repaint_all(0);
		} else {
			clr_drw_rejim ();
			myCanvas=document.getElementById("draw");
			ctx = myCanvas.getContext("2d");
			//рисуем «фон»
			ctx.clearRect(0,0,canvas.width,canvas.height);
			ctx.strokeRect(0,0,canvas.width,canvas.height);
			img=document.getElementById('bigpicture');
			ctx.save();
			if (v_cur_rotate_gr<=90) {
				v_w_tmp=canvas.width;//Math.floor(canvas.width/2);
				v_h_tmp=0;//Math.floor(canvas.height/2);
			} else if (v_cur_rotate_gr<=180) {
				v_w_tmp=canvas.width;//Math.floor(canvas.width/2);
				v_h_tmp=canvas.height;//Math.floor(canvas.height/2);
			} else if (v_cur_rotate_gr<=270) {
				v_w_tmp=0;//canvas.width;//Math.floor(canvas.width/2);
				v_h_tmp=canvas.height;//Math.floor(canvas.height/2);
			} 
			ctx.translate( v_w_tmp, v_h_tmp );
			ctx.rotate(grad_to_radian(v_cur_rotate_gr)); 
			ctx.fillStyle = '#000';
			ctx.fillRect(0, 0, canvas.width, canvas.height);
			ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
			ctx.restore();	
		}
}
	
function rotatem() {	//	Поворот 90 градусов против часовой стрелке
	rotateCMN(-90);
	v_povorot[v_cur_img-1]=v_povorot[v_cur_img-1]-90;
}
	
function rotatep() {	// Поворот 90 градусов по часовой стрелке
	rotateCMN(90);
	v_povorot[v_cur_img-1]=v_povorot[v_cur_img-1]+90;
}

function pnt_otrezok (i) {
	x.strokeRect(v_obj_list[1][i]-2,v_obj_list[2][i]-2,4,4);
	x.strokeRect(v_obj_list[3][i]-2,v_obj_list[4][i]-2,4,4);
	x.beginPath();
	x.moveTo(v_obj_list[1][i],v_obj_list[2][i]);
	x.lineTo(v_obj_list[3][i],v_obj_list[4][i]);
	x.stroke();	
	if (v_obj_list[5][i]!="") {// вывод текста
		x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
		sh_text( x, v_obj_list[5][i],
					v_obj_list[1][i]+10, 
					v_obj_list[2][i]+10, v_bgfill, v_fillStyle );
	}
}	

function pnt_text (i, p_color_text) {
	if (v_obj_list[5][i]!="") {
		x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
		sh_text( x, v_obj_list[5][i],
					v_obj_list[1][i], 
					v_obj_list[2][i], p_color_text, v_fillStyle );
	}
}

function pnt_strela (i) {
	x.strokeRect(v_obj_list[1][i]-2,v_obj_list[2][i]-2,4,4);
	x.beginPath();
	canvas_arrow(x, v_obj_list[1][i], v_obj_list[2][i], v_obj_list[3][i], v_obj_list[4][i]);
	x.stroke();	
	if (v_obj_list[5][i]!="") {
		x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
		sh_text( x, v_obj_list[5][i],
					v_obj_list[1][i]+10, 
					v_obj_list[2][i]+10, v_bgfill, v_fillStyle );
	}
}

function pnt_krug(i) {
	x.strokeRect(v_obj_list[1][i]-2,v_obj_list[2][i]-2,4,4);
	x.strokeRect(v_obj_list[3][i]-2,v_obj_list[4][i]-2,4,4);
	x.beginPath();
	
	var x1_tmp=(Math.PI/180)*0;
	var x2_tmp=(Math.PI/180)*360;
	
	var v_c_x_tmp = v_obj_list[1][i] + Math.floor( ( v_obj_list[3][i] - v_obj_list[1][i] ) / 2 ) ;
	var v_c_y_tmp = v_obj_list[2][i] + Math.floor( ( v_obj_list[4][i] - v_obj_list[2][i] ) / 2 ) ;
	var v_rad_tmp = Math.floor( Math.sqrt( ( v_c_x_tmp - v_obj_list[3][i] )*( v_c_x_tmp - v_obj_list[3][i] ) + 
	                                       ( v_c_y_tmp - v_obj_list[4][i] )*( v_c_y_tmp - v_obj_list[4][i] ) ) );
	x.arc ( v_c_x_tmp, v_c_y_tmp, v_rad_tmp, x1_tmp, x2_tmp );
	x.stroke();
	// выведем площадь и длину окружности (и м.б. интенсивность)
	x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
	if (v_obj_list[9][i]!="") {
		sh_text( x, v_obj_list[9][i],
					v_obj_list[1][i], 
					v_obj_list[2][i]-15, v_bgfill, v_fillStyle );
	}				
	if (v_obj_list[10][i]!="") {
		sh_text( x, v_obj_list[10][i],
					v_obj_list[1][i], 
					v_obj_list[2][i], v_bgfill, v_fillStyle );
	}				
	if (v_obj_list[11][i]!="") {
		sh_text( x, v_obj_list[11][i],
					v_obj_list[1][i], 
					v_obj_list[2][i]+15, v_bgfill, v_fillStyle );
	}
}

function pnt_ugol(i) {
	x.strokeRect(v_obj_list[1][i]-2,v_obj_list[2][i]-2,4,4);
	x.strokeRect(v_obj_list[3][i]-2,v_obj_list[4][i]-2,4,4);
	x.beginPath();
	x.moveTo(v_obj_list[1][i],v_obj_list[2][i]);
	x.lineTo(v_obj_list[3][i],v_obj_list[4][i]);
	if (v_obj_list[8][i] > 1) {
		x.moveTo(v_obj_list[3][i],v_obj_list[4][i]);
		x.lineTo(v_obj_list[6][i],v_obj_list[7][i]);
		x.strokeRect(v_obj_list[6][i]-2,v_obj_list[7][i]-2,4,4);
	}
	x.stroke();	
	if (v_obj_list[5][i]!="") {
		x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
		sh_text( x, v_obj_list[5][i],
					v_obj_list[1][i]+10, 
					v_obj_list[2][i]+10, v_bgfill, v_fillStyle );
	}	
}

function pnt_mnogoug(i) {
	var v_x_from	= v_obj_list[1][i];
	var v_y_from 	= v_obj_list[2][i];
	var v_x_to 		= v_obj_manip_list[3][1];
	var v_y_to 		= v_obj_manip_list[4][1];
	if (v_cur_nnn>1)
	for ( j=2; j<=v_cur_nnn; j++ ) {
		var t1 =	v_obj_manip_list[0][j];
		var t2 =	v_obj_manip_list[0][j-1];
		var t3 =	v_obj_manip_list[2][j];
		var t4 =	v_obj_manip_list[2][j-1];			
		if ((v_obj_manip_list[0][j]==7) && (v_obj_manip_list[2][j]==i) &&
			(v_obj_manip_list[0][j-1]==7) && (v_obj_manip_list[2][j-1]==i)					
		   ) {
			v_x_from 	= v_obj_manip_list[3][j-1];
			v_y_from 	= v_obj_manip_list[4][j-1];
			v_x_to 		= v_obj_manip_list[3][j];
			v_y_to 		= v_obj_manip_list[4][j];
			x.strokeRect(v_x_from-2,v_y_from-2,4,4);
			x.strokeRect(v_x_to-2,v_y_to-2,4,4);
			x.beginPath();
			x.moveTo(v_x_from,v_y_from);
			x.lineTo(v_x_to,v_y_to);
			x.stroke();
			
		}
	} 
	if (v_obj_list[3][i] != v_obj_list[1][i]) {
		v_x_from	= v_obj_manip_list[3][v_cur_nnn];
		v_y_from 	= v_obj_manip_list[4][v_cur_nnn];
		v_x_to 		= v_obj_list[3][i];
		v_y_to 		= v_obj_list[4][i];
		x.strokeRect(v_x_from-2,v_y_from-2,4,4);
		x.strokeRect(v_x_to-2,v_y_to-2,4,4);
		x.beginPath();
		x.moveTo(v_x_from,v_y_from);
		x.lineTo(v_x_to,v_y_to);
		x.stroke(); 
	}
	if (v_obj_list[5][i]!="") {
		x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
		sh_text( x, v_obj_list[5][i],
					v_obj_list[1][i]+10, 
					v_obj_list[2][i]+10, v_bgfill, v_fillStyle );
	}	
}	

	// смещение всех измерений
   function f_move_all_izmer(p_move_x,p_move_y) {
   		for ( var i=1; i<=v_cur_obj; i++	) {	
		  var v_img_tmp = v_obj_list[11][i];	
		  if (v_img_tmp == v_cur_img) {
   				var v_cur_rej = v_obj_list[0][i];
   				if (v_cur_act_izmer==i) {
				x.strokeStyle = v_color_otm;  
			} else {		
				x.strokeStyle = v_strokeStyle;  
			}
			var v_cur_rej = v_obj_list[0][i];
			if (v_cur_rej==1) {	// отрезок
				v_obj_list[1][i]=v_obj_list[1][i]+p_move_x;
				v_obj_list[2][i]=v_obj_list[2][i]+p_move_y;
				v_obj_list[3][i]=v_obj_list[3][i]+p_move_x;
				v_obj_list[4][i]=v_obj_list[4][i]+p_move_y;
			} else 
			if (v_cur_rej==4) {	// ТЕКСТ
				v_obj_list[1][i]=v_obj_list[1][i]+p_move_x;
				v_obj_list[2][i]=v_obj_list[2][i]+p_move_y;
			} else 
			if (v_cur_rej==5) {	// Стрелка с текстом
				v_obj_list[1][i]=v_obj_list[1][i]+p_move_x;
				v_obj_list[2][i]=v_obj_list[2][i]+p_move_y;
				v_obj_list[3][i]=v_obj_list[3][i]+p_move_x;
				v_obj_list[4][i]=v_obj_list[4][i]+p_move_y;
			} else 
			if (v_cur_rej==6) {	// угол
				v_obj_list[1][i]=v_obj_list[1][i]+p_move_x;
				v_obj_list[2][i]=v_obj_list[2][i]+p_move_y;
				v_obj_list[3][i]=v_obj_list[3][i]+p_move_x;
				v_obj_list[4][i]=v_obj_list[4][i]+p_move_y;
				v_obj_list[6][i]=v_obj_list[6][i]+p_move_x;
				v_obj_list[7][i]=v_obj_list[7][i]+p_move_y;
			} else
			if ((v_cur_rej==7) || (v_cur_rej==8)) {	// многоугольник - площадь и вырезать
				v_obj_list[1][i]=v_obj_list[1][i]+p_move_x;
				v_obj_list[2][i]=v_obj_list[2][i]+p_move_y;
				v_obj_list[3][i]=v_obj_list[3][i]+p_move_x;
				v_obj_list[4][i]=v_obj_list[4][i]+p_move_y;
				if (v_cur_nnn>1)
				for ( j=1; j<=v_cur_nnn; j++ ) {
					if ( (v_obj_manip_list[0][j]==7) && (v_obj_manip_list[2][j]==i) ) 
					{
						v_obj_manip_list[3][j]=v_obj_manip_list[3][j]+p_move_x;
						v_obj_manip_list[4][j]=v_obj_manip_list[4][j]+p_move_y;
					}
				}	
			}
			else if (v_cur_rej==11) {	// круг
				v_obj_list[1][i]=v_obj_list[1][i]+p_move_x;
				v_obj_list[2][i]=v_obj_list[2][i]+p_move_y;
				v_obj_list[3][i]=v_obj_list[3][i]+p_move_x;
				v_obj_list[4][i]=v_obj_list[4][i]+p_move_y;
			}
   			}
		}
   }	
   
   function repaint_all (p_nn) {
	if (v_obj_list.length>0) {
		// ----------------------------------------------------------------------------------------
		var v_is_ex_izmer = false;
		/*for ( var i=1; i<=v_cur_obj; i++	) {	
		  var v_img_tmp = v_obj_list[11][i];	
		  if (v_img_tmp == v_cur_img) {
			var v_cur_rej = v_obj_list[0][i];
			if (v_cur_rej==3) {	// перемещение
				x.clearRect(0,0,canvas.width,canvas.height);
				x.strokeRect(0,0,canvas.width,canvas.height);
				img=document.getElementById('bigpicture');
				x.save();
				v_pos_x = v_obj_list[1][i]; 
				v_pos_y = v_obj_list[2][i]; 
			//	v_pos_x_move = x1 ;
			//	v_pos_y_move = y1 ;
				x.drawImage(img, v_pos_x, v_pos_y, canvas.width, canvas.height );  //  
				x.restore();
				v_is_ex_izmer = true;	
			}
		  }
		}*/
		if (!v_is_ex_izmer) {
			f_to_canvas (p_nn,0);
		}
		canvas=document.getElementById("draw");
		x=canvas.getContext("2d");			
		x.lineWidth = v_lineWidth;  // set the line width to 10 pixels	
		// ----------------------------------------------------------------------------------------
		for ( var i=1; i<=v_cur_obj; i++	) {	
		  if (v_obj_list[11][i] == v_cur_img) {
			if (v_cur_act_izmer==i) {
				x.strokeStyle = v_color_otm;  
			} else {		
				x.strokeStyle = v_strokeStyle;  
			}
			var v_cur_rej = v_obj_list[0][i];
			if (v_cur_rej==1) {	// отрезок
				pnt_otrezok(i);
			} else 
			if (v_cur_rej==4) {	// ТЕКСТ
				if (v_cur_act_izmer==i) {
					pnt_text(i,v_color_otm);
				} else {
					pnt_text(i,v_bgfill);
				}
			} else 
			if (v_cur_rej==5) {	// Стрелка с текстом
				if (v_cur_act_izmer==i) {
					pnt_strela(i,v_color_otm);
				} else {
					pnt_strela(i,v_bgfill);
				}
			} else 
			if (v_cur_rej==6) {	// угол
				pnt_ugol(i);
			} else
			if ((v_cur_rej==7) || (v_cur_rej==8)) {	// многоугольник - площадь и вырезать
				pnt_mnogoug(i);
			}
			else if (v_cur_rej==11) {	// круг
				pnt_krug(i);
			}
		  }	
		}
		//
		if (v_vert_mirror[v_cur_img-1])  upDn();
    	if (v_horiz_mirror[v_cur_img-1]) LfRg();
	    if (v_inversion[v_cur_img-1]) invert();
	    if (v_povorot[v_cur_img-1]!=0) rotateCMN(v_povorot[v_cur_img-1]);
	    if (v_corr_light[v_cur_img-1]!=0) img_bright(v_corr_light[v_cur_img-1]);
	    if (v_corr_contrast[v_cur_img-1]!=0) img_contrast(v_corr_contrast[v_cur_img-1]);
		
	}
}
   
function myonloadrepaint() {
	f_to_canvas(1,0);
	repaint_all(0);	
}

function img_contrast (correction) {	// КОНТРАСТ
	v_fdraw_rejim=0;
	L = 256;

	myCanvas=document.getElementById("draw");
	ctx = myCanvas.getContext("2d");
	WIDTH = myCanvas.width;
	HEIGHT = myCanvas.height;
	imgData = ctx.getImageData(0,0,WIDTH, HEIGHT); 
	pixels = imgData.data;
	lAB = 0;
	for ( i = 0; i < pixels.length; i += 4)
	{
		valueB = pixels[i];
		valueG = pixels[i+1];
		valueR = pixels[i+2];
		lAB    = lAB + (valueR * 0.299 + valueG * 0.587 + valueB * 0.114);
	}
	//средняя яркость 
	lAB = lAB / ( ImgWidth[0] * ImgHeight[0] ) ; 

	//Коэффициент коррекции
    k = 1.0 + correction / 100.0;
	
	b = [];
	
	//RGB алгоритм изменения контраста	
    for ( i=0; i<L; i++)
    {
        delta = i - lAB;
        temp  = lAB + k *delta ;

        if (temp < 0) temp = 0;
        if (temp >= 255) temp = 255;
        b[i] = temp;
    }
	
	
	for ( j = 0; j < pixels.length; j++)
    {
        val = pixels[j];
        pixels[j] = b[val];
    }	
	
	ctx.putImageData(imgData,0,0);
}

function img_bright (val) {	// ЯРКОСТЬ
	v_fdraw_rejim=0;
	myCanvas=document.getElementById("draw");
	ctx = myCanvas.getContext("2d");
	WIDTH = myCanvas.width;
	HEIGHT = myCanvas.height;
	imgData = ctx.getImageData(0,0,WIDTH, HEIGHT); 
	pixels = imgData.data;
	for ( i = 0; i < pixels.length; i += 4) {
		if (pixels[i]<=255-val)
			pixels[i] = pixels[i ]+val;
		if (pixels[i+1]<=255-val)
			pixels[i+1] = pixels[i+1]+val;
		if (pixels[i+2]<=255-val)
			pixels[i+2] = pixels[i+2]+val; 
	}
	ctx.putImageData(imgData,0,0);
}

// убрать измерения ----------------------------------------------------
function btnclr() {
   v_pos_x[v_cur_img-1]=0;
   v_pos_y[v_cur_img-1]=0;
   v_scale_set[v_cur_img-1]=1;
   v_vert_mirror[v_cur_img-1] = false;
   v_horiz_mirror[v_cur_img-1] = false;
   v_povorot[v_cur_img-1] =0; 
   v_inversion[v_cur_img-1] = false;
   v_corr_light[v_cur_img-1] = 0;
   v_corr_contrast[v_cur_img-1] = 0;
   v_cur_obj=0;
   v_cur_nnn=0;
   clr_drw_rejim();
   repaint_all(0);
   clr_chk();
   v_ismousedown=0;
}

function PreviousSeries() {
	v_cur_seria=SeriesUID[v_cur_pos-1];
	for (i=v_cur_pos;i>0;i--) {
		if (v_cur_seria!=SeriesUID[i-1]) {
			v_cur_pos=i; v_cur_img=i;
			drawbox(v_cur_img);
 			f_paintimg(v_cur_img);
			break;
		}
	}
}

function NextSeries() {
	v_cur_seria=SeriesUID[v_cur_pos-1];
	for (i=v_cur_pos;i<=v_max_pos;i++) {
		if (v_cur_seria!=SeriesUID[i-1]) {
			v_cur_pos=i; v_cur_img=i;
			drawbox(v_cur_img);
 			f_paintimg(v_cur_img);
			break;
		}
	}
}

function MyTextAfterModal(name) {
	// нарисуем текст
	if ( (name!=null) && (name!="") ) {
		x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
		x0 = Math.floor( mouse.x  );
		y0 = Math.floor( mouse.y  );
		v_cur_obj++;
		v_obj_list[0][v_cur_obj] = v_fdraw_rejim;  // ТЕКСТ
		v_obj_list[1][v_cur_obj] = x0 ; // начало - x
		v_obj_list[2][v_cur_obj] = y0 ; // начало - y
		// 
		sh_text( x, name, x0, y0, v_bgfill, v_fillStyle );
		//
		v_obj_list[5][v_cur_obj] = name ;
		v_obj_list[8][v_cur_obj] = 1;	//	номер щелчка по порядку
		//
		v_obj_list[11][v_cur_obj] = v_cur_img;
	}		
	clr_drw_rejim ();
//S	myCmnTouchFunc(btnclr);
}

function MyStrelaAfterModal(name){
	// нарисуем текст
	if (name!=null && name!="") {
		x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
		sh_text( x, name,
				v_obj_list[1][v_cur_obj]+10, 
				v_obj_list[2][v_cur_obj]+10, v_bgfill, v_fillStyle );
		v_obj_list[5][v_cur_obj] = name ;
	}
	clr_drw_rejim ();		//	конец режима - нажата последняя кнопка
	v_click_canvas=false;
//	myCmnTouchFunc(btnclr);
}
	
function draw_click(e, px,py){
	   myresize();
//	canvas = document.getElementById("draw");
//	canvas.addEventListener("mousemove",function(e){
		canvas=document.getElementById("draw");
		x=canvas.getContext("2d");			
		x.lineWidth = v_lineWidth;  // set the line width to 10 pixels			
		x.strokeStyle = v_strokeStyle;  // set the line color 
		// get coord
		// вычисление положения (x, y) элемента Canvas DOM на странице
		fcanvas = $('#draw');
		canvasPosition = {
			x: fcanvas.offset().left,
			y: fcanvas.offset().top
		};
		mouse = {
			x: (e.pageX - canvasPosition.x)/v_scale_set[v_cur_img-1],
			y: (e.pageY - canvasPosition.y)/v_scale_set[v_cur_img-1]
		}
		if ((mouse.x<0) || (mouse.y<0)) {
			mouse = {
			x: px,
			y: py
			}
		}
		// --------------------------------------------------------------------------------------
		if (v_fdraw_rejim==1) {  // отрезок
			if (v_click_canvas) {
				x2 = Math.floor( mouse.x );
				y2 = Math.floor( mouse.y );
				v_obj_list[3][v_cur_obj] = x2 ; // конец отрезка - x
				v_obj_list[4][v_cur_obj] = y2 ; // конец отрезка - y
				// рисуем точку
				x.strokeRect( Math.floor( (x2-2) ), Math.floor( (y2-2) ), 4, 4 );
				clr_drw_rejim ();		//	конец режима - нажата последняя кнопка
				v_click_canvas=false;
				// определим длину отрезка
				v_lenF = gt_len_otr (v_obj_list[1][v_cur_obj],v_obj_list[2][v_cur_obj],v_obj_list[3][v_cur_obj],v_obj_list[4][v_cur_obj]);
				// вывод текста
				v_obj_list[5][v_cur_obj] = v_lenF.toFixed(2)+" см";
				x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
				sh_text( x, v_obj_list[5][v_cur_obj],
							v_obj_list[1][v_cur_obj]+10, 
							v_obj_list[2][v_cur_obj]+10, v_bgfill, v_fillStyle );
			} else {
				v_click_canvas=true;
				x0 = Math.floor( mouse.x  );
				y0 = Math.floor( mouse.y  );
				// рисуем точку
				x.strokeRect(x0-2,y0-2,4,4);
				v_cur_obj++;
				v_obj_list[0][v_cur_obj] = v_fdraw_rejim; // отрезок 
				v_obj_list[1][v_cur_obj] = x0 ; // начало - x
				v_obj_list[2][v_cur_obj] = y0 ; // начало - y
				v_obj_list[3][v_cur_obj] = x0 ; // конец отрезка - x
				v_obj_list[4][v_cur_obj] = y0 ; // конец отрезка - y
				// текст
				v_obj_list[5][v_cur_obj] = "" ;
				//
				v_obj_list[6][v_cur_obj] = -1 ; // конец отрезка 2 - x
				v_obj_list[7][v_cur_obj] = -1 ; // конец отрезка 2 - y
				//
				v_obj_list[8][v_cur_obj] = 1;	//	номер щелчка по порядку
				//
				v_obj_list[11][v_cur_obj] = v_cur_img;
			}
		} 
		// --------------------------------------------------------------------------------------
		else if (v_fdraw_rejim==3) { // перемещение
			if (v_click_canvas) {
				clr_drw_rejim ();		//	конец режима - нажата последняя кнопка
				v_click_canvas=false;
			} else {
				v_click_canvas=true;
			}
		}
		// --------------------------------------------------------------------------------------
		else if (v_fdraw_rejim==4) { // ТЕКСТ
			MyPromptText(MyTextAfterModal);
		}
		// --------------------------------------------------------------------------------------
		else if (v_fdraw_rejim==5) { // Стрелка с текстом
			if (v_click_canvas) {
				x2 = Math.floor( mouse.x );
				y2 = Math.floor( mouse.y );
				v_obj_list[3][v_cur_obj] = x2 ; // конец отрезка - x
				v_obj_list[4][v_cur_obj] = y2 ; // конец отрезка - y
				x.lineWidth = v_lineWidth;  // set the line width to 10 pixels			
				x.beginPath();
				x.strokeRect(v_obj_list[1][v_cur_obj]-2,v_obj_list[2][v_cur_obj]-2,4,4);
				canvas_arrow(x, v_obj_list[1][v_cur_obj], v_obj_list[2][v_cur_obj], v_obj_list[3][v_cur_obj], v_obj_list[4][v_cur_obj]);
				x.stroke();	
				
				MyPromptText(MyStrelaAfterModal);
				
			} else {
				v_click_canvas=true;
				x0 = Math.floor( mouse.x  );
				y0 = Math.floor( mouse.y  );
				// рисуем точку
				x.strokeRect(x0-2,y0-2,4,4);
				v_cur_obj++;
				v_obj_list[0][v_cur_obj] = v_fdraw_rejim; // Стрелка с текстом
				v_obj_list[1][v_cur_obj] = x0 ; // начало - x
				v_obj_list[2][v_cur_obj] = y0 ; // начало - y
				v_obj_list[3][v_cur_obj] = -1 ; // конец отрезка - x
				v_obj_list[4][v_cur_obj] = -1 ; // конец отрезка - y
				// текст
				v_obj_list[5][v_cur_obj] = "" ;
				//
				v_obj_list[6][v_cur_obj] = -1 ; // конец отрезка 2 - x
				v_obj_list[7][v_cur_obj] = -1 ; // конец отрезка 2 - y
				//
				v_obj_list[8][v_cur_obj] = 1;	//	номер щелчка по порядку
				//
				v_obj_list[11][v_cur_obj] = v_cur_img;
			}
		}
		// --------------------------------------------------------------------------------------
		else if (v_fdraw_rejim==6) {  // угол
			if (v_click_canvas) {
				x2 = Math.floor( mouse.x );
				y2 = Math.floor( mouse.y );
				//
				if (v_obj_list[8][v_cur_obj]==1) {
					v_obj_list[3][v_cur_obj] = x2 ; // конец отрезка - x
					v_obj_list[4][v_cur_obj] = y2 ; // конец отрезка - y
					// рисуем точку
					x.strokeRect( Math.floor( (x2-2) ), Math.floor( (y2-2) ), 4, 4 );
				} else if (v_obj_list[8][v_cur_obj]==2) {
					v_obj_list[6][v_cur_obj] = x2 ; // конец отрезка - x
					v_obj_list[7][v_cur_obj] = y2 ; // конец отрезка - y
					// рисуем точку
					x.strokeRect( Math.floor( (x2-2) ), Math.floor( (y2-2) ), 4, 4 );
				}
				v_obj_list[8][v_cur_obj] = v_obj_list[8][v_cur_obj] + 1 ;
				if (v_obj_list[8][v_cur_obj]==3) {
					// найдем длины отрезков
					var v_a_tmp = gt_len_otr(v_obj_list[1][v_cur_obj],v_obj_list[2][v_cur_obj],v_obj_list[3][v_cur_obj],v_obj_list[4][v_cur_obj]);
					var v_b_tmp = gt_len_otr(v_obj_list[3][v_cur_obj],v_obj_list[4][v_cur_obj],v_obj_list[6][v_cur_obj],v_obj_list[7][v_cur_obj]);
					var v_c_tmp = gt_len_otr(v_obj_list[1][v_cur_obj],v_obj_list[2][v_cur_obj],v_obj_list[6][v_cur_obj],v_obj_list[7][v_cur_obj]);
					// найдем угол между сторонами
					var v_tmp1 = v_c_tmp*v_c_tmp-v_a_tmp*v_a_tmp-v_b_tmp*v_b_tmp ;
					var v_tmp2 = (-2)*v_a_tmp*v_b_tmp;
					var c_ugol = radian_to_grad( Math.acos ( v_tmp1/v_tmp2 ) );
					// выведем текст
					v_obj_list[5][v_cur_obj] = c_ugol.toFixed(2);
					x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
					sh_text( x, v_obj_list[5][v_cur_obj],
							v_obj_list[1][v_cur_obj]+10, 
							v_obj_list[2][v_cur_obj]+10, v_bgfill, v_fillStyle );
					clr_drw_rejim ();	//	конец режима угол - нажата последняя кнопка					
					v_click_canvas=false;
				}
			} else {
				v_click_canvas=true;
				x0 = Math.floor( mouse.x  );
				y0 = Math.floor( mouse.y  );
				// рисуем точку
				x.strokeRect(x0-2,y0-2,4,4);
				v_cur_obj++;
				v_obj_list[0][v_cur_obj] = v_fdraw_rejim; // угол 
				v_obj_list[1][v_cur_obj] = x0 ; // начало - x
				v_obj_list[2][v_cur_obj] = y0 ; // начало - y
				v_obj_list[3][v_cur_obj] = -1 ; // конец отрезка - x
				v_obj_list[4][v_cur_obj] = -1 ; // конец отрезка - y
				// текст
				v_obj_list[5][v_cur_obj] = "" ;
				//
				v_obj_list[6][v_cur_obj] = -1 ; // конец отрезка 2 - x
				v_obj_list[7][v_cur_obj] = -1 ; // конец отрезка 2 - y
				//
				//
				v_obj_list[8][v_cur_obj] = 1;	//	номер щелчка по порядку
				//
				v_obj_list[11][v_cur_obj] = v_cur_img;
			}
		}
		// --------------------------------------------------------------------------------------
		else if ((v_fdraw_rejim==7) || (v_fdraw_rejim==8)) {	// многоугольник - площадь и вырезать
			x0 = Math.floor( mouse.x  );
			y0 = Math.floor( mouse.y  );
			// рисуем точку
			x.strokeRect(x0-2,y0-2,4,4);
			if (!v_click_canvas) {
				v_cur_obj++;
				v_obj_list[0][v_cur_obj] = v_fdraw_rejim; // режим 
				v_obj_list[1][v_cur_obj] = x0 ; // начало - x
				v_obj_list[2][v_cur_obj] = y0 ; // начало - y
				v_obj_list[3][v_cur_obj] = -1 ; // конец отрезка - x
				v_obj_list[4][v_cur_obj] = -1 ; // конец отрезка - y
				// текст
				v_obj_list[5][v_cur_obj] = "" ;
				//
				v_obj_list[6][v_cur_obj] = -1 ; // конец отрезка 2 - x
				v_obj_list[7][v_cur_obj] = -1 ; // конец отрезка 2 - y
				//
				v_obj_list[8][v_cur_obj] = 0;	//	номер щелчка по порядку
				//
				v_obj_list[11][v_cur_obj] = v_cur_img;
			}
			//
			v_obj_list[8][v_cur_obj] = v_obj_list[8][v_cur_obj] + 1;
			v_cur_nnn++;	//	кол-во отрезков в многоугольнике
			v_obj_manip_list[0][v_cur_nnn]	= v_fdraw_rejim; // режим
			v_obj_manip_list[1][v_cur_nnn]	= v_obj_list[8][v_cur_obj]; // номер снимка для которого определено "измерение"
			v_obj_manip_list[2][v_cur_nnn] 	= v_cur_obj ; 				// N измерения для снимка
			v_obj_manip_list[3][v_cur_nnn] 	= x0 ; // x
			v_obj_manip_list[4][v_cur_nnn] 	= y0 ; // y
			//
			v_click_canvas=true;
			var v_diff_x_tmp = Math.abs(v_obj_list[1][v_cur_obj]-x0);
			var v_diff_y_tmp = Math.abs(v_obj_list[2][v_cur_obj]-y0);
			var v_delta_tmp = 10;
			if ((v_diff_x_tmp<v_delta_tmp) && (v_diff_y_tmp<v_delta_tmp) && (v_obj_list[8][v_cur_obj]>1)) {	//	завершение операции
				v_obj_manip_list[3][v_cur_nnn] 	= v_obj_list[1][v_cur_obj] ; // x
				v_obj_manip_list[4][v_cur_nnn] 	= v_obj_list[2][v_cur_obj] ; // y
				v_obj_list[3][v_cur_obj] = v_obj_list[1][v_cur_obj] ; // конец отрезка - x
				v_obj_list[4][v_cur_obj] = v_obj_list[2][v_cur_obj] ; // конец отрезка - y
				repaint_all (0);	
				if (v_fdraw_rejim==7) {	//	площадь
					var lx=0;
					var ly=0;
					var f1=0;
					var v_cur_nn_tmp=0;
					var v_cur_max_tmp=0;
					for ( l=2; l<=v_cur_nnn; l++ ) {
						if ((v_obj_manip_list[0][l]==v_fdraw_rejim) && (v_obj_manip_list[2][l]==v_cur_obj) &&
							(v_obj_manip_list[0][l-1]==v_fdraw_rejim) && (v_obj_manip_list[2][l-1]==v_cur_obj)	) 
						{
							if (v_cur_nn_tmp==0) v_cur_nn_tmp=l;
							lx = Math.abs(v_obj_manip_list[3][l-1] - v_obj_manip_list[3][l]) * RescaleSlope[v_cur_img-1]*PixelSpacingX[v_cur_img-1]/v_koeff_img;
							ly = Math.abs(v_obj_manip_list[4][l-1] - v_obj_manip_list[4][l]) * RescaleSlope[v_cur_img-1]*PixelSpacingX[v_cur_img-1]/v_koeff_img;
							f1 = f1 + Math.sqrt(lx * lx + ly * ly);
							v_cur_max_tmp=l;
						}
					}
					lx = Math.abs(v_obj_manip_list[3][v_cur_max_tmp] - v_obj_list[1][v_cur_obj]) * RescaleSlope[v_cur_img-1];
					ly = Math.abs(v_obj_manip_list[4][v_cur_max_tmp] - v_obj_list[2][v_cur_obj]) * RescaleSlope[v_cur_img-1];
					f1 = f1 + Math.sqrt(lx * lx + ly * ly);
					v_lenF = f1  ;
					// вывод текста
					v_obj_list[5][v_cur_obj] = v_lenF.toFixed(2);
					x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
					sh_text( x, v_obj_list[5][v_cur_obj],
							v_obj_list[1][v_cur_obj]+10, 
							v_obj_list[2][v_cur_obj]+10, v_bgfill, v_fillStyle );
				} else if (v_fdraw_rejim==8) {	// вырезать
					
				}
				clr_drw_rejim ();	//	завершить операцию
				v_click_canvas=false;
			}
		}
		// --------------------------------------------------------------------------------------
		else if ( v_fdraw_rejim == 9 ) {	//	интенсивность
		}
	  // ---------------------------------------------------------------------------------------------			  
	    else if ( v_fdraw_rejim == 10 ) {	//	Отменить выбор режима
			clr_drw_rejim ();	//	завершить операцию
		}
		else if (v_fdraw_rejim==11) {  // круг
			if (v_click_canvas) {
				x2 = Math.floor( mouse.x );
				y2 = Math.floor( mouse.y );
				//
				v_obj_list[3][v_cur_obj] = x2 ; // конец отрезка - x
				v_obj_list[4][v_cur_obj] = y2 ; // конец отрезка - y
				// рисуем точку
				x.strokeRect( Math.floor( (x2-2) ), Math.floor( (y2-2) ), 4, 4 );
				// определим площадь, длину окружности
				var v_c_x_tmp = v_obj_list[1][v_cur_obj] + Math.floor( ( v_obj_list[3][v_cur_obj] - v_obj_list[1][v_cur_obj] ) / 2 ) ;
				var v_c_y_tmp = v_obj_list[2][v_cur_obj] + Math.floor( ( v_obj_list[4][v_cur_obj] - v_obj_list[2][v_cur_obj] ) / 2 ) ;
				var v_rad_tmp = ( Math.sqrt( ( v_c_x_tmp - v_obj_list[3][v_cur_obj] )*( v_c_x_tmp - v_obj_list[3][v_cur_obj] ) + 
				                                       ( v_c_y_tmp - v_obj_list[4][v_cur_obj] )*( v_c_y_tmp - v_obj_list[4][v_cur_obj] ) ) ) * RescaleSlope[v_cur_img-1];
				//
				var v_tmp = Math.PI*v_rad_tmp*v_rad_tmp ;
				v_obj_list[9][v_cur_obj]  = ""+v_tmp.toFixed(2);	//	1 строка - площадь
				var v_tmp = 2*Math.PI*v_rad_tmp ;
				v_obj_list[10][v_cur_obj] = ""+v_tmp.toFixed(2);	//	2 строка - длина окружности
				// вывести текст
				if (v_obj_list[9][v_cur_obj]!="") {
					sh_text( x, v_obj_list[9][v_cur_obj],
								v_obj_list[1][v_cur_obj], 
								v_obj_list[2][v_cur_obj]-15, v_bgfill, v_fillStyle );
				}				
				if (v_obj_list[10][v_cur_obj]!="") {
					sh_text( x, v_obj_list[10][v_cur_obj],
								v_obj_list[1][v_cur_obj], 
								v_obj_list[2][v_cur_obj], v_bgfill, v_fillStyle );
				}				
				if (v_obj_list[11][v_cur_obj]!="") {
					sh_text( x, v_obj_list[11][v_cur_obj],
								v_obj_list[1][v_cur_obj], 
								v_obj_list[2][v_cur_obj]+15, v_bgfill, v_fillStyle );
				}
				//
				v_click_canvas = false;
				clr_drw_rejim ();	//	завершить операцию
			} else {
				x0 = Math.floor( mouse.x  );
				y0 = Math.floor( mouse.y  );
				// рисуем точку
				x.strokeRect(x0-2,y0-2,4,4);
				//
				v_cur_obj++;
				v_obj_list[0][v_cur_obj] = v_fdraw_rejim; // круг 
				v_obj_list[1][v_cur_obj] = x0 ; // начало - x
				v_obj_list[2][v_cur_obj] = y0 ; // начало - y
				v_obj_list[3][v_cur_obj] = -1 ; // конец отрезка - x
				v_obj_list[4][v_cur_obj] = -1 ; // конец отрезка - y
				//
				v_obj_list[9][v_cur_obj]  = "";	//	1 строка - площадь
				v_obj_list[10][v_cur_obj] = "";	//	2 строка - длина окружности
				v_obj_list[11][v_cur_obj] = "";	//	3 строка - интенсивность ?
				//
				v_obj_list[11][v_cur_obj] = v_cur_img;
				//
				v_click_canvas = true;
			}
		}
	  // ---------------------------------------------------------------------------------------------	
		else
		{	// просто click
				v_cur_act_izmer=0;
				x1=x1/v_scale_set[v_cur_img-1];
				y1=y1/v_scale_set[v_cur_img-1];
				for ( iii=1; iii<=v_cur_obj; iii++	) {	
				    if (v_obj_list[11][iii] == v_cur_img) {
						var v_cur_rej = v_obj_list[0][iii];
						if (v_cur_rej==1) {	// отрезок
							if (!f_mychk_otm_otrezok (iii, x1, y1))
							{
								v_cur_act_izmer=iii;
								break; 
							} 
						} else if (v_cur_rej==4) {	// ТЕКСТ
							if (!f_mychk_otm_text (iii, x1, y1))
							{
								v_cur_act_izmer=iii;
								break; 
							} 
						} else if (v_cur_rej==5) {	// Стрелка с текстом
							if (!f_mychk_otm_strela (iii, x1, y1))
							{
								v_cur_act_izmer=iii; 
								break; 
							} 
						} else if (v_cur_rej==6) {	// угол
							if (!f_mychk_otm_ugol (iii, x1, y1))
							{
								v_cur_act_izmer=iii;
								break; 
							} 
						} else if (v_cur_rej==7) {	// многоугольник - площадь и вырезать
							if (!f_mychk_otm_mnogoug (iii, x1, y1))
							{
								v_cur_act_izmer=iii; 
								break; 
							} 
						} else if (v_cur_rej==11) {	// круг
							if (!f_mychk_otm_krug (iii, x1, y1))
							{
								v_cur_act_izmer=iii; 
								break;
							} 
						}
					}
				}
		}
}		

function drawmousemove(e,px,py) {  	
	if (!v_is_execute) {
		var v_is_repaint_tmp = true;
		try {
		  v_is_execute = true;	
			// вычисление положения (x, y) элемента Canvas DOM на странице
			fcanvas = $('#draw');
			canvasPosition = {
				x: fcanvas.offset().left,
				y: fcanvas.offset().top
			};
			mouse = {
				x: e.pageX - canvasPosition.x,
				y: e.pageY - canvasPosition.y
			}
			if ((mouse.x<0) || (mouse.y<0)) {
				mouse = {
				x: px - canvasPosition.x,
				y: py - canvasPosition.y
				}
			}
			x1 = Math.floor(mouse.x );
			y1 = Math.floor(mouse.y );
			canvas=document.getElementById("draw");
			x=canvas.getContext("2d");			
			x.lineWidth = v_lineWidth;  // set the line width to 10 pixels			
			x.strokeStyle = v_strokeStyle;  // set the line color to blue
			v_x1_corr = x1/v_scale_set[v_cur_img-1];
			v_y1_corr = y1/v_scale_set[v_cur_img-1]; 
			if (v_fdraw_rejim==1) {	// отрезок
			  // ---------------------------------------------------------------------------------------------
				if (v_click_canvas) {					
					v_obj_list[3][v_cur_obj] = v_x1_corr ; // конец отрезка - x
					v_obj_list[4][v_cur_obj] = v_y1_corr ; // конец отрезка - y
				} 
			  // ---------------------------------------------------------------------------------------------
			} else
			if (v_fdraw_rejim==5) {	// Стрелка с текстом
				if (v_click_canvas) {
					v_obj_list[3][v_cur_obj] = v_x1_corr ; // конец отрезка - x
					v_obj_list[4][v_cur_obj] = v_y1_corr ; // конец отрезка - y
				}
			  // ---------------------------------------------------------------------------------------------
			} else
			if (v_fdraw_rejim==6) {	// угол
			  	// вычисление положения (x, y) элемента Canvas DOM на странице
				if (v_click_canvas) {
					if (v_obj_list[8][v_cur_obj]==1) {
						v_obj_list[3][v_cur_obj] = v_x1_corr ; // конец отрезка - x
						v_obj_list[4][v_cur_obj] = v_y1_corr ; // конец отрезка - y
						// рисуем точку
						x.strokeRect( Math.floor( (x2-2) ), Math.floor( (y2-2) ), 4, 4 );
					} else if (v_obj_list[8][v_cur_obj]==2) {
						v_obj_list[6][v_cur_obj] = v_x1_corr ; // конец отрезка - x
						v_obj_list[7][v_cur_obj] = v_y1_corr ; // конец отрезка - y
						// рисуем точку
						x.strokeRect( Math.floor( (x2-2) ), Math.floor( (y2-2) ), 4, 4 );
					}
				}
			  // ---------------------------------------------------------------------------------------------
			} else
			if ((v_fdraw_rejim==7) || (v_fdraw_rejim==8) || (v_fdraw_rejim==11)) {	// многоугольник - площадь и вырезать и круг
				if (v_click_canvas) {					
					v_obj_list[3][v_cur_obj] = v_x1_corr ; // конец отрезка - x
					v_obj_list[4][v_cur_obj] = v_y1_corr ; // конец отрезка - y
				} 
			  // ---------------------------------------------------------------------------------------------
			} else
			if (v_fdraw_rejim==2) {	// лупа
				v_is_repaint_tmp = false; 
				var iMouseX = 1; 
				var iMouseY = 1;
				var v_border_tmp = 1;			 
				// loading source image
				image = new Image();
				image=document.getElementById('bigpicture');
				// creating canvas object
				canvas = document.getElementById('draw');
				ctx = canvas.getContext('2d');
				// ------------------------------------------------------------------------
				canvasOffset = $(canvas).offset();
				if (v_is_focus) {
					iMouseX = Math.floor( (v_focus_x - canvasOffset.left) );
					iMouseY = Math.floor( (v_focus_y - canvasOffset.top) );
				} else {				
					iMouseX = Math.floor( (e.pageX - canvasOffset.left) );
					iMouseY = Math.floor( (e.pageY - canvasOffset.top) );
				}
				//
				v_is_focus = false;
				//
				var v_x1_tmp = iMouseX-iZoomRadius/2;
				var v_y1_tmp = iMouseY-iZoomRadius/2; 			 
				var v_x2_tmp = iMouseX+iZoomRadius/2;
				var v_y2_tmp = iMouseY+iZoomRadius/2; 			 
				//	
				var v_drw_id_tmp = $("#draw") ;			
				var v_left_cnv_pos = draw.offsetLeft;                      
				var item_tmp = $('#lupabrd'); 
				var v_lft_tmp = v_x1_tmp+v_left_cnv_pos;                    
				var v_tp_tmp = v_y1_tmp+draw.offsetTop;
				if ( (v_lft_tmp>=(v_left_cnv_pos-iZoomRadius/2)) && 
				     (v_lft_tmp<=(v_drw_id_tmp.width()+v_left_cnv_pos-iZoomRadius/2)) && 
				     (v_tp_tmp>=(v_top_1_y-iZoomRadius/2))
				   ) {
					item_tmp.css("left",v_lft_tmp+"px");	
					item_tmp.css("top",v_tp_tmp+"px");	
					item_tmp.css("display","block");
					//
					ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
					// вывод рисунка
					ctx.drawImage(image, 
								  Math.floor( (0 - iMouseX * (iZoomPower - 1)) ), 
								  Math.floor( (0 - iMouseY * (iZoomPower - 1)) ), 
								  ctx.canvas.width * iZoomPower, 
								  ctx.canvas.height * iZoomPower
								 );
					// destination-atop — у предшествующего изображения отображается (поверх) только та часть, которая пересекается с новой фигурой.
					ctx.globalCompositeOperation = 'destination-atop';
					oGrd = ctx.createLinearGradient( v_x1_tmp, v_y1_tmp, v_x2_tmp, v_y2_tmp );
					// Добавляет стоп цвет объекту градиента
					oGrd.addColorStop(0.8, "rgba(0, 0, 0, 1.0)");
					ctx.fillStyle = oGrd;
					ctx.beginPath();
					ctx.fillRect( v_x1_tmp , 
						          v_y1_tmp,
						          iZoomRadius ,
						          iZoomRadius );
					ctx.closePath();	
					ctx.drawImage(image, 0, 0, ctx.canvas.width, ctx.canvas.height);  // draw source image
				}
			  // ---------------------------------------------------------------------------------------------
			} else
			if ( (v_fdraw_rejim==3) && (v_ismousedown==1) ) {	// перемещение
				myCmnMove (x,x1,y1);
			} else if ( v_fdraw_rejim == 9 ) {	//	интенсивность
				repaint_all (0);
				x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
				sh_text( x, "123",
							x1, 
							y1, v_bgfill, v_fillStyle );
			} else { // отметим текущий объект измерений и раскрасим его
				if ((v_ismousedown==1) && (v_cur_act_izmer>0)) {
					// x1, y1 - координаты точки мыши
					var v_delta_x_tmp = (x1 - v_pos_x_move); 
					var v_delta_y_tmp = (y1 - v_pos_y_move); 
					var v_cur_rej = v_obj_list[0][v_cur_act_izmer];
					v_x1_corr = x1/v_scale_set[v_cur_img-1];
					v_y1_corr = y1/v_scale_set[v_cur_img-1];
					if (v_cur_rej==1) {	// отрезок
						if (!f_mychk_otm_otrezok (iii, v_x1_corr, v_y1_corr))
						{
							v_obj_list[1][v_cur_act_izmer] = v_obj_list[1][v_cur_act_izmer] + v_delta_x_tmp; // начало - x
							v_obj_list[2][v_cur_act_izmer] = v_obj_list[2][v_cur_act_izmer] + v_delta_y_tmp; // начало - y
							v_obj_list[3][v_cur_act_izmer] = v_obj_list[3][v_cur_act_izmer] + v_delta_x_tmp; // конец отрезка - x
							v_obj_list[4][v_cur_act_izmer] = v_obj_list[4][v_cur_act_izmer] + v_delta_y_tmp; // конец отрезка - y
						}
					} else if (v_cur_rej==4) {	// ТЕКСТ
						if (!f_mychk_otm_text (iii, v_x1_corr, v_y1_corr))
						{
							v_obj_list[1][v_cur_act_izmer] = v_obj_list[1][v_cur_act_izmer] + v_delta_x_tmp; // начало - x
							v_obj_list[2][v_cur_act_izmer] = v_obj_list[2][v_cur_act_izmer] + v_delta_y_tmp; // начало - y
						}
					} else if (v_cur_rej==5) {	// Стрелка с текстом
						if (!f_mychk_otm_strela (iii, v_x1_corr, v_y1_corr))
						{
							v_obj_list[1][v_cur_act_izmer] = v_obj_list[1][v_cur_act_izmer] + v_delta_x_tmp; // начало - x
							v_obj_list[2][v_cur_act_izmer] = v_obj_list[2][v_cur_act_izmer] + v_delta_y_tmp; // начало - y
							v_obj_list[3][v_cur_act_izmer] = v_obj_list[3][v_cur_act_izmer] + v_delta_x_tmp; // конец отрезка - x
							v_obj_list[4][v_cur_act_izmer] = v_obj_list[4][v_cur_act_izmer] + v_delta_y_tmp; // конец отрезка - y
						}
					} else if (v_cur_rej==6) {	// угол
						if (!f_mychk_otm_ugol (iii, v_x1_corr, v_y1_corr))
						{
							v_obj_list[1][v_cur_act_izmer] = v_obj_list[1][v_cur_act_izmer] + v_delta_x_tmp; // начало - x
							v_obj_list[2][v_cur_act_izmer] = v_obj_list[2][v_cur_act_izmer] + v_delta_y_tmp; // начало - y
							v_obj_list[3][v_cur_act_izmer] = v_obj_list[3][v_cur_act_izmer] + v_delta_x_tmp; // конец отрезка - x
							v_obj_list[4][v_cur_act_izmer] = v_obj_list[4][v_cur_act_izmer] + v_delta_y_tmp; // конец отрезка - y
							v_obj_list[6][v_cur_act_izmer] = v_obj_list[6][v_cur_act_izmer] + v_delta_x_tmp; // конец отрезка - x
							v_obj_list[7][v_cur_act_izmer] = v_obj_list[7][v_cur_act_izmer] + v_delta_y_tmp; // конец отрезка - y
						}
					} else if (v_cur_rej==7) {	// многоугольник - площадь и вырезать
						if (!f_mychk_otm_mnogoug (iii, v_x1_corr, v_y1_corr))
						{
							v_obj_list[1][v_cur_act_izmer] = v_obj_list[1][v_cur_act_izmer] + v_delta_x_tmp; // начало - x
							v_obj_list[2][v_cur_act_izmer] = v_obj_list[2][v_cur_act_izmer] + v_delta_y_tmp; // начало - y
							v_obj_list[3][v_cur_act_izmer] = v_obj_list[3][v_cur_act_izmer] + v_delta_x_tmp; // конец отрезка - x
							v_obj_list[4][v_cur_act_izmer] = v_obj_list[4][v_cur_act_izmer] + v_delta_y_tmp; // конец отрезка - y
							for ( var j=1; j<=v_cur_nnn; j++ ) {
								if ( (v_obj_manip_list[0][j]==7) && (v_obj_manip_list[2][j]==v_cur_act_izmer) )		
							    {
							   		v_obj_manip_list[3][j] = v_obj_manip_list[3][j] + v_delta_x_tmp;
							   		v_obj_manip_list[4][j] = v_obj_manip_list[4][j] + v_delta_y_tmp;
							    }
						    }
						}
					} else if (v_cur_rej==11) {	// круг
						if (!f_mychk_otm_krug (iii, v_x1_corr, v_y1_corr))
						{
							v_obj_list[1][v_cur_act_izmer] = v_obj_list[1][v_cur_act_izmer] + v_delta_x_tmp; // начало - x
							v_obj_list[2][v_cur_act_izmer] = v_obj_list[2][v_cur_act_izmer] + v_delta_y_tmp; // начало - y
							v_obj_list[3][v_cur_act_izmer] = v_obj_list[3][v_cur_act_izmer] + v_delta_x_tmp; // конец отрезка - x
							v_obj_list[4][v_cur_act_izmer] = v_obj_list[4][v_cur_act_izmer] + v_delta_y_tmp; // конец отрезка - y
						}
					}
					v_pos_x_move=x1;
					v_pos_y_move=y1;
				} else 
				if (v_cur_act_izmer==0)
				{
					// x1, y1 - координаты точки мыши
					x1=x1/v_scale_set[v_cur_img-1];
					y1=y1/v_scale_set[v_cur_img-1];
					for ( iii=1; iii<=v_cur_obj; iii++	) {	
					    if (v_obj_list[11][iii] == v_cur_img) {
							var v_cur_rej = v_obj_list[0][iii];
							if (v_cur_rej==1) {	// отрезок
								if (!f_mychk_otm_otrezok (iii, x1, y1)) {	v_is_repaint_tmp = false;	break; 	}
							} else if (v_cur_rej==4) {	// ТЕКСТ
								if (!f_mychk_otm_text (iii, x1, y1)) {	v_is_repaint_tmp = false;	break; 	}
							} else if (v_cur_rej==5) {	// Стрелка с текстом
								if (!f_mychk_otm_strela (iii, x1, y1)) {	v_is_repaint_tmp = false;	break; 	}
							} else if (v_cur_rej==6) {	// угол
								if (!f_mychk_otm_ugol (iii, x1, y1)) {	v_is_repaint_tmp = false;	break;	}
							} else if (v_cur_rej==7) {	// многоугольник - площадь и вырезать
								if (!f_mychk_otm_mnogoug (iii, x1, y1)) {	v_is_repaint_tmp = false;	break; 	}
							} else if (v_cur_rej==11) {	// круг
								if (!f_mychk_otm_krug (iii, x1, y1)) {	v_is_repaint_tmp = false;	break; 	}
							}
						}
					}
				}
			}
			if (v_is_repaint_tmp) repaint_all (0);
			  // ---------------------------------------------------------------------------------------------			  
		} finally {
			v_is_execute = false;
		}
	}
 };
 
 function myCmnMove (x,x1,y1) {
 	//рисуем «фон»
	x.clearRect(0,0,canvas.width,canvas.height);
	x.strokeRect(0,0,canvas.width,canvas.height);
	img=document.getElementById('bigpicture');
	x.save();
	v_delta_x=x1-v_pos_x_move;
	v_delta_y=y1-v_pos_y_move;
	v_pos_x[v_cur_img-1] = v_pos_x[v_cur_img-1] + v_delta_x; 
	v_pos_y[v_cur_img-1] = v_pos_y[v_cur_img-1] + v_delta_y; 
	v_pos_x_move = x1 ;
	v_pos_y_move = y1 ;
	var v_xmy_tmp = v_pos_x[v_cur_img-1];
	var v_ymy_tmp = v_pos_y[v_cur_img-1];
	x.drawImage( img, 
		         fnull(v_xmy_tmp,0), 
		         fnull(v_ymy_tmp,0), 
		         canvas.width, 
		         canvas.height );    
	x.restore();	
	$('#draw').css('cursor', 'pointer');
	// "подвинем" все измерения
				f_move_all_izmer(v_delta_x,v_delta_y);
 }
 
    function gt_length_to_otrezok (p_x,p_y,v_x1_tmp,v_y1_tmp,v_x2_tmp,v_y2_tmp) {
    	var v_a_tmp = gt_len_otr(p_x,p_y,v_x1_tmp,v_y1_tmp);	//	a
		var v_c_tmp = gt_len_otr(p_x,p_y,v_x2_tmp,v_y2_tmp);	//	c
		var v_b_tmp = gt_len_otr(v_x1_tmp,v_y1_tmp,v_x2_tmp,v_y2_tmp);
		//
		var v_alpha_tmp = Math.acos( (v_a_tmp*v_a_tmp-v_b_tmp*v_b_tmp-v_c_tmp*v_c_tmp)/((-2)*v_b_tmp*v_c_tmp) );
		//
		var v_gamma_tmp = Math.acos( (v_c_tmp*v_c_tmp-v_b_tmp*v_b_tmp-v_a_tmp*v_a_tmp)/((-2)*v_b_tmp*v_a_tmp) );
		
		var v_ugol_a_tmp=radian_to_grad(v_alpha_tmp);
		var v_ugol_g_tmp=radian_to_grad(v_gamma_tmp);
		if (v_ugol_a_tmp>90) {
			var v_len_tmp=v_c_tmp;
		} else
		if (v_ugol_g_tmp>90) {
			var v_len_tmp=v_a_tmp;
		} else
		{
			var v_p_tmp = (v_a_tmp+v_c_tmp+v_b_tmp)/2;	//	полупериметр
			var v_len_tmp=(2/v_a_tmp)*Math.sqrt(v_p_tmp*(v_p_tmp-v_a_tmp)*(v_p_tmp-v_c_tmp)*(v_p_tmp-v_b_tmp));	//	высота треугольника
		}
		return v_len_tmp;    	
    }
   
    function f_mychk_otm_otrezok (p_cur_obj,p_x,p_y) {				
		
		var v_x1_tmp = v_obj_list[1][p_cur_obj];
		var v_x2_tmp = v_obj_list[3][p_cur_obj];
		var v_y1_tmp = v_obj_list[2][p_cur_obj];
		var v_y2_tmp = v_obj_list[4][p_cur_obj];
		//
		v_len_tmp = gt_length_to_otrezok(p_x,p_y,v_x1_tmp,v_y1_tmp,v_x2_tmp,v_y2_tmp);				
		if (v_len_tmp<v_otm_len_to_obj*v_scale_set[v_cur_img-1]) {
			// перерисуем отрезок другим цветом
			repaint_all (0);
			canvas=document.getElementById("draw");
			x=canvas.getContext("2d");			
			x.lineWidth = v_lineWidth;  // set the line width to 10 pixels			
			x.strokeStyle = v_color_otm;
			pnt_otrezok(p_cur_obj);
			return false;
		} else {
			return true;
		}
   }
   
   function f_mychk_otm_krug (p_cur_obj,p_x,p_y) {
   		var v_1 = v_obj_list[1][p_cur_obj];
   		var v_2 = v_obj_list[2][p_cur_obj];
   		var v_3 = v_obj_list[3][p_cur_obj];
   		var v_4 = v_obj_list[4][p_cur_obj];
		var v_c_x_tmp = v_1 + Math.floor( ( v_3 - v_1 ) / 2 ) ;
		var v_c_y_tmp = v_2 + Math.floor( ( v_4 - v_2 ) / 2 ) ;
		var v_rad_tmp = ( Math.sqrt( ( v_c_x_tmp - v_3 )*( v_c_x_tmp - v_3 ) + 
            ( v_c_y_tmp - v_4 )*( v_c_y_tmp - v_4 ) ) ) ;
		var v_ln_tmp = gt_len_otr(p_x,p_y,v_c_x_tmp,v_c_y_tmp);
		var v_1_tmp=PixelSpacingX[v_cur_img-1]*100;
		var v_2_tmp=v_koeff_img*100;
		var v_tmp = v_1_tmp/v_2_tmp;	
		var v_rad_tmp = v_rad_tmp*v_tmp;	
		if ( (v_ln_tmp<v_rad_tmp+v_otm_len_to_obj*v_scale_set[v_cur_img-1]) && (v_ln_tmp>v_rad_tmp-v_otm_len_to_obj*v_scale_set[v_cur_img-1]*2) ) {
			// перерисуем отрезок другим цветом
			repaint_all (0);
			canvas=document.getElementById("draw");
			x=canvas.getContext("2d");			
			x.lineWidth = v_lineWidth;  // set the line width to 10 pixels			
			x.strokeStyle = v_color_otm;
			pnt_krug(p_cur_obj);
			return false;
		} else {
			return true;
		}
   }
   
function setBorderLeftBtn (divId) {   
	$("#"+divId).css("border",v_css_border_check_button);
}