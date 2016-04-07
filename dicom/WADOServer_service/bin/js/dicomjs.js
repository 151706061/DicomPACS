function remedotrade() {
	window.open('http://www.medotrade.ru');	
}

function concl_click () {
	selRowId = $('#concl_lst').jqGrid ('getGridParam', 'selrow');
	if ((!(selRowId>0)) && (true))
	  refr_concl();	
}

function gridconcladdrecord (frecord) 
{
	v_flr = '<;>';
	v_curfld = frecord;
	
	v_fpos=v_curfld.indexOf(v_flr);
	v_FK_ID = v_curfld.substr(0,v_fpos);				// FK_ID
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	
	v_fpos=v_curfld.indexOf(v_flr);
	v_FD_DATE = v_curfld.substr(0,v_fpos);			// FD_DATE
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	
	v_fpos=v_curfld.indexOf(v_flr);
	v_FK_USERID = v_curfld.substr(0,v_fpos);		// FK_USERID
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );

	v_fpos=v_curfld.indexOf(v_flr);
	v_FC_FAM = v_curfld.substr(0,v_fpos);	// FC_FAM
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );

	v_fpos=v_curfld.indexOf(v_flr);
	v_FC_IM = v_curfld.substr(0,v_fpos);				// FC_IM
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );

	// остаток - загоняем в FC_OTCH
	v_FC_OTCH = v_curfld;

	v_cur_grid_id++;

	v_arr_concl_FK_ID [v_cur_grid_id]		=	v_FK_ID;
	v_arr_concl_FD_DATE [v_cur_grid_id]		=	v_FD_DATE;
	v_arr_concl_FK_USERID [v_cur_grid_id]	=	v_FK_USERID;
	v_arr_concl_FC_FAM [v_cur_grid_id]		=	v_FC_FAM;
	v_arr_concl_FC_IM [v_cur_grid_id]		=	v_FC_IM;
	v_arr_concl_FC_OTCH [v_cur_grid_id]		=	v_FC_OTCH;
	
	mydata = [ 
		{ 
  		  FD_DATE:v_FD_DATE,
		  FName:v_FC_FAM+' '+v_FC_IM+' '+v_FC_OTCH }
		];
	jQuery("#concl_lst").jqGrid('addRowData',v_cur_grid_id,mydata[0]); 	
}

function del_concl() //Удалить заключение
{
    selRowId = $('#concl_lst').jqGrid ('getGridParam', 'selrow');
    celValue = v_arr_concl_FK_ID[selRowId];
	if (celValue>0) {
		var r=confirm("Удалить заключение ?");
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
				  alert('Ошибка получения данных с сервера '+err.statusText );
			  }
			});
		}
	} else {
		alert('Не выбрано заключение');
	}
}

function sav_concl() // Сохранить заключение
{
    selRowId = $('#concl_lst').jqGrid ('getGridParam', 'selrow');
    celValue = v_arr_concl_FK_ID[selRowId];
	if ((celValue>0)||(!v_is_edt_concl)) {
		var r=true;	//	confirm("Сохранить заключение ?");
		if (r)
		{
//			var v_text = jQuery(this).html($('#concltextarea').val()) ;
			var v_text = $('#concltextarea1').val();
			if (v_is_edt_concl) {
				v_ask_url = v_url+'SAVECONCLUSION?studyuid='+studyUID[v_cur_pos]+'&ui='+v_ui+'&id='+celValue;
			} else {
				v_ask_url = v_url+'SAVECONCLUSION?studyuid='+studyUID[v_cur_pos]+'&ui='+v_ui+'&id=-1';
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
				    $('#AddTerminalModal1_Close').click();
					$('#concltextarea').val( $('#concltextarea1').val() );
					// concl_click(); 
				    // alert('Заключение сохранено');
					refr_concl(); // обновить список заключений	
				  },
				  error: function(err) {
			//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
					  alert('Ошибка получения данных с сервера '+err.statusText );
				  }	
			});
			var v_is_ok = true;
		}
	} else {
		alert('Не выбрано заключение');
	}
}

function frm_conclfull(data) {
//	$("#concltextarea").text(data);
	$('#concltextarea').val(data);
}

function show_concl_full(rowid) {
	v_ask_url = v_url+"FULLCONCLUSION?ID="+v_arr_concl_FK_ID[rowid]+'&studyuid='+studyUID[v_cur_pos]+'&ui='+v_ui;
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
		  frm_conclfull(data);
	  },
	  error: function(err) {
//		  alert('readyState='+err.readyState+' status='+err.status+' statusText='+err.statusText );
		  alert('Ошибка получения данных с сервера '+err.statusText );
	  }
	});
	
}

