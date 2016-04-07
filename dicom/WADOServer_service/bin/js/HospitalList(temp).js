$(document).ready(function(){
				
				document.getElementById("LpuListTree").innerHTML+="<div id=\"tree\"></div>";
				RefreshLpuListTree();
});

//================обновляем дерево. (id - id текущего узла)
function RefreshLpuListTree(id) {
    //unselectAnyLpuListTreeNode();
    var fld1="115f121f115f100f98f97f";
	var fld2="109f97f115f116f101f114f107f101f121f";
	var prntid;
	var data;
	if(id==null||id==''){
	prntid="0";
	}
	else{
	prntid=id;
	}
	$.ajax({
        type: "get",
        url: "\LPUDATA",
		data:{fld1:fld1, fld2:fld2, prntid:prntid},
        success: function (fdata) {
		 data=ParsingData(fdata);
		 InitTree(data);
        },
        error: function (errorThrown) {
            alert("При обращении к серверу произошла ошибка. Попробуйте перезагрузить страницу.");
        }
    });
}				

//=============== формирование временного массива из ответа сервера======
function ParsingData(fdata) {
 // очистка списка
 //$(".myrefr").remove();
 // заполнение новыми данными
 v_pos=0;
 v_cur_str = '';
 v_cur_grid_id=0;
 v_lftstr = fdata;
 v_rcr = '<|>';
 while (v_pos>=0) {
  v_pos=v_lftstr.indexOf(v_rcr);
  
  if (v_pos!=-1) { // найдено

   v_cur_str = v_lftstr.substr(0,v_pos);
   v_lftstr = v_lftstr.substr( v_pos+v_rcr.length, v_lftstr.length );
   gridaddrecord(v_cur_str);
   
  } else { // не найдено
   gridaddrecord(v_lftstr); // добавим остаток 
   break;      // и выйдем из цикла
  }
 }
 return v_lftstr;
}

function gridaddrecord (frecord){
	var RemainderLine='';
	 var treeNode='';
	 var separator = '<;>';

	 stringToParse = frecord;
	 //amm_child
	 positionSeparator = stringToParse.indexOf(separator);	//находим позицию разделителя
	 amm_child = stringToParse.substr(0,positionSeparator)=='1'?'parent':'ending';  //возвращаем строку от начала до номера разделителя  (отрезаем кусок)
	 //(сдвигаем строку)берем строку с позиции разделителя + длинна разделителя, берем число символом равное длинне строки
	 stringToParse = stringToParse.substr( positionSeparator + separator.length, stringToParse.length ); 
	 
	 //P_ID
	 positionSeparator = stringToParse.indexOf(separator);
	 P_ID = stringToParse.substr(0,positionSeparator);    
	 stringToParse = stringToParse.substr( positionSeparator + separator.length, stringToParse.length );
	 
	 //FC_NAME
	 positionSeparator = stringToParse.indexOf(separator);
	 FC_NAME = stringToParse.substr(0,positionSeparator);    
	 stringToParse = stringToParse.substr( positionSeparator + separator.length, stringToParse.length );
	 
	 //пропустить FN_TYPE
	 positionSeparator = stringToParse.indexOf(separator);
	 FN_TYPE = stringToParse.substr(0,positionSeparator);    
	 stringToParse = stringToParse.substr( positionSeparator + separator.length, stringToParse.length );
	 
	 //STUDIES_IMAGE_TYPE
	 positionSeparator = stringToParse.indexOf(separator);
	 STUDIES_IMAGE_TYPE = stringToParse.substr(0,positionSeparator);    
	 stringToParse = stringToParse.substr( positionSeparator + separator.length, stringToParse.length );
	 
	 //пропустить FN_PARENTID
	 positionSeparator = stringToParse.indexOf(separator);
	 FN_PARENTID = stringToParse.substr(0,positionSeparator);    
	 stringToParse = stringToParse.substr( positionSeparator + separator.length, stringToParse.length );

	  var parent = document.getElementById(FN_PARENTID); //получаем элемент по id родителя
	 if (parent==''||parent==null){
		 parent="#LpuListTree";
		}
	else{
				//1<;>4<;>РОССИЯ<;>1<;><;>0<|>0<;>10<;>Узбекистан<;>1<;><;>0
			var branch = {
			"data":"Folder 1",
			"attr":{"rel":"Layer","elt":1},
			"state":"closed",
			"children":[
							{
								"data":"Item 4",
								"attr":{"rel":"File 1","elt":2},
								"state":"",
								"children":null
							}
						]
				};
			LoadElement(-1, branch);
		 }
 }
 
  function LoadElement(node, branch) {
    data = {
        data: branch.name,
        attr: branch.attr,
        state: branch.state
    };
    var node = $.jstree._reference('#tree').create_node(
        node, 'last', data, false, false
    );
    if (typeof branch.children === 'undefined') return false;
    for (var i=0; i<branch.children.length; i++) {
        LoadElement(node, branch.children[i]);
    }
}