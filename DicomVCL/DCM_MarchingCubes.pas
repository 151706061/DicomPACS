{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_MarchingCubes;

interface

uses
  Classes, SysUtils, windows, forms, controls, dialogs, graphics,
  DCM_Attributes, gl, glext, DCM_UID,DCM_Dict, DCM_MPR, DCM_Bitmap16;

const
  EdgeTable: array[0..255] of Integer = (
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
    $70C, $605, $50F, $406, $30A, $203, $109, $0);

  TriangleTable: array[0..255, 0..15] of Integer = (
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
    (-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1));

type
  TGLCoord = record
    X, Y, Z: glFLoat;
  end;

  TGridPoint = record
    P: TGLCoord;
    Value: integer; //glFLoat;
  end;
  PGridPoint = ^TGridPoint;

  TGridCube = record
    GridPoint: array[0..7] of TGridPoint;
  end;

  PTriangle = ^Triangle;
  Triangle = record
    point: array[0..2] of TGLCoord;
    //color: array[0..2] of glFloat;
    normal: array[0..2] of glFloat;
    next: PTriangle;
  end;

  TTriangleRA = array[0..0] of Triangle;
  PTriangleP = ^TTriangleRA;

  TMarchingCubes = class(TDicomMPRImage)
  private
    TriangleListHead, TriangleListPre, TriangleListTemp: PTriangle;

    {TrianglePtr: PTriangleP;
    TriangleCount: Integer;
    TrianglePos: Integer;}

    FLowThreshold: Integer;
    FHighThreshold: Integer;

    function Interpolate(const C1, C2: TGLCoord; Val1, Val2: glFloat): TGLCoord;
    procedure CreateCubeTriangles(const GridCube: TGridCube);
    procedure SetHighThreshold(const Value: Integer);
    procedure SetLowThreshold(const Value: Integer);

    procedure CreateTriangleListWord(Xf, Xend, Yf, Yend, Zf, Zend: integer); overload;
  public
    constructor Create(ADatasets: TDicomDatasets; ASeriesUID: string); override;
    destructor Destroy; override;

    //procedure CreateTriangleListFromBitmap(ImageList: TList; Xf, Xend, Yf, Yend, Zf, Zend:
    //  integer);

    procedure CreateTriangleList(Xf, Xend, Yf, Yend, Zf, Zend: integer); overload;
    procedure CreateTriangleList; overload;

    procedure ClearTriangleList;

    procedure DrawLightKind;
    procedure DrawSTD;
    procedure DrawVA;
    procedure DrawVBO;

    property HighThreshold: Integer read FHighThreshold write SetHighThreshold;
    property LowThreshold: Integer read FLowThreshold write SetLowThreshold;
  end;

implementation

uses SurfaceInProcessing;
(*
function ReallocFace(var NewCapacity: Longint): Pointer;
const
  MemoryDelta = $8000;
begin
  if (NewCapacity > 0) and (NewCapacity <> TriangleCount) then
    NewCapacity := (NewCapacity + (MemoryDelta - 1)) and not (MemoryDelta - 1);
  Result := TrianglePtr;
  if NewCapacity <> TriangleCount then
  begin
    if NewCapacity = 0 then
    begin
      {$IFDEF MSWINDOWS}
      GlobalFreePtr(TrianglePtr);
      {$ELSE}
      FreeMem(TrianglePtr);
      {$ENDIF}
      Result := nil;
    end
    else
    begin
      {$IFNDEF LINUX}
      if TriangleCount = 0 then
        Result := GlobalAllocPtr(HeapAllocFlags, NewCapacity * sizeof(Triangle))
      else
        Result := GlobalReallocPtr(TrianglePtr, NewCapacity * sizeof(Triangle), HeapAllocFlags);
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

procedure SetTriangleCount(NewCapacity: Longint);
begin
  TrianglePtr := ReallocFace(NewCapacity);
  TriangleCount := NewCapacity;
end;

function AddTriangle: PTriangle;
begin
  if TriangleCount < TrianglePos + 1 then
  begin
    SetTriangleCount(TrianglePos + 1);
  end;
  Result := @TrianglePtr[TrianglePos];
  inc(TrianglePos);
end;

*)
{------------------------------------------------------------------}
{                         计算得到截点坐标                         }
{------------------------------------------------------------------}

function TMarchingCubes.Interpolate(const C1, C2: TGLCoord; Val1, Val2: glFloat): TGLCoord;
var
  dv, dValMax1, dMaxVal2, dValMin1, dMinVal2: glFLoat;
begin
  dv := Val1 - Val2;
  dValMax1 := Val1 - HighThreshold;
  dMaxVal2 := HighThreshold - Val2;
  dValMin1 := Val1 - LowThreshold;
  dMinVal2 := LowThreshold - Val2;

  if (Val1 <= HighThreshold) and (Val1 >= LowThreshold) then
    if Val2 > HighThreshold then
    begin //1
      Result.X := (C2.X * dValMax1 + C1.X * dMaxVal2) / dv;
      Result.Y := (C2.Y * dValMax1 + C1.Y * dMaxVal2) / dv;
      Result.Z := (C2.Z * dValMax1 + C1.Z * dMaxVal2) / dv;
    end
    else
    begin //2
      Result.X := (C2.X * dValMin1 + C1.X * dMinVal2) / dv;
      Result.Y := (C2.Y * dValMin1 + C1.Y * dMinVal2) / dv;
      Result.Z := (C2.Z * dValMin1 + C1.Z * dMinVal2) / dv;
    end
  else
    if Val1 > HighThreshold then
  begin //3
    Result.X := (C2.X * dValMax1 + C1.X * dMaxVal2) / dv;
    Result.Y := (C2.Y * dValMax1 + C1.Y * dMaxVal2) / dv;
    Result.Z := (C2.Z * dValMax1 + C1.Z * dMaxVal2) / dv;
  end
  else
  begin //4
    Result.X := (C2.X * dValMin1 + C1.X * dMinVal2) / dv;
    Result.Y := (C2.Y * dValMin1 + C1.Y * dMinVal2) / dv;
    Result.Z := (C2.Z * dValMin1 + C1.Z * dMinVal2) / dv;
  end;

end;

{------------------------------------------------------------------}
{                          得到三角片法向量                        }
{------------------------------------------------------------------}

procedure GetNormal(var TriangleIn: Triangle);
var
  vi, vj, vk, wi, wj, wk, nr: glfloat;
  p1, p2, p3: TGLCoord;
begin
  p1 := TriangleIn.point[0];
  p2 := TriangleIn.point[1];
  p3 := TriangleIn.point[2];

  vi := p2.X - p1.X;
  vj := p2.Y - p1.Y;
  vk := p2.Z - p1.Z;
  wi := p3.X - p1.X;
  wj := p3.Y - p1.Y;
  wk := p3.Z - p1.Z;
  nr := sqrt((vj * wk - vk * wj) * (vj * wk - vk * wj) + (vk * wi - vi * wk) * (vk * wi - vi * wk)
    + (vi * wj - vj * wi) * (vi * wj - vj * wi));

  TriangleIn.Normal[0] := 0 - (vj * wk - vk * wj) / nr;
  TriangleIn.Normal[1] := 0 - (vk * wi - vi * wk) / nr;
  TriangleIn.Normal[2] := 0 - (vi * wj - vj * wi) / nr;
end;

{------------------------------------------------------------------}
{                     画出每个方格体内对应的三角片                 }
{------------------------------------------------------------------}

procedure TMarchingCubes.CreateCubeTriangles(const GridCube: TGridCube);
var
  I: Integer;
  //  C: glFloat;
  CubeIndex: Integer;
  VertList: array[0..11] of TGLCoord;
  TriangleListTemp: PTriangle;
begin

  CubeIndex := 0;
  if (GridCube.GridPoint[0].Value <= HighThreshold) and (GridCube.GridPoint[0].Value >=
    LowThreshold) then
    CubeIndex := CubeIndex or 1;
  if (GridCube.GridPoint[1].Value <= HighThreshold) and (GridCube.GridPoint[1].Value >=
    LowThreshold) then
    CubeIndex := CubeIndex or 2;
  if (GridCube.GridPoint[2].Value <= HighThreshold) and (GridCube.GridPoint[2].Value >=
    LowThreshold) then
    CubeIndex := CubeIndex or 4;
  if (GridCube.GridPoint[3].Value <= HighThreshold) and (GridCube.GridPoint[3].Value >=
    LowThreshold) then
    CubeIndex := CubeIndex or 8;
  if (GridCube.GridPoint[4].Value <= HighThreshold) and (GridCube.GridPoint[4].Value >=
    LowThreshold) then
    CubeIndex := CubeIndex or 16;
  if (GridCube.GridPoint[5].Value <= HighThreshold) and (GridCube.GridPoint[5].Value >=
    LowThreshold) then
    CubeIndex := CubeIndex or 32;
  if (GridCube.GridPoint[6].Value <= HighThreshold) and (GridCube.GridPoint[6].Value >=
    LowThreshold) then
    CubeIndex := CubeIndex or 64;
  if (GridCube.GridPoint[7].Value <= HighThreshold) and (GridCube.GridPoint[7].Value >=
    LowThreshold) then
    CubeIndex := CubeIndex or 128;
  //if (edgeTable[CubeIndex] = 0) then
  if (CubeIndex = 0) or (CubeIndex = 255) then
    Exit;
  with GridCube do
  begin
    if (edgeTable[CubeIndex] and 1) <> 0 then
      VertList[0] := Interpolate(GridPoint[0].P, GridPoint[1].P, GridPoint[0].Value,
        GridPoint[1].Value);
    if (edgeTable[CubeIndex] and 2) <> 0 then
      VertList[1] := Interpolate(GridPoint[1].P, GridPoint[2].P, GridPoint[1].Value,
        GridPoint[2].Value);
    if (edgeTable[CubeIndex] and 4) <> 0 then
      VertList[2] := Interpolate(GridPoint[2].P, GridPoint[3].P, GridPoint[2].Value,
        GridPoint[3].Value);
    if (edgeTable[CubeIndex] and 8) <> 0 then
      VertList[3] := Interpolate(GridPoint[3].P, GridPoint[0].P, GridPoint[3].Value,
        GridPoint[0].Value);
    if (edgeTable[CubeIndex] and 16) <> 0 then
      VertList[4] := Interpolate(GridPoint[4].P, GridPoint[5].P, GridPoint[4].Value,
        GridPoint[5].Value);
    if (edgeTable[CubeIndex] and 32) <> 0 then
      VertList[5] := Interpolate(GridPoint[5].P, GridPoint[6].P, GridPoint[5].Value,
        GridPoint[6].Value);
    if (edgeTable[CubeIndex] and 64) <> 0 then
      VertList[6] := Interpolate(GridPoint[6].P, GridPoint[7].P, GridPoint[6].Value,
        GridPoint[7].Value);
    if (edgeTable[CubeIndex] and 128) <> 0 then
      VertList[7] := Interpolate(GridPoint[7].P, GridPoint[4].P, GridPoint[7].Value,
        GridPoint[4].Value);
    if (edgeTable[CubeIndex] and 256) <> 0 then
      VertList[8] := Interpolate(GridPoint[0].P, GridPoint[4].P, GridPoint[0].Value,
        GridPoint[4].Value);
    if (edgeTable[CubeIndex] and 512) <> 0 then
      VertList[9] := Interpolate(GridPoint[1].P, GridPoint[5].P, GridPoint[1].Value,
        GridPoint[5].Value);
    if (edgeTable[CubeIndex] and 1024) <> 0 then
      VertList[10] := Interpolate(GridPoint[2].P, GridPoint[6].P, GridPoint[2].Value,
        GridPoint[6].Value);
    if (edgeTable[CubeIndex] and 2048) <> 0 then
      VertList[11] := Interpolate(GridPoint[3].P, GridPoint[7].P, GridPoint[3].Value,
        GridPoint[7].Value);
  end;
  I := 0;
  while TriangleTable[CubeIndex, i] <> -1 do
  begin

    if TriangleListHead = nil then
    begin
      new(TriangleListTemp);
      TriangleListTemp^.point[0] := VertList[TriangleTable[CubeIndex][i]];
      TriangleListTemp^.point[1] := VertList[TriangleTable[CubeIndex][i + 1]];
      TriangleListTemp^.point[2] := VertList[TriangleTable[CubeIndex][i + 2]];
      GetNormal(TriangleListTemp^);
      TriangleListHead := TriangleListTemp;
      TriangleListPre := TriangleListHead;

    end
    else
    begin
      new(TriangleListTemp);

      TriangleListTemp^.point[0] := VertList[TriangleTable[CubeIndex][i]];
      TriangleListTemp^.point[1] := VertList[TriangleTable[CubeIndex][i + 1]];
      TriangleListTemp^.point[2] := VertList[TriangleTable[CubeIndex][i + 2]];

      GetNormal(TriangleListTemp^);

      TriangleListPre^.next := TriangleListTemp;
      TriangleListPre := TriangleListTemp;
    end;

    {TriangleListTemp := AddTriangle;
    TriangleListTemp^.point[0] := VertList[TriangleTable[CubeIndex][i]];
    TriangleListTemp^.point[1] := VertList[TriangleTable[CubeIndex][i + 1]];
    TriangleListTemp^.point[2] := VertList[TriangleTable[CubeIndex][i + 2]];
    GetNormal(TriangleListTemp^);}

    Inc(i, 3);
  end;
end;

{------------------------------------------------------------------}
{                        所有三角片入列                            }
{------------------------------------------------------------------}
(*
procedure TMarchingCubes.CreateTriangleListFromBitmap(ImageList: TList; Xf, Xend, Yf, Yend,
  Zf, Zend: integer);
var
  cx, cy, cz: Integer;
  Cube: TGridCube;
  p1: PByteArray;
  SlicePage1: TBitmap;
  SlicePage2: TBitmap;
  f1x, f1y, f1z: glFLoat;
  f2x, f2y, f2z: glFLoat;

  GridSizeY, GridSizeX, GridSizeZ: Integer;

  frm1: TRenderingProcessBarForm;
begin
  {  TrianglePos := 0;
    TriangleCount := 0;
    TrianglePtr := nil;}
  if ImageList.Count > 0 then
  begin
    frm1 := TRenderingProcessBarForm.Create(nil);
    try
      frm1.Caption := 'Create Triangle List';
      frm1.Show;
      frm1.ProgressBar1.Max := ImageList.Count;
      SlicePage1 := TBitmap(ImageList[0]);

      GridSizeY := ImageList.Count;
      GridSizeX := SlicePage1.Width;
      GridSizeZ := SlicePage1.Height;

      for cy := Yf to Yend - 1 do
      begin

        frm1.ProgressBar1.Position := cy;
        frm1.ProgressBar1.Update;
        frm1.Label1.Caption := Format('%d/%d', [cy, yend]);
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

        f1Y := 1 - 2 * cy / GridSizeY; // grid from -1 to 1
        f2Y := 1 - 2 * (cy + 1) / GridSizeY; // grid from -1 to 1

        SlicePage1 := TBitmap(ImageList[cy]);
        SlicePage2 := TBitmap(ImageList[cy + 1]);
        for cz := Zf to Zend - 1 do
        begin
          f1Z := 2 * cz / GridSizeZ - 1; // grid from -1 to 1
          f2Z := 2 * (cz + 1) / GridSizeZ - 1; // grid from -1 to 1

          for cx := Xf to Xend - 1 do
          begin
            f1X := 2 * cx / GridSizeX - 1; // grid from -1 to 1
            f2X := 2 * (cx + 1) / GridSizeX - 1; // grid from -1 to 1

            p1 := SlicePage1.ScanLine[cz];
            with Cube.GridPoint[0] do //:= @Grid[cx, cy, cz];
            begin
              P.X := f1x;
              P.Y := f1y;
              P.Z := f1z;

              Value := (p1[cx]);
            end;
            with Cube.GridPoint[1] do //:= @Grid[cx + 1, cy, cz];
            begin
              P.X := f2x;
              P.Y := f1y;
              P.Z := f1z;

              //p1 := SlicePage1.ScanLine[(cz)];
              Value := (p1[(cx + 1)]);
            end;

            p1 := SlicePage1.ScanLine[(cz + 1)];
            with Cube.GridPoint[2] do //:= @Grid[cx + 1, cy, cz + 1];
            begin
              P.X := f2x;
              P.Y := f1y;
              P.Z := f2z;

              Value := (p1[(cx + 1)]);
            end;
            with Cube.GridPoint[3] do //:= @Grid[cx, cy, cz + 1];
            begin
              P.X := f1x;
              P.Y := f1y;
              P.Z := f2z;

              //p1 := SlicePage1.ScanLine[(cz + 1)];
              Value := (p1[(cx)]);
            end;

            p1 := SlicePage2.ScanLine[(cz)];
            with Cube.GridPoint[4] do //:= @Grid[cx, cy + 1, cz];
            begin
              P.X := f1x;
              P.Y := f2y;
              P.Z := f1z;

              Value := (p1[(cx)]);
            end;
            with Cube.GridPoint[5] do //:= @Grid[cx + 1, cy + 1, cz];
            begin
              P.X := f2x;
              P.Y := f2y;
              P.Z := f1z;

              //p1 := SlicePage2.ScanLine[(cz)];
              Value := (p1[(cx + 1)]);
            end;

            p1 := SlicePage2.ScanLine[(cz + 1)];
            with Cube.GridPoint[6] do //:= @Grid[cx + 1, cy + 1, cz + 1];
            begin
              P.X := f2x;
              P.Y := f2y;
              P.Z := f2z;

              Value := (p1[(cx + 1)]);
            end;
            with Cube.GridPoint[7] do //:= @Grid[cx, cy + 1, cz + 1];
            begin
              P.X := f1x;
              P.Y := f2y;
              P.Z := f2z;

              //p1 := SlicePage2.ScanLine[(cz + 1)];
              Value := (p1[(cx)]);
            end;

            CreateCubeTriangles(Cube);
          end;
        end;
      end;
    finally
      frm1.Free;
    end;
  end;
end;  *)

procedure TMarchingCubes.DrawSTD;
begin
  if TriangleListHead <> nil then
  begin
    TriangleListTemp := TriangleListHead;
    while TriangleListTemp <> nil do
    begin
      glBegin(GL_TRIANGLES);
      glNormal3f((TriangleListTemp^.Normal[0]), (TriangleListTemp^.Normal[1]), (TriangleListTemp^.Normal[2]));
      //glNormal3f(TriangleListTemp^.point[0].x, TriangleListTemp^.point[0].y,
      //  TriangleListTemp^.point[0].z);
      glVertex3f(TriangleListTemp^.point[0].x, TriangleListTemp^.point[0].y,
        TriangleListTemp^.point[0].z);
      glNormal3f((TriangleListTemp^.Normal[0]), (TriangleListTemp^.Normal[1]), (TriangleListTemp^.Normal[2]));
      //glNormal3f((TriangleListTemp^.point[1].x), (TriangleListTemp^.point[1].y),
      //  (TriangleListTemp^.point[1].z));
      glVertex3f(TriangleListTemp^.point[1].x, TriangleListTemp^.point[1].y,
        TriangleListTemp^.point[1].z);
      glNormal3f((TriangleListTemp^.Normal[0]), (TriangleListTemp^.Normal[1]), (TriangleListTemp^.Normal[2]));
      //glNormal3f((TriangleListTemp^.point[2].x), (TriangleListTemp^.point[2].y),
      //  (TriangleListTemp^.point[2].z));
      glVertex3f(TriangleListTemp^.point[2].x, TriangleListTemp^.point[2].y,
        TriangleListTemp^.point[2].z);
      glEnd;
      TriangleListTemp := TriangleListTemp^.next;
    end;
  end;
end;

procedure TMarchingCubes.DrawLightKind;
begin
  if TriangleListHead <> nil then
  begin
    TriangleListTemp := TriangleListHead;
    while TriangleListTemp <> nil do
    begin
      glBegin(GL_TRIANGLES);
      glNormal3fv(@(TriangleListTemp^.Normal));
      glVertex3f(TriangleListTemp^.point[0].x, TriangleListTemp^.point[0].y,
        TriangleListTemp^.point[0].z);
      glVertex3f(TriangleListTemp^.point[1].x, TriangleListTemp^.point[1].y,
        TriangleListTemp^.point[1].z);
      glVertex3f(TriangleListTemp^.point[2].x, TriangleListTemp^.point[2].y,
        TriangleListTemp^.point[2].z);
      glEnd;
      TriangleListTemp := TriangleListTemp^.next;
    end;
  end;
end;

procedure TMarchingCubes.SetHighThreshold(const Value: Integer);
begin
  FHighThreshold := Value;
end;

procedure TMarchingCubes.SetLowThreshold(const Value: Integer);
begin
  FLowThreshold := Value;
end;

constructor TMarchingCubes.Create(ADatasets: TDicomDatasets;
  ASeriesUID: string);
begin
  inherited Create(ADatasets, ASeriesUID);

  TriangleListHead := nil;
  TriangleListPre := nil;
  TriangleListTemp := nil;

  FLowThreshold := 200;
  FHighThreshold := 250;
end;

destructor TMarchingCubes.Destroy;
begin
  ClearTriangleList;
  inherited;
end;

procedure TMarchingCubes.ClearTriangleList;
var
  p1, p2: PTriangle;
begin
  if TriangleListHead <> nil then
  begin
    p1 := TriangleListHead;
    while p1 <> nil do
    begin
      p2 := p1^.next;

      FreeMem(p1);
      P1 := P2;
    end;
    TriangleListHead := nil;
    TriangleListPre := nil;
    TriangleListTemp := nil;
  end;
end;

procedure TMarchingCubes.DrawVA;
begin
  if TriangleListHead <> nil then
  begin

  end;
end;

procedure TMarchingCubes.DrawVBO;
begin
  if TriangleListHead <> nil then
  begin

  end;
end;

procedure TMarchingCubes.CreateTriangleList(Xf, Xend, Yf, Yend, Zf,
  Zend: integer);
var
  pSliceA: SmallP;
  pSliceB: SmallP;

  cx, cy, cz: Integer;
  Cube: TGridCube;
  f1x, f1y, f1z: glFLoat;
  f2x, f2y, f2z: glFLoat;

  //  z1: glFloat;

  GridSizeY, GridSizeX, GridSizeZ: Integer;

  frm1: TRenderingProcessBarForm;
begin
  ClearTriangleList;

  if FPlanarConfiguration = 0 then
    CreateTriangleListWord(Xf, Xend, Yf, Yend, Zf, Zend)
  else
    if sliceNumber > 0 then
  begin
    frm1 := TRenderingProcessBarForm.Create(nil);
    try
      frm1.Caption := 'Create Triangle List';
      frm1.Show;
      frm1.ProgressBar1.Max := sliceNumber;

      //z1 := XSpace / ZSpace;
      GridSizeY := sliceNumber;
      GridSizeX := imageWidth;
      GridSizeZ := imageHeight;

      for cy := Yf to Yend - 1 do
      begin

        frm1.ProgressBar1.Position := cy;
        frm1.ProgressBar1.Update;
        frm1.Label1.Caption := Format('%d/%d', [cy, yend]);
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

        f1Y := cy * ZSpace; //1 - 2 * cy / GridSizeY * z1; // grid from -1 to 1
        f2Y := (cy + 1) * ZSpace; //1 - 2 * (cy + 1) / GridSizeY * z1; // grid from -1 to 1

        pSliceA := GetImageData(cy).ImageData[0].Data;
        pSliceB := GetImageData(cy + 1).ImageData[0].Data;

        for cz := Zf to Zend - 1 do
        begin
          f1Z := cz * YSpace; //2 * cz / GridSizeZ - 1; // grid from -1 to 1
          f2Z := (cz + 1) * YSpace; //2 * (cz + 1) / GridSizeZ - 1; // grid from -1 to 1

          for cx := Xf to Xend - 1 do
          begin
            f1X := cx * XSpace; //2 * cx / GridSizeX - 1; // grid from -1 to 1
            f2X := (cx + 1) * XSpace; //2 * (cx + 1) / GridSizeX - 1; // grid from -1 to 1

            //p1 := SlicePage1.ScanLine[cz];
            with Cube.GridPoint[0] do //:= @Grid[cx, cy, cz];
            begin
              P.X := f1x;
              P.Y := f1y;
              P.Z := f1z;

              Value := (pSliceA[cz * ImageWidth + cx]);
            end;
            with Cube.GridPoint[1] do //:= @Grid[cx + 1, cy, cz];
            begin
              P.X := f2x;
              P.Y := f1y;
              P.Z := f1z;

              //p1 := SlicePage1.ScanLine[(cz)];
              Value := (pSliceA[(cz * ImageWidth + cx + 1)]);
            end;

            //p1 := SlicePage1.ScanLine[(cz + 1)];
            with Cube.GridPoint[2] do //:= @Grid[cx + 1, cy, cz + 1];
            begin
              P.X := f2x;
              P.Y := f1y;
              P.Z := f2z;

              Value := (pSliceA[(cz + 1) * ImageWidth + (cx + 1)]);
            end;
            with Cube.GridPoint[3] do //:= @Grid[cx, cy, cz + 1];
            begin
              P.X := f1x;
              P.Y := f1y;
              P.Z := f2z;

              //p1 := SlicePage1.ScanLine[(cz + 1)];
              Value := (pSliceA[(cz + 1) * ImageWidth + (cx)]);
            end;

            //p1 := SlicePage2.ScanLine[(cz)];
            with Cube.GridPoint[4] do //:= @Grid[cx, cy + 1, cz];
            begin
              P.X := f1x;
              P.Y := f2y;
              P.Z := f1z;

              Value := (pSliceB[(cz) * ImageWidth + (cx)]);
            end;
            with Cube.GridPoint[5] do //:= @Grid[cx + 1, cy + 1, cz];
            begin
              P.X := f2x;
              P.Y := f2y;
              P.Z := f1z;

              //p1 := SlicePage2.ScanLine[(cz)];
              Value := (pSliceB[(cz) * ImageWidth + (cx + 1)]);
            end;

            //p1 := SlicePage2.ScanLine[(cz + 1)];
            with Cube.GridPoint[6] do //:= @Grid[cx + 1, cy + 1, cz + 1];
            begin
              P.X := f2x;
              P.Y := f2y;
              P.Z := f2z;

              Value := (pSliceB[(cz + 1) * ImageWidth + (cx + 1)]);
            end;
            with Cube.GridPoint[7] do //:= @Grid[cx, cy + 1, cz + 1];
            begin
              P.X := f1x;
              P.Y := f2y;
              P.Z := f2z;

              //p1 := SlicePage2.ScanLine[(cz + 1)];
              Value := (pSliceB[(cz + 1) * ImageWidth + (cx)]);
            end;

            CreateCubeTriangles(Cube);
          end;
        end;
      end;
    finally
      frm1.Free;
    end;
  end;
end;

procedure TMarchingCubes.CreateTriangleList;
begin
  CreateTriangleList(0, ImageWidth - 1, 0, sliceNumber - 1, 0, ImageHeight);
end;

procedure TMarchingCubes.CreateTriangleListWord(Xf, Xend, Yf, Yend, Zf,
  Zend: integer);
var
  pSliceA: WordP;
  pSliceB: WordP;

  cx, cy, cz: Integer;
  Cube: TGridCube;
  f1x, f1y, f1z: glFLoat;
  f2x, f2y, f2z: glFLoat;

  GridSizeY, GridSizeX, GridSizeZ: Integer;

  frm1: TRenderingProcessBarForm;
begin
  if sliceNumber > 0 then
  begin
    frm1 := TRenderingProcessBarForm.Create(nil);
    try
      frm1.Caption := 'Create Triangle List';
      frm1.Show;
      frm1.ProgressBar1.Max := sliceNumber;

      GridSizeY := sliceNumber;
      GridSizeX := imageWidth;
      GridSizeZ := imageHeight;

      for cy := Yf to Yend - 1 do
      begin

        frm1.ProgressBar1.Position := cy;
        frm1.ProgressBar1.Update;
        frm1.Label1.Caption := Format('%d/%d', [cy, yend]);
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

        //f1Y := 1 - 2 * cy / GridSizeY ; // grid from -1 to 1
        //f2Y := 1 - 2 * (cy + 1) / GridSizeY ; // grid from -1 to 1

        f1Y := cy * ZSpace;
        f2Y := (cy + 1) * ZSpace;

        pSliceA := GetImageData(cy).ImageData[0].Data;
        pSliceB := GetImageData(cy + 1).ImageData[0].Data;

        for cz := Zf to Zend - 1 do
        begin
          //f1Z := 2 * cz / GridSizeZ - 1; // grid from -1 to 1
          //f2Z := 2 * (cz + 1) / GridSizeZ - 1; // grid from -1 to 1

          f1Z := cz * YSpace; // grid from -1 to 1
          f2Z := (cz + 1) * YSpace; // grid from -1 to 1

          for cx := Xf to Xend - 1 do
          begin
            //f1X := 2 * cx / GridSizeX - 1; // grid from -1 to 1
            //f2X := 2 * (cx + 1) / GridSizeX - 1; // grid from -1 to 1

            f1X := cx * XSpace; // grid from -1 to 1
            f2X := (cx + 1) * XSpace; // grid from -1 to 1

            //p1 := SlicePage1.ScanLine[cz];
            with Cube.GridPoint[0] do //:= @Grid[cx, cy, cz];
            begin
              P.X := f1x;
              P.Y := f1y;
              P.Z := f1z;

              Value := (pSliceA[cz * ImageWidth + cx]);
            end;
            with Cube.GridPoint[1] do //:= @Grid[cx + 1, cy, cz];
            begin
              P.X := f2x;
              P.Y := f1y;
              P.Z := f1z;

              //p1 := SlicePage1.ScanLine[(cz)];
              Value := (pSliceA[(cz * ImageWidth + cx + 1)]);
            end;

            //p1 := SlicePage1.ScanLine[(cz + 1)];
            with Cube.GridPoint[2] do //:= @Grid[cx + 1, cy, cz + 1];
            begin
              P.X := f2x;
              P.Y := f1y;
              P.Z := f2z;

              Value := (pSliceA[(cz + 1) * ImageWidth + (cx + 1)]);
            end;
            with Cube.GridPoint[3] do //:= @Grid[cx, cy, cz + 1];
            begin
              P.X := f1x;
              P.Y := f1y;
              P.Z := f2z;

              //p1 := SlicePage1.ScanLine[(cz + 1)];
              Value := (pSliceA[(cz + 1) * ImageWidth + (cx)]);
            end;

            //p1 := SlicePage2.ScanLine[(cz)];
            with Cube.GridPoint[4] do //:= @Grid[cx, cy + 1, cz];
            begin
              P.X := f1x;
              P.Y := f2y;
              P.Z := f1z;

              Value := (pSliceB[(cz) * ImageWidth + (cx)]);
            end;
            with Cube.GridPoint[5] do //:= @Grid[cx + 1, cy + 1, cz];
            begin
              P.X := f2x;
              P.Y := f2y;
              P.Z := f1z;

              //p1 := SlicePage2.ScanLine[(cz)];
              Value := (pSliceB[(cz) * ImageWidth + (cx + 1)]);
            end;

            //p1 := SlicePage2.ScanLine[(cz + 1)];
            with Cube.GridPoint[6] do //:= @Grid[cx + 1, cy + 1, cz + 1];
            begin
              P.X := f2x;
              P.Y := f2y;
              P.Z := f2z;

              Value := (pSliceB[(cz + 1) * ImageWidth + (cx + 1)]);
            end;
            with Cube.GridPoint[7] do //:= @Grid[cx, cy + 1, cz + 1];
            begin
              P.X := f1x;
              P.Y := f2y;
              P.Z := f2z;

              //p1 := SlicePage2.ScanLine[(cz + 1)];
              Value := (pSliceB[(cz + 1) * ImageWidth + (cx)]);
            end;

            CreateCubeTriangles(Cube);
          end;
        end;
      end;
    finally
      frm1.Free;
    end;
  end;
end;

end.