function frm_searchconcl(fdata)	//	парсинг ответа от сервера со списком заключений
{	// очистка списка
	jQuery("#concl_lst").clearGridData(true);
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
			gridconcladdrecord(v_cur_str);
		} else {	// не найдено
			if ((v_lftstr!='') && (v_lftstr!='\r\n'))
				gridconcladdrecord(v_lftstr);	// добавим остаток 
			break;						// и выйдем из цикла
		}
	}
}

function refr_concl() // обновить список заключений
{
	v_ask_url = v_url+'CONCLUSIONS?studyuid='+studyUID[v_cur_pos]+'&ui='+v_ui;
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
		  alert('Ошибка получения данных с сервера '+err.statusText );
	  }
	});
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

function gt_len_otr (x1,y1,x2,y2) {
	v_xF   = Math.abs(x2 - x1)*PixelSpacingX[v_cur_img-1]/v_koeff_img;   // SCRX              
	v_yF   = Math.abs(y2 - y1)*PixelSpacingY[v_cur_img-1]/v_koeff_img;   // SCRY          
	return 	Math.sqrt(v_xF*v_xF + v_yF*v_yF) ;		
}

function LfRg () {	// Вертикальное зеркало
	v_fdraw_rejim=0;
	var cnvobj=document.getElementById("draw");
	var razmer=parseInt(cnvobj.height/2);
    var  ctx=cnvobj.getContext("2d");
    for (i=0;i<=razmer;i++)
    {
         imgd = ctx.getImageData(i,0, 1, cnvobj.height);
         imgd1 = ctx.getImageData((cnvobj.width-i),0, 1, cnvobj.height);
         ctx.putImageData(imgd, (cnvobj.width-i), 0);
         ctx.putImageData(imgd1, i, 0);
    }
}

