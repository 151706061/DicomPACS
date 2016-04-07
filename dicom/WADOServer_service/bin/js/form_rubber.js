function screenSize() {
    var w, h; // Объявляем переменные, w - длина, h - высота
    w = (window.innerWidth ? window.innerWidth : (document.documentElement.clientWidth ? document.documentElement.clientWidth : document.body.offsetWidth));
    h = (window.innerHeight ? window.innerHeight : (document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.offsetHeight));
    return {w:w, h:h};
}

function CMNcnhg_resize () {
	var v_tmp_w = screenSize().w;
	var v_tmp_h = screenSize().h;
	
	var v_new_h = v_tmp_h - 90 ;
	$('body').height( v_new_h );
	$('#myContainerLst').height( v_new_h );
	
	var myContainerLst = document.getElementById("myContainerLst");
	
	var myrowfff = document.getElementById("myrowfff");
	var myleftcolfff = document.getElementById("myleftcolfff");
	
	var v_cont_w = myContainerLst.style.width.replace("px","")-myleftcolfff.style.width.replace("px","")+5;
	
	$("#myLocLstMenu").css("width",v_cont_w+"px");
	$("#mytabrefr").css("width",v_cont_w+"px");

}


$(function() {
	CMNcnhg_resize();
	
	
	
	$("#gotomedo").click(function() {
		window.open('http://www.medotrade.ru');
	});
	
});
