unit cxPivotGrid_Rusification;
// русификация cxPivotGrid
// Voronov 27.08.2009
// Для использования подключить этот модуль в проект
interface

implementation
uses
 cxClasses, cxPivotGridStrs;

initialization
  cxSetResourceString(@scxDataField , 'Данные');
  cxSetResourceString(@scxDropFilterFields , 'Перетащите сюда поля для Фильтра');
  cxSetResourceString(@scxDropDataItems , 'Перетащите сюда поля для Данных');
  cxSetResourceString(@scxDropRowFields    , 'Перетащите сюда поля для Строк');
  cxSetResourceString(@scxDropColumnFields , 'Перетащите сюда поля для Столбцов');
  cxSetResourceString(@scxGrandTotal       , 'Итого');
  cxSetResourceString(@scxNoDataToDisplay  , '<Нет данных для отображения>');

  // field list strings
  cxSetResourceString(@scxAddTo            , 'Добавить');
  cxSetResourceString(@scxDragItems        , 'Перетащите поле в таблицу');
  cxSetResourceString(@scxFieldListCaption , 'Список доступных полей');
  cxSetResourceString(@scxRowArea    , 'Строки');
  cxSetResourceString(@scxColumnArea , 'Столбцы');
  cxSetResourceString(@scxFilterArea , 'Фильтры');
  cxSetResourceString(@scxDataArea   , 'Данные');

  // filter strings
  cxSetResourceString(@scxPivotGridShowAll, '(Отобр. всё)');
  cxSetResourceString(@scxPivotGridOk, 'Ok');
  cxSetResourceString(@scxPivotGridCancel, 'Отмена');

  // pivot grid pupup menu items
  cxSetResourceString(@scxHide, 'Скрыть');
  cxSetResourceString(@scxOrder, 'Порядок');
  cxSetResourceString(@scxMoveToBeginning, 'В начало');
  cxSetResourceString(@scxMoveToEnd, 'В конец');
  cxSetResourceString(@scxMoveToLeft, 'Вправо');
  cxSetResourceString(@scxMoveToRight, 'Влево');
  //
  cxSetResourceString(@scxExpand, 'Развернуть');
  cxSetResourceString(@scxCollapse, 'Свернуть');
  cxSetResourceString(@scxExpandAll, 'Развернуть все');
  cxSetResourceString(@scxCollapseAll, 'Свернуть все');

  // misc. commands
  cxSetResourceString(@scxShowCustomization, 'Отобр. список полей');
  cxSetResourceString(@scxHideCustomization, 'Скрыть. список полей');

  // prefilter commands
  cxSetResourceString(@scxShowPrefilterDialog, 'Отобр. настройки фильтра');


end.