function upDn () {	// Горизонтальное зеркало
	v_fdraw_rejim=0;
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

function set_scale() {
	v_fdraw_rejim=0;
	myCanvas=document.getElementById("draw");
	ctx = myCanvas.getContext("2d");
	//рисуем «фон»
	ctx.clearRect(0,0,canvas.width,canvas.height);
	ctx.strokeRect(0,0,canvas.width,canvas.height);
	img=document.getElementById('bigpicture');
	ctx.save();
	ctx.scale(v_scale_set, v_scale_set); //Уменьшение
	ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
	ctx.restore();	
}

function large () {
	v_scale_set += 0.01;
	set_scale();
}

function small () {
	v_scale_set -= 0.01;
	set_scale();
}

function rotateCMN(gragus) {	// Поворот 90 градусов по часовой стрелке
	v_cur_rotate_gr=v_cur_rotate_gr+gragus;
	if (v_cur_rotate_gr>=360) v_cur_rotate_gr=v_cur_rotate_gr-360; 
	if (v_cur_rotate_gr<0)   v_cur_rotate_gr=v_cur_rotate_gr+360; 
	if (v_cur_rotate_gr==0) {
		f_to_canvas ();
	} else {
		v_fdraw_rejim=0;
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
}

function rotatep() {	// Поворот 90 градусов по часовой стрелке
	rotateCMN(90);
}

function invert () {	// ИНВЕРСИЯ
	v_fdraw_rejim=0;
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

function getClientWidth()
{
  return document.compatMode=='CSS1Compat' && !window.opera?document.documentElement.clientWidth:document.body.clientWidth;
}
function getClientHeight()
{
  return document.compatMode=='CSS1Compat' && !window.opera?document.documentElement.clientHeight:document.body.clientHeight;
}

function f_to_canvas () {
	v_cur_rotate_gr = 0;	//	значение градусов поворота - текущее
	v_height_tmp = $(window).height()-150; //-320;  // screen.height   document.body.clientHeight
	$("#draw").attr("height", v_height_tmp+"px");
	//Ссылаемся на картинку
	img=document.getElementById('bigpicture');
	// размер выводим по первому снимку
	v_draw_width = ImgWidth[0];
	v_draw_height = ImgHeight[0];
	//
	v_koeff_img = v_height_tmp/v_draw_height;
	v_koeff_fnt = 1; // /v_koeff_img;
	$("#draw").attr("width", Math.floor(v_draw_width*v_koeff_img)+"px");
	//
	canvas=document.getElementById("draw");
	x=canvas.getContext("2d");
	// ширина и высота canvas
    v_width = $("#draw").attr("width");
    v_height = $("#draw").attr("height");
	// выведем аттрибуты DICOM на канве
	// подчистим канву
    x.clearRect(0, 0, canvas.width, canvas.height); // Очиста всего холста  
	x.strokeStyle = '#000'; // Цвет обводки
    x.lineWidth = 1; // Ширина линии
    x.fillStyle = '#000'; // Цвет заливки
	x.fillRect(0, 0, canvas.width, canvas.height);
	// вывод рисунка
	//	x.scale(v_koeff_img,v_koeff_img);
//	ctx.drawImage(image, 0, 0, x.canvas.width, x.canvas.height); 
	x.drawImage(img,0,0, x.canvas.width, x.canvas.height);
	//
	// для вывода текста
	if (v_show_label) {
		v_y1 = Math.floor(v_koeff_fnt*15) ;
		v_y2 = Math.floor(v_koeff_fnt*(15*2)) ;
		v_y3 = Math.floor(v_koeff_fnt*(15*3)) ;
		v_y4 = Math.floor(v_koeff_fnt*(15*4)) ;
		v_y5 = Math.floor(v_koeff_fnt*(15*5)) ;
		v_xf = Math.floor(v_koeff_fnt*5 );
		x.font = Math.floor(v_koeff_fnt*15)+"px "+v_font;
		x.fillStyle=v_text_fillStyle;
		x.fillText( p_ename[v_cur_pos-1], v_xf, v_y1);  
		x.fillText( patientid[v_cur_pos-1], v_xf, v_y2);  
		x.fillText( studyUID[v_cur_pos-1], v_xf, v_y3);  
		x.fillText('W: '+v_draw_width+' L: '+v_draw_height, v_xf, v_y4);  
		x.fillText('Z: '+v_koeff_fnt.toFixed(2), v_xf, v_y5);   
	}
	v_tmpf = $("#draw").attr("width");
	
/*----------------------------------------------------------------------------------------------*/	
//	$("#tabs").width(screen.width-30);
//	$("#tabs").height(screen.height-30);

/*	$("#tabs").width(window.width);
	$("#tabs").height(window.height);
	
	$("#tabs").css("min-width","532px;"); */
	
/*----------------------------------------------------------------------------------------------*/	
	
/*----------------------------------------------------------------------------------------------*/	
	$(".fscroll").width( v_tmpf );
	var v_width = 100*v_max_pos+15;
	$(".fscroll_child").width(v_width+"px");
	$("#tabs-2").height( canvas.height + "px" );
	
	var v_1_col = 150;
	var v_h_scrl = 118 ;
	// общий
	$("#cncl_cmn").width(v_1_col+"px");
	$("#cncl_cmn").height( canvas.height + "px" );
	
	// меню
	$("#cncl_lt").width(v_1_col+"px");
//	$("#cncl_lt").height( canvas.height + "px" );
	
	
	// грид
	$("#cncl_l").width(v_1_col+"px");
	$("#cncl_l").height( (canvas.height-$("#cncl_lt").height()) + "px" );
	
	$("#concl_lst").setGridWidth(v_1_col);
	$("#concl_lst").setGridHeight(canvas.height-60-$("#cncl_lt").height()+v_h_scrl-20);
	
	// правый
	var v_tmp_1 = canvas.width-v_1_col-14  ;  	 
	$("#cncl_r").width(v_tmp_1+"px");
	$("#cncl_r").height((canvas.height-14)+"px");
	$("#concltextarea").height(($("#cncl_r").height()+v_h_scrl-20)+"px");
	$("#concltextarea").width($("#cncl_r").width()+"px");
		
	$("#tabs").width(canvas.width);
	$("#tabs").height(canvas.height+v_h_scrl);
	
	$("#tabs").css("min-width","532px;");
	
/*----------------------------------------------------------------------------------------------*/	
}

function f_paintimg(p_id_img) {
    $("#bigpicture").attr("src", imgarr[p_id_img-1] );	
	f_to_canvas ();
}

function drwpictbyid(p_id) {
  $(".picture#"+p_id).css("border","1px solid red");
	if ( $(".picture#p"+p_id).attr("id") != v_cur_pos ) {
	  v_prev_pos = v_cur_pos;
	  v_cur_pos = $(".picture#p"+p_id).attr("id");
	  $(".picture#"+v_prev_pos).css("border","none");
	  f_paintimg(v_cur_pos);
	}	
}
function drawbox (p_id) {
	$(".picture#p"+p_id).css("border","1px solid red");
}
function clrbox(p_id) {
	$(".picture#p"+p_id).css("border","none");
}

function f_btnleft() {
	v_fdraw_rejim=0;
	if (v_cur_pos>1) {
	  clrbox(v_cur_pos);
	  if (v_cur_pos>1) {
		  v_cur_pos --;
		  drawbox(v_cur_pos);
		  f_paintimg(v_cur_pos);	  
	  }
	}
}

function f_btnright () {
	v_fdraw_rejim=0;
	v_max_pos=$(".fscroll_child div").size();
	v_max_pos_line=v_max_pos;
	if (v_cur_pos<v_max_pos) {
	  clrbox(v_cur_pos);
	  if (v_cur_pos<v_max_pos) {
		  v_cur_pos ++;
		  drawbox(v_cur_pos);
		  f_paintimg(v_cur_pos);	  
	  }
	}
}

// откроем окно поиска
function open_search () {
	$("#popupWINDOW1").css("visibility","visible");  
	$(".overlay").css("opacity","1");  
}

// рисуем линию
function drw_line() {
	v_fdraw_rejim = 1; // отрезок	
}
// лупа
function set_lupa() {
	v_fdraw_rejim = 2; // лупа	
}

function ShapeMove() {
	v_fdraw_rejim = 3; // перемещение
}

function ShapeText() {	// ТЕКСТ
	v_fdraw_rejim = 4;
}

function strelatext() {	//	Стрелка с текстом
	v_fdraw_rejim = 5;
}

function ugol() {	// УГОЛ
	v_fdraw_rejim = 6;
}

function mnogoug () {	// многоугольник - площадь
	v_fdraw_rejim = 7;
}

function fcut () {	// многоугольник - вырезать
	v_fdraw_rejim = 8;
}

function intencity () {	//	интенсивность
	v_fdraw_rejim = 9;
}

function fotmena () {	//	Отменить выбор режима
	v_fdraw_rejim = 10;
}

function repaint_all (p_nn) {
	f_to_canvas ();
	if (v_obj_list.length>0) {
		canvas=document.getElementById("draw");
		x=canvas.getContext("2d");			
		x.lineWidth = v_lineWidth;  // set the line width to 10 pixels			
		x.strokeStyle = v_strokeStyle;  // set the line color to blue
		for ( i=1; ((i<=v_cur_obj)&&(i<=p_nn)); i++	) {
			var v_cur_rej = v_obj_list[0][i];
			if (v_cur_rej==1) {	// отрезок
				x.strokeRect(v_obj_list[1][i]-2,v_obj_list[2][i]-2,4,4);
				x.strokeRect(v_obj_list[3][i]-2,v_obj_list[4][i]-2,4,4);
				x.beginPath();
				x.moveTo(v_obj_list[1][i],v_obj_list[2][i]);
				x.lineTo(v_obj_list[3][i],v_obj_list[4][i]);
				x.stroke();	
				if (v_obj_list[5][i]!="") {
					x.fillStyle = v_fillStyle;  // вывод текста
					x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
					x.fillText( v_obj_list[5][i], 
								v_obj_list[1][i]+10, 
								v_obj_list[2][i]+10 );
				}
			} else 
			if (v_cur_rej==2) {	// лупа
			} else 
			if (v_cur_rej==3) {	// перемещение
			} else 
			if (v_cur_rej==4) {	// ТЕКСТ
				if (v_obj_list[5][i]!="") {
					x.fillStyle = v_fillStyle;  // вывод текста
					x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
					x.fillText( v_obj_list[5][i], 
								v_obj_list[1][i], 
								v_obj_list[2][i] );
				}
			} else 
			if (v_cur_rej==5) {	// Стрелка с текстом
				x.strokeRect(v_obj_list[1][i]-2,v_obj_list[2][i]-2,4,4);
				x.beginPath();
				canvas_arrow(x, v_obj_list[1][i], v_obj_list[2][i], v_obj_list[3][i], v_obj_list[4][i]);
				x.stroke();	
				if (v_obj_list[5][i]!="") {
					x.fillStyle = v_fillStyle;  // вывод текста
					x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
					x.fillText( v_obj_list[5][i], 
								v_obj_list[1][i]+10, 
								v_obj_list[2][i]+10 );
				}	
			} else 
			if (v_cur_rej==6) {	// угол
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
					x.fillStyle = v_fillStyle;  // вывод текста
				//	x.strokeStyle = "#F00";
					x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
					x.fillText( v_obj_list[5][i], 
								v_obj_list[3][i]+10, 
								v_obj_list[4][i]+10 );
				}	
			} else
			if ((v_cur_rej==7) || (v_cur_rej==8)) {	// многоугольник - площадь и вырезать
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
					if ((v_obj_manip_list[0][j]==v_cur_rej) && (v_obj_manip_list[2][j]==i) &&
						(v_obj_manip_list[0][j-1]==v_cur_rej) && (v_obj_manip_list[2][j-1]==i)					
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
			}
		}
	}
}

function gridaddrecord (frecord) {
	v_flr = '<;>';
	v_curfld = frecord;
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

	v_fpos=v_curfld.indexOf(v_flr);
	v_StudyUID = v_curfld.substr(0,v_fpos);			// StudyDate
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );

	v_fpos=v_curfld.indexOf(v_flr);
	v_Description = v_curfld.substr(0,v_fpos);		// Description
	v_curfld = v_curfld.substr( v_fpos+v_flr.length, v_curfld.length );
	
	// остаток - загоняем в описание
	v_Description = v_curfld;
	
	v_cur_grid_id++;
	mydata = [ 
		{ id:v_cur_grid_id,
		  PatientID:v_P_PID,
		  Name:v_P_ENAME,
		  DateBorn:v_P_DATEBORN, 
		  AccessionNumber:v_ACCESSIONNUMBER, 
		  Mod:v_Mod, 
		  Description:v_Description, 
		  STUDYUID:v_StudyUID,
		  StudyDate:v_StudyDate }
		];
	if (v_ACCESSIONNUMBER!='')	
		jQuery("#mylist").jqGrid('addRowData',v_cur_grid_id,mydata[0]); 	
	
}

// формирование временногог массива из ответа сервера
function frm_searcharr(fdata) {
	// очистка списка
	jQuery("#mylist").clearGridData(true);
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
}

function f_cb_res (p_cb_id) {
	if ($("#m"+p_cb_id).is(':checked')) {
		return p_cb_id+'=1&';
	} else {
		return p_cb_id+'=0&';
	}
}

function AskData() {

	v_patientid1 = $("#patientid1").val();
	v_patientname1 = $("#patientname1").val();
	v_accessionnumber1 = $("#accessionnumber1").val();
	v_f_date1 = $("#f_date1").val();
	v_f_date2 = $("#f_date2").val();
	//
	v_ask_url = v_url+'STUDIES?';
	//
	v_studyuid = $("#fstudyuid").val();
	if (v_studyuid!='')
		v_ask_url = v_ask_url+'studyuid='+v_studyuid+'&';
	v_description = $("#fdescription").val();
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
	// modality	
	v_ask_url = v_ask_url+f_cb_res("CR"); 
	v_ask_url = v_ask_url+f_cb_res("DX");
	v_ask_url = v_ask_url+f_cb_res("IO");
	v_ask_url = v_ask_url+f_cb_res("MR");
	v_ask_url = v_ask_url+f_cb_res("OT");
	v_ask_url = v_ask_url+f_cb_res("RF");
	v_ask_url = v_ask_url+f_cb_res("SC");
	v_ask_url = v_ask_url+f_cb_res("XA");
	v_ask_url = v_ask_url+f_cb_res("CT");
	v_ask_url = v_ask_url+f_cb_res("ES"); 
	v_ask_url = v_ask_url+f_cb_res("MG");
	v_ask_url = v_ask_url+f_cb_res("NM"); 
	v_ask_url = v_ask_url+f_cb_res("PX");
	v_ask_url = v_ask_url+f_cb_res("RG");
	v_ask_url = v_ask_url+f_cb_res("US");
	v_ask_url = v_ask_url+f_cb_res("XC");
	v_ask_url = v_ask_url+f_cb_res("SR");
	v_ask_url = v_ask_url+f_cb_res("ECG");
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
		  alert('Ошибка получения данных с сервера '+err.statusText );
	  }
	});
}

