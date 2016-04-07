{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_3D;
{$I DicomPack.inc}
interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  DCM_Attributes, gl, glext, DCM_UID, DCM_Dict, DCM_MPR, dialogs, DCM_Bitmap16;
const
  //-----------------------------------------------------------------------------
  //recording the middle point of each side
  //and two points of each side
  //in order to realize integer operation,all coordinate values amplify 10 times.
  g_CoordTable: array[0..11, 0..4] of Byte =
  (
    (1, 0, 0, 0, 1),
    (2, 1, 0, 1, 2),
    (1, 2, 0, 3, 2),
    (0, 1, 0, 0, 3),
    (1, 0, 2, 4, 5),
    (2, 1, 2, 5, 6),
    (1, 2, 2, 7, 6),
    (0, 1, 2, 4, 7),
    (0, 0, 1, 0, 4),
    (2, 0, 1, 1, 5),
    (2, 2, 1, 2, 6),
    (0, 2, 1, 3, 7)
    );
  //-----------------------------------------------------------------------------
  //record the cube's point
  g_CoordVertex: array[0..7, 0..2] of Byte =
  (
    (0, 0, 0),
    (1, 0, 0),
    (1, 1, 0),
    (0, 1, 0),
    (0, 0, 1),
    (1, 0, 1),
    (1, 1, 1),
    (0, 1, 1)
    );
  //-----------------------------------------------------------------------------

  g_EdgeTable: array[0..255] of Word = (
    $0, $109, $203, $30A, $406, $50F, $605, $70C,
    $80C, $905, $A0F, $B06, $C0A, $D03, $E09, $F00,
    $190, $99, $393, $29A, $596, $49F, $795, $69C,
    $99C, $895, $B9F, $A96, $D9A, $C93, $F99, $E90,
    $230, $339, $33, $13A, $636, $73F, $435, $53C,
    $A3C, $B35, $83F, $936, $E3A, $F33, $C39, $D30,
    $3A0, $2A9, $1A3, $AA, $7A6, $6AF, $5A5, $4AC,
    $BAC, $AA5, $9AF, $8A6, $FAA, $EA3, $DA9, $CA0,
    $460, $569, $663, $76A, $66, $16F, $265, $36C,
    $C6C, $D65, $E6F, $F66, $86A, $963, $A69, $B60,
    $5F0, $4F9, $7F3, $6FA, $1F6, $FF, $3F5, $2FC,
    $DFC, $CF5, $FFF, $EF6, $9FA, $8F3, $BF9, $AF0,
    $650, $759, $453, $55A, $256, $35F, $55, $15C,
    $E5C, $F55, $C5F, $D56, $A5A, $B53, $859, $950,
    $7C0, $6C9, $5C3, $4CA, $3C6, $2CF, $1C5, $CC,
    $FCC, $EC5, $DCF, $CC6, $BCA, $AC3, $9C9, $8C0,
    $8C0, $9C9, $AC3, $BCA, $CC6, $DCF, $EC5, $FCC,
    $CC, $1C5, $2CF, $3C6, $4CA, $5C3, $6C9, $7C0,
    $950, $859, $B53, $A5A, $D56, $C5F, $F55, $E5C,
    $15C, $55, $35F, $256, $55A, $453, $759, $650,
    $AF0, $BF9, $8F3, $9FA, $EF6, $FFF, $CF5, $DFC,
    $2FC, $3F5, $FF, $1F6, $6FA, $7F3, $4F9, $5F0,
    $B60, $A69, $963, $86A, $F66, $E6F, $D65, $C6C,
    $36C, $265, $16F, $66, $76A, $663, $569, $460,
    $CA0, $DA9, $EA3, $FAA, $8A6, $9AF, $AA5, $BAC,
    $4AC, $5A5, $6AF, $7A6, $AA, $1A3, $2A9, $3A0,
    $D30, $C39, $F33, $E3A, $936, $83F, $B35, $A3C,
    $53C, $435, $73F, $636, $13A, $33, $339, $230,
    $E90, $F99, $C93, $D9A, $A96, $B9F, $895, $99C,
    $69C, $795, $49F, $596, $29A, $393, $99, $190,
    $F00, $E09, $D03, $C0A, $B06, $A0F, $905, $80C,
    $70C, $605, $50F, $406, $30A, $203, $109, $0
    );

  g_TriTable: array[0..255, 0..15] of Integer = (
    (-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (0, 8, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (0, 1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (1, 8, 3, 9, 8, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (1, 2, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (0, 8, 3, 1, 2, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (9, 2, 10, 0, 2, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (2, 8, 3, 2, 10, 8, 10, 9, 8, -1, -1, -1, -1, -1, -1, -1),
    (3, 11, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (0, 11, 2, 8, 11, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (1, 9, 0, 2, 3, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (1, 11, 2, 1, 9, 11, 9, 8, 11, -1, -1, -1, -1, -1, -1, -1),
    (3, 10, 1, 11, 10, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (0, 10, 1, 0, 8, 10, 8, 11, 10, -1, -1, -1, -1, -1, -1, -1),
    (3, 9, 0, 3, 11, 9, 11, 10, 9, -1, -1, -1, -1, -1, -1, -1),
    (9, 8, 10, 10, 8, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (4, 7, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (4, 3, 0, 7, 3, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (0, 1, 9, 8, 4, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (4, 1, 9, 4, 7, 1, 7, 3, 1, -1, -1, -1, -1, -1, -1, -1),
    (1, 2, 10, 8, 4, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (3, 4, 7, 3, 0, 4, 1, 2, 10, -1, -1, -1, -1, -1, -1, -1),
    (9, 2, 10, 9, 0, 2, 8, 4, 7, -1, -1, -1, -1, -1, -1, -1),
    (2, 10, 9, 2, 9, 7, 2, 7, 3, 7, 9, 4, -1, -1, -1, -1),
    (8, 4, 7, 3, 11, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (11, 4, 7, 11, 2, 4, 2, 0, 4, -1, -1, -1, -1, -1, -1, -1),
    (9, 0, 1, 8, 4, 7, 2, 3, 11, -1, -1, -1, -1, -1, -1, -1),
    (4, 7, 11, 9, 4, 11, 9, 11, 2, 9, 2, 1, -1, -1, -1, -1),
    (3, 10, 1, 3, 11, 10, 7, 8, 4, -1, -1, -1, -1, -1, -1, -1),
    (1, 11, 10, 1, 4, 11, 1, 0, 4, 7, 11, 4, -1, -1, -1, -1),
    (4, 7, 8, 9, 0, 11, 9, 11, 10, 11, 0, 3, -1, -1, -1, -1),
    (4, 7, 11, 4, 11, 9, 9, 11, 10, -1, -1, -1, -1, -1, -1, -1),
    (9, 5, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (9, 5, 4, 0, 8, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (0, 5, 4, 1, 5, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (8, 5, 4, 8, 3, 5, 3, 1, 5, -1, -1, -1, -1, -1, -1, -1),
    (1, 2, 10, 9, 5, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (3, 0, 8, 1, 2, 10, 4, 9, 5, -1, -1, -1, -1, -1, -1, -1),
    (5, 2, 10, 5, 4, 2, 4, 0, 2, -1, -1, -1, -1, -1, -1, -1),
    (2, 10, 5, 3, 2, 5, 3, 5, 4, 3, 4, 8, -1, -1, -1, -1),
    (9, 5, 4, 2, 3, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (0, 11, 2, 0, 8, 11, 4, 9, 5, -1, -1, -1, -1, -1, -1, -1),
    (0, 5, 4, 0, 1, 5, 2, 3, 11, -1, -1, -1, -1, -1, -1, -1),
    (2, 1, 5, 2, 5, 8, 2, 8, 11, 4, 8, 5, -1, -1, -1, -1),
    (10, 3, 11, 10, 1, 3, 9, 5, 4, -1, -1, -1, -1, -1, -1, -1),
    (4, 9, 5, 0, 8, 1, 8, 10, 1, 8, 11, 10, -1, -1, -1, -1),
    (5, 4, 0, 5, 0, 11, 5, 11, 10, 11, 0, 3, -1, -1, -1, -1),
    (5, 4, 8, 5, 8, 10, 10, 8, 11, -1, -1, -1, -1, -1, -1, -1),
    (9, 7, 8, 5, 7, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (9, 3, 0, 9, 5, 3, 5, 7, 3, -1, -1, -1, -1, -1, -1, -1),
    (0, 7, 8, 0, 1, 7, 1, 5, 7, -1, -1, -1, -1, -1, -1, -1),
    (1, 5, 3, 3, 5, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (9, 7, 8, 9, 5, 7, 10, 1, 2, -1, -1, -1, -1, -1, -1, -1),
    (10, 1, 2, 9, 5, 0, 5, 3, 0, 5, 7, 3, -1, -1, -1, -1),
    (8, 0, 2, 8, 2, 5, 8, 5, 7, 10, 5, 2, -1, -1, -1, -1),
    (2, 10, 5, 2, 5, 3, 3, 5, 7, -1, -1, -1, -1, -1, -1, -1),
    (7, 9, 5, 7, 8, 9, 3, 11, 2, -1, -1, -1, -1, -1, -1, -1),
    (9, 5, 7, 9, 7, 2, 9, 2, 0, 2, 7, 11, -1, -1, -1, -1),
    (2, 3, 11, 0, 1, 8, 1, 7, 8, 1, 5, 7, -1, -1, -1, -1),
    (11, 2, 1, 11, 1, 7, 7, 1, 5, -1, -1, -1, -1, -1, -1, -1),
    (9, 5, 8, 8, 5, 7, 10, 1, 3, 10, 3, 11, -1, -1, -1, -1),
    (5, 7, 0, 5, 0, 9, 7, 11, 0, 1, 0, 10, 11, 10, 0, -1),
    (11, 10, 0, 11, 0, 3, 10, 5, 0, 8, 0, 7, 5, 7, 0, -1),
    (11, 10, 5, 7, 11, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (10, 6, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (0, 8, 3, 5, 10, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (9, 0, 1, 5, 10, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (1, 8, 3, 1, 9, 8, 5, 10, 6, -1, -1, -1, -1, -1, -1, -1),
    (1, 6, 5, 2, 6, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (1, 6, 5, 1, 2, 6, 3, 0, 8, -1, -1, -1, -1, -1, -1, -1),
    (9, 6, 5, 9, 0, 6, 0, 2, 6, -1, -1, -1, -1, -1, -1, -1),
    (5, 9, 8, 5, 8, 2, 5, 2, 6, 3, 2, 8, -1, -1, -1, -1),
    (2, 3, 11, 10, 6, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (11, 0, 8, 11, 2, 0, 10, 6, 5, -1, -1, -1, -1, -1, -1, -1),
    (0, 1, 9, 2, 3, 11, 5, 10, 6, -1, -1, -1, -1, -1, -1, -1),
    (5, 10, 6, 1, 9, 2, 9, 11, 2, 9, 8, 11, -1, -1, -1, -1),
    (6, 3, 11, 6, 5, 3, 5, 1, 3, -1, -1, -1, -1, -1, -1, -1),
    (0, 8, 11, 0, 11, 5, 0, 5, 1, 5, 11, 6, -1, -1, -1, -1),
    (3, 11, 6, 0, 3, 6, 0, 6, 5, 0, 5, 9, -1, -1, -1, -1),
    (6, 5, 9, 6, 9, 11, 11, 9, 8, -1, -1, -1, -1, -1, -1, -1),
    (5, 10, 6, 4, 7, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (4, 3, 0, 4, 7, 3, 6, 5, 10, -1, -1, -1, -1, -1, -1, -1),
    (1, 9, 0, 5, 10, 6, 8, 4, 7, -1, -1, -1, -1, -1, -1, -1),
    (10, 6, 5, 1, 9, 7, 1, 7, 3, 7, 9, 4, -1, -1, -1, -1),
    (6, 1, 2, 6, 5, 1, 4, 7, 8, -1, -1, -1, -1, -1, -1, -1),
    (1, 2, 5, 5, 2, 6, 3, 0, 4, 3, 4, 7, -1, -1, -1, -1),
    (8, 4, 7, 9, 0, 5, 0, 6, 5, 0, 2, 6, -1, -1, -1, -1),
    (7, 3, 9, 7, 9, 4, 3, 2, 9, 5, 9, 6, 2, 6, 9, -1),
    (3, 11, 2, 7, 8, 4, 10, 6, 5, -1, -1, -1, -1, -1, -1, -1),
    (5, 10, 6, 4, 7, 2, 4, 2, 0, 2, 7, 11, -1, -1, -1, -1),
    (0, 1, 9, 4, 7, 8, 2, 3, 11, 5, 10, 6, -1, -1, -1, -1),
    (9, 2, 1, 9, 11, 2, 9, 4, 11, 7, 11, 4, 5, 10, 6, -1),
    (8, 4, 7, 3, 11, 5, 3, 5, 1, 5, 11, 6, -1, -1, -1, -1),
    (5, 1, 11, 5, 11, 6, 1, 0, 11, 7, 11, 4, 0, 4, 11, -1),
    (0, 5, 9, 0, 6, 5, 0, 3, 6, 11, 6, 3, 8, 4, 7, -1),
    (6, 5, 9, 6, 9, 11, 4, 7, 9, 7, 11, 9, -1, -1, -1, -1),
    (10, 4, 9, 6, 4, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (4, 10, 6, 4, 9, 10, 0, 8, 3, -1, -1, -1, -1, -1, -1, -1),
    (10, 0, 1, 10, 6, 0, 6, 4, 0, -1, -1, -1, -1, -1, -1, -1),
    (8, 3, 1, 8, 1, 6, 8, 6, 4, 6, 1, 10, -1, -1, -1, -1),
    (1, 4, 9, 1, 2, 4, 2, 6, 4, -1, -1, -1, -1, -1, -1, -1),
    (3, 0, 8, 1, 2, 9, 2, 4, 9, 2, 6, 4, -1, -1, -1, -1),
    (0, 2, 4, 4, 2, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (8, 3, 2, 8, 2, 4, 4, 2, 6, -1, -1, -1, -1, -1, -1, -1),
    (10, 4, 9, 10, 6, 4, 11, 2, 3, -1, -1, -1, -1, -1, -1, -1),
    (0, 8, 2, 2, 8, 11, 4, 9, 10, 4, 10, 6, -1, -1, -1, -1),
    (3, 11, 2, 0, 1, 6, 0, 6, 4, 6, 1, 10, -1, -1, -1, -1),
    (6, 4, 1, 6, 1, 10, 4, 8, 1, 2, 1, 11, 8, 11, 1, -1),
    (9, 6, 4, 9, 3, 6, 9, 1, 3, 11, 6, 3, -1, -1, -1, -1),
    (8, 11, 1, 8, 1, 0, 11, 6, 1, 9, 1, 4, 6, 4, 1, -1),
    (3, 11, 6, 3, 6, 0, 0, 6, 4, -1, -1, -1, -1, -1, -1, -1),
    (6, 4, 8, 11, 6, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (7, 10, 6, 7, 8, 10, 8, 9, 10, -1, -1, -1, -1, -1, -1, -1),
    (0, 7, 3, 0, 10, 7, 0, 9, 10, 6, 7, 10, -1, -1, -1, -1),
    (10, 6, 7, 1, 10, 7, 1, 7, 8, 1, 8, 0, -1, -1, -1, -1),
    (10, 6, 7, 10, 7, 1, 1, 7, 3, -1, -1, -1, -1, -1, -1, -1),
    (1, 2, 6, 1, 6, 8, 1, 8, 9, 8, 6, 7, -1, -1, -1, -1),
    (2, 6, 9, 2, 9, 1, 6, 7, 9, 0, 9, 3, 7, 3, 9, -1),
    (7, 8, 0, 7, 0, 6, 6, 0, 2, -1, -1, -1, -1, -1, -1, -1),
    (7, 3, 2, 6, 7, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (2, 3, 11, 10, 6, 8, 10, 8, 9, 8, 6, 7, -1, -1, -1, -1),
    (2, 0, 7, 2, 7, 11, 0, 9, 7, 6, 7, 10, 9, 10, 7, -1),
    (1, 8, 0, 1, 7, 8, 1, 10, 7, 6, 7, 10, 2, 3, 11, -1),
    (11, 2, 1, 11, 1, 7, 10, 6, 1, 6, 7, 1, -1, -1, -1, -1),
    (8, 9, 6, 8, 6, 7, 9, 1, 6, 11, 6, 3, 1, 3, 6, -1),
    (0, 9, 1, 11, 6, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (7, 8, 0, 7, 0, 6, 3, 11, 0, 11, 6, 0, -1, -1, -1, -1),
    (7, 11, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (7, 6, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (3, 0, 8, 11, 7, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (0, 1, 9, 11, 7, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (8, 1, 9, 8, 3, 1, 11, 7, 6, -1, -1, -1, -1, -1, -1, -1),
    (10, 1, 2, 6, 11, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (1, 2, 10, 3, 0, 8, 6, 11, 7, -1, -1, -1, -1, -1, -1, -1),
    (2, 9, 0, 2, 10, 9, 6, 11, 7, -1, -1, -1, -1, -1, -1, -1),
    (6, 11, 7, 2, 10, 3, 10, 8, 3, 10, 9, 8, -1, -1, -1, -1),
    (7, 2, 3, 6, 2, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (7, 0, 8, 7, 6, 0, 6, 2, 0, -1, -1, -1, -1, -1, -1, -1),
    (2, 7, 6, 2, 3, 7, 0, 1, 9, -1, -1, -1, -1, -1, -1, -1),
    (1, 6, 2, 1, 8, 6, 1, 9, 8, 8, 7, 6, -1, -1, -1, -1),
    (10, 7, 6, 10, 1, 7, 1, 3, 7, -1, -1, -1, -1, -1, -1, -1),
    (10, 7, 6, 1, 7, 10, 1, 8, 7, 1, 0, 8, -1, -1, -1, -1),
    (0, 3, 7, 0, 7, 10, 0, 10, 9, 6, 10, 7, -1, -1, -1, -1),
    (7, 6, 10, 7, 10, 8, 8, 10, 9, -1, -1, -1, -1, -1, -1, -1),
    (6, 8, 4, 11, 8, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (3, 6, 11, 3, 0, 6, 0, 4, 6, -1, -1, -1, -1, -1, -1, -1),
    (8, 6, 11, 8, 4, 6, 9, 0, 1, -1, -1, -1, -1, -1, -1, -1),
    (9, 4, 6, 9, 6, 3, 9, 3, 1, 11, 3, 6, -1, -1, -1, -1),
    (6, 8, 4, 6, 11, 8, 2, 10, 1, -1, -1, -1, -1, -1, -1, -1),
    (1, 2, 10, 3, 0, 11, 0, 6, 11, 0, 4, 6, -1, -1, -1, -1),
    (4, 11, 8, 4, 6, 11, 0, 2, 9, 2, 10, 9, -1, -1, -1, -1),
    (10, 9, 3, 10, 3, 2, 9, 4, 3, 11, 3, 6, 4, 6, 3, -1),
    (8, 2, 3, 8, 4, 2, 4, 6, 2, -1, -1, -1, -1, -1, -1, -1),
    (0, 4, 2, 4, 6, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (1, 9, 0, 2, 3, 4, 2, 4, 6, 4, 3, 8, -1, -1, -1, -1),
    (1, 9, 4, 1, 4, 2, 2, 4, 6, -1, -1, -1, -1, -1, -1, -1),
    (8, 1, 3, 8, 6, 1, 8, 4, 6, 6, 10, 1, -1, -1, -1, -1),
    (10, 1, 0, 10, 0, 6, 6, 0, 4, -1, -1, -1, -1, -1, -1, -1),
    (4, 6, 3, 4, 3, 8, 6, 10, 3, 0, 3, 9, 10, 9, 3, -1),
    (10, 9, 4, 6, 10, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (4, 9, 5, 7, 6, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (0, 8, 3, 4, 9, 5, 11, 7, 6, -1, -1, -1, -1, -1, -1, -1),
    (5, 0, 1, 5, 4, 0, 7, 6, 11, -1, -1, -1, -1, -1, -1, -1),
    (11, 7, 6, 8, 3, 4, 3, 5, 4, 3, 1, 5, -1, -1, -1, -1),
    (9, 5, 4, 10, 1, 2, 7, 6, 11, -1, -1, -1, -1, -1, -1, -1),
    (6, 11, 7, 1, 2, 10, 0, 8, 3, 4, 9, 5, -1, -1, -1, -1),
    (7, 6, 11, 5, 4, 10, 4, 2, 10, 4, 0, 2, -1, -1, -1, -1),
    (3, 4, 8, 3, 5, 4, 3, 2, 5, 10, 5, 2, 11, 7, 6, -1),
    (7, 2, 3, 7, 6, 2, 5, 4, 9, -1, -1, -1, -1, -1, -1, -1),
    (9, 5, 4, 0, 8, 6, 0, 6, 2, 6, 8, 7, -1, -1, -1, -1),
    (3, 6, 2, 3, 7, 6, 1, 5, 0, 5, 4, 0, -1, -1, -1, -1),
    (6, 2, 8, 6, 8, 7, 2, 1, 8, 4, 8, 5, 1, 5, 8, -1),
    (9, 5, 4, 10, 1, 6, 1, 7, 6, 1, 3, 7, -1, -1, -1, -1),
    (1, 6, 10, 1, 7, 6, 1, 0, 7, 8, 7, 0, 9, 5, 4, -1),
    (4, 0, 10, 4, 10, 5, 0, 3, 10, 6, 10, 7, 3, 7, 10, -1),
    (7, 6, 10, 7, 10, 8, 5, 4, 10, 4, 8, 10, -1, -1, -1, -1),
    (6, 9, 5, 6, 11, 9, 11, 8, 9, -1, -1, -1, -1, -1, -1, -1),
    (3, 6, 11, 0, 6, 3, 0, 5, 6, 0, 9, 5, -1, -1, -1, -1),
    (0, 11, 8, 0, 5, 11, 0, 1, 5, 5, 6, 11, -1, -1, -1, -1),
    (6, 11, 3, 6, 3, 5, 5, 3, 1, -1, -1, -1, -1, -1, -1, -1),
    (1, 2, 10, 9, 5, 11, 9, 11, 8, 11, 5, 6, -1, -1, -1, -1),
    (0, 11, 3, 0, 6, 11, 0, 9, 6, 5, 6, 9, 1, 2, 10, -1),
    (11, 8, 5, 11, 5, 6, 8, 0, 5, 10, 5, 2, 0, 2, 5, -1),
    (6, 11, 3, 6, 3, 5, 2, 10, 3, 10, 5, 3, -1, -1, -1, -1),
    (5, 8, 9, 5, 2, 8, 5, 6, 2, 3, 8, 2, -1, -1, -1, -1),
    (9, 5, 6, 9, 6, 0, 0, 6, 2, -1, -1, -1, -1, -1, -1, -1),
    (1, 5, 8, 1, 8, 0, 5, 6, 8, 3, 8, 2, 6, 2, 8, -1),
    (1, 5, 6, 2, 1, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (1, 3, 6, 1, 6, 10, 3, 8, 6, 5, 6, 9, 8, 9, 6, -1),
    (10, 1, 0, 10, 0, 6, 9, 5, 0, 5, 6, 0, -1, -1, -1, -1),
    (0, 3, 8, 5, 6, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (10, 5, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (11, 5, 10, 7, 5, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (11, 5, 10, 11, 7, 5, 8, 3, 0, -1, -1, -1, -1, -1, -1, -1),
    (5, 11, 7, 5, 10, 11, 1, 9, 0, -1, -1, -1, -1, -1, -1, -1),
    (10, 7, 5, 10, 11, 7, 9, 8, 1, 8, 3, 1, -1, -1, -1, -1),
    (11, 1, 2, 11, 7, 1, 7, 5, 1, -1, -1, -1, -1, -1, -1, -1),
    (0, 8, 3, 1, 2, 7, 1, 7, 5, 7, 2, 11, -1, -1, -1, -1),
    (9, 7, 5, 9, 2, 7, 9, 0, 2, 2, 11, 7, -1, -1, -1, -1),
    (7, 5, 2, 7, 2, 11, 5, 9, 2, 3, 2, 8, 9, 8, 2, -1),
    (2, 5, 10, 2, 3, 5, 3, 7, 5, -1, -1, -1, -1, -1, -1, -1),
    (8, 2, 0, 8, 5, 2, 8, 7, 5, 10, 2, 5, -1, -1, -1, -1),
    (9, 0, 1, 5, 10, 3, 5, 3, 7, 3, 10, 2, -1, -1, -1, -1),
    (9, 8, 2, 9, 2, 1, 8, 7, 2, 10, 2, 5, 7, 5, 2, -1),
    (1, 3, 5, 3, 7, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (0, 8, 7, 0, 7, 1, 1, 7, 5, -1, -1, -1, -1, -1, -1, -1),
    (9, 0, 3, 9, 3, 5, 5, 3, 7, -1, -1, -1, -1, -1, -1, -1),
    (9, 8, 7, 5, 9, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (5, 8, 4, 5, 10, 8, 10, 11, 8, -1, -1, -1, -1, -1, -1, -1),
    (5, 0, 4, 5, 11, 0, 5, 10, 11, 11, 3, 0, -1, -1, -1, -1),
    (0, 1, 9, 8, 4, 10, 8, 10, 11, 10, 4, 5, -1, -1, -1, -1),
    (10, 11, 4, 10, 4, 5, 11, 3, 4, 9, 4, 1, 3, 1, 4, -1),
    (2, 5, 1, 2, 8, 5, 2, 11, 8, 4, 5, 8, -1, -1, -1, -1),
    (0, 4, 11, 0, 11, 3, 4, 5, 11, 2, 11, 1, 5, 1, 11, -1),
    (0, 2, 5, 0, 5, 9, 2, 11, 5, 4, 5, 8, 11, 8, 5, -1),
    (9, 4, 5, 2, 11, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (2, 5, 10, 3, 5, 2, 3, 4, 5, 3, 8, 4, -1, -1, -1, -1),
    (5, 10, 2, 5, 2, 4, 4, 2, 0, -1, -1, -1, -1, -1, -1, -1),
    (3, 10, 2, 3, 5, 10, 3, 8, 5, 4, 5, 8, 0, 1, 9, -1),
    (5, 10, 2, 5, 2, 4, 1, 9, 2, 9, 4, 2, -1, -1, -1, -1),
    (8, 4, 5, 8, 5, 3, 3, 5, 1, -1, -1, -1, -1, -1, -1, -1),
    (0, 4, 5, 1, 0, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (8, 4, 5, 8, 5, 3, 9, 0, 5, 0, 3, 5, -1, -1, -1, -1),
    (9, 4, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (4, 11, 7, 4, 9, 11, 9, 10, 11, -1, -1, -1, -1, -1, -1, -1),
    (0, 8, 3, 4, 9, 7, 9, 11, 7, 9, 10, 11, -1, -1, -1, -1),
    (1, 10, 11, 1, 11, 4, 1, 4, 0, 7, 4, 11, -1, -1, -1, -1),
    (3, 1, 4, 3, 4, 8, 1, 10, 4, 7, 4, 11, 10, 11, 4, -1),
    (4, 11, 7, 9, 11, 4, 9, 2, 11, 9, 1, 2, -1, -1, -1, -1),
    (9, 7, 4, 9, 11, 7, 9, 1, 11, 2, 11, 1, 0, 8, 3, -1),
    (11, 7, 4, 11, 4, 2, 2, 4, 0, -1, -1, -1, -1, -1, -1, -1),
    (11, 7, 4, 11, 4, 2, 8, 3, 4, 3, 2, 4, -1, -1, -1, -1),
    (2, 9, 10, 2, 7, 9, 2, 3, 7, 7, 4, 9, -1, -1, -1, -1),
    (9, 10, 7, 9, 7, 4, 10, 2, 7, 8, 7, 0, 2, 0, 7, -1),
    (3, 7, 10, 3, 10, 2, 7, 4, 10, 1, 10, 0, 4, 0, 10, -1),
    (1, 10, 2, 8, 7, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (4, 9, 1, 4, 1, 7, 7, 1, 3, -1, -1, -1, -1, -1, -1, -1),
    (4, 9, 1, 4, 1, 7, 0, 8, 1, 8, 7, 1, -1, -1, -1, -1),
    (4, 0, 3, 7, 4, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (4, 8, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (9, 10, 8, 10, 11, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (3, 0, 9, 3, 9, 11, 11, 9, 10, -1, -1, -1, -1, -1, -1, -1),
    (0, 1, 10, 0, 10, 8, 8, 10, 11, -1, -1, -1, -1, -1, -1, -1),
    (3, 1, 10, 11, 3, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (1, 2, 11, 1, 11, 9, 9, 11, 8, -1, -1, -1, -1, -1, -1, -1),
    (3, 0, 9, 3, 9, 11, 1, 2, 9, 2, 11, 9, -1, -1, -1, -1),
    (0, 2, 11, 8, 0, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (3, 2, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (2, 3, 8, 2, 8, 10, 10, 8, 9, -1, -1, -1, -1, -1, -1, -1),
    (9, 10, 2, 0, 9, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (2, 3, 8, 2, 8, 10, 0, 1, 8, 1, 10, 8, -1, -1, -1, -1),
    (1, 10, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (1, 3, 8, 9, 1, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (0, 9, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (0, 3, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
    (-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
    );

type
  TGLFloatRA = array[0..0] of GLFloat;
  GLFloatP = ^TGLFloatRA;

  TRepresentationType = (MITK_MESH_WIREFRAME, MITK_MESH_POINTS, MITK_MESH_SURFACE);
  TInterpolationType = (MITK_SURFACE_FLAT, MITK_SURFACE_GOURAUD);

  TDicomSurfaceProperty = class
  protected
    m_Color: GLFloatP; //表面颜色
    m_AmbientColor: GLFloatP; //环境光颜色
    m_DiffuseColor: GLFloatP; //散线光颜色
    m_SpecularColor: GLFloatP; //反光光颜色
    m_EmissionColor: GLFloatP; //发射光颜色
    m_EdgeColor: GLFloatP; //采用线框方式绘制时线框的颜色
    m_Ambient: GLFloat; //环境光素数
    m_Diffuse: GLFloat; //散线光素数
    m_Specular: GLFloat; //反光光素数
    m_Emission: GLFloat; //发射光素数
    m_SpecularPower: GLFloat; //发射光强度
    m_Opacity: GLFloat; //不锈明度
    m_PointSize: GLFloat; //采用顶点方式绘制时点的大小
    m_LineWidth: GLFloat; //采用线框方式绘制时线的宽度

    m_InterpolationType: TInterpolationType; //插值方式
    m_LineStippleRepeatFactor: Integer; //点划线重因子
    m_LineStipplePattern: Integer; //点划线模板

    fRepresentationType: TRepresentationType; //绘制方式

    IsClockwise: Boolean;

    fModified: Boolean; //参数是否被更改
  public
    constructor Create;
    destructor Destroy; override;

    function GetColor: PGLFloat;

    procedure SetColor(v1, v2, v3, v4: GLFloat);
    procedure SetAmbientColor(v1, v2, v3, v4: GLFloat);
    procedure SetDiffuseColor(v1, v2, v3, v4: GLFloat);
    procedure SetSpecularColor(v1, v2, v3, v4: GLFloat);
    procedure SetEmissionColor(v1, v2, v3, v4: GLFloat);
    procedure SetEdgeColor(v1, v2, v3, v4: GLFloat);

    procedure SetMaterial;
  published
    property RepresentationType: TRepresentationType read fRepresentationType write
      fRepresentationType;
  end;
  TDicomContourValue = class
  private
    flowThreshold: Integer;
    fhighThreshold: Integer;

    pVertex: GLFloatP; //GLFloat
    //    pVertexPos: PGLFloat; //GLFloat
    fVertPos: Integer;
    fVertCount: integer;

    pFace: IntegerP; //Integer
    //    pFacePos: PInteger; //Integer
    fFacePos: Integer;
    fFaceCount: integer;

    fVertexNumber: integer;
    fFaceNumber: integer;

    fmin: array[0..2] of GLFloat;
    fmax: array[0..2] of GLFloat; //包围盒的尺寸

    m_EdgeNum: integer;
    m_Edges: IntegerP;

    m_VertVBO: GLuint;
    m_FaceVBO: GLuint;
    m_edgeVBO: GLuint;
    m_VBOBuilt: Boolean;
    m_NormalReversed: Boolean;

    fProp: TDicomSurfaceProperty;

    function ReallocFace(var NewCapacity: Longint): Pointer;
    function ReallocVertex(var NewCapacity: Longint): Pointer;
    procedure SetFaceCount(NewCapacity: Longint);
    procedure SetVertCount(NewCapacity: Longint);
  protected
    procedure AddFace(AValue: array of Integer; ACount: integer);
    procedure AddVertex(AValue: array of GLFloat; ACount: integer);

    procedure SetVertexNumber(Value: Integer);
    procedure SetFaceNumber(Value: integer);
    function GetVertexNumber: Integer;
    function GetFaceNumber: integer;

    procedure buildVBOs;

    procedure DrawPoints;
    procedure DrawWireFrame;
    procedure DrawSurface;

    procedure BuildArrays;
    procedure clearArrays;

    function GetModelMatrix: PGLFloat;
    function GetClipping: Boolean;
  public
    constructor Create(alowThreshold, ahighThreshold: Integer);
    destructor Destroy; override;
    procedure setBoundingBox(x1, x2, y1, y2, z1, z2: GLFloat);
    procedure GetBoundingBox(var x1, x2, y1, y2, z1, z2: GLFloat);

    procedure VBORerndering;
    procedure STDRerndering;
    procedure VARendering;

    property lowThreshold: Integer read flowThreshold;
    property highThreshold: Integer read fhighThreshold;

    property VertexData: GLFloatP read pVertex;
    property VertexNumber: integer read GetVertexNumber;

    property FaceData: IntegerP read pFace;
    property FaceNumber: integer read GetFaceNumber;

    property SurfaceProperty: TDicomSurfaceProperty read fProp;
  end;

  TDicomMarchingCubes = class(TDicomMPRImage)
  private
    fContourValueList: TList;

    function ExecuteWord: Integer;
    function ExecuteSmallint: Integer;
  protected
    procedure InitData; override;
    function GetCount: integer;
    function GetContourValue(index: Integer): TDicomContourValue;
  public
    constructor Create(ADatasets: TDicomDatasets; ASeriesUID: string); override;
    destructor Destroy; override;

    function Execute: Integer;

    procedure AddContourValue(alowThreshold, ahighThreshold: Integer);
    property ContourCount: integer read getCount;
    property ContourValues[index: Integer]: TDicomContourValue read GetContourValue;
  published

  end;

implementation

uses SurfaceInProcessing;

type

  index_type = integer;
  index_typearray = array[0..0] of index_type;
  index_typep = ^index_typearray;

constructor TDicomMarchingCubes.Create(ADatasets: TDicomDatasets; ASeriesUID: string);
begin
  inherited Create(ADatasets, ASeriesUID);
  fContourValueList := TList.Create;
end;

destructor TDicomMarchingCubes.Destroy;
var
  i: integer;
begin
  for i := 0 to fContourValueList.Count - 1 do
    ContourValues[i].Free;
  fContourValueList.Free;
  inherited;
end;

procedure TDicomMarchingCubes.InitData;
begin
  inherited;

end;

function TDicomMarchingCubes.ExecuteSmallint: Integer;
var
  vNumber, fNumber: index_type; //记录生成的顶点数和面数

  min: array[0..2] of Double;
  max: array[0..2] of Double; //包围盒的尺寸

  //当前扫描层的切片数据，因为要计算法向量，前后共设计4层切片数据
  pSliceA, pSliceB, pSliceC, pSliceD: SmallP; //WordP
  //用于记录上层扫描生成的顶点，避免生成重复的顶点。
  tempSlice: SmallP;
  cubegrid: array[0..7] of Integer; //当前Cube8个顶点的灰度值

  bottomXEdge, bottomYEdge, topXEdge, topYEdge, zEdge: index_typeP;

  //以下为计算某一层顶点和三角片时所需的一些变量
  i, j, k, w, r, w1: smallint; //一些循环变量
  cubeType: Byte; //Cube类型
  dx, dy, dz: array[0..7] of Double; //用于计算法向量
  squaroot: real;

  //以下为记录某个Cube生成的顶点坐标和相应顶点的法向量。
  vertPoint: array[0..5] of GLfloat; // to be save

  cellVerts: array[0..11] of index_type; //对应一个Cube的12条边

  triIndex: array[0..2] of index_type; //  to be save

  offset: index_type; //用于记录已生成顶点索引的临时变量

  edgeGroup: index_typeP;

  //  m: index_type;
  lowThreshold, highThreshold: integer;
  v1: TDicomContourValue;
  cv1: integer;
  procedure interpolate(w: Integer);
  var
    index1, index2: integer;
    s1, s2, s: Integer;
    x1, y1, z1, nx1, ny1, nz1, x2, y2, z2, nx2, ny2, nz2: real;

    factor: real;

  begin
    if edgeGroup[offset] = -1 then
    begin

      index1 := g_CoordTable[w][3];
      index2 := g_CoordTable[w][4];

      s1 := cubegrid[index1];
      s2 := cubegrid[index2];

      if (s1 < highThreshold) and (s1 > lowThreshold) then
      begin
        if (s2 >= highThreshold) then
          s := highThreshold
        else
          if (s2 <= lowThreshold) then
          s := lowThreshold;
      end
      else
        if (s2 < highThreshold) and (s2 > lowThreshold) then
      begin
        if (s1 >= highThreshold) then
          s := highThreshold
        else
          if (s1 <= lowThreshold) then
          s := lowThreshold;
      end;

      x1 := (k + g_CoordVertex[index1][0]) * XSpace;
      y1 := (j + g_CoordVertex[index1][1]) * YSpace;
      z1 := (i + g_CoordVertex[index1][2]) * ZSpace;
      x2 := (k + g_CoordVertex[index2][0]) * XSpace;
      y2 := (j + g_CoordVertex[index2][1]) * YSpace;
      z2 := (i + g_CoordVertex[index2][2]) * ZSpace;

      nx1 := dx[index1] / XSpace;
      ny1 := dx[index1] / YSpace;
      nz1 := dx[index1] / ZSpace;
      nx2 := dx[index2] / XSpace;
      ny2 := dx[index2] / YSpace;
      nz2 := dx[index2] / ZSpace;

      factor := ((s - s1)) / ((s2 - s1));

      vertPoint[0] := factor * (x2 - x1) + x1;
      vertPoint[1] := factor * (y2 - y1) + y1;
      vertPoint[2] := factor * (z2 - z1) + z1;

      vertPoint[3] := factor * (nx1 - nx2) - nx1;
      vertPoint[4] := factor * (ny1 - ny2) - ny1;
      vertPoint[5] := factor * (nz1 - nz2) - nz1;

      squaroot := sqrt(vertPoint[3] * vertPoint[3] +
        vertPoint[4] * vertPoint[4] +
        vertPoint[5] * vertPoint[5]);

      if (squaroot <= 0) then
        squaroot := 1.0;

      vertPoint[3] := vertPoint[3] / squaroot;
      vertPoint[4] := vertPoint[4] / squaroot;
      vertPoint[5] := vertPoint[5] / squaroot;

      if (min[0] > vertPoint[0]) then
        min[0] := vertPoint[0];
      if (max[0] < vertPoint[0]) then
        max[0] := vertPoint[0];

      if (min[1] > vertPoint[1]) then
        min[1] := vertPoint[1];
      if (max[1] < vertPoint[1]) then
        max[1] := vertPoint[1];

      if (min[2] > vertPoint[2]) then
        min[2] := vertPoint[2];
      if (max[2] < vertPoint[2]) then
        max[2] := vertPoint[2];

      cellVerts[w] := vNumber;
      edgeGroup[offset] := cellVerts[w];

      inc(vNumber);
      //存储当前Cube新生成的顶点及其法向量数据

      //todo save vertPoint[6]
      //v1.pVertex
      v1.AddVertex(vertPoint, 6);
    end //end of if edgeGroup[offset] = -1 then
    else

      cellVerts[w] := edgeGroup[offset];
  end;
begin
  vNumber := 0;
  fNumber := 0;

  min[0] := 30000;
  max[0] := -30000;

  min[1] := 30000;
  max[1] := -30000;

  min[2] := 30000;
  max[2] := -30000;
  if fContourValueList.Count <= 0 then
    raise Exception.Create('No Contour Value define');

  if XSpace = 0 then
  begin
    GenErrorMessage('Marching Cubes:Sorry,your data are wrong! XSpace=', XSpace);
  end;
  if YSpace = 0 then
  begin
    GenErrorMessage('Marching Cubes:Sorry,your data are wrong! YSpace=', YSpace);
  end;
  if ZSpace = 0 then
  begin
    GenErrorMessage('Marching Cubes:Sorry,your data are wrong! ZSpace=', ZSpace);
  end;
  for cv1 := 0 to fContourValueList.Count - 1 do
  begin
    v1 := TDicomContourValue(fContourValueList[cv1]);
    lowThreshold := v1.flowThreshold;
    highThreshold := v1.fhighThreshold;

    Getmem(bottomXEdge, imageSize * Sizeof(index_type));
    Getmem(bottomYEdge, imageSize * Sizeof(index_type));
    Getmem(TopXEdge, imageSize * Sizeof(index_type));
    Getmem(TopYEdge, imageSize * Sizeof(index_type));
    Getmem(zEdge, imageSize * Sizeof(index_type));

    Getmem(tempSlice, imageSize * Sizeof(smallint));

    if (bottomXEdge = nil) or (bottomYEdge = nil) or (topXEdge = nil) or (topYEdge = nil) or (zEdge
      = nil) or (tempSlice = nil) then
    begin
      GenErrorMessage('Marching Cubes:sorry,the assistant data structures memory are not right allocated');
    end;

    FillChar(bottomXEdge^, sizeof(index_type) * imageSize, -1);
    FillChar(bottomYEdge^, sizeof(index_type) * imageSize, -1);
    FillChar(topXEdge^, sizeof(index_type) * imageSize, -1);
    FillChar(topYEdge^, sizeof(index_type) * imageSize, -1);
    FillChar(zEdge^, sizeof(index_type) * imageSize, -1);

    FillChar(tempSlice^, sizeof(smallint) * imageSize, 0);

    pSliceD := GetImageData(0).ImageData[0].Data;

    pSliceB := tempSlice;
    pSliceA := tempSlice;

    for i := 0 to sliceNumber do
    begin
      pSliceC := pSliceA;
      pSliceA := pSliceB;
      pSliceB := pSliceD;

      if (i >= sliceNumber - 1) then
        pSliceD := tempSlice
      else
      begin
        pSliceD := GetImageData(i).ImageData[0].Data;
      end;
      for j := 0 to imageHeight - 2 do
      begin
        for k := 0 to imageWidth - 2 do
        begin
          //得到当前立方体8个顶点的灰度
          cubegrid[0] := pSliceA[j * imageWidth + k];
          cubegrid[1] := pSliceA[j * imageWidth + k + 1];
          cubegrid[2] := pSliceA[(j + 1) * imageWidth + k + 1];
          cubegrid[3] := pSliceA[(j + 1) * imageWidth + k];
          cubegrid[4] := pSliceB[j * imageWidth + k];
          cubegrid[5] := pSliceB[j * imageWidth + k + 1];
          cubegrid[6] := pSliceB[(j + 1) * imageWidth + k + 1];
          cubegrid[7] := pSliceB[(j + 1) * imageWidth + k];

          cubeType := 0;
          for w := 0 to 7 do
          begin
            if ((cubegrid[w] > lowThreshold) and (cubegrid[w] < highThreshold)) then
            begin
              w1 := w;
              cubeType := cubeType or (1 shl w1);
            end;
          end;

          if (cubeType = 0) or (cubetype = 255) then
          begin
            continue;
          end;

          for w := 0 to 11 do
          begin
            cellVerts[w] := -1;
          end; //初始化cellVerts数组，并将其全部赋初值。

          //以下为6个方向相邻点的像素差值（用于计算法向量）
          if (k = 0) then
          begin
            dx[0] := pSliceA[j * imageWidth + 1];
            dx[3] := pSliceA[(j + 1) * imageWidth + 1];
            dx[4] := pSliceB[j * imageWidth + 1];
            dx[7] := pSliceB[(j + 1) * imageWidth + 1];
          end
          else
          begin
            dx[0] := pSliceA[j * imageWidth + k + 1] - pSliceA[j * imageWidth + k - 1];
            dx[3] := pSliceA[(j + 1) * imageWidth + k + 1] - pSliceA[(j + 1) * imageWidth + k - 1];
            dx[4] := pSliceB[j * imageWidth + k + 1] - pSliceB[j * imageWidth + k - 1];
            dx[7] := pSliceB[(j + 1) * imageWidth + k + 1] - pSliceB[(j + 1) * imageWidth + k - 1];
          end;

          if (k = (imageWidth - 2)) then
          begin
            dx[1] := -pSliceA[j * imageWidth + imageWidth - 2];
            dx[2] := -pSliceA[(j + 1) * imageWidth + imageWidth - 2];
            dx[5] := -pSliceB[j * imageWidth + imageWidth - 2];
            dx[6] := -pSliceB[(j + 1) * imageWidth + imageWidth - 2];
          end
          else
          begin
            dx[1] := pSliceA[j * imageWidth + k + 2] - pSliceA[j * imageWidth + k];
            dx[2] := pSliceA[(j + 1) * imageWidth + k + 2] - pSliceA[(j + 1) * imageWidth + k];
            dx[5] := pSliceB[j * imageWidth + k + 2] - pSliceB[j * imageWidth + k];
            dx[6] := pSliceB[(j + 1) * imageWidth + k + 2] - pSliceB[(j + 1) * imageWidth + k];
          end;

          if (j = 0) then
          begin
            dx[0] := pSliceA[imageWidth + k];
            dx[1] := pSliceA[imageWidth + k + 1];
            dx[4] := pSliceB[imageWidth + k];
            dx[5] := pSliceB[imageWidth + k + 1];
          end
          else
          begin
            dx[0] := pSliceA[(j + 1) * imageWidth + k] - pSliceA[(j - 1) * imageWidth + k];
            dx[1] := pSliceA[(j + 1) * imageWidth + k + 1] - pSliceA[(j - 1) * imageWidth + k + 1];
            dx[4] := pSliceB[(j + 1) * imageWidth + k] - pSliceB[(j - 1) * imageWidth + k];
            dx[5] := pSliceB[(j + 1) * imageWidth + k + 1] - pSliceB[(j - 1) * imageWidth + k + 1];
          end;

          if (j = imageHeight - 2) then
          begin
            dx[2] := -pSliceA[(imageHeight - 2) * imageWidth + k + 1];
            dx[3] := -pSliceA[(imageHeight - 2) * imageWidth + k];
            dx[6] := -pSliceB[(imageHeight - 2) * imageWidth + k + 1];
            dx[3] := -pSliceB[(imageHeight - 2) * imageWidth + k];
          end
          else
          begin
            dx[2] := pSliceA[(imageHeight - 2) * imageWidth + k + 1] - pSliceA[j * imageWidth + k +
              1];
            dx[3] := pSliceA[(imageHeight - 2) * imageWidth + k] - pSliceA[j * imageWidth + k];
            dx[6] := pSliceB[(imageHeight - 2) * imageWidth + k + 1] - pSliceB[j * imageWidth + k +
              1];
            dx[7] := pSliceB[(imageHeight - 2) * imageWidth + k] - pSliceB[j * imageWidth + k];
          end;

          dz[0] := pSliceB[j * imageWidth + k] - pSliceC[j * imageWidth + k];
          dz[1] := pSliceB[j * imageWidth + k + 1] - pSliceC[j * imageWidth + k + 1];
          dz[2] := pSliceB[(j + 1) * imageWidth + k + 1] - pSliceC[(j + 1) * imageWidth + k + 1];
          dz[3] := pSliceB[(j + 1) * imageWidth + k] - pSliceC[(j + 1) * imageWidth + k];
          dz[4] := pSliceD[j * imageWidth + k] - pSliceA[j * imageWidth + k];
          dz[5] := pSliceD[j * imageWidth + k + 1] - pSliceA[j * imageWidth + k + 1];
          dz[6] := pSliceD[(j + 1) * imageWidth + k + 1] - pSliceA[(j + 1) * imageWidth + k + 1];
          dz[7] := pSliceD[(j + 1) * imageWidth + k] - pSliceA[(j + 1) * imageWidth + k];

          //以下为计算三角形顶点的坐标值及倾斜角度

          if (g_EdgeTable[cubeType] and 1) <> 0 then
          begin
            offset := j * imageWidth + k;
            edgeGroup := bottomXEdge;
            interpolate(0);
          end;
          if (g_EdgeTable[cubeType] and 2) <> 0 then
          begin
            offset := j * imageWidth + k + 1;
            edgeGroup := bottomYEdge;
            interpolate(1);
          end;
          if (g_EdgeTable[cubeType] and 4) <> 0 then
          begin
            offset := (j + 1) * imageWidth + k;
            edgeGroup := bottomXEdge;
            interpolate(2);
          end;
          if (g_EdgeTable[cubeType] and 8) <> 0 then
          begin
            offset := j * imageWidth + k;
            edgeGroup := bottomYEdge;
            interpolate(3);
          end;
          if (g_EdgeTable[cubeType] and 16) <> 0 then
          begin
            offset := j * imageWidth + k;
            edgeGroup := topXEdge;
            interpolate(4);
          end;
          if (g_EdgeTable[cubeType] and 32) <> 0 then
          begin
            offset := j * imageWidth + k + 1;
            edgeGroup := topYEdge;
            interpolate(5);
          end;
          if (g_EdgeTable[cubeType] and 64) <> 0 then
          begin
            offset := (j + 1) * imageWidth + k;
            edgeGroup := TopXEdge;
            interpolate(6);
          end;
          if (g_EdgeTable[cubeType] and 128) <> 0 then
          begin
            offset := j * imageWidth + k;
            edgeGroup := topYEdge;
            interpolate(7);
          end;
          if (g_EdgeTable[cubeType] and 256) <> 0 then
          begin
            offset := j * imageWidth + k;
            edgeGroup := zEdge;
            interpolate(8);
          end;
          if (g_EdgeTable[cubeType] and 512) <> 0 then
          begin
            offset := j * imageWidth + k + 1;
            edgeGroup := zEdge;
            interpolate(9);
          end;
          if (g_EdgeTable[cubeType] and 1024) <> 0 then
          begin
            offset := (j + 1) * imageWidth + k + 1;
            edgeGroup := zEdge;
            interpolate(10);
          end;
          if (g_EdgeTable[cubeType] and 2048) <> 0 then
          begin
            offset := (j + 1) * imageWidth + k;
            edgeGroup := zEdge;
            interpolate(11);
          end;

          //记录新生成的三角面片数据
          w := 0;
          while (g_TriTable[cubeType][w] <> -1) do
          begin
            for r := 0 to 2 do
            begin
              triIndex[r] := cellVerts[g_TriTable[cubeType][w]];
              inc(w)
            end;
            //todo save  triIndex[3] now
            //v1.pFace
            v1.AddFace(triIndex, 3);
            inc(fNumber);
          end;

        end; //end of  for k := 0 to imageWidth - 2 do
      end; //end of for j := 0 to imageHeight - 2 do
      Move(topXEdge^, BottomXEdge^, sizeof(index_type) * imageSize);

      Move(topYEdge^, BottomYEdge^, sizeof(index_type) * imageSize);

      fillChar(TopXEdge^, imageSize * Sizeof(index_type), -1);
      fillChar(TopYEdge^, imageSize * Sizeof(index_type), -1);
      fillChar(zEdge^, imageSize * Sizeof(index_type), -1);

    end; //end of for i := 0 to sliceNumber do

    FreeMem(tempSlice);
    FreeMem(bottomXEdge);
    FreeMem(bottomYEdge);
    FreeMem(topXEdge);
    FreeMem(topYEdge);
    FreeMem(zEdge);

    //设置输出Mesh的相关参数
    v1.SetVertexNumber(vNumber);
    v1.SetFaceNumber(fNumber);
    v1.setBoundingBox(min[0], max[0], min[1], max[1], min[2], max[2]);
  end;
end;

function TDicomMarchingCubes.ExecuteWord: Integer;
var
  vNumber, fNumber: index_type; //记录生成的顶点数和面数

  min: array[0..2] of Double;
  max: array[0..2] of Double; //包围盒的尺寸

  //当前扫描层的切片数据，因为要计算法向量，前后共设计4层切片数据
  pSliceA, pSliceB, pSliceC, pSliceD: WordP;
  //用于记录上层扫描生成的顶点，避免生成重复的顶点。
  tempSlice: WordP;
  cubegrid: array[0..7] of Integer; //当前Cube8个顶点的灰度值

  bottomXEdge, bottomYEdge, topXEdge, topYEdge, zEdge: index_typeP;

  //以下为计算某一层顶点和三角片时所需的一些变量
  i, j, k, w, r, w1: smallint; //一些循环变量
  cubeType: Byte; //Cube类型
  dx, dy, dz: array[0..7] of Double; //用于计算法向量
  squaroot: real;

  //以下为记录某个Cube生成的顶点坐标和相应顶点的法向量。
  vertPoint: array[0..5] of GLfloat; // to be save

  cellVerts: array[0..11] of index_type; //对应一个Cube的12条边

  triIndex: array[0..2] of index_type; //  to be save

  offset: index_type; //用于记录已生成顶点索引的临时变量

  edgeGroup: index_typeP;

  //  m: index_type;
  lowThreshold, highThreshold: integer;
  v1: TDicomContourValue;
  cv1: integer;

  frm1: TRenderingProcessBarForm;

  procedure interpolate(w: Integer);
  var
    index1, index2: integer;
    s1, s2, s: Integer;
    x1, y1, z1, nx1, ny1, nz1, x2, y2, z2, nx2, ny2, nz2: real;

    factor: real;

  begin
    if edgeGroup[offset] = -1 then
    begin

      index1 := g_CoordTable[w][3];
      index2 := g_CoordTable[w][4];

      s1 := cubegrid[index1];
      s2 := cubegrid[index2];

      if (s1 < highThreshold) and (s1 > lowThreshold) then
      begin
        if (s2 >= highThreshold) then
          s := highThreshold
        else
          if (s2 <= lowThreshold) then
          s := lowThreshold;
      end
      else
        if (s2 < highThreshold) and (s2 > lowThreshold) then
      begin
        if (s1 >= highThreshold) then
          s := highThreshold
        else
          if (s1 <= lowThreshold) then
          s := lowThreshold;
      end;

      x1 := (k + g_CoordVertex[index1][0]) * XSpace;
      y1 := (j + g_CoordVertex[index1][1]) * YSpace;
      z1 := (i + g_CoordVertex[index1][2]) * ZSpace;
      x2 := (k + g_CoordVertex[index2][0]) * XSpace;
      y2 := (j + g_CoordVertex[index2][1]) * YSpace;
      z2 := (i + g_CoordVertex[index2][2]) * ZSpace;

      nx1 := dx[index1] / XSpace;
      ny1 := dx[index1] / YSpace;
      nz1 := dx[index1] / ZSpace;
      nx2 := dx[index2] / XSpace;
      ny2 := dx[index2] / YSpace;
      nz2 := dx[index2] / ZSpace;

      factor := ((s - s1)) / ((s2 - s1));

      vertPoint[0] := factor * (x2 - x1) + x1;
      vertPoint[1] := factor * (y2 - y1) + y1;
      vertPoint[2] := factor * (z2 - z1) + z1;

      vertPoint[3] := factor * (nx1 - nx2) - nx1;
      vertPoint[4] := factor * (ny1 - ny2) - ny1;
      vertPoint[5] := factor * (nz1 - nz2) - nz1;

      squaroot := sqrt(vertPoint[3] * vertPoint[3] +
        vertPoint[4] * vertPoint[4] +
        vertPoint[5] * vertPoint[5]);

      if (squaroot <= 0) then
        squaroot := 1.0;

      vertPoint[3] := vertPoint[3] / squaroot;
      vertPoint[4] := vertPoint[4] / squaroot;
      vertPoint[5] := vertPoint[5] / squaroot;

      if (min[0] > vertPoint[0]) then
        min[0] := vertPoint[0];
      if (max[0] < vertPoint[0]) then
        max[0] := vertPoint[0];

      if (min[1] > vertPoint[1]) then
        min[1] := vertPoint[1];
      if (max[1] < vertPoint[1]) then
        max[1] := vertPoint[1];

      if (min[2] > vertPoint[2]) then
        min[2] := vertPoint[2];
      if (max[2] < vertPoint[2]) then
        max[2] := vertPoint[2];

      cellVerts[w] := vNumber;
      edgeGroup[offset] := cellVerts[w];

      inc(vNumber);
      //存储当前Cube新生成的顶点及其法向量数据

      //todo save vertPoint[6]
      //v1.pVertex
      v1.AddVertex(vertPoint, 6);
    end //end of if edgeGroup[offset] = -1 then
    else

      cellVerts[w] := edgeGroup[offset];
  end;
begin
  vNumber := 0;
  fNumber := 0;

  min[0] := 30000;
  max[0] := -30000;

  min[1] := 30000;
  max[1] := -30000;

  min[2] := 30000;
  max[2] := -30000;
  if fContourValueList.Count <= 0 then
    raise Exception.Create('No Contour Value define');

  if XSpace = 0 then
  begin
    GenErrorMessage('Marching Cubes:Sorry,your data are wrong! XSpace=', XSpace);
  end;
  if YSpace = 0 then
  begin
    GenErrorMessage('Marching Cubes:Sorry,your data are wrong! YSpace=', YSpace);
  end;
  if ZSpace = 0 then
  begin
    GenErrorMessage('Marching Cubes:Sorry,your data are wrong! ZSpace=', ZSpace);
  end;
  frm1 := TRenderingProcessBarForm.Create(nil);
  try
    frm1.Caption := 'Create Triangle List';
    frm1.Show;
    frm1.ProgressBar1.Max := sliceNumber;

    for cv1 := 0 to fContourValueList.Count - 1 do
    begin
      v1 := TDicomContourValue(fContourValueList[cv1]);
      lowThreshold := v1.flowThreshold;
      highThreshold := v1.fhighThreshold;

      Getmem(bottomXEdge, imageSize * Sizeof(index_type));
      Getmem(bottomYEdge, imageSize * Sizeof(index_type));
      Getmem(TopXEdge, imageSize * Sizeof(index_type));
      Getmem(TopYEdge, imageSize * Sizeof(index_type));
      Getmem(zEdge, imageSize * Sizeof(index_type));

      Getmem(tempSlice, imageSize * Sizeof(Word));

      if (bottomXEdge = nil) or (bottomYEdge = nil) or (topXEdge = nil) or (topYEdge = nil) or
        (zEdge
        = nil) or (tempSlice = nil) then
      begin
        GenErrorMessage('Marching Cubes:sorry,the assistant data structures memory are not right allocated');
      end;

      FillChar(bottomXEdge^, sizeof(index_type) * imageSize, -1);
      FillChar(bottomYEdge^, sizeof(index_type) * imageSize, -1);
      FillChar(topXEdge^, sizeof(index_type) * imageSize, -1);
      FillChar(topYEdge^, sizeof(index_type) * imageSize, -1);
      FillChar(zEdge^, sizeof(index_type) * imageSize, -1);

      FillChar(tempSlice^, sizeof(Word) * imageSize, 0);

      pSliceD := GetImageData(0).ImageData[0].Data;

      pSliceB := tempSlice;
      pSliceA := tempSlice;

      for i := 0 to sliceNumber do
      begin
        frm1.ProgressBar1.Position := i;
        frm1.ProgressBar1.Update;
        frm1.Label1.Caption := Format('%d/%d', [i, sliceNumber]);
        frm1.Label1.Update;
        application.ProcessMessages;

        if frm1.fAbort then
        begin
          if (MessageDlg('Abort Create Triangle List?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
            then
            break
          else
            frm1.fAbort := false;
        end;

        pSliceC := pSliceA;
        pSliceA := pSliceB;
        pSliceB := pSliceD;

        if (i >= sliceNumber - 1) then
          pSliceD := tempSlice
        else
        begin
          pSliceD := GetImageData(i).ImageData[0].Data;
        end;
        for j := 0 to imageHeight - 2 do
        begin
          for k := 0 to imageWidth - 2 do
          begin
            //得到当前立方体8个顶点的灰度
            cubegrid[0] := pSliceA[j * imageWidth + k];
            cubegrid[1] := pSliceA[j * imageWidth + k + 1];
            cubegrid[2] := pSliceA[(j + 1) * imageWidth + k + 1];
            cubegrid[3] := pSliceA[(j + 1) * imageWidth + k];
            cubegrid[4] := pSliceB[j * imageWidth + k];
            cubegrid[5] := pSliceB[j * imageWidth + k + 1];
            cubegrid[6] := pSliceB[(j + 1) * imageWidth + k + 1];
            cubegrid[7] := pSliceB[(j + 1) * imageWidth + k];

            cubeType := 0;
            for w := 0 to 7 do
            begin
              if ((cubegrid[w] > lowThreshold) and (cubegrid[w] < highThreshold)) then
              begin
                w1 := w;
                cubeType := cubeType or (1 shl w1);
              end;
            end;

            if (cubeType = 0) or (cubetype = 255) then
            begin
              continue;
            end;

            for w := 0 to 11 do
            begin
              cellVerts[w] := -1;
            end; //初始化cellVerts数组，并将其全部赋初值。

            //以下为6个方向相邻点的像素差值（用于计算法向量）
            if (k = 0) then
            begin
              dx[0] := pSliceA[j * imageWidth + 1];
              dx[3] := pSliceA[(j + 1) * imageWidth + 1];
              dx[4] := pSliceB[j * imageWidth + 1];
              dx[7] := pSliceB[(j + 1) * imageWidth + 1];
            end
            else
            begin
              dx[0] := pSliceA[j * imageWidth + k + 1] - pSliceA[j * imageWidth + k - 1];
              dx[3] := pSliceA[(j + 1) * imageWidth + k + 1] - pSliceA[(j + 1) * imageWidth + k -
                1];
              dx[4] := pSliceB[j * imageWidth + k + 1] - pSliceB[j * imageWidth + k - 1];
              dx[7] := pSliceB[(j + 1) * imageWidth + k + 1] - pSliceB[(j + 1) * imageWidth + k -
                1];
            end;

            if (k = (imageWidth - 2)) then
            begin
              dx[1] := -pSliceA[j * imageWidth + imageWidth - 2];
              dx[2] := -pSliceA[(j + 1) * imageWidth + imageWidth - 2];
              dx[5] := -pSliceB[j * imageWidth + imageWidth - 2];
              dx[6] := -pSliceB[(j + 1) * imageWidth + imageWidth - 2];
            end
            else
            begin
              dx[1] := pSliceA[j * imageWidth + k + 2] - pSliceA[j * imageWidth + k];
              dx[2] := pSliceA[(j + 1) * imageWidth + k + 2] - pSliceA[(j + 1) * imageWidth + k];
              dx[5] := pSliceB[j * imageWidth + k + 2] - pSliceB[j * imageWidth + k];
              dx[6] := pSliceB[(j + 1) * imageWidth + k + 2] - pSliceB[(j + 1) * imageWidth + k];
            end;

            if (j = 0) then
            begin
              dx[0] := pSliceA[imageWidth + k];
              dx[1] := pSliceA[imageWidth + k + 1];
              dx[4] := pSliceB[imageWidth + k];
              dx[5] := pSliceB[imageWidth + k + 1];
            end
            else
            begin
              dx[0] := pSliceA[(j + 1) * imageWidth + k] - pSliceA[(j - 1) * imageWidth + k];
              dx[1] := pSliceA[(j + 1) * imageWidth + k + 1] - pSliceA[(j - 1) * imageWidth + k +
                1];
              dx[4] := pSliceB[(j + 1) * imageWidth + k] - pSliceB[(j - 1) * imageWidth + k];
              dx[5] := pSliceB[(j + 1) * imageWidth + k + 1] - pSliceB[(j - 1) * imageWidth + k +
                1];
            end;

            if (j = (imageHeight - 2)) then
            begin
              dx[2] := -pSliceA[(imageHeight - 2) * imageWidth + k + 1];
              dx[3] := -pSliceA[(imageHeight - 2) * imageWidth + k];
              dx[6] := -pSliceB[(imageHeight - 2) * imageWidth + k + 1];
              dx[7] := -pSliceB[(imageHeight - 2) * imageWidth + k];
            end
            else
            begin
              dx[2] := pSliceA[(imageHeight - 2) * imageWidth + k + 1] - pSliceA[j * imageWidth + k
                + 1];
              dx[3] := pSliceA[(imageHeight - 2) * imageWidth + k] - pSliceA[j * imageWidth + k];
              dx[6] := pSliceB[(imageHeight - 2) * imageWidth + k + 1] - pSliceB[j * imageWidth + k
                + 1];
              dx[7] := pSliceB[(imageHeight - 2) * imageWidth + k] - pSliceB[j * imageWidth + k];
            end;

            dz[0] := pSliceB[j * imageWidth + k] - pSliceC[j * imageWidth + k];
            dz[1] := pSliceB[j * imageWidth + k + 1] - pSliceC[j * imageWidth + k + 1];
            dz[2] := pSliceB[(j + 1) * imageWidth + k + 1] - pSliceC[(j + 1) * imageWidth + k + 1];
            dz[3] := pSliceB[(j + 1) * imageWidth + k] - pSliceC[(j + 1) * imageWidth + k];
            dz[4] := pSliceD[j * imageWidth + k] - pSliceA[j * imageWidth + k];
            dz[5] := pSliceD[j * imageWidth + k + 1] - pSliceA[j * imageWidth + k + 1];
            dz[6] := pSliceD[(j + 1) * imageWidth + k + 1] - pSliceA[(j + 1) * imageWidth + k + 1];
            dz[7] := pSliceD[(j + 1) * imageWidth + k] - pSliceA[(j + 1) * imageWidth + k];

            //以下为计算三角形顶点的坐标值及倾斜角度

            if (g_EdgeTable[cubeType] and 1) <> 0 then
            begin
              offset := j * imageWidth + k;
              edgeGroup := bottomXEdge;
              interpolate(0);
            end;
            if (g_EdgeTable[cubeType] and 2) <> 0 then
            begin
              offset := j * imageWidth + k + 1;
              edgeGroup := bottomYEdge;
              interpolate(1);
            end;
            if (g_EdgeTable[cubeType] and 4) <> 0 then
            begin
              offset := (j + 1) * imageWidth + k;
              edgeGroup := bottomXEdge;
              interpolate(2);
            end;
            if (g_EdgeTable[cubeType] and 8) <> 0 then
            begin
              offset := j * imageWidth + k;
              edgeGroup := bottomYEdge;
              interpolate(3);
            end;
            if (g_EdgeTable[cubeType] and 16) <> 0 then
            begin
              offset := j * imageWidth + k;
              edgeGroup := topXEdge;
              interpolate(4);
            end;
            if (g_EdgeTable[cubeType] and 32) <> 0 then
            begin
              offset := j * imageWidth + k + 1;
              edgeGroup := topYEdge;
              interpolate(5);
            end;
            if (g_EdgeTable[cubeType] and 64) <> 0 then
            begin
              offset := (j + 1) * imageWidth + k;
              edgeGroup := TopXEdge;
              interpolate(6);
            end;
            if (g_EdgeTable[cubeType] and 128) <> 0 then
            begin
              offset := j * imageWidth + k;
              edgeGroup := topYEdge;
              interpolate(7);
            end;
            if (g_EdgeTable[cubeType] and 256) <> 0 then
            begin
              offset := j * imageWidth + k;
              edgeGroup := zEdge;
              interpolate(8);
            end;
            if (g_EdgeTable[cubeType] and 512) <> 0 then
            begin
              offset := j * imageWidth + k + 1;
              edgeGroup := zEdge;
              interpolate(9);
            end;
            if (g_EdgeTable[cubeType] and 1024) <> 0 then
            begin
              offset := (j + 1) * imageWidth + k + 1;
              edgeGroup := zEdge;
              interpolate(10);
            end;
            if (g_EdgeTable[cubeType] and 2048) <> 0 then
            begin
              offset := (j + 1) * imageWidth + k;
              edgeGroup := zEdge;
              interpolate(11);
            end;

            //记录新生成的三角面片数据
            w := 0;
            while (g_TriTable[cubeType][w] <> -1) do
            begin
              for r := 0 to 2 do
              begin
                triIndex[r] := cellVerts[g_TriTable[cubeType][w]];
                inc(w)
              end;
              //todo save  triIndex[3] now
              //v1.pFace
              v1.AddFace(triIndex, 3);
              inc(fNumber);
            end;

          end; //end of  for k := 0 to imageWidth - 2 do
        end; //end of for j := 0 to imageHeight - 2 do
        Move(topXEdge^, BottomXEdge^, sizeof(index_type) * imageSize);

        Move(topYEdge^, BottomYEdge^, sizeof(index_type) * imageSize);

        fillChar(TopXEdge^, imageSize * Sizeof(index_type), -1);
        fillChar(TopYEdge^, imageSize * Sizeof(index_type), -1);
        fillChar(zEdge^, imageSize * Sizeof(index_type), -1);

      end; //end of for i := 0 to sliceNumber do
    end; //for contour

  finally
    frm1.Free;
  end;

  FreeMem(tempSlice);
  FreeMem(bottomXEdge);
  FreeMem(bottomYEdge);
  FreeMem(topXEdge);
  FreeMem(topYEdge);
  FreeMem(zEdge);

  //设置输出Mesh的相关参数
  v1.SetVertexNumber(vNumber);
  v1.SetFaceNumber(fNumber);
  v1.setBoundingBox(min[0], max[0], min[1], max[1], min[2], max[2]);

end;

{ TDicomContourValue }

procedure TDicomContourValue.clearArrays;
begin
  if m_Edgenum > 0 then
  begin
    m_Edgenum := 0;
    FreeMem(m_Edges);
    m_Edges := nil;
  end;
end;

procedure TDicomContourValue.BuildArrays;
var
  i: integer;
begin
  clearArrays;

  m_Edgenum := FaceNumber * 3;
  GetMem(m_Edges, m_EdgeNum * 2 * Sizeof(Integer));

  for i := 0 to FaceNumber - 1 do
  begin
    m_Edges[6 * i] := pFace[3 * i];
    m_Edges[6 * i + 1] := pFace[3 * i + 1];

    m_Edges[6 * i + 2] := pFace[3 * i];
    m_Edges[6 * i + 3] := pFace[3 * i + 2];

    m_Edges[6 * i + 4] := pFace[3 * i + 1];
    m_Edges[6 * i + 5] := pFace[3 * i + 2];
  end;
end;

constructor TDicomContourValue.Create;
begin
  flowThreshold := alowThreshold;
  fhighThreshold := ahighThreshold;

  fVertPos := 0;
  fVertCount := 0;
  pVertex := nil;

  fFacePos := 0;
  fFaceCount := 0;
  pFace := nil;

  m_EdgeNum := 0;
  m_Edges := nil;

  fVertexNumber := 0;
  fFaceNumber := 0;

  fProp := TDicomSurfaceProperty.Create;

  m_VertVBO := 0;
  m_FaceVBO := 0;
  m_edgeVBO := 0;
  m_VBOBuilt := false;
  m_NormalReversed := false;
end;

destructor TDicomContourValue.Destroy;
begin
  if pFace <> nil then
    SetFaceCount(0);

  if pVertex <> nil then
    SetVertCount(0);

  clearArrays;

  if (m_VBOBuilt) then
  begin
    glDeleteBuffersARB(1, @m_VertVBO);
    glDeleteBuffersARB(1, @m_FaceVBO);
    glDeleteBuffersARB(1, @m_EdgeVBO);
  end;

  fProp.Free;
  inherited;
end;

procedure TDicomMarchingCubes.AddContourValue(alowThreshold, ahighThreshold: Integer);
var
  v1: TDicomContourValue;
begin
  v1 := TDicomContourValue.Create(alowThreshold, ahighThreshold);
  fContourValueList.Add(v1);
end;

function TDicomMarchingCubes.GetContourValue(
  index: Integer): TDicomContourValue;
begin
  Result := TDicomContourValue(fContourValueList[Index]);
end;

function TDicomMarchingCubes.GetCount: integer;
begin
  Result := fContourValueList.Count;
end;

procedure TDicomContourValue.DrawPoints;
var
  i: integer;
begin
  glBegin(GL_POINTS);
  for i := 0 to VertexNumber - 1 do
  begin
    glVertex3fv(@pVertex[i * 6]);
  end;
  glEnd;
end;

procedure TDicomContourValue.DrawSurface;
var
  i: integer;
begin
  glBegin(GL_TRIANGLES);
  for i := 0 to FaceNumber - 1 do
  begin
    glNormal3fv(@pVertex[6 * pFace[3 * i] + 3]);
    glVertex3fv(@pVertex[6 * pFace[3 * i]]);

    glNormal3fv(@pVertex[6 * pFace[3 * i + 1] + 3]);
    glVertex3fv(@pVertex[6 * pFace[3 * i + 1]]);

    glNormal3fv(@pVertex[6 * pFace[3 * i + 2] + 3]);
    glVertex3fv(@pVertex[6 * pFace[3 * i + 2]]);
  end;
  glEnd;
end;

procedure TDicomContourValue.DrawWireFrame;
var
  i: integer;
begin
  glBegin(GL_LINES);
  for i := 0 to FaceNumber - 1 do
  begin
    glVertex3fv(@pVertex[6 * pFace[3 * i]]);
    glVertex3fv(@pVertex[6 * pFace[3 * i + 1]]);
    glVertex3fv(@pVertex[6 * pFace[3 * i + 1]]);
    glVertex3fv(@pVertex[6 * pFace[3 * i + 2]]);
    glVertex3fv(@pVertex[6 * pFace[3 * i + 2]]);
    glVertex3fv(@pVertex[6 * pFace[3 * i]]);
  end;
  glEnd;
end;

function TDicomContourValue.GetFaceNumber: integer;
begin
  Result := fFaceNumber;
end;

function TDicomContourValue.GetVertexNumber: Integer;
begin
  Result := fVertexNumber;
end;

procedure TDicomContourValue.AddFace(AValue: array of Integer; ACount: integer);
var
  i: integer;
begin
  if fFaceCount < fFacePos + ACount then
  begin
    SetFaceCount(fFacePos + ACount);
  end;
  for i := 0 to Acount - 1 do
  begin
    pFace[fFacePos] := AValue[i];
    inc(fFacePos);
  end;
end;

procedure TDicomContourValue.AddVertex(AValue: array of GLFloat; ACount: integer);
var
  i: integer;
begin
  if fVertCount < fVertPos + ACount then
  begin
    SetVertCount(fVertPos + ACount);
  end;
  for i := 0 to Acount - 1 do
  begin
    pVertex[fVertPos] := AValue[i];
    inc(fVertPos);
  end;
end;

procedure TDicomContourValue.SetFaceCount(NewCapacity: Longint);
begin
  pFace := ReallocFace(NewCapacity);
  fFaceCount := NewCapacity;
end;

procedure TDicomContourValue.SetVertCount(NewCapacity: Longint);
begin
  pVertex := ReallocVertex(NewCapacity);
  fVertCount := NewCapacity;
end;

const
  MemoryDelta = $8000; { Must be a power of 2 }

function TDicomContourValue.ReallocVertex(var NewCapacity: Integer): Pointer;
begin
  if (NewCapacity > 0) and (NewCapacity <> fVertCount) then
    NewCapacity := (NewCapacity + (MemoryDelta - 1)) and not (MemoryDelta - 1);
  Result := pVertex;
  if NewCapacity <> fVertCount then
  begin
    if NewCapacity = 0 then
    begin
      {$IFDEF MSWINDOWS}
      GlobalFreePtr(pVertex);
      {$ELSE}
      FreeMem(pVertex);
      {$ENDIF}
      Result := nil;
    end
    else
    begin
      {$IFNDEF LINUX}
      if fFaceCount = 0 then
        Result := GlobalAllocPtr(HeapAllocFlags, NewCapacity * sizeof(GLFloat))
      else
        Result := GlobalReallocPtr(pVertex, NewCapacity * sizeof(GLFloat), HeapAllocFlags);
      {$ELSE}
      if Capacity = 0 then
        GetMem(Result, NewCapacity * sizeof(GLFloat))
      else
        ReallocMem(Result, NewCapacity * sizeof(GLFloat));
      {$ENDIF}
      if Result = nil then
        raise EStreamError.Create('Out of Memory Error');
    end;
  end;
end;

function TDicomContourValue.ReallocFace(var NewCapacity: Longint): Pointer;
begin
  if (NewCapacity > 0) and (NewCapacity <> fFaceCount) then
    NewCapacity := (NewCapacity + (MemoryDelta - 1)) and not (MemoryDelta - 1);
  Result := pFace;
  if NewCapacity <> fFaceCount then
  begin
    if NewCapacity = 0 then
    begin
      {$IFDEF MSWINDOWS}
      GlobalFreePtr(pFace);
      {$ELSE}
      FreeMem(pFace);
      {$ENDIF}
      Result := nil;
    end
    else
    begin
      {$IFNDEF LINUX}
      if fFaceCount = 0 then
        Result := GlobalAllocPtr(HeapAllocFlags, NewCapacity * sizeof(Integer))
      else
        Result := GlobalReallocPtr(pFace, NewCapacity * sizeof(Integer), HeapAllocFlags);
      {$ELSE}
      if Capacity = 0 then
        GetMem(Result, NewCapacity * sizeof(Integer))
      else
        ReallocMem(Result, NewCapacity * sizeof(Integer));
      {$ENDIF}
      if Result = nil then
        raise EStreamError.Create('Out of Memory Error');
    end;
  end;
end;

procedure TDicomContourValue.VARendering;
var
  blend: Boolean;
  stipple: Boolean;
  i: integer;
  p1: PGLFloat;
begin
  blend := fprop.m_Opacity < 1.0;
  stipple := fprop.m_LineStipplePattern <> $FFFF;

  fprop.setMaterial;

  glDisable(GL_TEXTURE_2D);
  glEnableClientState(GL_VERTEX_ARRAY); //启用顶点数组
  glEnableClientState(GL_NORMAL_ARRAY); //启用法向量数组
  glMatrixMode(GL_MODELVIEW);
  glPushMatrix;
  begin
    //模型的几何变换
    //glMultMatrixf(GetModelMatrix);

    if GetClipping then
    begin
      {mitkplane * aPlane = NULL;
      int count = 0;
      mitkList * planes = this.GetClippingPlanes();
      doubie equation[4];
      float nx, ny, nz, ox, oy, oz;

      planes.InitTraversal();
      while (count < 6) do
      begin
        aPlane.GetNormal(nx, ny, nz);
        aPlane.GetOrigin(ox.oy, oz);
        equation[0] = (double)nx;
        equation[1] = (double)ny;
        equation[2] = (double)nz;
        equation[3] = -(double)(nx * ox + ny * oy + nz * oz);
        giClipPlane(GL_CLIP_PLANEO + count, equation);
        glEnable(GL_CLIP_PLANEO + count);
        inc(count);
        aPlane = planes.GetNextItem();
      end;}
    end;

    case (fProp.RepresentationType) of
      MITK_MESH_POINTS:
        begin
          glDisable(GL_LIGHTING);

          //指定顶点数组并按顶点方式绘制
          glVertexPointer(3, GL_FLOAT, 6 * sizeof(GLFloat), VertexData);
          glDrawArrays(GL_POINTS, 0, VertexNumber);

        end;
      MITK_MESH_WIREFRAME:
        begin
          if (stipple) then
            glEnable(GL_LINE_STIPPLE)
          else
            glDisable(GL_LINE_STIPPLE);
          glDisable(GL_LIGHTING);
          glColor4fv(@fProp.m_EdgeColor[0]);

          //指定顶点数组并按素引方法绘制所有的边
          glVertexPointer(3, GL_FLOAT, 6 * sizeof(glfloat), VertexData);
          glDrawElements(GL_LINES, m_EdgeNum * 2, GL_UNSIGNED_INT, m_Edges);
          if (stipple) then
            glDisable(GL_LINE_STIPPLE);
        end;
      MITK_MESH_SURFACE:
        begin
          glEnable(GL_DEPTH_TEST);
          if (blend) then
          begin
            glEnable(GL_BLEND);
            glDepthMask(GL_FALSE);
          end;
          glEnable(GL_LIGHTING);
          glEnable(GL_NORMALIZE);
          if (fProp.IsClockwise) then
            glFrontFace(gl_cw);

          //指定顶点数组及法向量数组并按素引方法绘制所有三角片
          p1 := @VertexData[0];
          glVertexPointer(3, GL_FLOAT, 6 * sizeof(glfloat), p1);

          inc(p1, 3);
          glNormalPointer(GL_FLOAT, 6 * sizeof(glfloat), p1);

          glDrawElements(GL_TRIANGLES, FaceNumber * 3, GL_UNSIGNED_INT, FaceData);
          if (blend) then
            glDisable(GL_BLEND);
          if (fProp.IsClockwise) then
            glFrontFace(GL_CCW);
          if (blend) then
          begin
            glDisable(GL_BLEND);
            glDepthMask(GL_TRUE);
          end;
          glDisable(GL_NORMALIZE);
          glDisable(GL_LIGHTING);
          glDisable(GL_DEPTH_TEST);
        end;
    end;
  end;
  glDisableClientState(GL_VERTEX_ARRAY); //关闭顶点数组
  glDisableClientState(GL_NORMAL_ARRAY); //关闭法向量数组
  glPopmatrix;
end;

procedure TDicomContourValue.buildVBOs;
begin
  buildArrays;

  if (not m_VBOBuilt) then
  begin
    //创建VBO
    glGenBuffersARB(1, @m_VertVBO);
    glGenBuffersARB(1, @m_FaceVBO);
    glGenBuffersARB(1, @m_edgeVBO);
    m_VBOBuilt := true;
  end;

  //绑定顶点VBO对象并向显卡传送顶点数组数据
  glBindBufferARB(GL_ARRAY_BUFFER_ARB, m_VertVBO);
  glBufferDataARB(GL_ARRAY_BUFFER_ARB, VertexNumber * 6 * sizeof(GLFloat), VertexData,
    GL_STATIC_DRAW_ARB);

  //m_NormalReversed = mesh.IsNormalReversed();

  //绑定面表VBO对象并向显卡传送面表素引数据
  glBindBufferARB(GL_ELEMENT_ARRAY_BUFFER_ARB, m_FaceVBO);
  glBufferDataARB(GL_ELEMENT_ARRAY_BUFFER_ARB,
    FaceNumber * 3 * sizeof(Integer),
    FaceData, GL_STATIC_DRAW_ARB);

  //绑定边表VBO对象并向显卡传送边表素引数据
  glBindBufferARB(GL_ELEMENT_ARRAY_BUFFER_ARB, m_EdgeVBO);
  glBufferDataARB(GL_ELEMENT_ARRAY_BUFFER_ARB,
    m_EdgeNum * 2 * sizeof(Integer),
    m_Edges, GL_STATIC_DRAW_ARB);

  //因为数据均已传送到显卡显存，
  //所以临时申请的存放边表的系统内存可以释放了
  clearArrays;
end;

procedure TDicomContourValue.VBORerndering;
var
  Blend: Boolean;
  stipple: Boolean;
begin
  {//if (m_NormalReversed <> mesh.IsNormalReversed()) then
  begin
    //如果法线方向改变，则重新传送顶点数组数据
    glBindBufferARB(GL_ARRAY_BUFFER_ARB, m_VertVBO);
    glBufferdataARB(GL_ARRAY_BUFFER_ARB,
      VertexNumber * 6 * sizeof(glfloat),
      VertexData, GL_STATIC_DRAW_ARB);
    //m_NormalReversed = mesh.IsNormalReversed();
  end; }

  blend := fprop.m_Opacity < 1.0;
  stipple := fprop.m_LineStipplePattern <> $FFFF;

  fprop.setMaterial;

  glDisable(GL_TEXTURE_2D);
  glEnableclientstate(GL_VERTEX_ARRAY);
  glEnableClientState(GL_NORMAL_ARRAY);
  glMatrixMode(GL_MODELVIEW);
  glpushMatrix();
  begin
    //模型的几何变换
    //glMultMatrixf(GetModelMatrix);

    if (GetClipping) then
    begin
      {mitkplane * aplane = NULL;
      int count = 0;
      mitkList * aplanes = this.GetClippingPlanes();
      double equation[4];
      float nx, ny, nz, ox, oy, oz;

      //for (planes->InitTraversal();
      //       (aplene=planes.GetNextItem())
//        &&(count<6);
      begin
        aPlane.GetNormal(nx, ny, nz);
        aPlane.Getorigin(ox, oy, oz);
        equation[0] = (double)nx;
        equation[1] = (double)ny;
        equation[2] = (double)nz;
        equation[3] = -(double)(nx * ox + ny * oy + nz * oz);
        glClipPlane(GL_CLIP_PLANEO + count, equation);
        glEnable(GL_CLIP_PLANEO + count);
        inc(count);
      end;}
    end;

    case fProp.RepresentationType of
      MITK_MESH_POINTS:
        begin
          glDisable(GL_LIGHTING);

          //首先要绑定所需使用的VBO
          glBindBufferARB(GL_ARRAY_BUFFER_ARB, m_VertVBO);
          glVertexPointer(3, GL_FLOAT, 6 * sizeof(GLFloat), nil);
          glDrawArrays(GL_POINTS, 0, VertexNumber);
        end;
      MITK_MESH_WIREFRAME:
        begin
          if (stipple) then
            glEnable(GL_LINE_STIPPLE)
          else
            glDisable(GL_LINE_STIPPLE);
          glDisable(GL_LIGHTING);
          glColor4fv(@fprop.m_EdgeColor[0]);

          //首先要绑定所需使用的VBO
          //在指定顶点数组数据头指针时因为数据均已传送进显卡
          //所以只使用NULL（实际上表示了相对位移0）
          glBindBufferARB(GL_ARRAY_BUFFER_ARB, m_VertVBO);
          glVertexPointer(3, GL_FLOAT, 6 * sizeof(GLFloat), nil);
          glBindBufferARB(GL_ELEMENT_ARRAY_BUFFER_ARB, m_EdgeVBO);
          glDrawElements(GL_LINES, m_EdgeNum * 2, GL_UNSIGNED_INT, nil);

          if (stipple) then
            glDisable(GL_LINE_STIPPLE);
        end;
      MITK_MESH_SURFACE:
        begin
          glEnable(GL_DEPTH_TEST);
          if (blend) then
          begin
            glEnable(GL_BLEND);
            glDepthMask(GL_FALSE);
          end;

          glEnable(GL_LIGHTING);
          glEnable(GL_NORMALIZE);
          if (fprop.IsClockwise) then
            glFrontFace(GL_CW);

          //首先要绑定所需使用的VBO
          //因为顶点和法向量是放在一块存储的，
          //所以要指定两顶点数据之间的间隔6*sizeof(float),
          //并且在指定法向量数组头指针时，相对的从
          //（const void *）(3*sizeof(float))开始
          glBindBufferARB(GL_ARRAY_BUFFER_ARB, m_VertVBO);
          glVertexPointer(3, GL_FLOAT, 6 * sizeof(GLFloat), nil);
          glNormalPointer(GL_FLOAT, 6 * sizeof(GLFloat), Pointer(3 * sizeof(GLFloat)));
          glBindBufferARB(GL_ELEMENT_ARRAY_BUFFER_ARB, m_FaceVBO);
          glDrawElements(GL_TRIANGLES, FaceNumber * 3, GL_UNSIGNED_INT, nil);

          if (blend) then
            glDisable(GL_BLEND);
          if (fprop.IsClockwise) then
            glFrontFace(GL_CCW);
          if (blend) then
          begin
            glDisable(GL_BLEND);
            glDepthMask(GL_TRUE);
          end;
          glDisable(GL_NORMALIZE);
          glDisable(GL_LIGHTING);
          glDisable(GL_DEPTH_TEST);
        end;
    end;
  end;
  glDisableClientstate(GL_VERTEX_ARRAY);
  glDisableClientstate(GL_NORMAL_ARRAY);
  glPopMatrix;

end;

procedure TDicomContourValue.setBoundingBox(x1, x2, y1, y2, z1, z2: GLFloat);
begin
  fMin[0] := x1;
  fMin[1] := y1;
  fMin[2] := z1;
  fMax[0] := x2;
  fMax[1] := y2;
  fMax[2] := z2;
end;

procedure TDicomContourValue.GetBoundingBox(var x1, x2, y1, y2, z1,
  z2: GLFloat);
begin
  x1 := fMin[0];
  y1 := fMin[1];
  z1 := fMin[2];
  x2 := fMax[0];
  y2 := fMax[1];
  z2 := fMax[2];
end;

procedure TDicomContourValue.SetFaceNumber(Value: integer);
begin
  fFaceNumber := Value;
end;

procedure TDicomContourValue.SetVertexNumber(Value: Integer);
begin
  fVertexNumber := Value;
end;

procedure TDicomContourValue.STDRerndering;
var
  Blend: Boolean;
  stipple: Boolean;

begin
  //是否需要alpha融合(半透明显示)
  blend := fprop.m_Opacity < 1.0;
  //线框显示时是否采用点划方式
  stipple := fprop.m_LineStipplePattern <> $FFFF;

  fprop.setMaterial;

  //glDisable(GL_TEXTURE_2D);
  //glMatrixMode(GL_MODELVIEW);
  //glPushMatrix;
  begin
    //模型的几何变换
    //glMultMatrixf(GetModelMatrix);

    //如果附加裁剪平面被激活则设定裁剪平面
    if (GetClipping) then
    begin
      {mitkPlane * aPlane = NULL;
      int count = o;
      mitkList * planes = this - > GetClippingPlanes();
      double equation[4];
      float nx, ny, nz, ox, oy, oz;
      for (planes - > InitTraversal()
        (aPlane = (mitkPlane * )planes - > GetNextTem())
        &&(count < 6); )
      begin
        aPlane - > GetNormal(nx, ny, nz);
        aPlane - > GetOrigin(ox, oy, oz);
        equation[0] = (double)nx;
        equation[1] = (double)ny;
        equation[2] = (double)nz;
        equation[3] = -(double)(nx * ox + ny * oy + nz * oz);
        glClipPlane(GL_CLIP_PLANEO + count, equation);
        glEnable(GL_PLANEO + count);
        count + +;
      end; }
    end;

    //根据不同的显示方式绘制SurfaceModel
    case (fProp.fRepresentationType) of
      MITK_MESH_POINTS: //点显示   \
        begin
          glDisable(GL_LIGHTING);
          drawPoints;
        end;
      MITK_MESH_WIREFRAME: //线框显示
        begin
          if (stipple) then
            glEnable(GL_LINE_STIPPLE)
          else
            glDisable(GL_LINE_STIPPLE);
          glDisable(GL_LIGHTING);
          glColor4fv(@fProp.m_EdgeColor[0]);
          drawWireFrame;
          if (stipple) then
            glDisable(GL_LINE_STIPPLE);
        end;

      MITK_MESH_SURFACE: //面显示
        begin
          glEnable(GL_DEPTH_TEST);
          if (blend) then
          begin
            glEnable(GL_BLEND);
            glDepthMask(GL_FALSE);
          end;
          glEnable(GL_LIGHTING);
          glEnable(GL_NORMALIZE);
          if (fProp.IsClockwise) then
            glFrontFace(GL_CW);
          drawSurface;
          if (blend) then
            glDisable(GL_BLEND);
          if (fProp.IsClockwise) then
            glFrontFace(GL_CCW);
          if (blend) then
          begin
            glDisable(GL_BLEND);
            glDepthMask(GL_TRUE);
          end;
          glDisable(GL_NORMALIZE);
          glDisable(GL_LIGHTING);
          glDisable(GL_DEPTH_TEST);
        end;
    end;
  end;
  //glPopMatrix();
end;

function TDicomContourValue.GetModelMatrix: PGLFloat;
begin

end;

function TDicomContourValue.GetClipping: Boolean;
begin
  Result := false;
end;

{ TDicomSurfaceProperty }

constructor TDicomSurfaceProperty.Create;
begin
  fModified := true;
  IsClockwise := false;

  fRepresentationType := MITK_MESH_SURFACE;
  m_InterpolationType := MITK_SURFACE_FLAT;

  GetMem(m_Color, 4 * sizeof(GLFloat)); //表面颜色
  GetMem(m_AmbientColor, 4 * sizeof(GLFloat)); //环境光颜色

  GetMem(m_DiffuseColor, 4 * sizeof(GLFloat)); //散线光颜色
  GetMem(m_SpecularColor, 4 * sizeof(GLFloat)); //反光光颜色
  GetMem(m_EmissionColor, 4 * sizeof(GLFloat)); //发射光颜色
  GetMem(m_EdgeColor, 4 * sizeof(GLFloat)); //采用线框方式绘制时线框的颜色

  SetAmbientColor(0.75, 0.75, 0.75, 1);
  SetDiffuseColor(1.0, 0.57, 0.04, 1.0);
  SetSpecularColor(1.0, 1.0, 1.0, 1.0);
  SetEmissionColor(0.0, 0.0, 0.0, 0.0);
  m_SpecularPower := 100.0;
end;

destructor TDicomSurfaceProperty.Destroy;
begin
  FreeMem(m_Color);
  FreeMem(m_AmbientColor);

  FreeMem(m_DiffuseColor);
  FreeMem(m_SpecularColor);
  FreeMem(m_EmissionColor);
  FreeMem(m_EdgeColor);
  inherited;
end;

function TDicomSurfaceProperty.GetColor: PGLFloat;
var
  norm, total: GLFloat;
  i: integer;
begin
  total := m_Ambient + m_Diffuse + m_Specular + m_Emission;
  if (total > 0) then
  begin
    norm := norm + 1.0 / total;
  end
  else
  begin
    norm := norm + 1.0;
  end;
  for i := 0 to 3 do
  begin
    m_Color[i] := m_AmbientColor[i] * m_Ambient * norm
      + m_DiffuseColor[i] * m_Diffuse * norm
      + m_SpecularColor[i] * m_Specular * norm
      + m_EmissionColor[i] * m_Emission * norm;
  end;

  Result := @m_Color[0];
end;

procedure TDicomSurfaceProperty.SetAmbientColor(v1, v2, v3,
  v4: GLFloat);
var
  i: integer;
begin
  i := 0;
  m_AmbientColor[i] := v1;
  m_AmbientColor[i + 1] := v2;
  m_AmbientColor[i + 2] := v2;
  m_AmbientColor[i + 3] := v2;
  fModified := true;
end;

procedure TDicomSurfaceProperty.SetColor(v1, v2, v3, v4: GLFloat);
var
  i: integer;
begin
  i := 0;
  m_Color[i] := v1;
  m_Color[i + 1] := v2;
  m_Color[i + 2] := v2;
  m_Color[i + 3] := v2;
  fModified := true;
end;

procedure TDicomSurfaceProperty.SetDiffuseColor(v1, v2, v3,
  v4: GLFloat);
var
  i: integer;
begin
  i := 0;
  m_DiffuseColor[i] := v1;
  m_DiffuseColor[i + 1] := v2;
  m_DiffuseColor[i + 2] := v2;
  m_DiffuseColor[i + 3] := v2;
  fModified := true;
end;

procedure TDicomSurfaceProperty.SetEdgeColor(v1, v2, v3, v4: GLFloat);
var
  i: integer;
begin
  i := 0;
  m_EdgeColor[i] := v1;
  m_EdgeColor[i + 1] := v2;
  m_EdgeColor[i + 2] := v2;
  m_EdgeColor[i + 3] := v2;
  fModified := true;
end;

procedure TDicomSurfaceProperty.SetEmissionColor(v1, v2, v3,
  v4: GLFloat);
var
  i: integer;
begin
  i := 0;
  m_EmissionColor[i] := v1;
  m_EmissionColor[i + 1] := v2;
  m_EmissionColor[i + 2] := v2;
  m_EmissionColor[i + 3] := v2;
  fModified := true;
end;

procedure TDicomSurfaceProperty.SetSpecularColor(v1, v2, v3,
  v4: GLFloat);
var
  i: integer;
begin
  i := 0;
  m_SpecularColor[i] := v1;
  m_SpecularColor[i + 1] := v2;
  m_SpecularColor[i + 2] := v2;
  m_SpecularColor[i + 3] := v2;
  fModified := true;
end;

procedure TDicomSurfaceProperty.SetMaterial;
var
  method, face: GLenum;
begin
  if fModified then
  begin
    //设置插值方式
    case (m_InterpolationType) of
      MITK_SURFACE_FLAT:
        method := GL_FLAT;
      //MITK_SURFACE_GOURAUD:
      //  method := GL_SMOOTH;
    else
      method := GL_SMOOTH;
    end;
    glShadeModel(method);

    //点和线段的绘制属性设置
    glPointSize(m_PointSize);
    glLineWidth(m_LineWidth);
    glLineStipple(m_LineStippleRepeatFactor, m_LineStipplePattern);
    //表面材质属性设置
    face := GL_FRONT_AND_BACK;
    glMaterialfv(face, GL_AMBIENT, @m_AmbientColor[0]);
    glMaterialfv(face, GL_DIFFUSE, @m_DiffuseColor[0]);
    glMaterialfv(face, GL_SPECULAR, @m_SpecularColor[0]);
    glMaterialfv(face, GL_EMISSION, @m_EmissionColor[0]);
    glMaterialf(face, GL_SHININESS, m_SpecularPower);

    //设置Alpha融合运算方式(用于表面的半透明显示)
    glBlendFunc(GL_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    fModified := false;
  end;
end;

function TDicomMarchingCubes.Execute: Integer;
begin
  if fIsWord then
    ExecuteWord
  else
    ExecuteSmallint;
end;

end.

