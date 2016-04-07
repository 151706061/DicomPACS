$(function () {
    RefreshLpuListTree();
/*	$('#LpuListTree').bind("click",function () {
		var NodeId='';
		RefreshLpuListTree(NodeId);
		}); */
    });
	
//================обновляем дерево. (id - id текущего узла)
function RefreshLpuListTree(id) {
    //unselectAnyLpuListTreeNode();
    var fld1="115f121f115f100f98f97f";
	var fld2="109f97f115f116f101f114f107f101f121f";
	var prntid;
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
         InitTree();
		 ParsingData(fdata);
        },
        error: function (errorThrown) {
            alert("При обращении к серверу произошла ошибка. Попробуйте перезагрузить страницу.");
        }
    });
	

}
function InitTree(){
//$("#LpuListTree").empty();
    $("#LpuListTree").treeview({
        collapsed: true,	
		animated: 'slow',
        useCacheInLoad: true
    });
}

//=============== формирование временного массива из ответа сервера======
function ParsingData(fdata) {
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
//1		   <;>4   <;>РОССИЯ <;> 1	  <;>      			   <;>0
//amm_child<;>P_ID<;>FC_NAME<;>FN_TYPE<;>STUDIES_IMAGE_TYPE<;>FN_PARENTID
//====================Добавление узла дерева===============
function gridaddrecord (frecord) {
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

  var parent = document.getElementById(P_ID);
  //alert(parent);
 if (parent==''||parent==null){
 parent="#LpuListTree";
  //alert(parent);
 }
 treeNode=$("<span style='padding: 0 0 1px 1px; cursor: pointer;' id='"+P_ID+"' class='"+amm_child+"'><span style='font-weight: bold;'>"+STUDIES_IMAGE_TYPE+"</span>"+FC_NAME+"</span>").appendTo(parent);
 
 //$("#LpuListTree").add(treeNode);
     $("#LpuListTree").treeview({
        add:treeNode
    });
}

function ChooseSelectListNode(uniqId, icd10Id, endingsOnly) {
    var selected1 = $('#LpuListTree').find('[selected]');
    if ($(selected1).attr('value') != null) {
        if ((endingsOnly && $(selected1).hasClass('ending').toString()) || (!endingsOnly && !$(selected1).hasClass('ending').toString())) {
            $('[name="' + icd10Id+'"]').attr('value', $(selected1).attr('value'));
            $('#ChooseList').text($(selected1).children('span').text());
            $('#LableList').text($(selected1).text());
            $('#' + uniqId + '_text').val($(selected1).text().substring($(selected1).children().text().length+1,$(selected1).text().length));
            searchBlur('window choose', uniqId, endingsOnly);
            AfterFillingAmbulatoryTicket_CloseMKBModal(uniqId);
            if (uniqId.indexOf('basic') + 1) {
                $("#AfterFillingAmbulatoryTicketBasicDiagDetectId").removeAttr("disabled");
                $("#AmbulatoryTicketsAfterFillingBasicDiagMkb10SettedMark").val("true");
            }

            var sm = $('#searchMode');
            $.cookie("sotr" + "@sotr" + "MkbSearchMode", $(sm).attr('value'));

        } 
    }
}
		
		
function LpuList_Refresh() {
    if (IsLPUOtdelTreeDisplayed()) {
        $("#LpuListTree").empty();
        RefreshLpuListTree();
    } else {
        $('#LpuListGrid').jqGrid().trigger("reloadGrid");
    }
    
    return false;
}

    function LpuList_EditRecord(clickedTreeNode)
    {
        var nothingSelectedAlert = 'Первоначально необходимо выделить редактируемое ЛПУ или отделение.';

        if (IsLPUOtdelTreeDisplayed()) {
            var selectedNode; 
            
            if (clickedTreeNode)
            {
                selectedNode = clickedTreeNode;
            } else {
                selectedNode = $("a.selected-node", "#LpuOtdelTree")[0];
            } 
            
            if (!selectedNode) {
                alert(nothingSelectedAlert);
            } else {
                var id = $("input[type='hidden'].tree-node-id", $(selectedNode).parent().parent()).val();
                
                if (id) {
                    if ($(selectedNode).hasClass("lpu")) {
                        EditLpu(id);
                    } else if ($(selectedNode).hasClass("otdel")) {
                        EditOtdel(id);
                    }
                }
            }
        } else {
            var id = jQuery("#LpuListGrid").jqGrid('getGridParam', 'selrow');
            if (id == null) {
                alert(nothingSelectedAlert);
            } else {
                //проверяем что это ЛПУ или отдел
                //var str_par='oidLpu_'+id;
                var grid = $("#LpuListGrid");
                var obj = grid.getRowData(id);
        
                if (obj['OidOtdel']==null||obj['OidOtdel']=="")
                {
                    EditLpu(id);
                }
                else
                {
                    EditOtdel(obj['OidOtdel']);       
                }
            }
        }

        return false;
    }

    function SearchLpuListGrid()
    {
        $('#LpuListGrid').jqGrid('setGridParam', { datatype: 'json' });
        $('#LpuListGrid').jqGrid("clearGridData", true);

        var grid = $("#LpuListGrid");
        var text = trimJS($("#myLpuListGrid").val());
        var postdata = grid.jqGrid('getGridParam', 'postData');
        $.extend(postdata, { searchString: text });
        grid.jqGrid('setGridParam', { search: text.length > 0, postData: postdata });
        grid.trigger("reloadGrid", [{ page: 1}]);
        return false;
            
    }
                     
    function IsLPUSelected(selectedRowId) {
        var grid = $("#LpuListGrid");
        var obj = grid.getRowData(selectedRowId);
        
        if (obj['OidOtdel']==null || obj['OidOtdel']=="")
        {
            return true;         
        } else {
            return false;
        }
    }

    function IsLPUOtdelTreeDisplayed() {
        return $("#LpuOtdelTree").is(":visible");
    }

    function SetLPUOtdelTreeMode() {
        $("#LpuListGrid_container").hide();
        $("#LpuOtdelTree").show();

        RefreshLpuListTree();
    }

    function ChangeCheckNode(nodeCheckbox) {
        var node = $(nodeCheckbox).next();
        
        if ($(node).hasClass("selected-node")) {
            $(node).removeClass("selected-node");
        } else {
            $("a.lpu, a.otdel", "#LpuOtdelTree").removeClass("selected-node");
            $("input[type='checkbox'].tree-node-checker", "#LpuOtdelTree").attr("checked", "");
            $(nodeCheckbox).attr("checked", "checked");
            $(node).addClass("selected-node");
        }
    }
    
    function ClickOnNodeForEdit(node) {
        LpuList_EditRecord(node);
    }   