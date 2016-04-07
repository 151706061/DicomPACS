// $Id: uPkgProdCert.pas,v 1.2 2007/05/28 06:32:42 delphi5 Exp $
//
unit uPkgProdcert;

interface

uses
	Classes, SysUtils, Oracle;

type
	TPkgProdcert = class(TOracleCustomPackage)
	public
		procedure Add(const strVal: string; var nID: Double; bForeighn: boolean = false);
		procedure Edit(nID: Double; const strVal: string; bForeighn: boolean = false);
		function  Find(strVal: Double): Double;
		procedure Remove(nID: Double);
		procedure GetProdcert(nID: Double; out strProd: string; out strCert: string);
	published
		property Name;
		property Session;
		property Cursor;
	end;

const
	PRODCERT_VALUE_LEN = 256;

var
	DefaultPLSQLTableSize: Integer = 100; // Default size of a PL/SQL Table

implementation

// PKG_PRODCERT.ADD
procedure TPkgProdcert.Add(const strVal: string; var nID: Double; bForeighn: boolean = false);
begin
	GetQuery;
	OCPQuery.DeclareVariable('strVal', otString);
	OCPQuery.SetVariable('strVal', Copy(strVal, 0, PRODCERT_VALUE_LEN));
	OCPQuery.DeclareVariable('nID', otFloat);
	OCPQuery.SetVariable('nID', nID);
	OCPQuery.DeclareVariable('bForeighn', otInteger);
	OCPQuery.SetVariable('bForeighn', Integer(bForeighn));
	OCPQuery.SQL.Add('begin');
	OCPQuery.SQL.Add('  "MED"."PKG_PRODCERT"."ADD"(');
	OCPQuery.SQL.Add('    strVal => :strVal,');
	OCPQuery.SQL.Add('    nID => :nID,');
	OCPQuery.SQL.Add('    bForeighn => :bForeighn);');
	OCPQuery.SQL.Add('end;');
	OCPQuery.Execute;
	nID := ConvertVariant(OCPQuery.GetVariable('nID'));
end;

// PKG_PRODCERT.EDIT
procedure TPkgProdcert.Edit(nID: Double; const strVal: string; bForeighn: boolean = false);
begin
	GetQuery;
	OCPQuery.DeclareVariable('nID', otFloat);
	OCPQuery.SetVariable('nID', nID);
	OCPQuery.DeclareVariable('strVal', otString);
	OCPQuery.SetVariable('strVal', Copy(strVal, 0, PRODCERT_VALUE_LEN)); 
	OCPQuery.DeclareVariable('bForeighn', otInteger);
	OCPQuery.SetVariable('bForeighn', Integer(bForeighn));
	OCPQuery.SQL.Add('begin');
	OCPQuery.SQL.Add('  "MED"."PKG_PRODCERT"."EDIT"(');
	OCPQuery.SQL.Add('    nID => :nID,');
	OCPQuery.SQL.Add('    strVal => :strVal,');
	OCPQuery.SQL.Add('    bForeighn => :bForeighn);');
	OCPQuery.SQL.Add('end;');
	OCPQuery.Execute;
end;

// PKG_PRODCERT.FIND
function TPkgProdcert.Find(strVal: Double): Double;
begin
	GetQuery;
	OCPQuery.DeclareVariable('function_result', otFloat);
	OCPQuery.DeclareVariable('strVal', otFloat);
	OCPQuery.SetVariable('strVal', strVal);
	OCPQuery.SQL.Add('begin');
	OCPQuery.SQL.Add('  :function_result := "MED"."PKG_PRODCERT"."FIND"(strVal => :strVal);');
	OCPQuery.SQL.Add('end;');
	OCPQuery.Execute;
	Result := ConvertVariant(OCPQuery.GetVariable('function_result'));
end;

// PKG_PRODCERT.REMOVE
procedure TPkgProdcert.Remove(nID: Double);
begin
	GetQuery;
	OCPQuery.DeclareVariable('nID', otFloat);
	OCPQuery.SetVariable('nID', nID);
	OCPQuery.SQL.Add('begin');
	OCPQuery.SQL.Add('  "MED"."PKG_PRODCERT"."REMOVE"(nID => :nID);');
	OCPQuery.SQL.Add('end;');
	OCPQuery.Execute;
end;

procedure TPkgProdcert.GetProdcert(nID: Double; out strProd: string; out strCert: string);
begin
	GetQuery;
	OCPQuery.DeclareVariable('nID', otFloat);
	OCPQuery.SetVariable('nID', nID);
	OCPQuery.DeclareVariable('strProd', otString);
	OCPQuery.DeclareVariable('strCert', otString);
	OCPQuery.SQL.Add('begin');
	OCPQuery.SQL.Add('  "MED"."PKG_PRODCERT"."GET_PRODCERT"(');
	OCPQuery.SQL.Add('    nID => :nID,');
	OCPQuery.SQL.Add('    strProd => :strProd,');
	OCPQuery.SQL.Add('    strCert => :strCert);');
	OCPQuery.SQL.Add('end;');
	OCPQuery.Execute;
	strProd := ConvertVariant(OCPQuery.GetVariable('strProd'));
	strCert := ConvertVariant(OCPQuery.GetVariable('strCert'));
end;

end.
