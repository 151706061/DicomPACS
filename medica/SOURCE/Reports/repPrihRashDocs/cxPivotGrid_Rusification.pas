unit cxPivotGrid_Rusification;
// ����������� cxPivotGrid
// Voronov 27.08.2009
// ��� ������������� ���������� ���� ������ � ������
interface

implementation
uses
 cxClasses, cxPivotGridStrs;

initialization
  cxSetResourceString(@scxDataField , '������');
  cxSetResourceString(@scxDropFilterFields , '���������� ���� ���� ��� �������');
  cxSetResourceString(@scxDropDataItems , '���������� ���� ���� ��� ������');
  cxSetResourceString(@scxDropRowFields    , '���������� ���� ���� ��� �����');
  cxSetResourceString(@scxDropColumnFields , '���������� ���� ���� ��� ��������');
  cxSetResourceString(@scxGrandTotal       , '�����');
  cxSetResourceString(@scxNoDataToDisplay  , '<��� ������ ��� �����������>');

  // field list strings
  cxSetResourceString(@scxAddTo            , '��������');
  cxSetResourceString(@scxDragItems        , '���������� ���� � �������');
  cxSetResourceString(@scxFieldListCaption , '������ ��������� �����');
  cxSetResourceString(@scxRowArea    , '������');
  cxSetResourceString(@scxColumnArea , '�������');
  cxSetResourceString(@scxFilterArea , '�������');
  cxSetResourceString(@scxDataArea   , '������');

  // filter strings
  cxSetResourceString(@scxPivotGridShowAll, '(�����. ��)');
  cxSetResourceString(@scxPivotGridOk, 'Ok');
  cxSetResourceString(@scxPivotGridCancel, '������');

  // pivot grid pupup menu items
  cxSetResourceString(@scxHide, '������');
  cxSetResourceString(@scxOrder, '�������');
  cxSetResourceString(@scxMoveToBeginning, '� ������');
  cxSetResourceString(@scxMoveToEnd, '� �����');
  cxSetResourceString(@scxMoveToLeft, '������');
  cxSetResourceString(@scxMoveToRight, '�����');
  //
  cxSetResourceString(@scxExpand, '����������');
  cxSetResourceString(@scxCollapse, '��������');
  cxSetResourceString(@scxExpandAll, '���������� ���');
  cxSetResourceString(@scxCollapseAll, '�������� ���');

  // misc. commands
  cxSetResourceString(@scxShowCustomization, '�����. ������ �����');
  cxSetResourceString(@scxHideCustomization, '������. ������ �����');

  // prefilter commands
  cxSetResourceString(@scxShowPrefilterDialog, '�����. ��������� �������');


end.