function fgetdata() {	
    selRowId = $('#mylist').jqGrid ('getGridParam', 'selrow'),
    celValue = $('#mylist').jqGrid ('getCell', selRowId, 'STUDYUID');
	// REDIRECT
	if (celValue!='') {
		
		if ((v_up!='') && (v_un!=''))
		{
			window.location.href = v_url+"IMAGES?STUDYUID="+celValue+'&fld1='+v_un+'&fld2='+v_up ;
		} else {
			window.location.href = v_url+"IMAGES?STUDYUID="+celValue ;
		}
	} else {
		alert('Не выбрано значение UID исследования');
	}
}

$(document).ready(function() {
	$("#bigpicture").attr("src", imgarr[0] );	
	// инициализация
	drawbox(v_cur_pos);
	f_paintimg(v_cur_pos);
		
	$("#tabs").tabs();

		
	if (v_username=='') {
		//$("#tabs").tabs("remove",2);
		// $("#tabs").children().css("display","none");
		$('#tabs').tabs({ disabled: [1] });
		$("#tab_2_head").css("display","none");
		$("#ui-id-1").text("");
	} else {
//		$("#tabs").tabs();
		$(".ui-tabs-panel").css("padding","");
	}
	
	//	если нажата закладка заключения и список заключений пуст - обновим список 
	//  первый раз заполним список - потом - обновление по кнопке
	$("#ui-id-2").click(function()   {	
		concl_click();
	});
	
	$(window).resize(function() {
		drawbox(v_cur_pos);
		f_paintimg(v_cur_pos);
	});
	
	
	$(document).ajaxError(function(e, jqxhr, settings, exception) {  
	  if (jqxhr.readyState == 0 || jqxhr.status == 0) {  
		return; //Skip this error  
	  }  
	});
	
	jQuery("#concl_lst").jqGrid({ 
		datatype: "local", 
		height: 100,
		width : 200, 
		colNames:[ 'Дата','Врач'],
		 colModel:[
			{name:'FD_DATE',index:'FD_DATE', width:60}, 
			{name:'FName',index:'FName', width:130}		
			 ],
		viewrecords: true,
		gridview: true,
		multiselect: false,
		caption: "Заключения" ,
		hidegrid: false,
		shrinkToFit:false,
		onSelectRow: function(rowid,status,e){ 
			show_concl_full(rowid);		
			},

		}); 
		
	jQuery("#mylist").jqGrid({ 
		datatype: "local", 
		height: 325,
		width : 600, 
		colNames:[ '№ медкарты','Пациент','Дата Рожд', '№ исследования', 'Модальность','Описание','Дата иссл', 'UID исследования'],
		 colModel:[
			{name:'PatientID',index:'PatientID', width:100}, 
			{name:'Name',index:'name', width:200}, 
			{name:'DateBorn',index:'DateBorn', width:60, sorttype:"date"}, 
			{name:'AccessionNumber',index:'AccessionNumber', width:300}, 
			{name:'Mod',index:'Mod', width:50}, 
			{name:'Description',index:'Description', width:300}, 
			{name:'StudyDate',index:'StudyDate', width:120, sorttype:"date"},
			{name:'STUDYUID',index:'STUDYUID', width:300}			
			 ],
		viewrecords: true,
		gridview: true,
		multiselect: false, 
		caption: "Исследования" ,
		hidegrid: false,
		shrinkToFit:false
		}); 
		
   $(".picture").click(function()   {
	 clrbox(v_cur_pos);
	 v_cur_img = $(this).attr("id").substring(1);
	 drawbox(v_cur_img);
	 f_paintimg(v_cur_img);
	 v_cur_pos = v_cur_img ;
   });
	// кнопки
   $("#btnleft").click(function()   {
	f_btnleft();
  });
   $("#btnright").click(function()   {
	f_btnright ();
  });
   canvas = document.getElementById("draw");
   $("#draw").click(function(e){
//	canvas = document.getElementById("draw");
//	canvas.addEventListener("mousemove",function(e){
		canvas=document.getElementById("draw");
		x=canvas.getContext("2d");			
		x.lineWidth = v_lineWidth;  // set the line width to 10 pixels			
		x.strokeStyle = v_strokeStyle;  // set the line color to blue
		// get coord
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
		// --------------------------------------------------------------------------------------
		if (v_fdraw_rejim==1) {  // отрезок
			if (v_click_canvas) {
				x2 = Math.floor( mouse.x );
				y2 = Math.floor( mouse.y );
				v_obj_list[3][v_cur_obj] = x2 ; // конец отрезка - x
				v_obj_list[4][v_cur_obj] = y2 ; // конец отрезка - y
				// рисуем точку
				x.strokeRect( Math.floor( (x2-2) ), Math.floor( (y2-2) ), 4, 4 );
				v_fdraw_rejim=0;		//	конец режима - нажата последняя кнопка
				v_click_canvas=false;
				// определим длину отрезка
				v_lenF = gt_len_otr (v_obj_list[1][v_cur_obj],v_obj_list[2][v_cur_obj],v_obj_list[3][v_cur_obj],v_obj_list[4][v_cur_obj]);
				// вывод текста
				v_obj_list[5][v_cur_obj] = v_lenF.toFixed(2)+" см";
				x.fillStyle = v_fillStyle;
				x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
				x.fillText( v_obj_list[5][v_cur_obj], 
							v_obj_list[1][v_cur_obj]+10, 
							v_obj_list[2][v_cur_obj]+10 );
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
			}
		} 
		// --------------------------------------------------------------------------------------
		else if (v_fdraw_rejim==4) { // ТЕКСТ
			var name=prompt("Введите Текст","");
			// нарисуем текст
			if ( (name!=null) && (name!="") ) {
				x.fillStyle = v_fillStyle;
				x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
				x0 = Math.floor( mouse.x  );
				y0 = Math.floor( mouse.y  );
				v_cur_obj++;
				v_obj_list[0][v_cur_obj] = v_fdraw_rejim;  // ТЕКСТ
				v_obj_list[1][v_cur_obj] = x0 ; // начало - x
				v_obj_list[2][v_cur_obj] = y0 ; // начало - y
				x.fillText( name,	x0,	y0 );
				v_obj_list[5][v_cur_obj] = name ;
				v_obj_list[8][v_cur_obj] = 1;	//	номер щелчка по порядку
			}		
			v_fdraw_rejim=0;
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
				x.strokeRect(v_obj_list[1][i]-2,v_obj_list[2][i]-2,4,4);
				canvas_arrow(x, v_obj_list[1][v_cur_obj], v_obj_list[2][v_cur_obj], v_obj_list[3][v_cur_obj], v_obj_list[4][v_cur_obj]);
				x.stroke();	
				var name=prompt("Введите Текст","");
				// нарисуем текст
				if (name!=null && name!="") {
					x.fillStyle = v_fillStyle;
					x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
					x.fillText( name,	v_obj_list[1][v_cur_obj]+10, 	v_obj_list[2][v_cur_obj]+10 );
					v_obj_list[5][v_cur_obj] = name ;
				}
				v_fdraw_rejim=0;		//	конец режима - нажата последняя кнопка
				v_click_canvas=false;
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
					x.fillStyle = v_fillStyle;
					x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
					x.fillText( v_obj_list[5][v_cur_obj], 
								v_obj_list[3][v_cur_obj]+10, 
								v_obj_list[4][v_cur_obj]+10 );
					v_fdraw_rejim=0;	//	конец режима угол - нажата последняя кнопка					
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
				repaint_all (v_cur_obj);	
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
					x.fillStyle = v_fillStyle;
					x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
					x.fillText( v_obj_list[5][v_cur_obj], 
								v_obj_list[1][v_cur_obj]+10, 
								v_obj_list[2][v_cur_obj]+10 );
				} else if (v_fdraw_rejim==8) {	// вырезать
					
				}
				v_fdraw_rejim=0;	//	завершить операцию
				v_click_canvas=false;
			}
		}
		// --------------------------------------------------------------------------------------
		else if ( v_fdraw_rejim == 9 ) {	//	интенсивность
		}
	  // ---------------------------------------------------------------------------------------------			  
	    else if ( v_fdraw_rejim = 10 ) {	//	Отменить выбор режима
			v_fdraw_rejim=0;	//	завершить операцию
		}
	  // ---------------------------------------------------------------------------------------------	
		else
		{	// просто click
			v_cur_img_form = 1 ;			
			$("#mn_box").css("border", "2px solid red");			
		}
 });
  $("#draw").mousedown(function(e){	// нажатие мыши
    if (v_fdraw_rejim==3) {
		v_ismousedown = 1;
		
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
	if (v_fdraw_rejim==3) {	
		v_ismousedown = 0;
		$('#draw').css('cursor', 'default');
	}
  });
  $("#draw").mousemove(function(e){
	if (!v_is_execute) {
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
			x1 = Math.floor(mouse.x );
			y1 = Math.floor(mouse.y );
			canvas=document.getElementById("draw");
			x=canvas.getContext("2d");			
			x.lineWidth = v_lineWidth;  // set the line width to 10 pixels			
			x.strokeStyle = v_strokeStyle;  // set the line color to blue
			if (v_fdraw_rejim==1) {	// отрезок
			  // ---------------------------------------------------------------------------------------------
				if (v_click_canvas) {					
					v_obj_list[3][v_cur_obj] = x1 ; // конец отрезка - x
					v_obj_list[4][v_cur_obj] = y1 ; // конец отрезка - y
					repaint_all (v_cur_obj);
				} 
			  // ---------------------------------------------------------------------------------------------
			} else
			if (v_fdraw_rejim==5) {	// Стрелка с текстом
				if (v_click_canvas) {
					// вычисление положения (x, y) элемента Canvas DOM на странице
					v_obj_list[3][v_cur_obj] = x1 ; // конец отрезка - x
					v_obj_list[4][v_cur_obj] = y1 ; // конец отрезка - y
					repaint_all (v_cur_obj);
				}
			  // ---------------------------------------------------------------------------------------------
			} else
			if (v_fdraw_rejim==6) {	// угол
			  	// вычисление положения (x, y) элемента Canvas DOM на странице
				if (v_click_canvas) {
					if (v_obj_list[8][v_cur_obj]==1) {
						v_obj_list[3][v_cur_obj] = x1 ; // конец отрезка - x
						v_obj_list[4][v_cur_obj] = y1 ; // конец отрезка - y
						// рисуем точку
						x.strokeRect( Math.floor( (x2-2) ), Math.floor( (y2-2) ), 4, 4 );
					} else if (v_obj_list[8][v_cur_obj]==2) {
						v_obj_list[6][v_cur_obj] = x1 ; // конец отрезка - x
						v_obj_list[7][v_cur_obj] = y1 ; // конец отрезка - y
						// рисуем точку
						x.strokeRect( Math.floor( (x2-2) ), Math.floor( (y2-2) ), 4, 4 );
					}
					//
					repaint_all (v_cur_obj);	
				}
			  // ---------------------------------------------------------------------------------------------
			} else
			if ((v_fdraw_rejim==7) || (v_fdraw_rejim==8)) {	// многоугольник - площадь и вырезать
				if (v_click_canvas) {					
					v_obj_list[3][v_cur_obj] = x1 ; // конец отрезка - x
					v_obj_list[4][v_cur_obj] = y1 ; // конец отрезка - y
					repaint_all (v_cur_obj);
				} 
			  // ---------------------------------------------------------------------------------------------
			} else
			if (v_fdraw_rejim==2) {	// лупа
				var iMouseX = 1; 
				var iMouseY = 1;
				iZoomRadius = 100;
				iZoomPower = 2;
				// loading source image
				image = new Image();
				image=document.getElementById('bigpicture');
				// creating canvas object
				canvas = document.getElementById('draw');
				ctx = canvas.getContext('2d');
				canvasOffset = $(canvas).offset();
				iMouseX = Math.floor( (e.pageX - canvasOffset.left) );
				iMouseY = Math.floor( (e.pageY - canvasOffset.top) );
				ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
				// вывод рисунка
				ctx.drawImage(image, 
							  Math.floor( (0 - iMouseX * (iZoomPower - 1)) ), 
							  Math.floor( (0 - iMouseY * (iZoomPower - 1)) ), 
							  ctx.canvas.width * iZoomPower, 
							  ctx.canvas.height * iZoomPower
							 );
				ctx.globalCompositeOperation = 'destination-atop';
				oGrd = ctx.createRadialGradient(iMouseX, iMouseY, 0, iMouseX, iMouseY, iZoomRadius);
				oGrd.addColorStop(0.8, "rgba(0, 0, 0, 1.0)");
			//	oGrd.addColorStop(1.0, "rgba(0, 0, 0, 0.1)");
				ctx.fillStyle = oGrd;
				ctx.beginPath();
				ctx.arc(iMouseX, iMouseY, iZoomRadius, 0, Math.PI*2, true);
				ctx.closePath();
				ctx.fill();
				ctx.drawImage(image, 0, 0, ctx.canvas.width, ctx.canvas.height);  // draw source image
			  // ---------------------------------------------------------------------------------------------
			} else
			if (v_fdraw_rejim==3) {	// перемещение
			  	if (v_ismousedown==1) {
					//рисуем «фон»
					x.clearRect(0,0,canvas.width,canvas.height);
					x.strokeRect(0,0,canvas.width,canvas.height);
					img=document.getElementById('bigpicture');
					x.save();
					v_pos_x = v_pos_x + (x1-v_pos_x_move); // *v_koeff_img; // x1 - canvasPosition.x ;
					v_pos_y = v_pos_y + (y1-v_pos_y_move); // *v_koeff_img; // y1 - canvasPosition.y ;
					v_pos_x_move = x1 ;
					v_pos_y_move = y1 ;
					// ctx.translate(v_pos_x, v_pos_y);
					x.drawImage(img, v_pos_x, v_pos_y, canvas.width, canvas.height );  //  
					x.restore();	
					$('#draw').css('cursor', 'pointer');
				}
			  // ---------------------------------------------------------------------------------------------			  
			} else if ( v_fdraw_rejim == 9 ) {	//	интенсивность
				repaint_all (v_cur_obj);
				x.fillStyle = v_fillStyle;
				x.font = Math.floor(15 * v_koeff_fnt)+"px "+v_font;
				x.fillText( "123", 
							x1, 
							y1 );
			}
			  // ---------------------------------------------------------------------------------------------			  
		} finally {
			v_is_execute = false;
		}
	}
 });
	  
});
