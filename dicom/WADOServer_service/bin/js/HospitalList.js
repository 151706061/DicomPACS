 $(document).ready(function(){
				
				document.getElementById("LpuListTree").innerHTML+="<div id=\"tree\"></div>";
				RefreshLpuListTree();								
				//InitTree();

							});
/*$(function ()
    {   
         //$('#serachStr').enterEvent({ functionName: 'searchFromTree' });
         //$("#searchCode").enterEvent({ functionName: 'searchFromTree' });
InitTree();
        //RefreshLpuListTree();
/*	$('#LpuListTree').bind("click",function () {
		var NodeId='';
		RefreshLpuListTree(NodeId);
		}); 
    });*/

function GetData(){
					var data =[
										{	
											"data":"РОССИЯ"
											,"attr":{"id": "4","rel": "directory","title":"РОССИЯ"}
											,"state":"closed"
											,"children" : 
															[
																{ 
																	"data":"Оборудование MG"
																	,"attr":{"id": "7","rel": "default","title":"Оборудование"}
																	,"state":""
																}
															] 
										}
								];	
						/*
						[
							 { 
								"data":"РОССИЯ (код оборудования - если есть)",
								"attr":{"id": "4","rel": "folder","title":"РОССИЯ"},
								"state":"closed"
							 }
						 ] , 
						 [
							{ 
								"data":"Оборудование MG",
								"attr":{"id": "7","rel": "default","title":"Оборудование"},
								"state":""
							}
						 ] */
	return data;
}
	
	
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


/*
	var fld1="115f121f115f100f98f97f";
	var fld2="109f97f115f116f101f114f107f101f121f";
	var prntid;
	if(id==null||id==''){
	prntid="0";
	}
	else{
	prntid=id;
	}
	
$("#LpuListTree").tree({
  data  : {
    type  : "json",
    json  : [ 
      { attributes: { id : "pjson_1" }, state: "open", data: "Root node 1", children : [
        { attributes: { id : "pjson_2" }, data: "Custom icon" },
        { attributes: { id : "pjson_3" }, data: "Child node 2" },
        { attributes: { id : "pjson_4" }, data: "Some other child node" }
      ]},       
	  { attributes: { id : "pjson_5" }, data: "Root node 2" } 
    ]
  }
});


					"themes":{
                    "theme": "apple",
                    "dots": true,
                    "icons": true
                } ,
                ui:{
				animation   : 5
                    //"select_limit": 1
                }//,
                //"plugins": pluginJstree 
				///});

				tree.init(container_node,{ 
					"json_data": { 
							//JSON.stringify({"data":"РОССИЯ","attr":[{"id":"4","rel":"folder","title":"РОССИЯ"}],"state":"closed"}),
                    "ajax": {
                        "url": "\LPUDATA", //'@Url.Action("GetTreeFactorsById", "ProphRegistry")',
                        "data": function (n)
                       {
						//var n=JSON.stringify({"data":"РОССИЯ","attr":[{"id":"4","rel":"folder","title":"РОССИЯ"}],"state":"closed"});
                            //var search = $("#FactorList" + "_Search").val();
                            return {
                                prntid: n.attr ? n.attr("id") : "",
                                //show_all: "true",
								fld1:fld1, 
								fld2:fld2 //, 
                                //search: search
                            };
                        }
                    }
                }  
				});

*/
/*
$("#LpuListTree")
            .jstree({ 
			"json_data": { 
							//JSON.stringify({"data":"РОССИЯ","attr":[{"id":"4","rel":"folder","title":"РОССИЯ"}],"state":"closed"}),
                    "ajax": {
                        "url": "\LPUDATA", //'@Url.Action("GetTreeFactorsById", "ProphRegistry")',
                        "data": function (n)
                       {
						//var n=JSON.stringify({"data":"РОССИЯ","attr":[{"id":"4","rel":"folder","title":"РОССИЯ"}],"state":"closed"});
                            //var search = $("#FactorList" + "_Search").val();
                            return {
                                prntid: n.attr ? n.attr("id") : "",
                                //show_all: "true",
								fld1:fld1, 
								fld2:fld2 //, 
                                //search: search
                            };
                        }
                    }
                }, 
                "themes":{
                    "theme": "apple",
                    "dots": true,
                    "icons": true
                },
                "ui":{
                    "select_limit": 1
                },
                "plugins": pluginJstree
            });
*/
/*
//$("#LpuListTree").empty();
    $("#LpuListTree").treeview({
        collapsed: true,	
		animated: 'slow',
        useCacheInLoad: true
    });*/


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

//=============Разбираем полученную строку на узлы дерева=================
//<span style='padding: 0 0 1px 1px; cursor: pointer;' value='933 ' class='parent'||"ending"><span style='font-weight: bold;'></span> НОВООБРАЗОВАНИЯ (C00-D48)</span>

//<span style='padding: 0 0 1px 1px; cursor: pointer;' value='{0}' class='{1}'><span style='font-weight: bold;'>{2}</span> {3}</span>	current.Oid, classAtr, current.Code, current.Name
//}
//{1}		  {0}	 {3}					{2}
//1		   <;>4   <;>РОССИЯ <;> 1	  <;>      			   <;>0				//---- ответ приходит от сервера
//amm_child<;>P_ID<;>FC_NAME<;>FN_TYPE<;>STUDIES_IMAGE_TYPE<;>FN_PARENTID	//---- поля соответствующие приходящиму ответу
//====================Добавление узла дерева===============
function gridaddrecord (frecord){
	var RemainderLine='';
	 var treeNode='';
	 var separator = '<;>';

	 stringToParse = frecord;
	 //{1}amm_child
	 positionSeparator = stringToParse.indexOf(separator);	//находим позицию разделителя
	 amm_child = stringToParse.substr(0,positionSeparator)=='1'?'parent':'ending';  //возвращаем строку от начала до номера разделителя  (отрезаем кусок)
	 //(сдвигаем строку)берем строку с позиции разделителя + длинна разделителя, берем число символом равное длинне строки
	 stringToParse = stringToParse.substr( positionSeparator + separator.length, stringToParse.length ); 
	 //{0}P_ID
	 positionSeparator = stringToParse.indexOf(separator);
	 P_ID = stringToParse.substr(0,positionSeparator);    
	 stringToParse = stringToParse.substr( positionSeparator + separator.length, stringToParse.length );
	 //{3}FC_NAME
	 positionSeparator = stringToParse.indexOf(separator);
	 FC_NAME = stringToParse.substr(0,positionSeparator);    
	 stringToParse = stringToParse.substr( positionSeparator + separator.length, stringToParse.length );
	 //пропустить FN_TYPE
	 positionSeparator = stringToParse.indexOf(separator);
	 FN_TYPE = stringToParse.substr(0,positionSeparator);    
	 stringToParse = stringToParse.substr( positionSeparator + separator.length, stringToParse.length );
	 //{2}STUDIES_IMAGE_TYPE
	 positionSeparator = stringToParse.indexOf(separator);
	 STUDIES_IMAGE_TYPE = stringToParse.substr(0,positionSeparator);    
	 stringToParse = stringToParse.substr( positionSeparator + separator.length, stringToParse.length );
	 //пропустить FN_PARENTID
	 positionSeparator = stringToParse.indexOf(separator);
	 FN_PARENTID = stringToParse.substr(0,positionSeparator);    
	 stringToParse = stringToParse.substr( positionSeparator + separator.length, stringToParse.length );

	  var parent = document.getElementById(FN_PARENTID); //получаем элемент по id родителя
	 if (parent==''||parent==null){
		// parent="#tree";
		 var branch = {
		 				"data":FC_NAME
						,"attr":{"id": P_ID,"rel": "directory","elt":1,"title":FC_NAME}
						,"state":"closed"
					};
			LoadElement(-1, branch);
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
        data: branch.data,
        attr: branch.attr,
        state: branch.state
    };
    var nod = $.jstree._reference('#tree').create_node(
        node, 'last', data, false, false
    );
    if (typeof branch.children === 'undefined') return false;
    for (var i=0; i<branch.children.length; i++) {
        LoadElement(nod, branch.children[i]);
    }
}
// -1 means root

 function InitTree(data){
	$("#tree").jstree({
						plugins: ['themes', 'json_data', "types"],
						json_data: {data: data},
						themes: {
									theme: "default",
									dots: true,
									url: "/css/jstree/themes/default/style.css"
								},
						checkbox: {
									real_checkboxes: true,
									two_state: true
									},
						"types":{
									"types":{
											   "disabled" : {
															   "check_node" : false,
															   "uncheck_node" : false
															} ,
												"directory" : {
																  "check_node" : false,
																 "uncheck_node" : false
															   }
											}
								}    
						});
}

 /*
 //treeNode=$("<span style='padding: 0 0 1px 1px; cursor: pointer;' id='"+P_ID+"' class='"+amm_child+"'><span style='font-weight: bold;'>"+STUDIES_IMAGE_TYPE+"</span>"+FC_NAME+"</span>").appendTo(parent);
 //Node=P_ID,amm_child
 
 //var a = {1:'один', 2:'два', 3:'три'};
//var jsonString = JSON.stringify(a);//преобразование в JSON
 
 //$("#LpuListTree").add(treeNode);
    // $("#LpuListTree").treeview({
    //   add:treeNode
    //});
	
	//$("#LpuListTree").jstree("create_node",parent,"first", {attr : {id: P_ID}, data: FC_NAME+" "+STUDIES_IMAGE_TYPE});
	//$("#LpuListTree").jstree("create",parent,"first","Enter a new name"); 
	//$.tree_reference('#LpuListTree').create({ data: FC_NAME+" "+STUDIES_IMAGE_TYPE },$('#'+P_ID));
	
	так дерево выглядит на странице
	<li id="4" class="jstree-last jstree-open" rel="directory" title="РОССИЯ">
		<ins class="jstree-icon"> </ins>
		<a href="#">
				<ins class="jstree-icon"> </ins>
				РОССИЯ
		</a>
			<ul style="">
				<li id="7" class="jstree-last jstree-leaf" rel="default" title="Оборудование">
					<ins class="jstree-icon"> </ins>
						<a href="#">
							<ins class="jstree-icon"> </ins>
							Оборудование MG
						</a>
				</li>
			</ul>
	</li>
//}

 //поиск по дереву 
    function searchFromTree()
    {   
        $("#LpuListTree").jstree("close_all");
        //вызываем метод поиска в плагине jstree и передаем текст для поиска на стороне клиента 
        $("#LpuListTree").jstree("search", $("#searchCode").val() + "," + $("#serachStr").val());
    }
function GetSelect_FactorList(){
            var selected;
            if ( $("#LpuListTree").jstree("get_selected").attr("rel") == "default")
            {
                selected =  $("#LpuListTree").jstree("get_selected").attr("title");  
                //@(Model.Callback)(selected);
            }         
             return false;
        }

    //запрос для вызова формы для добавления нового пункта в дерево
    //в качестве oidParent передаем oid выбраного элемента
    function addNewItem() {
        //проверка выбран ли элемент в дереве
        var parentOid = 0;
        if ($("#LpuListTree").jstree('get_selected').attr("id")) {
            parentOid = $("#LpuListTree").jstree('get_selected').attr("id");
        }

        $.post(
        //'@Url.Action("EditProffactor", "ProphRegistry")',
        { oidParent: parentOid },
        function (data) {
            $("#modalBox").html(data);
        });

    }
    //----------------------------------------------------------------------------
    //редактирование элемента дерева
    function editItem() {
        //проверка выбран ли элемент в дереве
        if (!$("#LpuListTree").jstree('get_selected').attr("id")) {

            alert("Выберите элемент дерева");
            return false;
        }

        $.post(
        //'@Url.Action("EditProffactor", "ProphRegistry")',
        { oid: $("#LpuListTree").jstree('get_selected').attr("id"), action: "edit" },
        function (data) {
            $("#modalBox").html(data);
        });

    }
    //------------------------------------------------------------------------------
    //удаление элемента дерева
    function deletItem() {
        //проверка выбран ли элемент в дереве
        if (!$("#LpuListTree").jstree('get_selected').attr("id")) {

            alert("Выберите элемент дерева!");
            return false;
        }

        $.post(
        //'@Url.Action("DeleteItem", "ProphRegistry")',
        { oid: $("#LpuListTree").jstree('get_selected').attr("id"), action: "edit" },
        function (data) {

              if (data.status == "1")
             {
                $("#LpuListTree").jstree('refresh').save_selected();
                $(".close-reveal-modal").click();
             }
             else
             {
                 alert(data.error);
             }
        });

    }
    //-------------------------------------------------------------------------------------
    //поиск элемента в дереве
    function SearchFactor() {
        $("#LpuListTree").jstree('refresh');
    }
    //----------------------------------------------------------------------------------------
    
    //добавления выбранному профактору назначеня
    function EditProfactorPresc()
    {
	
         //проверка выбран ли элемент в дереве
        if (!$("#LpuListTree").jstree('get_selected').attr("id")) {

            alert("Выберите элемент дерева");
            return false;
        }

        $.post(
        //'@Url.Action("EditProfactorPresc")',
        { oid: $("#LpuListTree").jstree('get_selected').attr("id"), action: "edit" },
        function (data) {
            $("#profactorPrescTab").html(data);
            $("#profactorPrescTab").show();
            $("#FactorsListWraper").hide();
            $(window).trigger("resize");
        });
        
    
    }   
	*/