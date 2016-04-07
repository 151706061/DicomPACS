{******************************************************************************}
{                                                       	               }
{       Borland Delphi Runtime Library                  		       }
{       OpenGL interface unit                                                  }
{                                                       	               }
{                                                       	               }
{ This is an interface unit for the use of OpenGL from within Delphi and Kylix.}
{ It contains the translations of gl.h, glu.h, glx.h as well as context        }
{ and extension management functions.                                          }
{                                                                              }
{ The original Pascal code is: OpenGL12.pas 	                               }
{ The initial developer of the Pascal code is Mike Lischke                     }
{                                                                              }
{ 									       }
{ Portions created by Microsoft are 					       }
{ Copyright (C) 1995-2001 Microsoft Corporation. 			       }
{ All Rights Reserved. 							       }
{ 									       }
{ Portions created by Silicon Graphics Incorporated are 		       }
{ Copyright (C) 1995-2001 Silicon Graphics Incorporated 		       }
{ All Rights Reserved. 							       }
{ 									       }
{ Portions created by NVidia are                        		       }
{ Copyright (C) 1995-2001 NVidia 		                               }
{ All Rights Reserved. 							       }
{ 									       }
{ Portions created by Brian Paul                       		               }
{ Copyright (C) 1995-2001 Brian Paul 		                               }
{ All Rights Reserved. 							       }
{ 									       }
{ 									       }
{ The original file is: gl.h                                                   }
{ The original file is: glut.h                                                 }
{ The original file is: glx.h                                                  }
{ The original file is: glx.h                                                  }
{ 									       }
{ Portions created by Mike Lischke are    				       }
{ Copyright (C) 2001 Mike Lischke. 					       }
{ 									       }
{ Portions created by John O'Harrow are    				       }
{ Copyright (C) 2001 John O'Harrow. 					       }
{                                                                              }
{ Portions created by Eric Grange are    				       }
{ Copyright (C) 2001 Eric Grange. 					       }
{                                                                              }
{ Portions created by Olivier Chatelain    				       }
{ Copyright (C) 2001 Olivier Chatelain. 				       }
{                                                                              }
{ Portions created by Tom Nuydens            				       }
{ Copyright (C) 2001 Tom Nuydens.       				       }
{                                                                              }
{ Portions created by Matthias Thoma are    				       }
{ Copyright (C) 2001 Matthias Thoma. 					       }
{                                                                              }
{ Portions created by Sven Bobrowski are    				       }
{ Copyright (C) 2001 Sven Bobrowski 					       }
{                                                                              }
{ Portions created by Eugene Kryukov are    				       }
{ Copyright (C) 2001 Eugene Kryukov 					       }
{                                                                              }
{       Obtained through:                               		       }
{ 									       }
{       Joint Endeavour of Delphi Innovators (Project JEDI)                    }
{									       }
{ You may retrieve the latest version of this file at the Project              }
{ JEDI home page, located at http://delphi-jedi.org                            }
{									       }
{ The contents of this file are used with permission, subject to               }
{ the Mozilla Public License Version 1.1 (the "License"); you may              }
{ not use this file except in compliance with the License. You may             }
{ obtain a copy of the License at                                              }
{ http://www.mozilla.org/MPL/MPL-1.1.html 	                               }
{ 									       }
{ Software distributed under the License is distributed on an 	               }
{ "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or               }
{ implied. See the License for the specific language governing                 }
{ rights and limitations under the License. 				       }
{ 									       }
{******************************************************************************}

{.$define MULTITHREADOPENGL}

{$IFDEF fpc}
type
  UINT = cuint;
{$ENDIF}

const
  INVALID_MODULEHANDLE = 0;

type
  TVector2d = array[0..1] of double;
  TVector2f = array[0..1] of single;
  TVector2i = array[0..1] of longint;
  TVector2s = array[0..1] of smallint;
  TVector2b = array[0..1] of byte;
  TVector2e = array[0..1] of Extended;
  TVector2w = array[0..1] of Word;
  TVector2p = array[0..1] of Pointer;

  TVector3d = array[0..2] of double;
  TVector3f = array[0..2] of single;
  TVector3i = array[0..2] of longint;
  TVector3s = array[0..2] of smallint;
  TVector3b = array[0..2] of byte;
  TVector3e = array[0..2] of Extended;
  TVector3w = array[0..2] of Word;
  TVector3p = array[0..2] of Pointer;

  TVector4d = array[0..3] of double;
  TVector4f = array[0..3] of single;
  TVector4i = array[0..3] of longint;
  TVector4s = array[0..3] of smallint;
  TVector4b = array[0..3] of byte;
  TVector4e = array[0..3] of Extended;
  TVector4w = array[0..3] of Word;
  TVector4p = array[0..3] of Pointer;

  TMatrix2d = array[0..1] of TVector2d;
  TMatrix2f = array[0..1] of TVector2f;
  TMatrix2i = array[0..1] of TVector2i;
  TMatrix2s = array[0..1] of TVector2s;
  TMatrix2b = array[0..1] of TVector2b;
  TMatrix2e = array[0..1] of TVector2e;
  TMatrix2w = array[0..1] of TVector2w;
  TMatrix2p = array[0..1] of TVector2p;

  TMatrix3d = array[0..2] of TVector3d;
  TMatrix3f = array[0..2] of TVector3f;
  TMatrix3i = array[0..2] of TVector3i;
  TMatrix3s = array[0..2] of TVector3s;
  TMatrix3b = array[0..2] of TVector3b;
  TMatrix3e = array[0..2] of TVector3e;
  TMatrix3w = array[0..2] of TVector3w;
  TMatrix3p = array[0..2] of TVector3p;

  TMatrix4d = array[0..3] of TVector4d;
  TMatrix4f = array[0..3] of TVector4f;
  TMatrix4i = array[0..3] of TVector4i;
  TMatrix4s = array[0..3] of TVector4s;
  TMatrix4b = array[0..3] of TVector4b;
  TMatrix4e = array[0..3] of TVector4e;
  TMatrix4w = array[0..3] of TVector4w;
  TMatrix4p = array[0..3] of TVector4p;

  TD3DVector = packed record
    case Integer of
      0 : (X: single;
           Y: single;
           Z: single);
      1 : (V: TVector3f);
  end;

  TD3DMatrix = packed record
    case Integer of
      0 : (_11, _12, _13, _14: single;
           _21, _22, _23, _24: single;
           _31, _32, _33, _34: single;
           _41, _42, _43, _44: single);
      1 : (M : TMatrix4f);
  end;

type
   TRCOptions = set of (
      opDoubleBuffered,
      opGDI,
      opStereo
   );

   GLenum      = UINT;
   TGLenum     = UINT;
   PGLenum     = ^TGLenum;

   GLboolean   = BYTEBOOL;
   TGLboolean  = BYTEBOOL;
   PGLboolean  = ^TGLboolean;

   GLbitfield  = UINT;
   TGLbitfield = UINT;
   PGLbitfield = ^TGLbitfield;

   GLbyte      = ShortInt;
   TGLbyte     = ShortInt;
   PGLbyte     = ^TGLbyte;

   GLshort     = SmallInt;
   TGLshort    = SmallInt;
   PGLshort    = ^TGLshort;

   GLint       = Integer;
   TGLint      = Integer;
   PGLint      = ^Integer;

   GLsizei     = Integer;
   TGLsizei    = Integer;
   PGLsizei    = ^TGLsizei;

   GLubyte     = Byte;
   TGLubyte    = Byte;
   PGLubyte    = ^TGLubyte;

   GLushort    = Word;
   TGLushort   = Word;
   PGLushort   = ^TGLushort;

   GLuint      = UINT;
   TGLuint     = UINT;
   PGLuint     = ^TGLuint;

   GLfloat     = Single;
   TGLfloat    = Single;
   PGLfloat    = ^TGLfloat;

   GLclampf    = Single;
   TGLclampf   = Single;
   PGLclampf   = ^TGLclampf;

   GLdouble    = Double;
   TGLdouble   = Double;
   PGLdouble   = ^TGLdouble;

   GLclampd    = Double;
   TGLclampd   = Double;
   PGLclampd   = ^TGLclampd;

   GLhandleARB = Cardinal;
   PGLhandleARB = ^GLhandleARB;
   
   GLcharARB = Char;
   PGLcharARB = ^GLcharARB;
   
   GLchar = Char;
   PGLchar = Pchar;

   PGLPCharArray = ^PChar;

   PGLvoid = Pointer;

   PGLPointer = ^Pointer;

   // unix type
   {$IFDEF unix}
   GLXContext    = Pointer;
   GLXFBConfig   = Pointer;
   {$IFDEF fpc}
   GLXPixmap     = TXID;
   GLXDrawable   = TXID;
   // GLX 1.3 and later
   GLXFBConfigID = TXID;
   GLXContextID  = TXID;
   GLXWindow     = TXID;
   GLXPbuffer    = TXID;
   Pixmap = TPixmap;
   Font = TFont;
   Window = TWindow;
   Colormap = TColormap;
   {$ELSE}
   GLXPixmap     = XID;
   GLXDrawable   = XID;
   // GLX 1.3 and later
   GLXFBConfigID = XID;
   GLXContextID  = XID;
   GLXWindow     = XID;
   GLXPbuffer    = XID;
   {$ENDIF}
   {$ENDIF}

{$IFDEF MULTITHREADOPENGL}
threadvar
{$else}
var
{$ENDIF}
   GL_VERSION_1_0,
   GL_VERSION_1_1,
   GL_VERSION_1_2,
   GL_VERSION_1_3,
   GL_VERSION_1_4,
   GL_VERSION_1_5,
   GL_VERSION_2_0,
   GL_VERSION_2_1,
   GL_VERSION_2_2,
   
   GLU_VERSION_1_1,
   GLU_VERSION_1_2,
   GLU_VERSION_1_3: Boolean;

   // Extensions (gl)
   GL_3DFX_multisample,
   GL_3DFX_tbuffer,
   GL_3DFX_texture_compression_FXT1,

   GL_ARB_imaging,
   GL_ARB_multisample,
   GL_ARB_multitexture,
   GL_ARB_depth_texture,
   GL_ARB_shadow,
   GL_ARB_texture_border_clamp,
   GL_ARB_texture_compression,
   GL_ARB_texture_cube_map,
   GL_ARB_transpose_matrix,
   GL_ARB_vertex_blend,
   GL_ARB_point_parameters,
   GL_ARB_texture_env_combine,
   GL_ARB_texture_env_crossbar,
   GL_ARB_texture_env_dot3,
   GL_ARB_vertex_program,
   GL_ARB_vertex_buffer_object,
   GL_ARB_pixel_buffer_object,
   GL_ARB_shader_objects,
   GL_ARB_vertex_shader,
   GL_ARB_fragment_shader,
   GL_ARB_fragment_program,
   GL_ARB_texture_rectangle,

   GL_EXT_abgr,
   GL_EXT_bgra,
   GL_EXT_blend_color,
   GL_EXT_blend_func_separate,
   GL_EXT_blend_logic_op,
   GL_EXT_blend_minmax,
   GL_EXT_blend_subtract,
   GL_EXT_Cg_shader,
   GL_EXT_compiled_vertex_array,
   GL_EXT_copy_texture,
   GL_EXT_draw_range_elements,
   GL_EXT_fog_coord,
   GL_EXT_multi_draw_arrays,
   GL_EXT_multisample,
   GL_EXT_packed_pixels,
   GL_EXT_paletted_texture,
   GL_EXT_polygon_offset,
   GL_EXT_rescale_normal,
   GL_EXT_secondary_color,
   GL_EXT_separate_specular_color,
   GL_EXT_shared_texture_palette,
   GL_EXT_stencil_wrap,
   GL_EXT_stencil_two_side,
   GL_EXT_texture_compression_s3tc,
   GL_EXT_texture_cube_map,
   GL_EXT_texture_edge_clamp,
   GL_EXT_texture_env_add,
   GL_EXT_texture_env_combine,
   GL_EXT_texture_filter_anisotropic,
   GL_EXT_texture_lod_bias,
   GL_EXT_texture_object,
   GL_EXT_texture3D,
   GL_EXT_clip_volume_hint,
   GL_EXT_framebuffer_object,
   GL_EXT_texture_rectangle,
   GL_EXT_pixel_buffer_object,

   GL_HP_occlusion_test,

   GL_IBM_rasterpos_clip,

   GL_KTX_buffer_region,

   GL_MESA_resize_buffers,

   GL_NV_blend_square,
   GL_NV_fog_distance,
   GL_NV_light_max_exponent,
   GL_NV_register_combiners,
   GL_NV_texgen_reflection,
   GL_NV_texture_env_combine4,
   GL_NV_vertex_array_range,
   GL_NV_vertex_program,
   GL_NV_multisample_filter_hint,
   GL_NV_fence,
   GL_NV_occlusion_query,
   GL_NV_texture_rectangle,

   GL_ATI_texture_float,
   GL_ATI_draw_buffers,
   GL_ARB_draw_buffers,

   GL_SGI_color_matrix,

   GL_SGIS_generate_mipmap,
   GL_SGIS_multisample,
   GL_SGIS_texture_border_clamp,
   GL_SGIS_texture_color_mask,
   GL_SGIS_texture_edge_clamp,
   GL_SGIS_texture_lod,

   GL_SGIX_depth_texture,
   GL_SGIX_shadow,
   GL_SGIX_shadow_ambient,

   GL_WIN_swap_hint,
   GL_ARB_texture_float,
   GL_ARB_texture_non_power_of_two,

   // WGL Extensions ----------------------------
   WGL_EXT_swap_control,
   WGL_ARB_multisample,
   WGL_ARB_extensions_string,
   WGL_ARB_pixel_format,
   WGL_ARB_pbuffer,
   WGL_ARB_buffer_region,
   WGL_ATI_pixel_format_float,

   // Extensions (glu)
   GLU_EXT_Texture,
   GLU_EXT_object_space_tess,
   GLU_EXT_nurbs_tessellator: Boolean;

const

   // ********** GL generic constants **********

   // errors
   GL_NO_ERROR                                       = 0;
   GL_INVALID_ENUM                                   = $0500;
   GL_INVALID_VALUE                                  = $0501;
   GL_INVALID_OPERATION                              = $0502;
   GL_STACK_OVERFLOW                                 = $0503;
   GL_STACK_UNDERFLOW                                = $0504;
   GL_OUT_OF_MEMORY                                  = $0505;

   // attribute bits
   GL_CURRENT_BIT                                    = $00000001;
   GL_POINT_BIT                                      = $00000002;
   GL_LINE_BIT                                       = $00000004;
   GL_POLYGON_BIT                                    = $00000008;
   GL_POLYGON_STIPPLE_BIT                            = $00000010;
   GL_PIXEL_MODE_BIT                                 = $00000020;
   GL_LIGHTING_BIT                                   = $00000040;
   GL_FOG_BIT                                        = $00000080;
   GL_DEPTH_BUFFER_BIT                               = $00000100;
   GL_ACCUM_BUFFER_BIT                               = $00000200;
   GL_STENCIL_BUFFER_BIT                             = $00000400;
   GL_VIEWPORT_BIT                                   = $00000800;
   GL_TRANSFORM_BIT                                  = $00001000;
   GL_ENABLE_BIT                                     = $00002000;
   GL_COLOR_BUFFER_BIT                               = $00004000;
   GL_HINT_BIT                                       = $00008000;
   GL_EVAL_BIT                                       = $00010000;
   GL_LIST_BIT                                       = $00020000;
   GL_TEXTURE_BIT                                    = $00040000;
   GL_SCISSOR_BIT                                    = $00080000;
   GL_ALL_ATTRIB_BITS                                = $000FFFFF;

   // client attribute bits
   GL_CLIENT_PIXEL_STORE_BIT                         = $00000001;
   GL_CLIENT_VERTEX_ARRAY_BIT                        = $00000002;
   GL_CLIENT_ALL_ATTRIB_BITS                         = $FFFFFFFF;

   // boolean values
   GL_FALSE                                          = 0;
   GL_TRUE                                           = 1;

   // primitives
   GL_POINTS                                         = $0000;
   GL_LINES                                          = $0001;
   GL_LINE_LOOP                                      = $0002;
   GL_LINE_STRIP                                     = $0003;
   GL_TRIANGLES                                      = $0004;
   GL_TRIANGLE_STRIP                                 = $0005;
   GL_TRIANGLE_FAN                                   = $0006;
   GL_QUADS                                          = $0007;
   GL_QUAD_STRIP                                     = $0008;
   GL_POLYGON                                        = $0009;

   // blending
   GL_ZERO                                           = 0;
   GL_ONE                                            = 1;
   GL_SRC_COLOR                                      = $0300;
   GL_ONE_MINUS_SRC_COLOR                            = $0301;
   GL_SRC_ALPHA                                      = $0302;
   GL_ONE_MINUS_SRC_ALPHA                            = $0303;
   GL_DST_ALPHA                                      = $0304;
   GL_ONE_MINUS_DST_ALPHA                            = $0305;
   GL_DST_COLOR                                      = $0306;
   GL_ONE_MINUS_DST_COLOR                            = $0307;
   GL_SRC_ALPHA_SATURATE                             = $0308;
   GL_BLEND_DST                                      = $0BE0;
   GL_BLEND_SRC                                      = $0BE1;
   GL_BLEND                                          = $0BE2;

   // blending (GL 1.2 ARB imaging)
   GL_BLEND_COLOR                                    = $8005;
   GL_CONSTANT_COLOR                                 = $8001;
   GL_ONE_MINUS_CONSTANT_COLOR                       = $8002;
   GL_CONSTANT_ALPHA                                 = $8003;
   GL_ONE_MINUS_CONSTANT_ALPHA                       = $8004;
   GL_FUNC_ADD                                       = $8006;
   GL_MIN                                            = $8007;
   GL_MAX                                            = $8008;
   GL_FUNC_SUBTRACT                                  = $800A;
   GL_FUNC_REVERSE_SUBTRACT                          = $800B;

   // color table GL 1.2 ARB imaging
   GL_COLOR_TABLE                                    = $80D0;
   GL_POST_CONVOLUTION_COLOR_TABLE                   = $80D1;
   GL_POST_COLOR_MATRIX_COLOR_TABLE                  = $80D2;
   GL_PROXY_COLOR_TABLE                              = $80D3;
   GL_PROXY_POST_CONVOLUTION_COLOR_TABLE             = $80D4;
   GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE            = $80D5;
   GL_COLOR_TABLE_SCALE                              = $80D6;
   GL_COLOR_TABLE_BIAS                               = $80D7;
   GL_COLOR_TABLE_FORMAT                             = $80D8;
   GL_COLOR_TABLE_WIDTH                              = $80D9;
   GL_COLOR_TABLE_RED_SIZE                           = $80DA;
   GL_COLOR_TABLE_GREEN_SIZE                         = $80DB;
   GL_COLOR_TABLE_BLUE_SIZE                          = $80DC;
   GL_COLOR_TABLE_ALPHA_SIZE                         = $80DD;
   GL_COLOR_TABLE_LUMINANCE_SIZE                     = $80DE;
   GL_COLOR_TABLE_INTENSITY_SIZE                     = $80DF;

   // convolutions GL 1.2 ARB imaging
   GL_CONVOLUTION_1D                                 = $8010;
   GL_CONVOLUTION_2D                                 = $8011;
   GL_SEPARABLE_2D                                   = $8012;
   GL_CONVOLUTION_BORDER_MODE                        = $8013;
   GL_CONVOLUTION_FILTER_SCALE                       = $8014;
   GL_CONVOLUTION_FILTER_BIAS                        = $8015;
   GL_REDUCE                                         = $8016;
   GL_CONVOLUTION_FORMAT                             = $8017;
   GL_CONVOLUTION_WIDTH                              = $8018;
   GL_CONVOLUTION_HEIGHT                             = $8019;
   GL_MAX_CONVOLUTION_WIDTH                          = $801A;
   GL_MAX_CONVOLUTION_HEIGHT                         = $801B;
   GL_POST_CONVOLUTION_RED_SCALE                     = $801C;
   GL_POST_CONVOLUTION_GREEN_SCALE                   = $801D;
   GL_POST_CONVOLUTION_BLUE_SCALE                    = $801E;
   GL_POST_CONVOLUTION_ALPHA_SCALE                   = $801F;
   GL_POST_CONVOLUTION_RED_BIAS                      = $8020;
   GL_POST_CONVOLUTION_GREEN_BIAS                    = $8021;
   GL_POST_CONVOLUTION_BLUE_BIAS                     = $8022;
   GL_POST_CONVOLUTION_ALPHA_BIAS                    = $8023;

   // histogram GL 1.2 ARB imaging
   GL_HISTOGRAM                                      = $8024;
   GL_PROXY_HISTOGRAM                                = $8025;
   GL_HISTOGRAM_WIDTH                                = $8026;
   GL_HISTOGRAM_FORMAT                               = $8027;
   GL_HISTOGRAM_RED_SIZE                             = $8028;
   GL_HISTOGRAM_GREEN_SIZE                           = $8029;
   GL_HISTOGRAM_BLUE_SIZE                            = $802A;
   GL_HISTOGRAM_ALPHA_SIZE                           = $802B;
   GL_HISTOGRAM_LUMINANCE_SIZE                       = $802C;
   GL_HISTOGRAM_SINK                                 = $802D;
   GL_MINMAX                                         = $802E;
   GL_MINMAX_FORMAT                                  = $802F;
   GL_MINMAX_SINK                                    = $8030;

   // buffers
   GL_NONE                                           = 0;
   GL_FRONT_LEFT                                     = $0400;
   GL_FRONT_RIGHT                                    = $0401;
   GL_BACK_LEFT                                      = $0402;
   GL_BACK_RIGHT                                     = $0403;
   GL_FRONT                                          = $0404;
   GL_BACK                                           = $0405;
   GL_LEFT                                           = $0406;
   GL_RIGHT                                          = $0407;
   GL_FRONT_AND_BACK                                 = $0408;
   GL_AUX0                                           = $0409;
   GL_AUX1                                           = $040A;
   GL_AUX2                                           = $040B;
   GL_AUX3                                           = $040C;
   GL_AUX_BUFFERS                                    = $0C00;
   GL_DRAW_BUFFER                                    = $0C01;
   GL_READ_BUFFER                                    = $0C02;
   GL_DOUBLEBUFFER                                   = $0C32;
   GL_STEREO                                         = $0C33;

   // depth buffer
   GL_DEPTH_RANGE                                    = $0B70;
   GL_DEPTH_TEST                                     = $0B71;
   GL_DEPTH_WRITEMASK                                = $0B72;
   GL_DEPTH_CLEAR_VALUE                              = $0B73;
   GL_DEPTH_FUNC                                     = $0B74;
   GL_NEVER                                          = $0200;
   GL_LESS                                           = $0201;
   GL_EQUAL                                          = $0202;
   GL_LEQUAL                                         = $0203;
   GL_GREATER                                        = $0204;
   GL_NOTEQUAL                                       = $0205;
   GL_GEQUAL                                         = $0206;
   GL_ALWAYS                                         = $0207;

   // accumulation buffer
   GL_ACCUM                                          = $0100;
   GL_LOAD                                           = $0101;
   GL_RETURN                                         = $0102;
   GL_MULT                                           = $0103;
   GL_ADD                                            = $0104;
   GL_ACCUM_CLEAR_VALUE                              = $0B80;

   // feedback buffer
   GL_FEEDBACK_BUFFER_POINTER                        = $0DF0;
   GL_FEEDBACK_BUFFER_SIZE                           = $0DF1;
   GL_FEEDBACK_BUFFER_TYPE                           = $0DF2;

   // feedback types
   GL_2D                                             = $0600;
   GL_3D                                             = $0601;
   GL_3D_COLOR                                       = $0602;
   GL_3D_COLOR_TEXTURE                               = $0603;
   GL_4D_COLOR_TEXTURE                               = $0604;

   // feedback tokens
   GL_PASS_THROUGH_TOKEN                             = $0700;
   GL_POINT_TOKEN                                    = $0701;
   GL_LINE_TOKEN                                     = $0702;
   GL_POLYGON_TOKEN                                  = $0703;
   GL_BITMAP_TOKEN                                   = $0704;
   GL_DRAW_PIXEL_TOKEN                               = $0705;
   GL_COPY_PIXEL_TOKEN                               = $0706;
   GL_LINE_RESET_TOKEN                               = $0707;

   // fog
   GL_EXP                                            = $0800;
   GL_EXP2                                           = $0801;
   GL_FOG                                            = $0B60;
   GL_FOG_INDEX                                      = $0B61;
   GL_FOG_DENSITY                                    = $0B62;
   GL_FOG_START                                      = $0B63;
   GL_FOG_END                                        = $0B64;
   GL_FOG_MODE                                       = $0B65;
   GL_FOG_COLOR                                      = $0B66;

   // pixel mode, transfer
   GL_PIXEL_MAP_I_TO_I                               = $0C70;
   GL_PIXEL_MAP_S_TO_S                               = $0C71;
   GL_PIXEL_MAP_I_TO_R                               = $0C72;
   GL_PIXEL_MAP_I_TO_G                               = $0C73;
   GL_PIXEL_MAP_I_TO_B                               = $0C74;
   GL_PIXEL_MAP_I_TO_A                               = $0C75;
   GL_PIXEL_MAP_R_TO_R                               = $0C76;
   GL_PIXEL_MAP_G_TO_G                               = $0C77;
   GL_PIXEL_MAP_B_TO_B                               = $0C78;
   GL_PIXEL_MAP_A_TO_A                               = $0C79;

   // vertex arrays
   GL_VERTEX_ARRAY_POINTER                           = $808E;
   GL_NORMAL_ARRAY_POINTER                           = $808F;
   GL_COLOR_ARRAY_POINTER                            = $8090;
   GL_INDEX_ARRAY_POINTER                            = $8091;
   GL_TEXTURE_COORD_ARRAY_POINTER                    = $8092;
   GL_EDGE_FLAG_ARRAY_POINTER                        = $8093;

   // stenciling
   GL_STENCIL_TEST                                   = $0B90;
   GL_STENCIL_CLEAR_VALUE                            = $0B91;
   GL_STENCIL_FUNC                                   = $0B92;
   GL_STENCIL_VALUE_MASK                             = $0B93;
   GL_STENCIL_FAIL                                   = $0B94;
   GL_STENCIL_PASS_DEPTH_FAIL                        = $0B95;
   GL_STENCIL_PASS_DEPTH_PASS                        = $0B96;
   GL_STENCIL_REF                                    = $0B97;
   GL_STENCIL_WRITEMASK                              = $0B98;
   GL_KEEP                                           = $1E00;
   GL_REPLACE                                        = $1E01;
   GL_INCR                                           = $1E02;
   GL_DECR                                           = $1E03;

   // color material
   GL_COLOR_MATERIAL_FACE                            = $0B55;
   GL_COLOR_MATERIAL_PARAMETER                       = $0B56;
   GL_COLOR_MATERIAL                                 = $0B57;

   // points
   GL_POINT_SMOOTH                                   = $0B10;
   GL_POINT_SIZE                                     = $0B11;
   GL_POINT_SIZE_RANGE                               = $0B12;
   GL_POINT_SIZE_GRANULARITY                         = $0B13;

   // lines
   GL_LINE_SMOOTH                                    = $0B20;
   GL_LINE_WIDTH                                     = $0B21;
   GL_LINE_WIDTH_RANGE                               = $0B22;
   GL_LINE_WIDTH_GRANULARITY                         = $0B23;
   GL_LINE_STIPPLE                                   = $0B24;
   GL_LINE_STIPPLE_PATTERN                           = $0B25;
   GL_LINE_STIPPLE_REPEAT                            = $0B26;

   // polygons
   GL_POLYGON_MODE                                   = $0B40;
   GL_POLYGON_SMOOTH                                 = $0B41;
   GL_POLYGON_STIPPLE                                = $0B42;
   GL_EDGE_FLAG                                      = $0B43;
   GL_CULL_FACE                                      = $0B44;
   GL_CULL_FACE_MODE                                 = $0B45;
   GL_FRONT_FACE                                     = $0B46;
   GL_CW                                             = $0900;
   GL_CCW                                            = $0901;
   GL_POINT                                          = $1B00;
   GL_LINE                                           = $1B01;
   GL_FILL                                           = $1B02;

   // display lists
   GL_LIST_MODE                                      = $0B30;
   GL_LIST_BASE                                      = $0B32;
   GL_LIST_INDEX                                     = $0B33;
   GL_COMPILE                                        = $1300;
   GL_COMPILE_AND_EXECUTE                            = $1301;

   // lighting
   GL_LIGHTING                                       = $0B50;
   GL_LIGHT_MODEL_LOCAL_VIEWER                       = $0B51;
   GL_LIGHT_MODEL_TWO_SIDE                           = $0B52;
   GL_LIGHT_MODEL_AMBIENT                            = $0B53;
   GL_LIGHT_MODEL_COLOR_CONTROL                      = $81F8; // GL 1.2
   GL_SHADE_MODEL                                    = $0B54;
   GL_NORMALIZE                                      = $0BA1;
   GL_AMBIENT                                        = $1200;
   GL_DIFFUSE                                        = $1201;
   GL_SPECULAR                                       = $1202;
   GL_POSITION                                       = $1203;
   GL_SPOT_DIRECTION                                 = $1204;
   GL_SPOT_EXPONENT                                  = $1205;
   GL_SPOT_CUTOFF                                    = $1206;
   GL_CONSTANT_ATTENUATION                           = $1207;
   GL_LINEAR_ATTENUATION                             = $1208;
   GL_QUADRATIC_ATTENUATION                          = $1209;
   GL_EMISSION                                       = $1600;
   GL_SHININESS                                      = $1601;
   GL_AMBIENT_AND_DIFFUSE                            = $1602;
   GL_COLOR_INDEXES                                  = $1603;
   GL_FLAT                                           = $1D00;
   GL_SMOOTH                                         = $1D01;
   GL_LIGHT0                                         = $4000;
   GL_LIGHT1                                         = $4001;
   GL_LIGHT2                                         = $4002;
   GL_LIGHT3                                         = $4003;
   GL_LIGHT4                                         = $4004;
   GL_LIGHT5                                         = $4005;
   GL_LIGHT6                                         = $4006;
   GL_LIGHT7                                         = $4007;

   // matrix modes
   GL_MATRIX_MODE                                    = $0BA0;
   GL_MODELVIEW                                      = $1700;
   GL_PROJECTION                                     = $1701;
   GL_TEXTURE                                        = $1702;

   // gets
   GL_CURRENT_COLOR                                  = $0B00;
   GL_CURRENT_INDEX                                  = $0B01;
   GL_CURRENT_NORMAL                                 = $0B02;
   GL_CURRENT_TEXTURE_COORDS                         = $0B03;
   GL_CURRENT_RASTER_COLOR                           = $0B04;
   GL_CURRENT_RASTER_INDEX                           = $0B05;
   GL_CURRENT_RASTER_TEXTURE_COORDS                  = $0B06;
   GL_CURRENT_RASTER_POSITION                        = $0B07;
   GL_CURRENT_RASTER_POSITION_VALID                  = $0B08;
   GL_CURRENT_RASTER_DISTANCE                        = $0B09;
   GL_MAX_LIST_NESTING                               = $0B31;
   GL_VIEWPORT                                       = $0BA2;
   GL_MODELVIEW_STACK_DEPTH                          = $0BA3;
   GL_PROJECTION_STACK_DEPTH                         = $0BA4;
   GL_TEXTURE_STACK_DEPTH                            = $0BA5;
   GL_MODELVIEW_MATRIX                               = $0BA6;
   GL_PROJECTION_MATRIX                              = $0BA7;
   GL_TEXTURE_MATRIX                                 = $0BA8;
   GL_ATTRIB_STACK_DEPTH                             = $0BB0;
   GL_CLIENT_ATTRIB_STACK_DEPTH                      = $0BB1;

   GL_SINGLE_COLOR                                   = $81F9; // GL 1.2
   GL_SEPARATE_SPECULAR_COLOR                        = $81FA; // GL 1.2

   // alpha testing
   GL_ALPHA_TEST                                     = $0BC0;
   GL_ALPHA_TEST_FUNC                                = $0BC1;
   GL_ALPHA_TEST_REF                                 = $0BC2;

   GL_LOGIC_OP_MODE                                  = $0BF0;
   GL_INDEX_LOGIC_OP                                 = $0BF1;
   GL_LOGIC_OP                                       = $0BF1;
   GL_COLOR_LOGIC_OP                                 = $0BF2;
   GL_SCISSOR_BOX                                    = $0C10;
   GL_SCISSOR_TEST                                   = $0C11;
   GL_INDEX_CLEAR_VALUE                              = $0C20;
   GL_INDEX_WRITEMASK                                = $0C21;
   GL_COLOR_CLEAR_VALUE                              = $0C22;
   GL_COLOR_WRITEMASK                                = $0C23;
   GL_INDEX_MODE                                     = $0C30;
   GL_RGBA_MODE                                      = $0C31;
   GL_RENDER_MODE                                    = $0C40;
   GL_PERSPECTIVE_CORRECTION_HINT                    = $0C50;
   GL_POINT_SMOOTH_HINT                              = $0C51;
   GL_LINE_SMOOTH_HINT                               = $0C52;
   GL_POLYGON_SMOOTH_HINT                            = $0C53;
   GL_FOG_HINT                                       = $0C54;
   GL_TEXTURE_GEN_S                                  = $0C60;
   GL_TEXTURE_GEN_T                                  = $0C61;
   GL_TEXTURE_GEN_R                                  = $0C62;
   GL_TEXTURE_GEN_Q                                  = $0C63;
   GL_PIXEL_MAP_I_TO_I_SIZE                          = $0CB0;
   GL_PIXEL_MAP_S_TO_S_SIZE                          = $0CB1;
   GL_PIXEL_MAP_I_TO_R_SIZE                          = $0CB2;
   GL_PIXEL_MAP_I_TO_G_SIZE                          = $0CB3;
   GL_PIXEL_MAP_I_TO_B_SIZE                          = $0CB4;
   GL_PIXEL_MAP_I_TO_A_SIZE                          = $0CB5;
   GL_PIXEL_MAP_R_TO_R_SIZE                          = $0CB6;
   GL_PIXEL_MAP_G_TO_G_SIZE                          = $0CB7;
   GL_PIXEL_MAP_B_TO_B_SIZE                          = $0CB8;
   GL_PIXEL_MAP_A_TO_A_SIZE                          = $0CB9;
   GL_UNPACK_SWAP_BYTES                              = $0CF0;
   GL_UNPACK_LSB_FIRST                               = $0CF1;
   GL_UNPACK_ROW_LENGTH                              = $0CF2;
   GL_UNPACK_SKIP_ROWS                               = $0CF3;
   GL_UNPACK_SKIP_PIXELS                             = $0CF4;
   GL_UNPACK_ALIGNMENT                               = $0CF5;
   GL_PACK_SWAP_BYTES                                = $0D00;
   GL_PACK_LSB_FIRST                                 = $0D01;
   GL_PACK_ROW_LENGTH                                = $0D02;
   GL_PACK_SKIP_ROWS                                 = $0D03;
   GL_PACK_SKIP_PIXELS                               = $0D04;
   GL_PACK_ALIGNMENT                                 = $0D05;
   GL_PACK_SKIP_IMAGES                               = $806B; // GL 1.2
   GL_PACK_IMAGE_HEIGHT                              = $806C; // GL 1.2
   GL_UNPACK_SKIP_IMAGES                             = $806D; // GL 1.2
   GL_UNPACK_IMAGE_HEIGHT                            = $806E; // GL 1.2
   GL_MAP_COLOR                                      = $0D10;
   GL_MAP_STENCIL                                    = $0D11;
   GL_INDEX_SHIFT                                    = $0D12;
   GL_INDEX_OFFSET                                   = $0D13;
   GL_RED_SCALE                                      = $0D14;
   GL_RED_BIAS                                       = $0D15;
   GL_ZOOM_X                                         = $0D16;
   GL_ZOOM_Y                                         = $0D17;
   GL_GREEN_SCALE                                    = $0D18;
   GL_GREEN_BIAS                                     = $0D19;
   GL_BLUE_SCALE                                     = $0D1A;
   GL_BLUE_BIAS                                      = $0D1B;
   GL_ALPHA_SCALE                                    = $0D1C;
   GL_ALPHA_BIAS                                     = $0D1D;
   GL_DEPTH_SCALE                                    = $0D1E;
   GL_DEPTH_BIAS                                     = $0D1F;
   GL_MAX_EVAL_ORDER                                 = $0D30;
   GL_MAX_LIGHTS                                     = $0D31;
   GL_MAX_CLIP_PLANES                                = $0D32;
   GL_MAX_TEXTURE_SIZE                               = $0D33;
   GL_MAX_3D_TEXTURE_SIZE                            = $8073; // GL 1.2
   GL_MAX_PIXEL_MAP_TABLE                            = $0D34;
   GL_MAX_ATTRIB_STACK_DEPTH                         = $0D35;
   GL_MAX_MODELVIEW_STACK_DEPTH                      = $0D36;
   GL_MAX_NAME_STACK_DEPTH                           = $0D37;
   GL_MAX_PROJECTION_STACK_DEPTH                     = $0D38;
   GL_MAX_TEXTURE_STACK_DEPTH                        = $0D39;
   GL_MAX_VIEWPORT_DIMS                              = $0D3A;
   GL_MAX_CLIENT_ATTRIB_STACK_DEPTH                  = $0D3B;
   GL_MAX_ELEMENTS_VERTICES                          = $80E8; // GL 1.2
   GL_MAX_ELEMENTS_INDICES                           = $80E9; // GL 1.2
   GL_RESCALE_NORMAL                                 = $803A; // GL 1.2
   GL_SUBPIXEL_BITS                                  = $0D50;
   GL_INDEX_BITS                                     = $0D51;
   GL_RED_BITS                                       = $0D52;
   GL_GREEN_BITS                                     = $0D53;
   GL_BLUE_BITS                                      = $0D54;
   GL_ALPHA_BITS                                     = $0D55;
   GL_DEPTH_BITS                                     = $0D56;
   GL_STENCIL_BITS                                   = $0D57;
   GL_ACCUM_RED_BITS                                 = $0D58;
   GL_ACCUM_GREEN_BITS                               = $0D59;
   GL_ACCUM_BLUE_BITS                                = $0D5A;
   GL_ACCUM_ALPHA_BITS                               = $0D5B;
   GL_NAME_STACK_DEPTH                               = $0D70;
   GL_AUTO_NORMAL                                    = $0D80;
   GL_MAP1_COLOR_4                                   = $0D90;
   GL_MAP1_INDEX                                     = $0D91;
   GL_MAP1_NORMAL                                    = $0D92;
   GL_MAP1_TEXTURE_COORD_1                           = $0D93;
   GL_MAP1_TEXTURE_COORD_2                           = $0D94;
   GL_MAP1_TEXTURE_COORD_3                           = $0D95;
   GL_MAP1_TEXTURE_COORD_4                           = $0D96;
   GL_MAP1_VERTEX_3                                  = $0D97;
   GL_MAP1_VERTEX_4                                  = $0D98;
   GL_MAP2_COLOR_4                                   = $0DB0;
   GL_MAP2_INDEX                                     = $0DB1;
   GL_MAP2_NORMAL                                    = $0DB2;
   GL_MAP2_TEXTURE_COORD_1                           = $0DB3;
   GL_MAP2_TEXTURE_COORD_2                           = $0DB4;
   GL_MAP2_TEXTURE_COORD_3                           = $0DB5;
   GL_MAP2_TEXTURE_COORD_4                           = $0DB6;
   GL_MAP2_VERTEX_3                                  = $0DB7;
   GL_MAP2_VERTEX_4                                  = $0DB8;
   GL_MAP1_GRID_DOMAIN                               = $0DD0;
   GL_MAP1_GRID_SEGMENTS                             = $0DD1;
   GL_MAP2_GRID_DOMAIN                               = $0DD2;
   GL_MAP2_GRID_SEGMENTS                             = $0DD3;
   GL_TEXTURE_1D                                     = $0DE0;
   GL_TEXTURE_2D                                     = $0DE1;
   GL_TEXTURE_3D                                     = $806F; // GL 1.2
   GL_SELECTION_BUFFER_POINTER                       = $0DF3;
   GL_SELECTION_BUFFER_SIZE                          = $0DF4;
   GL_POLYGON_OFFSET_UNITS                           = $2A00;
   GL_POLYGON_OFFSET_POINT                           = $2A01;
   GL_POLYGON_OFFSET_LINE                            = $2A02;
   GL_POLYGON_OFFSET_FILL                            = $8037;
   GL_POLYGON_OFFSET_FACTOR                          = $8038;
   GL_TEXTURE_BINDING_1D                             = $8068;
   GL_TEXTURE_BINDING_2D                             = $8069;
   GL_VERTEX_ARRAY                                   = $8074;
   GL_NORMAL_ARRAY                                   = $8075;
   GL_COLOR_ARRAY                                    = $8076;
   GL_INDEX_ARRAY                                    = $8077;
   GL_TEXTURE_COORD_ARRAY                            = $8078;
   GL_EDGE_FLAG_ARRAY                                = $8079;
   GL_VERTEX_ARRAY_SIZE                              = $807A;
   GL_VERTEX_ARRAY_TYPE                              = $807B;
   GL_VERTEX_ARRAY_STRIDE                            = $807C;
   GL_NORMAL_ARRAY_TYPE                              = $807E;
   GL_NORMAL_ARRAY_STRIDE                            = $807F;
   GL_COLOR_ARRAY_SIZE                               = $8081;
   GL_COLOR_ARRAY_TYPE                               = $8082;
   GL_COLOR_ARRAY_STRIDE                             = $8083;
   GL_INDEX_ARRAY_TYPE                               = $8085;
   GL_INDEX_ARRAY_STRIDE                             = $8086;
   GL_TEXTURE_COORD_ARRAY_SIZE                       = $8088;
   GL_TEXTURE_COORD_ARRAY_TYPE                       = $8089;
   GL_TEXTURE_COORD_ARRAY_STRIDE                     = $808A;
   GL_EDGE_FLAG_ARRAY_STRIDE                         = $808C;
   GL_COLOR_MATRIX                                   = $80B1; // GL 1.2 ARB imaging
   GL_COLOR_MATRIX_STACK_DEPTH                       = $80B2; // GL 1.2 ARB imaging
   GL_MAX_COLOR_MATRIX_STACK_DEPTH                   = $80B3; // GL 1.2 ARB imaging
   GL_POST_COLOR_MATRIX_RED_SCALE                    = $80B4; // GL 1.2 ARB imaging
   GL_POST_COLOR_MATRIX_GREEN_SCALE                  = $80B5; // GL 1.2 ARB imaging
   GL_POST_COLOR_MATRIX_BLUE_SCALE                   = $80B6; // GL 1.2 ARB imaging
   GL_POST_COLOR_MATRIX_ALPHA_SCALE                  = $80B7; // GL 1.2 ARB imaging
   GL_POST_COLOR_MATRIX_RED_BIAS                     = $80B8; // GL 1.2 ARB imaging
   GL_POST_COLOR_MATRIX_GREEN_BIAS                   = $80B9; // GL 1.2 ARB imaging
   GL_POST_COLOR_MATRIX_BLUE_BIAS                    = $80BA; // GL 1.2 ARB imaging
   GL_POST_COLOR_MATRIX_ALPHA_BIAS                   = $80BB; // GL 1.2 ARB imaging

   // evaluators
   GL_COEFF                                          = $0A00;
   GL_ORDER                                          = $0A01;
   GL_DOMAIN                                         = $0A02;

   // texture mapping
   GL_TEXTURE_WIDTH                                  = $1000;
   GL_TEXTURE_HEIGHT                                 = $1001;
   GL_TEXTURE_INTERNAL_FORMAT                        = $1003;
   GL_TEXTURE_COMPONENTS                             = $1003;
   GL_TEXTURE_BORDER_COLOR                           = $1004;
   GL_TEXTURE_BORDER                                 = $1005;
   GL_TEXTURE_RED_SIZE                               = $805C;
   GL_TEXTURE_GREEN_SIZE                             = $805D;
   GL_TEXTURE_BLUE_SIZE                              = $805E;
   GL_TEXTURE_ALPHA_SIZE                             = $805F;
   GL_TEXTURE_LUMINANCE_SIZE                         = $8060;
   GL_TEXTURE_INTENSITY_SIZE                         = $8061;
   GL_TEXTURE_PRIORITY                               = $8066;
   GL_TEXTURE_RESIDENT                               = $8067;
   GL_BGR                                            = $80E0; // v 1.2
   GL_BGRA                                           = $80E1; // v 1.2
   GL_S                                              = $2000;
   GL_T                                              = $2001;
   GL_R                                              = $2002;
   GL_Q                                              = $2003;
   GL_MODULATE                                       = $2100;
   GL_DECAL                                          = $2101;
   GL_TEXTURE_ENV_MODE                               = $2200;
   GL_TEXTURE_ENV_COLOR                              = $2201;
   GL_TEXTURE_ENV                                    = $2300;
   GL_EYE_LINEAR                                     = $2400;
   GL_OBJECT_LINEAR                                  = $2401;
   GL_SPHERE_MAP                                     = $2402;
   GL_TEXTURE_GEN_MODE                               = $2500;
   GL_OBJECT_PLANE                                   = $2501;
   GL_EYE_PLANE                                      = $2502;
   GL_NEAREST                                        = $2600;
   GL_LINEAR                                         = $2601;
   GL_NEAREST_MIPMAP_NEAREST                         = $2700;
   GL_LINEAR_MIPMAP_NEAREST                          = $2701;
   GL_NEAREST_MIPMAP_LINEAR                          = $2702;
   GL_LINEAR_MIPMAP_LINEAR                           = $2703;
   GL_TEXTURE_MAG_FILTER                             = $2800;
   GL_TEXTURE_MIN_FILTER                             = $2801;
   GL_TEXTURE_WRAP_R                                 = $8072; // GL 1.2
   GL_TEXTURE_WRAP_S                                 = $2802;
   GL_TEXTURE_WRAP_T                                 = $2803;
   GL_CLAMP_TO_EDGE                                  = $812F; // GL 1.2
   GL_TEXTURE_MIN_LOD                                = $813A; // GL 1.2
   GL_TEXTURE_MAX_LOD                                = $813B; // GL 1.2
   GL_TEXTURE_BASE_LEVEL                             = $813C; // GL 1.2
   GL_TEXTURE_MAX_LEVEL                              = $813D; // GL 1.2
   GL_TEXTURE_DEPTH                                  = $8071; // GL 1.2
   GL_PROXY_TEXTURE_1D                               = $8063;
   GL_PROXY_TEXTURE_2D                               = $8064;
   GL_PROXY_TEXTURE_3D                               = $8070; // GL 1.2
   GL_CLAMP                                          = $2900;
   GL_REPEAT                                         = $2901;

   // hints
   GL_DONT_CARE                                      = $1100;
   GL_FASTEST                                        = $1101;
   GL_NICEST                                         = $1102;

   // data types
   GL_BYTE                                           = $1400;
   GL_UNSIGNED_BYTE                                  = $1401;
   GL_SHORT                                          = $1402;
   GL_UNSIGNED_SHORT                                 = $1403;
   GL_INT                                            = $1404;
   GL_UNSIGNED_INT                                   = $1405;
   GL_FLOAT                                          = $1406;
   GL_2_BYTES                                        = $1407;
   GL_3_BYTES                                        = $1408;
   GL_4_BYTES                                        = $1409;
   GL_DOUBLE                                         = $140A;
   GL_DOUBLE_EXT                                     = $140A;

   // logic operations
   GL_CLEAR                                          = $1500;
   GL_AND                                            = $1501;
   GL_AND_REVERSE                                    = $1502;
   GL_COPY                                           = $1503;
   GL_AND_INVERTED                                   = $1504;
   GL_NOOP                                           = $1505;
   GL_XOR                                            = $1506;
   GL_OR                                             = $1507;
   GL_NOR                                            = $1508;
   GL_EQUIV                                          = $1509;
   GL_INVERT                                         = $150A;
   GL_OR_REVERSE                                     = $150B;
   GL_COPY_INVERTED                                  = $150C;
   GL_OR_INVERTED                                    = $150D;
   GL_NAND                                           = $150E;
   GL_SET                                            = $150F;

   // PixelCopyType
   GL_COLOR                                          = $1800;
   GL_DEPTH                                          = $1801;
   GL_STENCIL                                        = $1802;

   // pixel formats
   GL_COLOR_INDEX                                    = $1900;
   GL_STENCIL_INDEX                                  = $1901;
   GL_DEPTH_COMPONENT                                = $1902;
   GL_RED                                            = $1903;
   GL_GREEN                                          = $1904;
   GL_BLUE                                           = $1905;
   GL_ALPHA                                          = $1906;
   GL_RGB                                            = $1907;
   GL_RGBA                                           = $1908;
   GL_LUMINANCE                                      = $1909;
   GL_LUMINANCE_ALPHA                                = $190A;

   // pixel type
   GL_BITMAP                                         = $1A00;

   // rendering modes
   GL_RENDER                                         = $1C00;
   GL_FEEDBACK                                       = $1C01;
   GL_SELECT                                         = $1C02;

   // implementation strings
   GL_VENDOR                                         = $1F00;
   GL_RENDERER                                       = $1F01;
   GL_VERSION                                        = $1F02;
   GL_EXTENSIONS                                     = $1F03;

   // pixel formats
   GL_R3_G3_B2                                       = $2A10;
   GL_ALPHA4                                         = $803B;
   GL_ALPHA8                                         = $803C;
   GL_ALPHA12                                        = $803D;
   GL_ALPHA16                                        = $803E;
   GL_LUMINANCE4                                     = $803F;
   GL_LUMINANCE8                                     = $8040;
   GL_LUMINANCE12                                    = $8041;
   GL_LUMINANCE16                                    = $8042;
   GL_LUMINANCE4_ALPHA4                              = $8043;
   GL_LUMINANCE6_ALPHA2                              = $8044;
   GL_LUMINANCE8_ALPHA8                              = $8045;
   GL_LUMINANCE12_ALPHA4                             = $8046;
   GL_LUMINANCE12_ALPHA12                            = $8047;
   GL_LUMINANCE16_ALPHA16                            = $8048;
   GL_INTENSITY                                      = $8049;
   GL_INTENSITY4                                     = $804A;
   GL_INTENSITY8                                     = $804B;
   GL_INTENSITY12                                    = $804C;
   GL_INTENSITY16                                    = $804D;
   GL_RGB4                                           = $804F;
   GL_RGB5                                           = $8050;
   GL_RGB8                                           = $8051;
   GL_RGB10                                          = $8052;
   GL_RGB12                                          = $8053;
   GL_RGB16                                          = $8054;
   GL_RGBA2                                          = $8055;
   GL_RGBA4                                          = $8056;
   GL_RGB5_A1                                        = $8057;
   GL_RGBA8                                          = $8058;
   GL_RGB10_A2                                       = $8059;
   GL_RGBA12                                         = $805A;
   GL_RGBA16                                         = $805B;
   UNSIGNED_BYTE_3_3_2                               = $8032; // GL 1.2
   UNSIGNED_BYTE_2_3_3_REV                           = $8362; // GL 1.2
   UNSIGNED_SHORT_5_6_5                              = $8363; // GL 1.2
   UNSIGNED_SHORT_5_6_5_REV                          = $8364; // GL 1.2
   UNSIGNED_SHORT_4_4_4_4                            = $8033; // GL 1.2
   UNSIGNED_SHORT_4_4_4_4_REV                        = $8365; // GL 1.2
   UNSIGNED_SHORT_5_5_5_1                            = $8034; // GL 1.2
   UNSIGNED_SHORT_1_5_5_5_REV                        = $8366; // GL 1.2
   UNSIGNED_INT_8_8_8_8                              = $8035; // GL 1.2
   UNSIGNED_INT_8_8_8_8_REV                          = $8367; // GL 1.2
   UNSIGNED_INT_10_10_10_2                           = $8036; // GL 1.2
   UNSIGNED_INT_2_10_10_10_REV                       = $8368; // GL 1.2

   // interleaved arrays formats
   GL_V2F                                            = $2A20;
   GL_V3F                                            = $2A21;
   GL_C4UB_V2F                                       = $2A22;
   GL_C4UB_V3F                                       = $2A23;
   GL_C3F_V3F                                        = $2A24;
   GL_N3F_V3F                                        = $2A25;
   GL_C4F_N3F_V3F                                    = $2A26;
   GL_T2F_V3F                                        = $2A27;
   GL_T4F_V4F                                        = $2A28;
   GL_T2F_C4UB_V3F                                   = $2A29;
   GL_T2F_C3F_V3F                                    = $2A2A;
   GL_T2F_N3F_V3F                                    = $2A2B;
   GL_T2F_C4F_N3F_V3F                                = $2A2C;
   GL_T4F_C4F_N3F_V4F                                = $2A2D;

   // clip planes
   GL_CLIP_PLANE0                                    = $3000;
   GL_CLIP_PLANE1                                    = $3001;
   GL_CLIP_PLANE2                                    = $3002;
   GL_CLIP_PLANE3                                    = $3003;
   GL_CLIP_PLANE4                                    = $3004;
   GL_CLIP_PLANE5                                    = $3005;

   // miscellaneous
   GL_DITHER                                         = $0BD0;

   // ----- extensions enumerants -----
   // EXT_abgr
   GL_ABGR_EXT                                       = $8000;

   // EXT_packed_pixels
   GL_UNSIGNED_BYTE_3_3_2_EXT                        = $8032;
   GL_UNSIGNED_SHORT_4_4_4_4_EXT                     = $8033;
   GL_UNSIGNED_SHORT_5_5_5_1_EXT                     = $8034;
   GL_UNSIGNED_INT_8_8_8_8_EXT                       = $8035;
   GL_UNSIGNED_INT_10_10_10_2_EXT                    = $8036;

   // EXT_bgra
   GL_BGR_EXT                                        = $80E0;
   GL_BGRA_EXT                                       = $80E1;

   // EXT_paletted_texture
   GL_COLOR_INDEX1_EXT                               = $80E2;
   GL_COLOR_INDEX2_EXT                               = $80E3;
   GL_COLOR_INDEX4_EXT                               = $80E4;
   GL_COLOR_INDEX8_EXT                               = $80E5;
   GL_COLOR_INDEX12_EXT                              = $80E6;
   GL_COLOR_INDEX16_EXT                              = $80E7;

   // EXT_blend_color
   GL_CONSTANT_COLOR_EXT                             = $8001;
   GL_ONE_MINUS_CONSTANT_COLOR_EXT                   = $8002;
   GL_CONSTANT_ALPHA_EXT                             = $8003;
   GL_ONE_MINUS_CONSTANT_ALPHA_EXT                   = $8004;
   GL_BLEND_COLOR_EXT                                = $8005;

   // EXT_blend_minmax
   GL_FUNC_ADD_EXT                                   = $8006;
   GL_MIN_EXT                                        = $8007;
   GL_MAX_EXT                                        = $8008;
   GL_BLEND_EQUATION_EXT                             = $8009;

   // EXT_blend_subtract
   GL_FUNC_SUBTRACT_EXT                              = $800A;
   GL_FUNC_REVERSE_SUBTRACT_EXT                      = $800B;

   // EXT_convolution
   GL_CONVOLUTION_1D_EXT                             = $8010;
   GL_CONVOLUTION_2D_EXT                             = $8011;
   GL_SEPARABLE_2D_EXT                               = $8012;
   GL_CONVOLUTION_BORDER_MODE_EXT                    = $8013;
   GL_CONVOLUTION_FILTER_SCALE_EXT                   = $8014;
   GL_CONVOLUTION_FILTER_BIAS_EXT                    = $8015;
   GL_REDUCE_EXT                                     = $8016;
   GL_CONVOLUTION_FORMAT_EXT                         = $8017;
   GL_CONVOLUTION_WIDTH_EXT                          = $8018;
   GL_CONVOLUTION_HEIGHT_EXT                         = $8019;
   GL_MAX_CONVOLUTION_WIDTH_EXT                      = $801A;
   GL_MAX_CONVOLUTION_HEIGHT_EXT                     = $801B;
   GL_POST_CONVOLUTION_RED_SCALE_EXT                 = $801C;
   GL_POST_CONVOLUTION_GREEN_SCALE_EXT               = $801D;
   GL_POST_CONVOLUTION_BLUE_SCALE_EXT                = $801E;
   GL_POST_CONVOLUTION_ALPHA_SCALE_EXT               = $801F;
   GL_POST_CONVOLUTION_RED_BIAS_EXT                  = $8020;
   GL_POST_CONVOLUTION_GREEN_BIAS_EXT                = $8021;
   GL_POST_CONVOLUTION_BLUE_BIAS_EXT                 = $8022;
   GL_POST_CONVOLUTION_ALPHA_BIAS_EXT                = $8023;

   // EXT_histogram
   GL_HISTOGRAM_EXT                                  = $8024;
   GL_PROXY_HISTOGRAM_EXT                            = $8025;
   GL_HISTOGRAM_WIDTH_EXT                            = $8026;
   GL_HISTOGRAM_FORMAT_EXT                           = $8027;
   GL_HISTOGRAM_RED_SIZE_EXT                         = $8028;
   GL_HISTOGRAM_GREEN_SIZE_EXT                       = $8029;
   GL_HISTOGRAM_BLUE_SIZE_EXT                        = $802A;
   GL_HISTOGRAM_ALPHA_SIZE_EXT                       = $802B;
   GL_HISTOGRAM_LUMINANCE_SIZE_EXT                   = $802C;
   GL_HISTOGRAM_SINK_EXT                             = $802D;
   GL_MINMAX_EXT                                     = $802E;
   GL_MINMAX_FORMAT_EXT                              = $802F;
   GL_MINMAX_SINK_EXT                                = $8030;

   // EXT_polygon_offset
   GL_POLYGON_OFFSET_EXT                             = $8037;
   GL_POLYGON_OFFSET_FACTOR_EXT                      = $8038;
   GL_POLYGON_OFFSET_BIAS_EXT                        = $8039;

   // EXT_texture
   GL_ALPHA4_EXT                                     = $803B;
   GL_ALPHA8_EXT                                     = $803C;
   GL_ALPHA12_EXT                                    = $803D;
   GL_ALPHA16_EXT                                    = $803E;
   GL_LUMINANCE4_EXT                                 = $803F;
   GL_LUMINANCE8_EXT                                 = $8040;
   GL_LUMINANCE12_EXT                                = $8041;
   GL_LUMINANCE16_EXT                                = $8042;
   GL_LUMINANCE4_ALPHA4_EXT                          = $8043;
   GL_LUMINANCE6_ALPHA2_EXT                          = $8044;
   GL_LUMINANCE8_ALPHA8_EXT                          = $8045;
   GL_LUMINANCE12_ALPHA4_EXT                         = $8046;
   GL_LUMINANCE12_ALPHA12_EXT                        = $8047;
   GL_LUMINANCE16_ALPHA16_EXT                        = $8048;
   GL_INTENSITY_EXT                                  = $8049;
   GL_INTENSITY4_EXT                                 = $804A;
   GL_INTENSITY8_EXT                                 = $804B;
   GL_INTENSITY12_EXT                                = $804C;
   GL_INTENSITY16_EXT                                = $804D;
   GL_RGB2_EXT                                       = $804E;
   GL_RGB4_EXT                                       = $804F;
   GL_RGB5_EXT                                       = $8050;
   GL_RGB8_EXT                                       = $8051;
   GL_RGB10_EXT                                      = $8052;
   GL_RGB12_EXT                                      = $8053;
   GL_RGB16_EXT                                      = $8054;
   GL_RGBA2_EXT                                      = $8055;
   GL_RGBA4_EXT                                      = $8056;
   GL_RGB5_A1_EXT                                    = $8057;
   GL_RGBA8_EXT                                      = $8058;
   GL_RGB10_A2_EXT                                   = $8059;
   GL_RGBA12_EXT                                     = $805A;
   GL_RGBA16_EXT                                     = $805B;
   GL_TEXTURE_RED_SIZE_EXT                           = $805C;
   GL_TEXTURE_GREEN_SIZE_EXT                         = $805D;
   GL_TEXTURE_BLUE_SIZE_EXT                          = $805E;
   GL_TEXTURE_ALPHA_SIZE_EXT                         = $805F;
   GL_TEXTURE_LUMINANCE_SIZE_EXT                     = $8060;
   GL_TEXTURE_INTENSITY_SIZE_EXT                     = $8061;
   GL_REPLACE_EXT                                    = $8062;
   GL_PROXY_TEXTURE_1D_EXT                           = $8063;
   GL_PROXY_TEXTURE_2D_EXT                           = $8064;
   GL_TEXTURE_TOO_LARGE_EXT                          = $8065;

   // EXT_texture_object
   GL_TEXTURE_PRIORITY_EXT                           = $8066;
   GL_TEXTURE_RESIDENT_EXT                           = $8067;
   GL_TEXTURE_1D_BINDING_EXT                         = $8068;
   GL_TEXTURE_2D_BINDING_EXT                         = $8069;
   GL_TEXTURE_3D_BINDING_EXT                         = $806A;

   // EXT_texture3D
   GL_PACK_SKIP_IMAGES_EXT                           = $806B;
   GL_PACK_IMAGE_HEIGHT_EXT                          = $806C;
   GL_UNPACK_SKIP_IMAGES_EXT                         = $806D;
   GL_UNPACK_IMAGE_HEIGHT_EXT                        = $806E;
   GL_TEXTURE_3D_EXT                                 = $806F;
   GL_PROXY_TEXTURE_3D_EXT                           = $8070;
   GL_TEXTURE_DEPTH_EXT                              = $8071;
   GL_TEXTURE_WRAP_R_EXT                             = $8072;
   GL_MAX_3D_TEXTURE_SIZE_EXT                        = $8073;

   // SGI_color_matrix
   GL_COLOR_MATRIX_SGI                               = $80B1;
   GL_COLOR_MATRIX_STACK_DEPTH_SGI                   = $80B2;
   GL_MAX_COLOR_MATRIX_STACK_DEPTH_SGI               = $80B3;
   GL_POST_COLOR_MATRIX_RED_SCALE_SGI                = $80B4;
   GL_POST_COLOR_MATRIX_GREEN_SCALE_SGI              = $80B5;
   GL_POST_COLOR_MATRIX_BLUE_SCALE_SGI               = $80B6;
   GL_POST_COLOR_MATRIX_ALPHA_SCALE_SGI              = $80B7;
   GL_POST_COLOR_MATRIX_RED_BIAS_SGI                 = $80B8;
   GL_POST_COLOR_MATRIX_GREEN_BIAS_SGI               = $80B9;
   GL_POST_COLOR_MATRIX_BLUE_BIAS_SGI                = $80BA;
   GL_POST_COLOR_MATRIX_ALPHA_BIAS_SGI               = $80BB;

   // ARB_point_parameters
   GL_POINT_SIZE_MIN_ARB                             = $8126;
   GL_POINT_SIZE_MAX_ARB                             = $8127;
   GL_POINT_FADE_THRESHOLD_SIZE_ARB                  = $8128;
   GL_DISTANCE_ATTENUATION_ARB                       = $8129;

   // EXT_rescale_normal
   GL_RESCALE_NORMAL_EXT                             = $803A;

   // EXT_shared_texture_palette
   GL_SHARED_TEXTURE_PALETTE_EXT                     = $81FB;

   // EXT_nurbs_tessellator
   GLU_NURBS_MODE_EXT                                = 100160;
   GLU_NURBS_TESSELLATOR_EXT                         = 100161;
   GLU_NURBS_RENDERER_EXT                            = 100162;
   GLU_NURBS_BEGIN_EXT                               = 100164;
   GLU_NURBS_VERTEX_EXT                              = 100165;
   GLU_NURBS_NORMAL_EXT                              = 100166;
   GLU_NURBS_COLOR_EXT                               = 100167;
   GLU_NURBS_TEX_COORD_EXT                           = 100168;
   GLU_NURBS_END_EXT                                 = 100169;
   GLU_NURBS_BEGIN_DATA_EXT                          = 100170;
   GLU_NURBS_VERTEX_DATA_EXT                         = 100171;
   GLU_NURBS_NORMAL_DATA_EXT                         = 100172;
   GLU_NURBS_COLOR_DATA_EXT                          = 100173;
   GLU_NURBS_TEX_COORD_DATA_EXT                      = 100174;
   GLU_NURBS_END_DATA_EXT                            = 100175;

   // EXT_object_space_tess
   GLU_OBJECT_PARAMETRIC_ERROR_EXT                   = 100208;
   GLU_OBJECT_PATH_LENGTH_EXT                        = 100209;

   // EXT_compiled_vertex_array
   GL_ARRAY_ELEMENT_LOCK_FIRST_EXT                   = $81A8;
   GL_ARRAY_ELEMENT_LOCK_COUNT_EXT                   = $81A9;

   // ARB_multitexture
   GL_ACTIVE_TEXTURE_ARB                             = $84E0;
   GL_CLIENT_ACTIVE_TEXTURE_ARB                      = $84E1;
   GL_MAX_TEXTURE_UNITS_ARB                          = $84E2;
   GL_TEXTURE0_ARB                                   = $84C0;
   GL_TEXTURE1_ARB                                   = $84C1;
   GL_TEXTURE2_ARB                                   = $84C2;
   GL_TEXTURE3_ARB                                   = $84C3;
   GL_TEXTURE4_ARB                                   = $84C4;
   GL_TEXTURE5_ARB                                   = $84C5;
   GL_TEXTURE6_ARB                                   = $84C6;
   GL_TEXTURE7_ARB                                   = $84C7;
   GL_TEXTURE8_ARB                                   = $84C8;
   GL_TEXTURE9_ARB                                   = $84C9;
   GL_TEXTURE10_ARB                                  = $84CA;
   GL_TEXTURE11_ARB                                  = $84CB;
   GL_TEXTURE12_ARB                                  = $84CC;
   GL_TEXTURE13_ARB                                  = $84CD;
   GL_TEXTURE14_ARB                                  = $84CE;
   GL_TEXTURE15_ARB                                  = $84CF;
   GL_TEXTURE16_ARB                                  = $84D0;
   GL_TEXTURE17_ARB                                  = $84D1;
   GL_TEXTURE18_ARB                                  = $84D2;
   GL_TEXTURE19_ARB                                  = $84D3;
   GL_TEXTURE20_ARB                                  = $84D4;
   GL_TEXTURE21_ARB                                  = $84D5;
   GL_TEXTURE22_ARB                                  = $84D6;
   GL_TEXTURE23_ARB                                  = $84D7;
   GL_TEXTURE24_ARB                                  = $84D8;
   GL_TEXTURE25_ARB                                  = $84D9;
   GL_TEXTURE26_ARB                                  = $84DA;
   GL_TEXTURE27_ARB                                  = $84DB;
   GL_TEXTURE28_ARB                                  = $84DC;
   GL_TEXTURE29_ARB                                  = $84DD;
   GL_TEXTURE30_ARB                                  = $84DE;
   GL_TEXTURE31_ARB                                  = $84DF;

   // EXT_stencil_wrap
   GL_INCR_WRAP_EXT                                  = $8507;
   GL_DECR_WRAP_EXT                                  = $8508;

   // EXT_stencil_two_side
   GL_STENCIL_TEST_TWO_SIDE_EXT                      = $8910;
   GL_ACTIVE_STENCIL_FACE_EXT                        = $8911;

   // NV_texgen_reflection
   GL_NORMAL_MAP_NV                                  = $8511;
   GL_REFLECTION_MAP_NV                              = $8512;

   // NV_fence
   GL_ALL_COMPLETED_NV                               = $84F2;
   GL_FENCE_STATUS_NV                                = $84F3;
   GL_FENCE_CONDITION_NV                             = $84F4;

   // NV_occlusion_query
   GL_PIXEL_COUNTER_BITS_NV                          = $8864;
   GL_CURRENT_OCCLUSION_QUERY_ID_NV                  = $8865;
   GL_PIXEL_COUNT_NV                                 = $8866;
   GL_PIXEL_COUNT_AVAILABLE_NV                       = $8867;

   // NV_texture_rectangle
   GL_TEXTURE_RECTANGLE_NV                           = $84F5;
   GL_TEXTURE_BINDING_RECTANGLE_NV                   = $84F6;
   GL_PROXY_TEXTURE_RECTANGLE_NV                     = $84F7;
   GL_MAX_RECTANGLE_TEXTURE_SIZE_NV                  = $84F8;

   // ARB_texture_rectangle
   GL_TEXTURE_RECTANGLE_ARB                          = $84F5;
   GL_TEXTURE_BINDING_RECTANGLE_ARB                  = $84F6;
   GL_PROXY_TEXTURE_RECTANGLE_ARB                    = $84F7;
   GL_MAX_RECTANGLE_TEXTURE_SIZE_ARB                 = $84F8;

   // EXT_texture_rectangle
   GL_TEXTURE_RECTANGLE_EXT                          = $84F5;
   GL_TEXTURE_BINDING_RECTANGLE_EXT                  = $84F6;
   GL_PROXY_TEXTURE_RECTANGLE_EXT                    = $84F7;
   GL_MAX_RECTANGLE_TEXTURE_SIZE_EXT                 = $84F8;

   // EXT_texture_env_combine
   GL_COMBINE_EXT                                    = $8570;
   GL_COMBINE_RGB_EXT                                = $8571;
   GL_COMBINE_ALPHA_EXT                              = $8572;
   GL_RGB_SCALE_EXT                                  = $8573;
   GL_ADD_SIGNED_EXT                                 = $8574;
   GL_INTERPOLATE_EXT                                = $8575;
   GL_CONSTANT_EXT                                   = $8576;
   GL_PRIMARY_COLOR_EXT                              = $8577;
   GL_PREVIOUS_EXT                                   = $8578;
   GL_SOURCE0_RGB_EXT                                = $8580;
   GL_SOURCE1_RGB_EXT                                = $8581;
   GL_SOURCE2_RGB_EXT                                = $8582;
   GL_SOURCE0_ALPHA_EXT                              = $8588;
   GL_SOURCE1_ALPHA_EXT                              = $8589;
   GL_SOURCE2_ALPHA_EXT                              = $858A;
   GL_OPERAND0_RGB_EXT                               = $8590;
   GL_OPERAND1_RGB_EXT                               = $8591;
   GL_OPERAND2_RGB_EXT                               = $8592;
   GL_OPERAND0_ALPHA_EXT                             = $8598;
   GL_OPERAND1_ALPHA_EXT                             = $8599;
   GL_OPERAND2_ALPHA_EXT                             = $859A;

   // ARB_texture_env_combine
   GL_COMBINE_ARB                                    = $8570;
   GL_COMBINE_RGB_ARB                                = $8571;
   GL_COMBINE_ALPHA_ARB                              = $8572;
   GL_SOURCE0_RGB_ARB                                = $8580;
   GL_SOURCE1_RGB_ARB                                = $8581;
   GL_SOURCE2_RGB_ARB                                = $8582;
   GL_SOURCE0_ALPHA_ARB                              = $8588;
   GL_SOURCE1_ALPHA_ARB                              = $8589;
   GL_SOURCE2_ALPHA_ARB                              = $858A;
   GL_OPERAND0_RGB_ARB                               = $8590;
   GL_OPERAND1_RGB_ARB                               = $8591;
   GL_OPERAND2_RGB_ARB                               = $8592;
   GL_OPERAND0_ALPHA_ARB                             = $8598;
   GL_OPERAND1_ALPHA_ARB                             = $8599;
   GL_OPERAND2_ALPHA_ARB                             = $859A;
   GL_RGB_SCALE_ARB                                  = $8573;
   GL_ADD_SIGNED_ARB                                 = $8574;
   GL_INTERPOLATE_ARB                                = $8575;
   GL_SUBTRACT_ARB                                   = $84E7;
   GL_CONSTANT_ARB                                   = $8576;
   GL_CONSTANT_COLOR_ARB                             = $8576;
   GL_PRIMARY_COLOR_ARB                              = $8577;
   GL_PREVIOUS_ARB                                   = $8578;

   // ARB_texture_env_dot3
   GL_DOT3_RGB_ARB                                   = $86AE;
   GL_DOT3_RGBA_ARB                                  = $86AF;

   // ARB_vertex_program
   GL_VERTEX_PROGRAM_ARB                             = $8620;
   GL_VERTEX_PROGRAM_POINT_SIZE_ARB                  = $8642;
   GL_VERTEX_PROGRAM_TWO_SIDE_ARB                    = $8643;
   GL_COLOR_SUM_ARB                                  = $8458;
   GL_PROGRAM_FORMAT_ASCII_ARB                       = $8875;
   GL_VERTEX_ATTRIB_ARRAY_ENABLED_ARB                = $8622;
   GL_VERTEX_ATTRIB_ARRAY_SIZE_ARB                   = $8623;
   GL_VERTEX_ATTRIB_ARRAY_STRIDE_ARB                 = $8624;
   GL_VERTEX_ATTRIB_ARRAY_TYPE_ARB                   = $8625;
   GL_VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB             = $886A;
   GL_CURRENT_VERTEX_ATTRIB_ARB                      = $8626;
   GL_VERTEX_ATTRIB_ARRAY_POINTER_ARB                = $8645;
   GL_PROGRAM_LENGTH_ARB                             = $8627;
   GL_PROGRAM_FORMAT_ARB                             = $8876;
   GL_PROGRAM_BINDING_ARB                            = $8677;
   GL_PROGRAM_INSTRUCTIONS_ARB                       = $88A0;
   GL_MAX_PROGRAM_INSTRUCTIONS_ARB                   = $88A1;
   GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB                = $88A2;
   GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB            = $88A3;
   GL_PROGRAM_TEMPORARIES_ARB                        = $88A4;
   GL_MAX_PROGRAM_TEMPORARIES_ARB                    = $88A5;
   GL_PROGRAM_NATIVE_TEMPORARIES_ARB                 = $88A6;
   GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB             = $88A7;
   GL_PROGRAM_PARAMETERS_ARB                         = $88A8;
   GL_MAX_PROGRAM_PARAMETERS_ARB                     = $88A9;
   GL_PROGRAM_NATIVE_PARAMETERS_ARB                  = $88AA;
   GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB              = $88AB;
   GL_PROGRAM_ATTRIBS_ARB                            = $88AC;
   GL_MAX_PROGRAM_ATTRIBS_ARB                        = $88AD;
   GL_PROGRAM_NATIVE_ATTRIBS_ARB                     = $88AE;
   GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB                 = $88AF;
   GL_PROGRAM_ADDRESS_REGISTERS_ARB                  = $88B0;
   GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB              = $88B1;
   GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB           = $88B2;
   GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB       = $88B3;
   GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB               = $88B4;
   GL_MAX_PROGRAM_ENV_PARAMETERS_ARB                 = $88B5;
   GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB                = $88B6;
   GL_PROGRAM_STRING_ARB                             = $8628;
   GL_PROGRAM_ERROR_POSITION_ARB                     = $864B;
   GL_CURRENT_MATRIX_ARB                             = $8641;
   GL_TRANSPOSE_CURRENT_MATRIX_ARB                   = $88B7;
   GL_CURRENT_MATRIX_STACK_DEPTH_ARB                 = $8640;
   GL_MAX_VERTEX_ATTRIBS_ARB                         = $8869;
   GL_MAX_PROGRAM_MATRICES_ARB                       = $862F;
   GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB             = $862E;
   GL_PROGRAM_ERROR_STRING_ARB                       = $8874;
   GL_MATRIX0_ARB                                    = $88C0;
   GL_MATRIX1_ARB                                    = $88C1;
   GL_MATRIX2_ARB                                    = $88C2;
   GL_MATRIX3_ARB                                    = $88C3;
   GL_MATRIX4_ARB                                    = $88C4;
   GL_MATRIX5_ARB                                    = $88C5;
   GL_MATRIX6_ARB                                    = $88C6;
   GL_MATRIX7_ARB                                    = $88C7;
   GL_MATRIX8_ARB                                    = $88C8;
   GL_MATRIX9_ARB                                    = $88C9;
   GL_MATRIX10_ARB                                   = $88CA;
   GL_MATRIX11_ARB                                   = $88CB;
   GL_MATRIX12_ARB                                   = $88CC;
   GL_MATRIX13_ARB                                   = $88CD;
   GL_MATRIX14_ARB                                   = $88CE;
   GL_MATRIX15_ARB                                   = $88CF;
   GL_MATRIX16_ARB                                   = $88D0;
   GL_MATRIX17_ARB                                   = $88D1;
   GL_MATRIX18_ARB                                   = $88D2;
   GL_MATRIX19_ARB                                   = $88D3;
   GL_MATRIX20_ARB                                   = $88D4;
   GL_MATRIX21_ARB                                   = $88D5;
   GL_MATRIX22_ARB                                   = $88D6;
   GL_MATRIX23_ARB                                   = $88D7;
   GL_MATRIX24_ARB                                   = $88D8;
   GL_MATRIX25_ARB                                   = $88D9;
   GL_MATRIX26_ARB                                   = $88DA;
   GL_MATRIX27_ARB                                   = $88DB;
   GL_MATRIX28_ARB                                   = $88DC;
   GL_MATRIX29_ARB                                   = $88DD;
   GL_MATRIX30_ARB                                   = $88DE;
   GL_MATRIX31_ARB                                   = $88DF;

   // ARB_vertex_buffer_object
   GL_ARRAY_BUFFER_ARB                               = $8892;
   GL_ELEMENT_ARRAY_BUFFER_ARB                       = $8893;
   GL_ARRAY_BUFFER_BINDING_ARB                       = $8894;
   GL_ELEMENT_ARRAY_BUFFER_BINDING_ARB               = $8895;
   GL_VERTEX_ARRAY_BUFFER_BINDING_ARB                = $8896;
   GL_NORMAL_ARRAY_BUFFER_BINDING_ARB                = $8897;
   GL_COLOR_ARRAY_BUFFER_BINDING_ARB                 = $8898;
   GL_INDEX_ARRAY_BUFFER_BINDING_ARB                 = $8899;
   GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB         = $889A;
   GL_EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB             = $889B;
   GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB       = $889C;
   GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB        = $889D;
   GL_WEIGHT_ARRAY_BUFFER_BINDING_ARB                = $889E;
   GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB         = $889F;
   GL_STREAM_DRAW_ARB                                = $88E0;
   GL_STREAM_READ_ARB                                = $88E1;
   GL_STREAM_COPY_ARB                                = $88E2;
   GL_STATIC_DRAW_ARB                                = $88E4;
   GL_STATIC_READ_ARB                                = $88E5;
   GL_STATIC_COPY_ARB                                = $88E6;
   GL_DYNAMIC_DRAW_ARB                               = $88E8;
   GL_DYNAMIC_READ_ARB                               = $88E9;
   GL_DYNAMIC_COPY_ARB                               = $88EA;
   GL_READ_ONLY_ARB                                  = $88B8;
   GL_WRITE_ONLY_ARB                                 = $88B9;
   GL_READ_WRITE_ARB                                 = $88BA;
   GL_BUFFER_SIZE_ARB                                = $8764;
   GL_BUFFER_USAGE_ARB                               = $8765;
   GL_BUFFER_ACCESS_ARB                              = $88BB;
   GL_BUFFER_MAPPED_ARB                              = $88BC;
   GL_BUFFER_MAP_POINTER_ARB                         = $88BD;

   // ARB_pixel_buffer_object
   GL_PIXEL_PACK_BUFFER_ARB                          = $88EB;
   GL_PIXEL_UNPACK_BUFFER_ARB                        = $88EC;
   GL_PIXEL_PACK_BUFFER_BINDING_ARB                  = $88ED;
   GL_PIXEL_UNPACK_BUFFER_BINDING_ARB                = $88EF;

   // ARB_shader_objects
   GL_PROGRAM_OBJECT_ARB                             = $8B40;
   GL_OBJECT_TYPE_ARB                                = $8B4E;
   GL_OBJECT_SUBTYPE_ARB                             = $8B4F;
   GL_OBJECT_DELETE_STATUS_ARB                       = $8B80;
   GL_OBJECT_COMPILE_STATUS_ARB                      = $8B81;
   GL_OBJECT_LINK_STATUS_ARB                         = $8B82;
   GL_OBJECT_VALIDATE_STATUS_ARB                     = $8B83;
   GL_OBJECT_INFO_LOG_LENGTH_ARB                     = $8B84;
   GL_OBJECT_ATTACHED_OBJECTS_ARB                    = $8B85;
   GL_OBJECT_ACTIVE_UNIFORMS_ARB                     = $8B86;
   GL_OBJECT_ACTIVE_UNIFORM_MAX_LENGTH_ARB           = $8B87;
   GL_OBJECT_SHADER_SOURCE_LENGTH_ARB                = $8B88;
   GL_SHADER_OBJECT_ARB                              = $8B48;
   GL_FLOAT_VEC2_ARB                                 = $8B50;
   GL_FLOAT_VEC3_ARB                                 = $8B51;
   GL_FLOAT_VEC4_ARB                                 = $8B52;
   GL_INT_VEC2_ARB                                   = $8B53;
   GL_INT_VEC3_ARB                                   = $8B54;
   GL_INT_VEC4_ARB                                   = $8B55;
   GL_BOOL_ARB                                       = $8B56;
   GL_BOOL_VEC2_ARB                                  = $8B57;
   GL_BOOL_VEC3_ARB                                  = $8B58;
   GL_BOOL_VEC4_ARB                                  = $8B59;
   GL_FLOAT_MAT2_ARB                                 = $8B5A;
   GL_FLOAT_MAT3_ARB                                 = $8B5B;
   GL_FLOAT_MAT4_ARB                                 = $8B5C;

   // ARB_vertex_shader
   GL_VERTEX_SHADER_ARB                              = $8B31;
   GL_MAX_VERTEX_UNIFORM_COMPONENTS_ARB              = $8B4A;
   GL_MAX_VARYING_FLOATS_ARB                         = $8B4B;
   GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB             = $8B4C;
   GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB           = $8B4D;
   GL_OBJECT_ACTIVE_ATTRIBUTES_ARB                   = $8B89;
   GL_OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB         = $8B8A;

   // ARB_fragment_shader
   GL_FRAGMENT_SHADER_ARB                            = $8B30;
   GL_MAX_FRAGMENT_UNIFORM_COMPONENTS_ARB            = $8B49;

   // ARB_fragment_program
   GL_FRAGMENT_PROGRAM_ARB                           = $8804;

   // NV_texture_env_combine4
   GL_COMBINE4_NV                                    = $8503;
   GL_SOURCE3_RGB_NV                                 = $8583;
   GL_SOURCE3_ALPHA_NV                               = $858B;
   GL_OPERAND3_RGB_NV                                = $8593;
   GL_OPERAND3_ALPHA_NV                              = $859B;

   GL_BLEND_EQUATION                                 = $8009;
   GL_TABLE_TOO_LARGE                                = $8031;
   GL_UNSIGNED_BYTE_3_3_2                            = $8032;
   GL_UNSIGNED_SHORT_4_4_4_4                         = $8033;
   GL_UNSIGNED_SHORT_5_5_5_1                         = $8034;
   GL_UNSIGNED_INT_8_8_8_8                           = $8035;
   GL_UNSIGNED_INT_10_10_10_2                        = $8036;
   GL_UNSIGNED_BYTE_2_3_3_REV                        = $8362;
   GL_UNSIGNED_SHORT_5_6_5                           = $8363;
   GL_UNSIGNED_SHORT_5_6_5_REV                       = $8364;
   GL_UNSIGNED_SHORT_4_4_4_4_REV                     = $8365;
   GL_UNSIGNED_SHORT_1_5_5_5_REV                     = $8366;
   GL_UNSIGNED_INT_8_8_8_8_REV                       = $8367;
   GL_UNSIGNED_INT_2_10_10_10_REV                    = $8368;

   // GL_ARB_transpose_matrix
   GL_TRANSPOSE_MODELVIEW_MATRIX_ARB                 = $84E3;
   GL_TRANSPOSE_PROJECTION_MATRIX_ARB                = $84E4;
   GL_TRANSPOSE_TEXTURE_MATRIX_ARB                   = $84E5;
   GL_TRANSPOSE_COLOR_MATRIX_ARB                     = $84E6;

   // GL_ARB_multisample
   GL_MULTISAMPLE_ARB                                = $809D;
   GL_SAMPLE_ALPHA_TO_COVERAGE_ARB                   = $809E;
   GL_SAMPLE_ALPHA_TO_ONE_ARB                        = $809F;
   GL_SAMPLE_COVERAGE_ARB                            = $80A0;
   GL_SAMPLE_BUFFERS_ARB                             = $80A8;
   GL_SAMPLES_ARB                                    = $80A9;
   GL_SAMPLE_COVERAGE_VALUE_ARB                      = $80AA;
   GL_SAMPLE_COVERAGE_INVERT_ARB                     = $80AB;
   GL_MULTISAMPLE_BIT_ARB                            = $20000000;
   GLX_SAMPLE_BUFFERS_ARB                            = 100000;
   GLX_SAMPLES_ARB                                   = 100001;
   WGL_SAMPLE_BUFFERS_ARB                            = $2041;
   WGL_SAMPLES_ARB                                   = $2042;

   // GL_ARB_depth_texture
   GL_DEPTH_COMPONENT16_ARB                          = $81A5;
   GL_DEPTH_COMPONENT24_ARB                          = $81A6;
   GL_DEPTH_COMPONENT32_ARB                          = $81A7;
   GL_TEXTURE_DEPTH_SIZE_ARB                         = $884A;
   GL_DEPTH_TEXTURE_MODE_ARB                         = $884B;

   // GL_ARB_shadow
   GL_TEXTURE_COMPARE_MODE_ARB                       = $884C;
   GL_TEXTURE_COMPARE_FUNC_ARB                       = $884D;
   GL_COMPARE_R_TO_TEXTURE_ARB                       = $884E;

   // GL_ARB_texture_cube_map
   GL_NORMAL_MAP_ARB                                 = $8511;
   GL_REFLECTION_MAP_ARB                             = $8512;
   GL_TEXTURE_CUBE_MAP_ARB                           = $8513;
   GL_TEXTURE_BINDING_CUBE_MAP_ARB                   = $8514;
   GL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB                = $8515;
   GL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB                = $8516;
   GL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB                = $8517;
   GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB                = $8518;
   GL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB                = $8519;
   GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB                = $851A;
   GL_PROXY_TEXTURE_CUBE_MAP_ARB                     = $851B;
   GL_MAX_CUBE_MAP_TEXTURE_SIZE_ARB                  = $851C;

   // GL_ARB_texture_border_clamp
   GL_CLAMP_TO_BORDER_ARB                            = $812D;

   // GL_ARB_texture_compression
   GL_COMPRESSED_ALPHA_ARB                           = $84E9;
   GL_COMPRESSED_LUMINANCE_ARB                       = $84EA;
   GL_COMPRESSED_LUMINANCE_ALPHA_ARB                 = $84EB;
   GL_COMPRESSED_INTENSITY_ARB                       = $84EC;
   GL_COMPRESSED_RGB_ARB                             = $84ED;
   GL_COMPRESSED_RGBA_ARB                            = $84EE;
   GL_TEXTURE_COMPRESSION_HINT_ARB                   = $84EF;
   GL_TEXTURE_COMPRESSED_IMAGE_SIZE_ARB              = $86A0;
   GL_TEXTURE_COMPRESSED_ARB                         = $86A1;
   GL_NUM_COMPRESSED_TEXTURE_FORMATS_ARB             = $86A2;
   GL_COMPRESSED_TEXTURE_FORMATS_ARB                 = $86A3;

   // GL_ARB_vertex_blend
   GL_MAX_VERTEX_UNITS_ARB                           = $86A4;
   GL_ACTIVE_VERTEX_UNITS_ARB                        = $86A5;
   GL_WEIGHT_SUM_UNITY_ARB                           = $86A6;
   GL_VERTEX_BLEND_ARB                               = $86A7;
   GL_CURRENT_WEIGHT_ARB                             = $86A8;
   GL_WEIGHT_ARRAY_TYPE_ARB                          = $86A9;
   GL_WEIGHT_ARRAY_STRIDE_ARB                        = $86AA;
   GL_WEIGHT_ARRAY_SIZE_ARB                          = $86AB;
   GL_WEIGHT_ARRAY_POINTER_ARB                       = $86AC;
   GL_WEIGHT_ARRAY_ARB                               = $86AD;
   GL_MODELVIEW0_ARB                                 = $1700;
   GL_MODELVIEW1_ARB                                 = $850A;
   GL_MODELVIEW2_ARB                                = $8722;
   GL_MODELVIEW3_ARB                                = $8723;
   GL_MODELVIEW4_ARB                                = $8724;
   GL_MODELVIEW5_ARB                                = $8725;
   GL_MODELVIEW6_ARB                                = $8726;
   GL_MODELVIEW7_ARB                                = $8727;
   GL_MODELVIEW8_ARB                                = $8728;
   GL_MODELVIEW9_ARB                                = $8729;
   GL_MODELVIEW10_ARB                               = $872A;
   GL_MODELVIEW11_ARB                               = $872B;
   GL_MODELVIEW12_ARB                               = $872C;
   GL_MODELVIEW13_ARB                               = $872D;
   GL_MODELVIEW14_ARB                               = $872E;
   GL_MODELVIEW15_ARB                               = $872F;
   GL_MODELVIEW16_ARB                               = $8730;
   GL_MODELVIEW17_ARB                               = $8731;
   GL_MODELVIEW18_ARB                               = $8732;
   GL_MODELVIEW19_ARB                               = $8733;
   GL_MODELVIEW20_ARB                               = $8734;
   GL_MODELVIEW21_ARB                               = $8735;
   GL_MODELVIEW22_ARB                               = $8736;
   GL_MODELVIEW23_ARB                               = $8737;
   GL_MODELVIEW24_ARB                               = $8738;
   GL_MODELVIEW25_ARB                               = $8739;
   GL_MODELVIEW26_ARB                               = $873A;
   GL_MODELVIEW27_ARB                               = $873B;
   GL_MODELVIEW28_ARB                               = $873C;
   GL_MODELVIEW29_ARB                               = $873D;
   GL_MODELVIEW30_ARB                               = $873E;
   GL_MODELVIEW31_ARB                               = $873F;

  // GL_ARB_texture_float
  GL_TEXTURE_RED_TYPE_ARB                           = $8C10;
  GL_TEXTURE_GREEN_TYPE_ARB                         = $8C11;
  GL_TEXTURE_BLUE_TYPE_ARB                          = $8C12;
  GL_TEXTURE_ALPHA_TYPE_ARB                         = $8C13;
  GL_TEXTURE_LUMINANCE_TYPE_ARB                     = $8C14;
  GL_TEXTURE_INTENSITY_TYPE_ARB                     = $8C15;
  GL_TEXTURE_DEPTH_TYPE_ARB                         = $8C16;
  GL_UNSIGNED_NORMALIZED_ARB                        = $8C17;
  GL_RGBA32F_ARB                                    = $8814;
  GL_RGB32F_ARB                                     = $8815;
  GL_ALPHA32F_ARB                                   = $8816;
  GL_INTENSITY32F_ARB                               = $8817;
  GL_LUMINANCE32F_ARB                               = $8818;
  GL_LUMINANCE_ALPHA32F_ARB                         = $8819;
  GL_RGBA16F_ARB                                    = $881A;
  GL_RGB16F_ARB                                     = $881B;
  GL_ALPHA16F_ARB                                   = $881C;
  GL_INTENSITY16F_ARB                               = $881D;
  GL_LUMINANCE16F_ARB                               = $881E;
  GL_LUMINANCE_ALPHA16F_ARB                         = $881F;

   // GL_SGIS_texture_lod
   GL_TEXTURE_MIN_LOD_SGIS                          = $813A;
   GL_TEXTURE_MAX_LOD_SGIS                          = $813B;
   GL_TEXTURE_BASE_LEVEL_SGIS                       = $813C;
   GL_TEXTURE_MAX_LEVEL_SGIS                        = $813D;

   // GL_SGIS_multisample
   GL_MULTISAMPLE_SGIS                              = $809D;
   GL_SAMPLE_ALPHA_TO_MASK_SGIS                     = $809E;
   GL_SAMPLE_ALPHA_TO_ONE_SGIS                      = $809F;
   GL_SAMPLE_MASK_SGIS                              = $80A0;
   GL_1PASS_SGIS                                    = $80A1;
   GL_2PASS_0_SGIS                                  = $80A2;
   GL_2PASS_1_SGIS                                  = $80A3;
   GL_4PASS_0_SGIS                                  = $80A4;
   GL_4PASS_1_SGIS                                  = $80A5;
   GL_4PASS_2_SGIS                                  = $80A6;
   GL_4PASS_3_SGIS                                  = $80A7;
   GL_SAMPLE_BUFFERS_SGIS                           = $80A8;
   GL_SAMPLES_SGIS                                  = $80A9;
   GL_SAMPLE_MASK_VALUE_SGIS                        = $80AA;
   GL_SAMPLE_MASK_INVERT_SGIS                       = $80AB;
   GL_SAMPLE_PATTERN_SGIS                           = $80AC;

   // GL_SGIS_generate_mipmap
   GL_GENERATE_MIPMAP_SGIS                          = $8191;
   GL_GENERATE_MIPMAP_HINT_SGIS                     = $8192;

   // GL_SGIX_shadow
   GL_TEXTURE_COMPARE_SGIX                          = $819A;
   GL_TEXTURE_COMPARE_OPERATOR_SGIX                 = $819B;
   GL_TEXTURE_LEQUAL_R_SGIX                         = $819C;
   GL_TEXTURE_GEQUAL_R_SGIX                         = $819D;

   // GL_SGIS_texture_edge_clamp
   GL_CLAMP_TO_EDGE_SGIS                            = $812F;

   // GL_SGIS_texture_border_clamp
   GL_CLAMP_TO_BORDER_SGIS                          = $812D;

   // GL_EXT_paletted_texture
   GL_TEXTURE_INDEX_SIZE_EXT                        = $80ED;

   // GL_SGIX_shadow_ambient
   GL_SHADOW_AMBIENT_SGIX                           = $80BF;

   // GL_IBM_rasterpos_clip
   GL_RASTER_POSITION_UNCLIPPED_IBM                 = $19262;

   // GL_EXT_draw_range_elements
   GL_MAX_ELEMENTS_VERTICES_EXT                     = $80E8;
   GL_MAX_ELEMENTS_INDICES_EXT                      = $80E9;

   // GL_HP_occlusion_test
   GL_OCCLUSION_TEST_HP                             = $8165;
   GL_OCCLUSION_TEST_RESULT_HP                      = $8166;

   // GL_EXT_separate_specular_color
   GL_LIGHT_MODEL_COLOR_CONTROL_EXT                 = $81F8;
   GL_SINGLE_COLOR_EXT                              = $81F9;
   GL_SEPARATE_SPECULAR_COLOR_EXT                   = $81FA;

   // GL_EXT_secondary_color
   GL_COLOR_SUM_EXT                                 = $8458;
   GL_CURRENT_SECONDARY_COLOR_EXT                   = $8459;
   GL_SECONDARY_COLOR_ARRAY_SIZE_EXT                = $845A;
   GL_SECONDARY_COLOR_ARRAY_TYPE_EXT                = $845B;
   GL_SECONDARY_COLOR_ARRAY_STRIDE_EXT              = $845C;
   GL_SECONDARY_COLOR_ARRAY_POINTER_EXT             = $845D;
   GL_SECONDARY_COLOR_ARRAY_EXT                     = $845E;

   // GL_EXT_fog_coord
   GL_FOG_COORDINATE_SOURCE_EXT                     = $8450;
   GL_FOG_COORDINATE_EXT                            = $8451;
   GL_FRAGMENT_DEPTH_EXT                            = $8452;
   GL_CURRENT_FOG_COORDINATE_EXT                    = $8453;
   GL_FOG_COORDINATE_ARRAY_TYPE_EXT                 = $8454;
   GL_FOG_COORDINATE_ARRAY_STRIDE_EXT               = $8455;
   GL_FOG_COORDINATE_ARRAY_POINTER_EXT              = $8456;
   GL_FOG_COORDINATE_ARRAY_EXT                      = $8457;

   // GL_EXT_texture_env_combine
   GL_SOURCE3_RGB_EXT                               = $8583;
   GL_SOURCE4_RGB_EXT                               = $8584;
   GL_SOURCE5_RGB_EXT                               = $8585;
   GL_SOURCE6_RGB_EXT                               = $8586;
   GL_SOURCE7_RGB_EXT                               = $8587;
   GL_SOURCE3_ALPHA_EXT                             = $858B;
   GL_SOURCE4_ALPHA_EXT                             = $858C;
   GL_SOURCE5_ALPHA_EXT                             = $858D;
   GL_SOURCE6_ALPHA_EXT                             = $858E;
   GL_SOURCE7_ALPHA_EXT                             = $858F;
   GL_OPERAND3_RGB_EXT                              = $8593;
   GL_OPERAND4_RGB_EXT                              = $8594;
   GL_OPERAND5_RGB_EXT                              = $8595;
   GL_OPERAND6_RGB_EXT                              = $8596;
   GL_OPERAND7_RGB_EXT                              = $8597;
   GL_OPERAND3_ALPHA_EXT                            = $859B;
   GL_OPERAND4_ALPHA_EXT                            = $859C;
   GL_OPERAND5_ALPHA_EXT                            = $859D;
   GL_OPERAND6_ALPHA_EXT                            = $859E;
   GL_OPERAND7_ALPHA_EXT                            = $859F;

   // GL_EXT_blend_func_separate
   GL_BLEND_DST_RGB_EXT                             = $80C8;
   GL_BLEND_SRC_RGB_EXT                             = $80C9;
   GL_BLEND_DST_ALPHA_EXT                           = $80CA;
   GL_BLEND_SRC_ALPHA_EXT                           = $80CB;

   // GL_EXT_texture_cube_map
   GL_NORMAL_MAP_EXT                                = $8511;
   GL_REFLECTION_MAP_EXT                            = $8512;
   GL_TEXTURE_CUBE_MAP_EXT                          = $8513;
   GL_TEXTURE_BINDING_CUBE_MAP_EXT                  = $8514;
   GL_TEXTURE_CUBE_MAP_POSITIVE_X_EXT               = $8515;
   GL_TEXTURE_CUBE_MAP_NEGATIVE_X_EXT               = $8516;
   GL_TEXTURE_CUBE_MAP_POSITIVE_Y_EXT               = $8517;
   GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_EXT               = $8518;
   GL_TEXTURE_CUBE_MAP_POSITIVE_Z_EXT               = $8519;
   GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_EXT               = $851A;
   GL_PROXY_TEXTURE_CUBE_MAP_EXT                    = $851B;
   GL_MAX_CUBE_MAP_TEXTURE_SIZE_EXT                 = $851C;

   // GL_EXT_texture_lod_bias
   GL_MAX_TEXTURE_LOD_BIAS_EXT                      = $84FD;
   GL_TEXTURE_FILTER_CONTROL_EXT                    = $8500;
   GL_TEXTURE_LOD_BIAS_EXT                          = $8501;

   // GL_EXT_texture_filter_anisotropic
   GL_TEXTURE_MAX_ANISOTROPY_EXT                    = $84FE;
   GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT                = $84FF;

   // GL_NV_light_max_exponent
   GL_MAX_SHININESS_NV                              = $8504;
   GL_MAX_SPOT_EXPONENT_NV                          = $8505;

   // GL_NV_vertex_array_range
   GL_VERTEX_ARRAY_RANGE_NV                         = $851D;
   GL_VERTEX_ARRAY_RANGE_LENGTH_NV                  = $851E;
   GL_VERTEX_ARRAY_RANGE_VALID_NV                   = $851F;
   GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV             = $8520;
   GL_VERTEX_ARRAY_RANGE_POINTER_NV                 = $8521;

   // GL_NV_vertex_array_range2
   GL_VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV          = $8533;

   // GL_NV_register_combiners
   GL_REGISTER_COMBINERS_NV                         = $8522;
   GL_VARIABLE_A_NV                                 = $8523;
   GL_VARIABLE_B_NV                                 = $8524;
   GL_VARIABLE_C_NV                                 = $8525;
   GL_VARIABLE_D_NV                                 = $8526;
   GL_VARIABLE_E_NV                                 = $8527;
   GL_VARIABLE_F_NV                                 = $8528;
   GL_VARIABLE_G_NV                                 = $8529;
   GL_CONSTANT_COLOR0_NV                            = $852A;
   GL_CONSTANT_COLOR1_NV                            = $852B;
   GL_PRIMARY_COLOR_NV                              = $852C;
   GL_SECONDARY_COLOR_NV                            = $852D;
   GL_SPARE0_NV                                     = $852E;
   GL_SPARE1_NV                                     = $852F;
   GL_DISCARD_NV                                    = $8530;
   GL_E_TIMES_F_NV                                  = $8531;
   GL_SPARE0_PLUS_SECONDARY_COLOR_NV                = $8532;
   GL_UNSIGNED_IDENTITY_NV                          = $8536;
   GL_UNSIGNED_INVERT_NV                            = $8537;
   GL_EXPAND_NORMAL_NV                              = $8538;
   GL_EXPAND_NEGATE_NV                              = $8539;
   GL_HALF_BIAS_NORMAL_NV                           = $853A;
   GL_HALF_BIAS_NEGATE_NV                           = $853B;
   GL_SIGNED_IDENTITY_NV                            = $853C;
   GL_SIGNED_NEGATE_NV                              = $853D;
   GL_SCALE_BY_TWO_NV                               = $853E;
   GL_SCALE_BY_FOUR_NV                              = $853F;
   GL_SCALE_BY_ONE_HALF_NV                          = $8540;
   GL_BIAS_BY_NEGATIVE_ONE_HALF_NV                  = $8541;
   GL_COMBINER_INPUT_NV                             = $8542;
   GL_COMBINER_MAPPING_NV                           = $8543;
   GL_COMBINER_COMPONENT_USAGE_NV                   = $8544;
   GL_COMBINER_AB_DOT_PRODUCT_NV                    = $8545;
   GL_COMBINER_CD_DOT_PRODUCT_NV                    = $8546;
   GL_COMBINER_MUX_SUM_NV                           = $8547;
   GL_COMBINER_SCALE_NV                             = $8548;
   GL_COMBINER_BIAS_NV                              = $8549;
   GL_COMBINER_AB_OUTPUT_NV                         = $854A;
   GL_COMBINER_CD_OUTPUT_NV                         = $854B;
   GL_COMBINER_SUM_OUTPUT_NV                        = $854C;
   GL_MAX_GENERAL_COMBINERS_NV                      = $854D;
   GL_NUM_GENERAL_COMBINERS_NV                      = $854E;
   GL_COLOR_SUM_CLAMP_NV                            = $854F;
   GL_COMBINER0_NV                                  = $8550;
   GL_COMBINER1_NV                                  = $8551;
   GL_COMBINER2_NV                                  = $8552;
   GL_COMBINER3_NV                                  = $8553;
   GL_COMBINER4_NV                                  = $8554;
   GL_COMBINER5_NV                                  = $8555;
   GL_COMBINER6_NV                                  = $8556;
   GL_COMBINER7_NV                                  = $8557;

   // GL_NV_fog_distance
   GL_FOG_DISTANCE_MODE_NV                          = $855A;
   GL_EYE_RADIAL_NV                                 = $855B;
   GL_EYE_PLANE_ABSOLUTE_NV                         = $855C;

   // GL_EXT_texture_compression_s3tc
   GL_COMPRESSED_RGB_S3TC_DXT1_EXT                  = $83F0;
   GL_COMPRESSED_RGBA_S3TC_DXT1_EXT                 = $83F1;
   GL_COMPRESSED_RGBA_S3TC_DXT3_EXT                 = $83F2;
   GL_COMPRESSED_RGBA_S3TC_DXT5_EXT                 = $83F3;

   // GL_3DFX_texture_compression_FXT1
   GL_COMPRESSED_RGB_FXT1_3DFX                      = $86B0;
   GL_COMPRESSED_RGBA_FXT1_3DFX                     = $86B1;

   // GL_3DFX_multisample
   GL_MULTISAMPLE_3DFX                              = $86B2;
   GL_SAMPLE_BUFFERS_3DFX                           = $86B3;
   GL_SAMPLES_3DFX                                  = $86B4;
   GL_MULTISAMPLE_BIT_3DFX                          = $20000000;

   // GL_EXT_multisample
   GL_MULTISAMPLE_EXT                               = $809D;
   GL_SAMPLE_ALPHA_TO_MASK_EXT                      = $809E;
   GL_SAMPLE_ALPHA_TO_ONE_EXT                       = $809F;
   GL_SAMPLE_MASK_EXT                               = $80A0;
   GL_1PASS_EXT                                     = $80A1;
   GL_2PASS_0_EXT                                   = $80A2;
   GL_2PASS_1_EXT                                   = $80A3;
   GL_4PASS_0_EXT                                   = $80A4;
   GL_4PASS_1_EXT                                   = $80A5;
   GL_4PASS_2_EXT                                   = $80A6;
   GL_4PASS_3_EXT                                   = $80A7;
   GL_SAMPLE_BUFFERS_EXT                            = $80A8;
   GL_SAMPLES_EXT                                   = $80A9;
   GL_SAMPLE_MASK_VALUE_EXT                         = $80AA;
   GL_SAMPLE_MASK_INVERT_EXT                        = $80AB;
   GL_SAMPLE_PATTERN_EXT                            = $80AC;

   // GL_EXT_clip_volume_hint
   GL_CLIP_VOLUME_CLIPPING_HINT_EXT                 = $80F0;

   // GL_SGIS_texture_color_mask
   GL_TEXTURE_COLOR_WRITEMASK_SGIS                  = $81EF;

   // GL_NV_vertex_program
   GL_VERTEX_PROGRAM_NV                             = $8620;
   GL_VERTEX_STATE_PROGRAM_NV                       = $8621;
   GL_ATTRIB_ARRAY_SIZE_NV                          = $8623;
   GL_ATTRIB_ARRAY_STRIDE_NV                        = $8624;
   GL_ATTRIB_ARRAY_TYPE_NV                          = $8625;
   GL_CURRENT_ATTRIB_NV                             = $8626;
   GL_PROGRAM_LENGTH_NV                             = $8627;
   GL_PROGRAM_STRING_NV                             = $8628;
   GL_MODELVIEW_PROJECTION_NV                       = $8629;
   GL_IDENTITY_NV                                   = $862A;
   GL_INVERSE_NV                                    = $862B;
   GL_TRANSPOSE_NV                                  = $862C;
   GL_INVERSE_TRANSPOSE_NV                          = $862D;
   GL_MAX_TRACK_MATRIX_STACK_DEPTH_NV               = $862E;
   GL_MAX_TRACK_MATRICES_NV                         = $862F;
   GL_MATRIX0_NV                                    = $8630;
   GL_MATRIX1_NV                                    = $8631;
   GL_MATRIX2_NV                                    = $8632;
   GL_MATRIX3_NV                                    = $8633;
   GL_MATRIX4_NV                                    = $8634;
   GL_MATRIX5_NV                                    = $8635;
   GL_MATRIX6_NV                                    = $8636;
   GL_MATRIX7_NV                                    = $8637;
   GL_CURRENT_MATRIX_STACK_DEPTH_NV                 = $8640;
   GL_CURRENT_MATRIX_NV                             = $8641;
   GL_VERTEX_PROGRAM_POINT_SIZE_NV                  = $8642;
   GL_VERTEX_PROGRAM_TWO_SIDE_NV                    = $8643;
   GL_PROGRAM_PARAMETER_NV                          = $8644;
   GL_ATTRIB_ARRAY_POINTER_NV                       = $8645;
   GL_PROGRAM_TARGET_NV                             = $8646;
   GL_PROGRAM_RESIDENT_NV                           = $8647;
   GL_TRACK_MATRIX_NV                               = $8648;
   GL_TRACK_MATRIX_TRANSFORM_NV                     = $8649;
   GL_VERTEX_PROGRAM_BINDING_NV                     = $864A;
   GL_PROGRAM_ERROR_POSITION_NV                     = $864B;
   GL_VERTEX_ATTRIB_ARRAY0_NV                       = $8650;
   GL_VERTEX_ATTRIB_ARRAY1_NV                       = $8651;
   GL_VERTEX_ATTRIB_ARRAY2_NV                       = $8652;
   GL_VERTEX_ATTRIB_ARRAY3_NV                       = $8653;
   GL_VERTEX_ATTRIB_ARRAY4_NV                       = $8654;
   GL_VERTEX_ATTRIB_ARRAY5_NV                       = $8655;
   GL_VERTEX_ATTRIB_ARRAY6_NV                       = $8656;
   GL_VERTEX_ATTRIB_ARRAY7_NV                       = $8657;
   GL_VERTEX_ATTRIB_ARRAY8_NV                       = $8658;
   GL_VERTEX_ATTRIB_ARRAY9_NV                       = $8659;
   GL_VERTEX_ATTRIB_ARRAY10_NV                      = $865A;
   GL_VERTEX_ATTRIB_ARRAY11_NV                      = $865B;
   GL_VERTEX_ATTRIB_ARRAY12_NV                      = $865C;
   GL_VERTEX_ATTRIB_ARRAY13_NV                      = $865D;
   GL_VERTEX_ATTRIB_ARRAY14_NV                      = $865E;
   GL_VERTEX_ATTRIB_ARRAY15_NV                      = $865F;
   GL_MAP1_VERTEX_ATTRIB0_4_NV                      = $8660;
   GL_MAP1_VERTEX_ATTRIB1_4_NV                      = $8661;
   GL_MAP1_VERTEX_ATTRIB2_4_NV                      = $8662;
   GL_MAP1_VERTEX_ATTRIB3_4_NV                      = $8663;
   GL_MAP1_VERTEX_ATTRIB4_4_NV                      = $8664;
   GL_MAP1_VERTEX_ATTRIB5_4_NV                      = $8665;
   GL_MAP1_VERTEX_ATTRIB6_4_NV                      = $8666;
   GL_MAP1_VERTEX_ATTRIB7_4_NV                      = $8667;
   GL_MAP1_VERTEX_ATTRIB8_4_NV                      = $8668;
   GL_MAP1_VERTEX_ATTRIB9_4_NV                      = $8669;
   GL_MAP1_VERTEX_ATTRIB10_4_NV                     = $866A;
   GL_MAP1_VERTEX_ATTRIB11_4_NV                     = $866B;
   GL_MAP1_VERTEX_ATTRIB12_4_NV                     = $866C;
   GL_MAP1_VERTEX_ATTRIB13_4_NV                     = $866D;
   GL_MAP1_VERTEX_ATTRIB14_4_NV                     = $866E;
   GL_MAP1_VERTEX_ATTRIB15_4_NV                     = $866F;
   GL_MAP2_VERTEX_ATTRIB0_4_NV                      = $8670;
   GL_MAP2_VERTEX_ATTRIB1_4_NV                      = $8671;
   GL_MAP2_VERTEX_ATTRIB2_4_NV                      = $8672;
   GL_MAP2_VERTEX_ATTRIB3_4_NV                      = $8673;
   GL_MAP2_VERTEX_ATTRIB4_4_NV                      = $8674;
   GL_MAP2_VERTEX_ATTRIB5_4_NV                      = $8675;
   GL_MAP2_VERTEX_ATTRIB6_4_NV                      = $8676;
   GL_MAP2_VERTEX_ATTRIB7_4_NV                      = $8677;
   GL_MAP2_VERTEX_ATTRIB8_4_NV                      = $8678;
   GL_MAP2_VERTEX_ATTRIB9_4_NV                      = $8679;
   GL_MAP2_VERTEX_ATTRIB10_4_NV                     = $867A;
   GL_MAP2_VERTEX_ATTRIB11_4_NV                     = $867B;
   GL_MAP2_VERTEX_ATTRIB12_4_NV                     = $867C;
   GL_MAP2_VERTEX_ATTRIB13_4_NV                     = $867D;
   GL_MAP2_VERTEX_ATTRIB14_4_NV                     = $867E;
   GL_MAP2_VERTEX_ATTRIB15_4_NV                     = $867F;

   // NV_multisample_filter_hint
   GL_MULTISAMPLE_FILTER_HINT_NV                    = $8534;

   // WGL_ARB_pixel_format
   WGL_NUMBER_PIXEL_FORMATS_ARB                     = $2000;
   WGL_DRAW_TO_WINDOW_ARB                           = $2001;
   WGL_DRAW_TO_BITMAP_ARB                           = $2002;
   WGL_ACCELERATION_ARB                             = $2003;
   WGL_NEED_PALETTE_ARB                             = $2004;
   WGL_NEED_SYSTEM_PALETTE_ARB                      = $2005;
   WGL_SWAP_LAYER_BUFFERS_ARB                       = $2006;
   WGL_SWAP_METHOD_ARB                              = $2007;
   WGL_NUMBER_OVERLAYS_ARB                          = $2008;
   WGL_NUMBER_UNDERLAYS_ARB                         = $2009;
   WGL_TRANSPARENT_ARB                              = $200A;
   WGL_TRANSPARENT_RED_VALUE_ARB                    = $2037;
   WGL_TRANSPARENT_GREEN_VALUE_ARB                  = $2038;
   WGL_TRANSPARENT_BLUE_VALUE_ARB                   = $2039;
   WGL_TRANSPARENT_ALPHA_VALUE_ARB                  = $203A;
   WGL_TRANSPARENT_INDEX_VALUE_ARB                  = $203B;
   WGL_SHARE_DEPTH_ARB                              = $200C;
   WGL_SHARE_STENCIL_ARB                            = $200D;
   WGL_SHARE_ACCUM_ARB                              = $200E;
   WGL_SUPPORT_GDI_ARB                              = $200F;
   WGL_SUPPORT_OPENGL_ARB                           = $2010;
   WGL_DOUBLE_BUFFER_ARB                            = $2011;
   WGL_STEREO_ARB                                   = $2012;
   WGL_PIXEL_TYPE_ARB                               = $2013;
   WGL_COLOR_BITS_ARB                               = $2014;
   WGL_RED_BITS_ARB                                 = $2015;
   WGL_RED_SHIFT_ARB                                = $2016;
   WGL_GREEN_BITS_ARB                               = $2017;
   WGL_GREEN_SHIFT_ARB                              = $2018;
   WGL_BLUE_BITS_ARB                                = $2019;
   WGL_BLUE_SHIFT_ARB                               = $201A;
   WGL_ALPHA_BITS_ARB                               = $201B;
   WGL_ALPHA_SHIFT_ARB                              = $201C;
   WGL_ACCUM_BITS_ARB                               = $201D;
   WGL_ACCUM_RED_BITS_ARB                           = $201E;
   WGL_ACCUM_GREEN_BITS_ARB                         = $201F;
   WGL_ACCUM_BLUE_BITS_ARB                          = $2020;
   WGL_ACCUM_ALPHA_BITS_ARB                         = $2021;
   WGL_DEPTH_BITS_ARB                               = $2022;
   WGL_STENCIL_BITS_ARB                             = $2023;
   WGL_AUX_BUFFERS_ARB                              = $2024;
   WGL_NO_ACCELERATION_ARB                          = $2025;
   WGL_GENERIC_ACCELERATION_ARB                     = $2026;
   WGL_FULL_ACCELERATION_ARB                        = $2027;
   WGL_SWAP_EXCHANGE_ARB                            = $2028;
   WGL_SWAP_COPY_ARB                                = $2029;
   WGL_SWAP_UNDEFINED_ARB                           = $202A;
   WGL_TYPE_RGBA_ARB                                = $202B;
   WGL_TYPE_COLORINDEX_ARB                          = $202C;

   // WGL_NV_float_buffer
   WGL_FLOAT_COMPONENTS_NV                          = $20B0;
   WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_R_NV         = $20B1;
   WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RG_NV        = $20B2;
   WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RGB_NV       = $20B3;
   WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RGBA_NV      = $20B4;
   WGL_TEXTURE_FLOAT_R_NV                           = $20B5;
   WGL_TEXTURE_FLOAT_RG_NV                          = $20B6;
   WGL_TEXTURE_FLOAT_RGB_NV                         = $20B7;
   WGL_TEXTURE_FLOAT_RGBA_NV                        = $20B8;

   // GL_NV_float_buffer
   GL_FLOAT_R_NV                                    = $8880;
   GL_FLOAT_RG_NV                                   = $8881;
   GL_FLOAT_RGB_NV                                  = $8882;
   GL_FLOAT_RGBA_NV                                 = $8883;
   GL_FLOAT_R16_NV                                  = $8884;
   GL_FLOAT_R32_NV                                  = $8885;
   GL_FLOAT_RG16_NV                                 = $8886;
   GL_FLOAT_RG32_NV                                 = $8887;
   GL_FLOAT_RGB16_NV                                = $8888;
   GL_FLOAT_RGB32_NV                                = $8889;
   GL_FLOAT_RGBA16_NV                               = $888A;
   GL_FLOAT_RGBA32_NV                               = $888B;
   GL_TEXTURE_FLOAT_COMPONENTS_NV                   = $888C;
   GL_FLOAT_CLEAR_COLOR_VALUE_NV                    = $888D;
   GL_FLOAT_RGBA_MODE_NV                            = $888E;

   // WGL_ATI_pixel_format_float
   WGL_TYPE_RGBA_FLOAT_ATI                          = $21A0;
   GL_TYPE_RGBA_FLOAT_ATI                           = $8820;
   GL_COLOR_CLEAR_UNCLAMPED_VALUE_ATI               = $8835;

   // GL_ATI_texture_float
   GL_RGBA_FLOAT32_ATI                              = $8814;
   GL_RGB_FLOAT32_ATI                               = $8815;
   GL_ALPHA_FLOAT32_ATI                             = $8816;
   GL_INTENSITY_FLOAT32_ATI                         = $8817;
   GL_LUMINANCE_FLOAT32_ATI                         = $8818;
   GL_LUMINANCE_ALPHA_FLOAT32_ATI                   = $8819;
   GL_RGBA_FLOAT16_ATI                              = $881A;
   GL_RGB_FLOAT16_ATI                               = $881B;
   GL_ALPHA_FLOAT16_ATI                             = $881C;
   GL_INTENSITY_FLOAT16_ATI                         = $881D;
   GL_LUMINANCE_FLOAT16_ATI                         = $881E;
   GL_LUMINANCE_ALPHA_FLOAT16_ATI                   = $881F;

   // GL_ATI_draw_buffers
   GL_MAX_DRAW_BUFFERS_ATI                          = $8824;
   GL_DRAW_BUFFER0_ATI                              = $8825;
   GL_DRAW_BUFFER1_ATI                              = $8826;
   GL_DRAW_BUFFER2_ATI                              = $8827;
   GL_DRAW_BUFFER3_ATI                              = $8828;
   GL_DRAW_BUFFER4_ATI                              = $8829;
   GL_DRAW_BUFFER5_ATI                              = $882A;
   GL_DRAW_BUFFER6_ATI                              = $882B;
   GL_DRAW_BUFFER7_ATI                              = $882C;
   GL_DRAW_BUFFER8_ATI                              = $882D;
   GL_DRAW_BUFFER9_ATI                              = $882E;
   GL_DRAW_BUFFER10_ATI                             = $882F;
   GL_DRAW_BUFFER11_ATI                             = $8830;
   GL_DRAW_BUFFER12_ATI                             = $8831;
   GL_DRAW_BUFFER13_ATI                             = $8832;
   GL_DRAW_BUFFER14_ATI                             = $8833;
   GL_DRAW_BUFFER15_ATI                             = $8834;

   // GL_ATI_draw_buffers became obsolete with OpenGL 2.0
   GL_MAX_DRAW_BUFFERS                          = $8824;
   GL_DRAW_BUFFER0                              = $8825;
   GL_DRAW_BUFFER1                              = $8826;
   GL_DRAW_BUFFER2                              = $8827;
   GL_DRAW_BUFFER3                              = $8828;
   GL_DRAW_BUFFER4                              = $8829;
   GL_DRAW_BUFFER5                              = $882A;
   GL_DRAW_BUFFER6                              = $882B;
   GL_DRAW_BUFFER7                              = $882C;
   GL_DRAW_BUFFER8                              = $882D;
   GL_DRAW_BUFFER9                              = $882E;
   GL_DRAW_BUFFER10                             = $882F;
   GL_DRAW_BUFFER11                             = $8830;
   GL_DRAW_BUFFER12                             = $8831;
   GL_DRAW_BUFFER13                             = $8832;
   GL_DRAW_BUFFER14                             = $8833;
   GL_DRAW_BUFFER15                             = $8834;

   // GL_EXT_framebuffer_object
   GL_FRAMEBUFFER_EXT                               = $8D40;
   GL_RENDERBUFFER_EXT                              = $8D41;
   GL_STENCIL_INDEX1_EXT                            = $8D46;
   GL_STENCIL_INDEX4_EXT                            = $8D47;
   GL_STENCIL_INDEX8_EXT                            = $8D48;
   GL_STENCIL_INDEX16_EXT                           = $8D49;
   GL_DEPTH24_STENCIL8_EXT							= $88F0;
   GL_RENDERBUFFER_WIDTH_EXT                        = $8D42;
   GL_RENDERBUFFER_HEIGHT_EXT                       = $8D43;
   GL_RENDERBUFFER_INTERNAL_FORMAT_EXT              = $8D44;
   GL_RENDERBUFFER_RED_SIZE_EXT                     = $8D50;
   GL_RENDERBUFFER_GREEN_SIZE_EXT                   = $8D51;
   GL_RENDERBUFFER_BLUE_SIZE_EXT                    = $8D52;
   GL_RENDERBUFFER_ALPHA_SIZE_EXT                   = $8D53;
   GL_RENDERBUFFER_DEPTH_SIZE_EXT                   = $8D54;
   GL_RENDERBUFFER_STENCIL_SIZE_EXT                 = $8D55;
   GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE_EXT        = $8CD0;
   GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME_EXT        = $8CD1;
   GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL_EXT      = $8CD2;
   GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE_E= $8CD3;
   GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_EXT = $8CD4;
   GL_COLOR_ATTACHMENT0_EXT                         = $8CE0;
   GL_COLOR_ATTACHMENT1_EXT                         = $8CE1;
   GL_COLOR_ATTACHMENT2_EXT                         = $8CE2;
   GL_COLOR_ATTACHMENT3_EXT                         = $8CE3;
   GL_COLOR_ATTACHMENT4_EXT                         = $8CE4;
   GL_COLOR_ATTACHMENT5_EXT                         = $8CE5;
   GL_COLOR_ATTACHMENT6_EXT                         = $8CE6;
   GL_COLOR_ATTACHMENT7_EXT                         = $8CE7;
   GL_COLOR_ATTACHMENT8_EXT                         = $8CE8;
   GL_COLOR_ATTACHMENT9_EXT                         = $8CE9;
   GL_COLOR_ATTACHMENT10_EXT                        = $8CEA;
   GL_COLOR_ATTACHMENT11_EXT                        = $8CEB;
   GL_COLOR_ATTACHMENT12_EXT                        = $8CEC;
   GL_COLOR_ATTACHMENT13_EXT                        = $8CED;
   GL_COLOR_ATTACHMENT14_EXT                        = $8CEE;
   GL_COLOR_ATTACHMENT15_EXT                        = $8CEF;
   GL_DEPTH_ATTACHMENT_EXT                          = $8D00;
   GL_STENCIL_ATTACHMENT_EXT                        = $8D20;
   GL_FRAMEBUFFER_COMPLETE_EXT                      = $8CD5;
   GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT_EXT         = $8CD6;
   GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT_EXT = $8CD7;
   GL_FRAMEBUFFER_INCOMPLETE_DUPLICATE_ATTACHMENT_EXT = $8CD8;
   GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS_EXT         = $8CD9;
   GL_FRAMEBUFFER_INCOMPLETE_FORMATS_EXT            = $8CDA;
   GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER_EXT        = $8CDB;
   GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER_EXT        = $8CDC;
   GL_FRAMEBUFFER_UNSUPPORTED_EXT                   = $8CDD;
   GL_FRAMEBUFFER_BINDING_EXT                       = $8CA6;
   GL_RENDERBUFFER_BINDING_EXT                      = $8CA7;
   GL_MAX_COLOR_ATTACHMENTS_EXT                     = $8CDF;
   GL_MAX_RENDERBUFFER_SIZE_EXT                     = $84E8;
   GL_INVALID_FRAMEBUFFER_OPERATION_EXT             = $0506;


   
   // gl 2.0
   GL_BLEND_EQUATION_RGB = $8009;
   GL_VERTEX_ATTRIB_ARRAY_ENABLED = $8622;
   GL_VERTEX_ATTRIB_ARRAY_SIZE = $8623;
   GL_VERTEX_ATTRIB_ARRAY_STRIDE = $8624;
   GL_VERTEX_ATTRIB_ARRAY_TYPE = $8625;
   GL_CURRENT_VERTEX_ATTRIB = $8626;
   GL_VERTEX_PROGRAM_POINT_SIZE = $8642;
   GL_VERTEX_PROGRAM_TWO_SIDE = $8643;
   GL_VERTEX_ATTRIB_ARRAY_POINTER = $8645;
   GL_STENCIL_BACK_FUNC = $8800;
   GL_STENCIL_BACK_FAIL = $8801;
   GL_STENCIL_BACK_PASS_DEPTH_FAIL = $8802;
   GL_STENCIL_BACK_PASS_DEPTH_PASS = $8803;
   GL_BLEND_EQUATION_ALPHA = $883D;
   GL_POINT_SPRITE = $8861;
   GL_COORD_REPLACE = $8862;
   GL_MAX_VERTEX_ATTRIBS = $8869;
   GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = $886A;
   GL_MAX_TEXTURE_COORDS = $8871;
   GL_MAX_TEXTURE_IMAGE_UNITS = $8872;
   GL_FRAGMENT_SHADER = $8B30;
   GL_VERTEX_SHADER = $8B31;
   GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = $8B49;
   GL_MAX_VERTEX_UNIFORM_COMPONENTS = $8B4A;
   GL_MAX_VARYING_FLOATS = $8B4B;
   GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = $8B4C;
   GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = $8B4D;
   GL_SHADER_TYPE = $8B4F;
   GL_FLOAT_VEC2 = $8B50;
   GL_FLOAT_VEC3 = $8B51;
   GL_FLOAT_VEC4 = $8B52;
   GL_INT_VEC2 = $8B53;
   GL_INT_VEC3 = $8B54;
   GL_INT_VEC4 = $8B55;
   GL_BOOL = $8B56;
   GL_BOOL_VEC2 = $8B57;
   GL_BOOL_VEC3 = $8B58;
   GL_BOOL_VEC4 = $8B59;
   GL_FLOAT_MAT2 = $8B5A;
   GL_FLOAT_MAT3 = $8B5B;
   GL_FLOAT_MAT4 = $8B5C;
   GL_SAMPLER_1D = $8B5D;
   GL_SAMPLER_2D = $8B5E;
   GL_SAMPLER_3D = $8B5F;
   GL_SAMPLER_CUBE = $8B60;
   GL_SAMPLER_1D_SHADOW = $8B61;
   GL_SAMPLER_2D_SHADOW = $8B62;
   GL_DELETE_STATUS = $8B80;
   GL_COMPILE_STATUS = $8B81;
   GL_LINK_STATUS = $8B82;
   GL_VALIDATE_STATUS = $8B83;
   GL_INFO_LOG_LENGTH = $8B84;
   GL_ATTACHED_SHADERS = $8B85;
   GL_ACTIVE_UNIFORMS = $8B86;
   GL_ACTIVE_UNIFORM_MAX_LENGTH = $8B87;
   GL_SHADER_SOURCE_LENGTH = $8B88;
   GL_ACTIVE_ATTRIBUTES = $8B89;
   GL_ACTIVE_ATTRIBUTE_MAX_LENGTH = $8B8A;
   GL_FRAGMENT_SHADER_DERIVATIVE_HINT = $8B8B;
   GL_SHADING_LANGUAGE_VERSION = $8B8C;
   GL_CURRENT_PROGRAM = $8B8D;
   GL_POINT_SPRITE_COORD_ORIGIN = $8CA0;
   GL_LOWER_LEFT = $8CA1;
   GL_UPPER_LEFT = $8CA2;
   GL_STENCIL_BACK_REF = $8CA3;
   GL_STENCIL_BACK_VALUE_MASK = $8CA4;
   GL_STENCIL_BACK_WRITEMASK = $8CA5;

   // WGL_ARB_pbuffer
type
   HPBUFFERARB= Integer;
const
   WGL_DRAW_TO_PBUFFER_ARB                          = $202D;
   WGL_MAX_PBUFFER_PIXELS_ARB                       = $202E;
   WGL_MAX_PBUFFER_WIDTH_ARB                        = $202F;
   WGL_MAX_PBUFFER_HEIGHT_ARB                       = $2030;
   WGL_PBUFFER_LARGEST_ARB                          = $2033;
   WGL_PBUFFER_WIDTH_ARB                            = $2034;
   WGL_PBUFFER_HEIGHT_ARB                           = $2035;
   WGL_PBUFFER_LOST_ARB                             = $2036;

   // WGL_ARB_buffer_region
   WGL_FRONT_COLOR_BUFFER_BIT_ARB                   = $00000001;
   WGL_BACK_COLOR_BUFFER_BIT_ARB                    = $00000002;
   WGL_DEPTH_BUFFER_BIT_ARB                         = $00000004;
   WGL_STENCIL_BUFFER_BIT_ARB                       = $00000008;

   // ********** GLU generic constants **********

   // Errors: (return value 0= no error)
   GLU_INVALID_ENUM                                 = 100900;
   GLU_INVALID_VALUE                                = 100901;
   GLU_OUT_OF_MEMORY                                = 100902;
   GLU_INCOMPATIBLE_GL_VERSION                      = 100903;

   // StringName
   GLU_VERSION                                      = 100800;
   GLU_EXTENSIONS                                   = 100801;

   // Boolean
   GLU_TRUE                                         = GL_TRUE;
   GLU_FALSE                                        = GL_FALSE;

   // Quadric constants
   // QuadricNormal
   GLU_SMOOTH                                       = 100000;
   GLU_FLAT                                         = 100001;
   GLU_NONE                                         = 100002;

   // QuadricDrawStyle
   GLU_POINT                                        = 100010;
   GLU_LINE                                         = 100011;
   GLU_FILL                                         = 100012;
   GLU_SILHOUETTE                                   = 100013;

   // QuadricOrientation
   GLU_OUTSIDE                                      = 100020;
   GLU_INSIDE                                       = 100021;

   // Tesselation constants
   GLU_TESS_MAX_COORD                               = 1.0e150;

   // TessProperty
   GLU_TESS_WINDING_RULE                            = 100140;
   GLU_TESS_BOUNDARY_ONLY                           = 100141;
   GLU_TESS_TOLERANCE                               = 100142;

   // TessWinding
   GLU_TESS_WINDING_ODD                             = 100130;
   GLU_TESS_WINDING_NONZERO                         = 100131;
   GLU_TESS_WINDING_POSITIVE                        = 100132;
   GLU_TESS_WINDING_NEGATIVE                        = 100133;
   GLU_TESS_WINDING_ABS_GEQ_TWO                     = 100134;

   // TessCallback
   GLU_TESS_BEGIN                                   = 100100; // TGLUTessBeginProc
   GLU_TESS_VERTEX                                  = 100101; // TGLUTessVertexProc
   GLU_TESS_END                                     = 100102; // TGLUTessEndProc
   GLU_TESS_ERROR                                   = 100103; // TGLUTessErrorProc
   GLU_TESS_EDGE_FLAG                               = 100104; // TGLUTessEdgeFlagProc
   GLU_TESS_COMBINE                                 = 100105; // TGLUTessCombineProc
   GLU_TESS_BEGIN_DATA                              = 100106; // TGLUTessBeginDataProc
   GLU_TESS_VERTEX_DATA                             = 100107; // TGLUTessVertexDataProc
   GLU_TESS_END_DATA                                = 100108; // TGLUTessEndDataProc
   GLU_TESS_ERROR_DATA                              = 100109; // TGLUTessErrorDataProc
   GLU_TESS_EDGE_FLAG_DATA                          = 100110; // TGLUTessEdgeFlagDataProc
   GLU_TESS_COMBINE_DATA                            = 100111; // TGLUTessCombineDataProc

   // TessError
   GLU_TESS_ERROR1                                  = 100151;
   GLU_TESS_ERROR2                                  = 100152;
   GLU_TESS_ERROR3                                  = 100153;
   GLU_TESS_ERROR4                                  = 100154;
   GLU_TESS_ERROR5                                  = 100155;
   GLU_TESS_ERROR6                                  = 100156;
   GLU_TESS_ERROR7                                  = 100157;
   GLU_TESS_ERROR8                                  = 100158;

   GLU_TESS_MISSING_BEGIN_POLYGON                   = GLU_TESS_ERROR1;
   GLU_TESS_MISSING_BEGIN_CONTOUR                   = GLU_TESS_ERROR2;
   GLU_TESS_MISSING_END_POLYGON                     = GLU_TESS_ERROR3;
   GLU_TESS_MISSING_END_CONTOUR                     = GLU_TESS_ERROR4;
   GLU_TESS_COORD_TOO_LARGE                         = GLU_TESS_ERROR5;
   GLU_TESS_NEED_COMBINE_CALLBACK                   = GLU_TESS_ERROR6;

   // NURBS constants

   // NurbsProperty
   GLU_AUTO_LOAD_MATRIX                             = 100200;
   GLU_CULLING                                      = 100201;
   GLU_SAMPLING_TOLERANCE                           = 100203;
   GLU_DISPLAY_MODE                                 = 100204;
   GLU_PARAMETRIC_TOLERANCE                         = 100202;
   GLU_SAMPLING_METHOD                              = 100205;
   GLU_U_STEP                                       = 100206;
   GLU_V_STEP                                       = 100207;

   // NurbsSampling
   GLU_PATH_LENGTH                                  = 100215;
   GLU_PARAMETRIC_ERROR                             = 100216;
   GLU_DOMAIN_DISTANCE                              = 100217;

   // NurbsTrim
   GLU_MAP1_TRIM_2                                  = 100210;
   GLU_MAP1_TRIM_3                                  = 100211;

   // NurbsDisplay
   GLU_OUTLINE_POLYGON                              = 100240;
   GLU_OUTLINE_PATCH                                = 100241;

   // NurbsErrors
   GLU_NURBS_ERROR1                                 = 100251;
   GLU_NURBS_ERROR2                                 = 100252;
   GLU_NURBS_ERROR3                                 = 100253;
   GLU_NURBS_ERROR4                                 = 100254;
   GLU_NURBS_ERROR5                                 = 100255;
   GLU_NURBS_ERROR6                                 = 100256;
   GLU_NURBS_ERROR7                                 = 100257;
   GLU_NURBS_ERROR8                                 = 100258;
   GLU_NURBS_ERROR9                                 = 100259;
   GLU_NURBS_ERROR10                                = 100260;
   GLU_NURBS_ERROR11                                = 100261;
   GLU_NURBS_ERROR12                                = 100262;
   GLU_NURBS_ERROR13                                = 100263;
   GLU_NURBS_ERROR14                                = 100264;
   GLU_NURBS_ERROR15                                = 100265;
   GLU_NURBS_ERROR16                                = 100266;
   GLU_NURBS_ERROR17                                = 100267;
   GLU_NURBS_ERROR18                                = 100268;
   GLU_NURBS_ERROR19                                = 100269;
   GLU_NURBS_ERROR20                                = 100270;
   GLU_NURBS_ERROR21                                = 100271;
   GLU_NURBS_ERROR22                                = 100272;
   GLU_NURBS_ERROR23                                = 100273;
   GLU_NURBS_ERROR24                                = 100274;
   GLU_NURBS_ERROR25                                = 100275;
   GLU_NURBS_ERROR26                                = 100276;
   GLU_NURBS_ERROR27                                = 100277;
   GLU_NURBS_ERROR28                                = 100278;
   GLU_NURBS_ERROR29                                = 100279;
   GLU_NURBS_ERROR30                                = 100280;
   GLU_NURBS_ERROR31                                = 100281;
   GLU_NURBS_ERROR32                                = 100282;
   GLU_NURBS_ERROR33                                = 100283;
   GLU_NURBS_ERROR34                                = 100284;
   GLU_NURBS_ERROR35                                = 100285;
   GLU_NURBS_ERROR36                                = 100286;
   GLU_NURBS_ERROR37                                = 100287;

   // Contours types -- obsolete!
   GLU_CW                                           = 100120;
   GLU_CCW                                          = 100121;
   GLU_INTERIOR                                     = 100122;
   GLU_EXTERIOR                                     = 100123;
   GLU_UNKNOWN                                      = 100124;

   // Names without "TESS_" prefix
   GLU_BEGIN                                        = GLU_TESS_BEGIN;
   GLU_VERTEX                                       = GLU_TESS_VERTEX;
   GLU_END                                          = GLU_TESS_END;
   GLU_ERROR                                        = GLU_TESS_ERROR;
   GLU_EDGE_FLAG                                    = GLU_TESS_EDGE_FLAG;

   GLX_VERSION_1_1                                  = 1;
   GLX_VERSION_1_2                                  = 1;
   GLX_VERSION_1_3                                  = 1;
   GLX_EXTENSION_NAME                               = 'GLX';
   GLX_USE_GL                                       = 1;
   GLX_BUFFER_SIZE                                  = 2;
   GLX_LEVEL                                        = 3;
   GLX_RGBA                                         = 4;
   GLX_DOUBLEBUFFER                                 = 5;
   GLX_STEREO                                       = 6;
   GLX_AUX_BUFFERS                                  = 7;
   GLX_RED_SIZE                                     = 8;
   GLX_GREEN_SIZE                                   = 9;
   GLX_BLUE_SIZE                                    = 10;
   GLX_ALPHA_SIZE                                   = 11;
   GLX_DEPTH_SIZE                                   = 12;
   GLX_STENCIL_SIZE                                 = 13;
   GLX_ACCUM_RED_SIZE                               = 14;
   GLX_ACCUM_GREEN_SIZE                             = 15;
   GLX_ACCUM_BLUE_SIZE                              = 16;
   GLX_ACCUM_ALPHA_SIZE                             = 17;

   // Error codes returned by glXGetConfig:
   GLX_BAD_SCREEN                                   = 1;
   GLX_BAD_ATTRIBUTE                                = 2;
   GLX_NO_EXTENSION                                 = 3;
   GLX_BAD_VISUAL                                   = 4;
   GLX_BAD_CONTEXT                                  = 5;
   GLX_BAD_VALUE                                    = 6;
   GLX_BAD_ENUM                                     = 7;

   // GLX 1.1 and later:
   GLX_VENDOR                                       = 1;
   GLX_VERSION                                      = 2;
   GLX_EXTENSIONS                                   = 3;

   // GLX 1.3 and later:
   GLX_CONFIG_CAVEAT                                = $20;
   GLX_DONT_CARE                                    = $FFFFFFFF;
   GLX_SLOW_CONFIG                                  = $8001;
   GLX_NON_CONFORMANT_CONFIG                        = $800D;
   GLX_X_VISUAL_TYPE                                = $22;
   GLX_TRANSPARENT_TYPE                             = $23;
   GLX_TRANSPARENT_INDEX_VALUE                      = $24;
   GLX_TRANSPARENT_RED_VALUE                        = $25;
   GLX_TRANSPARENT_GREEN_VALUE                      = $26;
   GLX_TRANSPARENT_BLUE_VALUE                       = $27;
   GLX_TRANSPARENT_ALPHA_VALUE                      = $28;
   GLX_MAX_PBUFFER_WIDTH                            = $8016;
   GLX_MAX_PBUFFER_HEIGHT                           = $8017;
   GLX_MAX_PBUFFER_PIXELS                           = $8018;
   GLX_PRESERVED_CONTENTS                           = $801B;
   GLX_LARGEST_BUFFER                               = $801C;
   GLX_DRAWABLE_TYPE                                = $8010;
   GLX_FBCONFIG_ID                                  = $8013;
   GLX_VISUAL_ID                                    = $800B;
   GLX_WINDOW_BIT                                   = $00000001;
   GLX_PIXMAP_BIT                                   = $00000002;
   GLX_PBUFFER_BIT                                  = $00000004;
   GLX_AUX_BUFFERS_BIT                              = $00000010;
   GLX_FRONT_LEFT_BUFFER_BIT                        = $00000001;
   GLX_FRONT_RIGHT_BUFFER_BIT                       = $00000002;
   GLX_BACK_LEFT_BUFFER_BIT                         = $00000004;
   GLX_BACK_RIGHT_BUFFER_BIT                        = $00000008;
   GLX_DEPTH_BUFFER_BIT                             = $00000020;
   GLX_STENCIL_BUFFER_BIT                           = $00000040;
   GLX_ACCUM_BUFFER_BIT                             = $00000080;
   GLX_RENDER_TYPE                                  = $8011;
   GLX_X_RENDERABLE                                 = $8012;
   GLX_NONE                                         = $8000;
   GLX_TRUE_COLOR                                   = $8002;
   GLX_DIRECT_COLOR                                 = $8003;
   GLX_PSEUDO_COLOR                                 = $8004;
   GLX_STATIC_COLOR                                 = $8005;
   GLX_GRAY_SCALE                                   = $8006;
   GLX_STATIC_GRAY                                  = $8007;
   GLX_TRANSPARENT_INDEX                            = $8009;
   GLX_COLOR_INDEX_TYPE                             = $8015;
   GLX_COLOR_INDEX_BIT                              = $00000002;
   GLX_SCREEN                                       = $800C;
   GLX_PBUFFER_CLOBBER_MASK                         = $08000000;
   GLX_DAMAGED                                      = $8020;
   GLX_SAVED                                        = $8021;
   GLX_WINDOW                                       = $8022;
   GLX_PBUFFER                                      = $8023;
   GLX_EXT_visual_info                              = 1;
   GLX_X_VISUAL_TYPE_EXT                            = $22;
   GLX_TRANSPARENT_TYPE_EXT                         = $23;
   GLX_TRANSPARENT_INDEX_VALUE_EXT                  = $24;
   GLX_TRANSPARENT_RED_VALUE_EXT                    = $25;
   GLX_TRANSPARENT_GREEN_VALUE_EXT                  = $26;
   GLX_TRANSPARENT_BLUE_VALUE_EXT                   = $27;
   GLX_TRANSPARENT_ALPHA_VALUE_EXT                  = $28;
   GLX_TRUE_COLOR_EXT                               = $8002;
   GLX_DIRECT_COLOR_EXT                             = $8003;
   GLX_PSEUDO_COLOR_EXT                             = $8004;
   GLX_STATIC_COLOR_EXT                             = $8005;
   GLX_GRAY_SCALE_EXT                               = $8006;
   GLX_STATIC_GRAY_EXT                              = $8007;
   GLX_NONE_EXT                                     = $8000;
   GLX_TRANSPARENT_RGB_EXT                          = $8008;
   GLX_TRANSPARENT_INDEX_EXT                        = $8009;
   GLX_VISUAL_CAVEAT_EXT                            = $20;
   GLX_SLOW_VISUAL_EXT                              = $8001;
   GLX_NON_CONFORMANT_VISUAL_EXT                    = $800D;
   GLX_SHARE_CONTEXT_EXT                            = $800A;
   GLX_VISUAL_ID_EXT                                = $800B;
   GLX_SCREEN_EXT                                   = $800C;
   GLX_3DFX_WINDOW_MODE_MESA                        = $1;
   GLX_3DFX_FULLSCREEN_MODE_MESA                    = $2;


type
   // GLU types
   TGLUNurbs = record end;
   TGLUQuadric = record end;
   TGLUTesselator = record end;

   PGLUNurbs = ^TGLUNurbs;
   PGLUQuadric = ^TGLUQuadric;
   PGLUTesselator=  ^TGLUTesselator;

   // backwards compatibility
   TGLUNurbsObj = TGLUNurbs;
   TGLUQuadricObj = TGLUQuadric;
   TGLUTesselatorObj = TGLUTesselator;
   TGLUTriangulatorObj = TGLUTesselator;

   PGLUNurbsObj = PGLUNurbs;
   PGLUQuadricObj = PGLUQuadric;
   PGLUTesselatorObj = PGLUTesselator;
   PGLUTriangulatorObj = PGLUTesselator;

   // Callback function prototypes
   // GLUQuadricCallback
   TGLUQuadricErrorProc = procedure(errorCode: TGLEnum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GLUTessCallback
   TGLUTessBeginProc = procedure(AType: TGLEnum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   TGLUTessEdgeFlagProc = procedure(Flag: TGLboolean); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   TGLUTessVertexProc = procedure(VertexData: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   TGLUTessEndProc = procedure; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   TGLUTessErrorProc = procedure(ErrNo: TGLEnum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   TGLUTessCombineProc = procedure(const Coords: TVector3d; const VertexData: TVector4p; const Weight: TVector4f; OutData: PGLPointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   TGLUTessBeginDataProc = procedure(AType: TGLEnum; UserData: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   TGLUTessEdgeFlagDataProc = procedure(Flag: TGLboolean; UserData: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   TGLUTessVertexDataProc = procedure(VertexData: Pointer; UserData: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   TGLUTessEndDataProc = procedure(UserData: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   TGLUTessErrorDataProc = procedure(ErrNo: TGLEnum; UserData: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   TGLUTessCombineDataProc = procedure(const Coords: TVector3d; const VertexData: TVector4p; const Weight: TVector4f; OutData: PGLPointer; UserData: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GLUNurbsCallback
   TGLUNurbsErrorProc = procedure(ErrorCode: TGLEnum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

var
   // GL functions and procedures
  glAccum: procedure(op: GLenum; value: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glAlphaFunc: procedure(func: GLenum; ref: GLclampf);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glAreTexturesResident: function (n: GLsizei; const textures: PGLuint; residences: PGLboolean): GLboolean;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glArrayElement: procedure(i: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glBegin: procedure(mode: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glBindTexture: procedure(target: GLenum; texture: GLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glBitmap: procedure (width, height: GLsizei; xorig, yorig: GLfloat; xmove, ymove: GLfloat; const bitmap: PGLubyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glBlendFunc: procedure(sfactor, dfactor: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glCallList: procedure(list: GLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glCallLists: procedure(n: GLsizei; atype: GLenum; const lists: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glClear: procedure(mask: GLbitfield);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glClearAccum: procedure(red, green, blue, alpha: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glClearColor: procedure(red, green, blue, alpha: GLclampf);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glClearDepth: procedure(depth: GLclampd);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glClearIndex: procedure(c: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glClearStencil: procedure(s: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glClipPlane: procedure(plane: GLenum; const equation: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3b: procedure(red, green, blue: GLbyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3bv: procedure(const v: PGLbyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3d: procedure(red, green, blue: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3dv: procedure(const v: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3f: procedure(red, green, blue: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3fv: procedure(const v: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3i: procedure(red, green, blue: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3iv: procedure(const v: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3s: procedure(red, green, blue: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3sv: procedure(const v: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3ub: procedure(red, green, blue: GLubyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3ubv: procedure(const v: PGLubyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3ui: procedure(red, green, blue: GLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3uiv: procedure(const v: PGLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3us: procedure(red, green, blue: GLushort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor3usv: procedure(const v: PGLushort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4b: procedure(red, green, blue, alpha: GLbyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4bv: procedure(const v: PGLbyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4d: procedure(red, green, blue, alpha: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4dv: procedure(const v: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4f: procedure(red, green, blue, alpha: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4fv: procedure(const v: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4i: procedure(red, green, blue, alpha: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4iv: procedure(const v: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4s: procedure(red, green, blue, alpha: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4sv: procedure(const v: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4ub: procedure(red, green, blue, alpha: GLubyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4ubv: procedure(const v: PGLubyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4ui: procedure(red, green, blue, alpha: GLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4uiv: procedure(const v: PGLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4us: procedure(red, green, blue, alpha: GLushort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColor4usv: procedure(const v: PGLushort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColorMask: procedure(red, green, blue, alpha: GLboolean);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColorMaterial: procedure(face, mode: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glColorPointer: procedure(size: GLint; atype: GLenum; stride: GLsizei; const pointer: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glCopyPixels: procedure(x, y: GLint; width, height: GLsizei; atype: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glCopyTexImage1D: procedure (target: GLenum; level: GLint; internalFormat: GLenum; x, y: GLint; width: GLsizei; border: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glCopyTexImage2D: procedure(target: GLenum; level: GLint; internalFormat: GLenum; x, y: GLint; width, height: GLsizei; border: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glCopyTexSubImage1D: procedure(target: GLenum; level, xoffset, x, y: GLint; width: GLsizei);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glCopyTexSubImage2D: procedure(target: GLenum; level, xoffset, yoffset, x, y: GLint; width, height: GLsizei);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glCullFace: procedure(mode: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glDeleteLists: procedure(list: GLuint; range: GLsizei);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glDeleteTextures: procedure(n: GLsizei; const textures: PGLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glDepthFunc: procedure(func: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glDepthMask: procedure(flag: GLboolean);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glDepthRange: procedure(zNear, zFar: GLclampd);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glDisable: procedure(cap: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glDisableClientState: procedure(aarray: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glDrawArrays: procedure(mode: GLenum; first: GLint; count: GLsizei);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glDrawBuffer: procedure(mode: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glDrawElements: procedure(mode: GLenum; count: GLsizei; atype: GLenum; const indices: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glDrawPixels: procedure(width, height: GLsizei; format, atype: GLenum; const pixels: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEdgeFlag: procedure(flag: GLboolean);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEdgeFlagPointer: procedure(stride: GLsizei; const pointer: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEdgeFlagv: procedure(const flag: PGLboolean);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEnable: procedure(cap: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEnableClientState: procedure(aarray: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEnd: procedure;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEndList: procedure;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEvalCoord1d: procedure(u: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEvalCoord1dv: procedure(const u: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEvalCoord1f: procedure(u: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEvalCoord1fv: procedure(const u: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEvalCoord2d: procedure(u, v: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEvalCoord2dv: procedure(const u: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEvalCoord2f: procedure(u, v: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEvalCoord2fv: procedure(const u: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEvalMesh1: procedure(mode: GLenum; i1, i2: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEvalMesh2: procedure(mode: GLenum; i1, i2, j1, j2: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEvalPoint1: procedure(i: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glEvalPoint2: procedure(i, j: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glFeedbackBuffer: procedure(size: GLsizei; atype: GLenum; buffer: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glFinish: procedure;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glFlush: procedure;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glFogf: procedure(pname: GLenum; param: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glFogfv: procedure(pname: GLenum; const params: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glFogi: procedure(pname: GLenum; param: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glFogiv: procedure(pname: GLenum; const params: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glFrontFace: procedure(mode: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glFrustum: procedure(left, right, bottom, top, zNear, zFar: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGenLists: function(range: GLsizei): GLuint;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGenTextures: procedure(n: GLsizei; textures: PGLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetBooleanv: procedure(pname: GLenum; params: PGLboolean);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetClipPlane: procedure(plane: GLenum; equation: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetDoublev: procedure(pname: GLenum; params: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetError: function: GLenum;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetFloatv: procedure(pname: GLenum; params: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetIntegerv: procedure(pname: GLenum; params: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetLightfv: procedure(light, pname: GLenum; params: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetLightiv: procedure(light, pname: GLenum; params: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetMapdv: procedure(target, query: GLenum; v: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetMapfv: procedure(target, query: GLenum; v: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetMapiv: procedure(target, query: GLenum; v: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetMaterialfv: procedure(face, pname: GLenum; params: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetMaterialiv: procedure(face, pname: GLenum; params: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetPixelMapfv: procedure(map: GLenum; values: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetPixelMapuiv: procedure(map: GLenum; values: PGLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetPixelMapusv: procedure(map: GLenum; values: PGLushort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetPointerv: procedure(pname: GLenum; params: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetPolygonStipple: procedure(mask: PGLubyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetString: function(name: GLenum): PAnsiChar;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetTexEnvfv: procedure(target, pname: GLenum; params: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetTexEnviv: procedure(target, pname: GLenum; params: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetTexGendv: procedure(coord, pname: GLenum; params: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetTexGenfv: procedure(coord, pname: GLenum; params: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetTexGeniv: procedure(coord, pname: GLenum; params: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetTexImage: procedure(target: GLenum; level: GLint; format: GLenum; atype: GLenum; pixels: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetTexLevelParameterfv: procedure(target: GLenum; level: GLint; pname: GLenum; params: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetTexLevelParameteriv: procedure(target: GLenum; level: GLint; pname: GLenum; params: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetTexParameterfv: procedure(target, pname: GLenum; params: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glGetTexParameteriv: procedure(target, pname: GLenum; params: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glHint: procedure(target, mode: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIndexMask: procedure(mask: GLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIndexPointer: procedure(atype: GLenum; stride: GLsizei; const pointer: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIndexd: procedure(c: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIndexdv: procedure(const c: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIndexf: procedure(c: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIndexfv: procedure(const c: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIndexi: procedure(c: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIndexiv: procedure(const c: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIndexs: procedure(c: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIndexsv: procedure(const c: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIndexub: procedure(c: GLubyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIndexubv: procedure(const c: PGLubyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glInitNames: procedure;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glInterleavedArrays: procedure(format: GLenum; stride: GLsizei; const pointer: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIsEnabled: function(cap: GLenum): GLboolean;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIsList: function(list: GLuint): GLboolean;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glIsTexture: function(texture: GLuint): GLboolean;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLightModelf: procedure(pname: GLenum; param: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLightModelfv: procedure(pname: GLenum; const params: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLightModeli: procedure(pname: GLenum; param: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLightModeliv: procedure(pname: GLenum; const params: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLightf: procedure(light, pname: GLenum; param: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLightfv: procedure(light, pname: GLenum; const params: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLighti: procedure(light, pname: GLenum; param: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLightiv: procedure(light, pname: GLenum; const params: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLineStipple: procedure(factor: GLint; pattern: GLushort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLineWidth: procedure(width: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glListBase: procedure(base: GLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLoadIdentity: procedure;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLoadMatrixd: procedure(const m: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLoadMatrixf: procedure(const m: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLoadName: procedure(name: GLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glLogicOp: procedure(opcode: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMap1d: procedure(target: GLenum; u1, u2: GLdouble; stride, order: GLint; const points: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMap1f: procedure(target: GLenum; u1, u2: GLfloat; stride, order: GLint; const points: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMap2d: procedure(target: GLenum; u1, u2: GLdouble; ustride, uorder: GLint; v1, v2: GLdouble; vstride, vorder: GLint; const points: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMap2f: procedure(target: GLenum; u1, u2: GLfloat; ustride, uorder: GLint; v1, v2: GLfloat; vstride, vorder: GLint; const points: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMapGrid1d: procedure(un: GLint; u1, u2: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMapGrid1f: procedure(un: GLint; u1, u2: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMapGrid2d: procedure(un: GLint; u1, u2: GLdouble; vn: GLint; v1, v2: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMapGrid2f: procedure(un: GLint; u1, u2: GLfloat; vn: GLint; v1, v2: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMaterialf: procedure(face, pname: GLenum; param: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMaterialfv: procedure(face, pname: GLenum; const params: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMateriali: procedure(face, pname: GLenum; param: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMaterialiv: procedure(face, pname: GLenum; const params: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMatrixMode: procedure(mode: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMultMatrixd: procedure(const m: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glMultMatrixf: procedure(const m: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glNewList: procedure(list: GLuint; mode: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glNormal3b: procedure(nx, ny, nz: GLbyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glNormal3bv: procedure(const v: PGLbyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glNormal3d: procedure(nx, ny, nz: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glNormal3dv: procedure(const v: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glNormal3f: procedure(nx, ny, nz: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glNormal3fv: procedure(const v: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glNormal3i: procedure(nx, ny, nz: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glNormal3iv: procedure(const v: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glNormal3s: procedure(nx, ny, nz: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glNormal3sv: procedure(const v: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glNormalPointer: procedure(atype: GLenum; stride: GLsizei; const pointer: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glOrtho: procedure(left, right, bottom, top, zNear, zFar: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPassThrough: procedure(token: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPixelMapfv: procedure(map: GLenum; mapsize: GLsizei; const values: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPixelMapuiv: procedure(map: GLenum; mapsize: GLsizei; const values: PGLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPixelMapusv: procedure(map: GLenum; mapsize: GLsizei; const values: PGLushort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPixelStoref: procedure(pname: GLenum; param: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPixelStorei: procedure(pname: GLenum; param: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPixelTransferf: procedure(pname: GLenum; param: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPixelTransferi: procedure(pname: GLenum; param: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPixelZoom: procedure(xfactor, yfactor: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPointSize: procedure(size: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPolygonMode: procedure(face, mode: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPolygonOffset: procedure(factor, units: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPolygonStipple: procedure(const mask: PGLubyte);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPopAttrib: procedure;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPopClientAttrib: procedure;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPopMatrix: procedure;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPopName: procedure;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPrioritizeTextures: procedure(n: GLsizei; const textures: PGLuint; const priorities: PGLclampf);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPushAttrib: procedure(mask: GLbitfield);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPushClientAttrib: procedure(mask: GLbitfield);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPushMatrix: procedure;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glPushName: procedure(name: GLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos2d: procedure(x, y: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos2dv: procedure(const v: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos2f: procedure(x, y: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos2fv: procedure(const v: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos2i: procedure(x, y: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos2iv: procedure(const v: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos2s: procedure(x, y: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos2sv: procedure(const v: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos3d: procedure(x, y, z: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos3dv: procedure(const v: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos3f: procedure(x, y, z: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos3fv: procedure(const v: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos3i: procedure(x, y, z: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos3iv: procedure(const v: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos3s: procedure(x, y, z: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos3sv: procedure(const v: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos4d: procedure(x, y, z, w: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos4dv: procedure(const v: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos4f: procedure(x, y, z, w: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos4fv: procedure(const v: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos4i: procedure(x, y, z, w: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos4iv: procedure(const v: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos4s: procedure(x, y, z, w: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRasterPos4sv: procedure(const v: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glReadBuffer: procedure(mode: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glReadPixels: procedure(x, y: GLint; width, height: GLsizei; format, atype: GLenum; pixels: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRectd: procedure(x1, y1, x2, y2: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRectdv: procedure(const v1: PGLdouble; const v2: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRectf: procedure(x1, y1, x2, y2: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRectfv: procedure(const v1: PGLfloat; const v2: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRecti: procedure(x1, y1, x2, y2: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRectiv: procedure(const v1: PGLint; const v2: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRects: procedure(x1, y1, x2, y2: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRectsv: procedure(const v1: PGLshort; const v2: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRenderMode: function(mode: GLint): GLint;{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRotated: procedure(angle, x, y, z: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glRotatef: procedure(angle, x, y, z: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glScaled: procedure(x, y, z: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glScalef: procedure(x, y, z: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glScissor: procedure(x, y: GLint; width, height: GLsizei);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glSelectBuffer: procedure(size: GLsizei; buffer: PGLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glShadeModel: procedure(mode: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glStencilFunc: procedure(func: GLenum; ref: GLint; mask: GLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glStencilMask: procedure(mask: GLuint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glStencilOp: procedure(fail, zfail, zpass: GLenum);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord1d: procedure(s: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord1dv: procedure(const v: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord1f: procedure(s: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord1fv: procedure(const v: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord1i: procedure(s: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord1iv: procedure(const v: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord1s: procedure(s: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord1sv: procedure(const v: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord2d: procedure(s, t: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord2dv: procedure(const v: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord2f: procedure(s, t: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord2fv: procedure(const v: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord2i: procedure(s, t: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord2iv: procedure(const v: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord2s: procedure(s, t: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord2sv: procedure(const v: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord3d: procedure(s, t, r: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord3dv: procedure(const v: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord3f: procedure(s, t, r: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord3fv: procedure(const v: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord3i: procedure(s, t, r: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord3iv: procedure(const v: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord3s: procedure(s, t, r: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord3sv: procedure(const v: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord4d: procedure(s, t, r, q: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord4dv: procedure(const v: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord4f: procedure(s, t, r, q: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord4fv: procedure(const v: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord4i: procedure(s, t, r, q: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord4iv: procedure(const v: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord4s: procedure(s, t, r, q: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoord4sv: procedure(const v: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexCoordPointer: procedure(size: GLint; atype: GLenum; stride: GLsizei; const pointer: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexEnvf: procedure(target: GLenum; pname: GLenum; param: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexEnvfv: procedure(target: GLenum; pname: GLenum; const params: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexEnvi: procedure(target: GLenum; pname: GLenum; param: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexEnviv: procedure(target: GLenum; pname: GLenum; const params: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexGend: procedure(coord: GLenum; pname: GLenum; param: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexGendv: procedure(coord: GLenum; pname: GLenum; const params: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexGenf: procedure(coord: GLenum; pname: GLenum; param: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexGenfv: procedure(coord: GLenum; pname: GLenum; const params: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexGeni: procedure(coord: GLenum; pname: GLenum; param: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexGeniv: procedure(coord: GLenum; pname: GLenum; const params: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexImage1D: procedure(target: GLenum; level, internalformat: GLint; width: GLsizei; border: GLint; format, atype: GLenum; const pixels: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexImage2D: procedure(target: GLenum; level, internalformat: GLint; width, height: GLsizei; border: GLint; format, atype: GLenum; const pixels: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexParameterf: procedure(target: GLenum; pname: GLenum; param: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexParameterfv: procedure(target: GLenum; pname: GLenum; const params: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexParameteri: procedure(target: GLenum; pname: GLenum; param: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexParameteriv: procedure(target: GLenum; pname: GLenum; const params: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexSubImage1D: procedure(target: GLenum; level, xoffset: GLint; width: GLsizei; format, atype: GLenum; const pixels: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTexSubImage2D: procedure(target: GLenum; level, xoffset, yoffset: GLint; width, height: GLsizei; format, atype: GLenum; const pixels: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTranslated: procedure(x, y, z: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glTranslatef: procedure(x, y, z: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex2d: procedure(x, y: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex2dv: procedure(const v: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex2f: procedure(x, y: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex2fv: procedure(const v: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex2i: procedure(x, y: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex2iv: procedure(const v: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex2s: procedure(x, y: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex2sv: procedure(const v: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex3d: procedure(x, y, z: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex3dv: procedure(const v: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex3f: procedure(x, y, z: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex3fv: procedure(const v: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex3i: procedure(x, y, z: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex3iv: procedure(const v: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex3s: procedure(x, y, z: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex3sv: procedure(const v: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex4d: procedure(x, y, z, w: GLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex4dv: procedure(const v: PGLdouble);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex4f: procedure(x, y, z, w: GLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex4fv: procedure(const v: PGLfloat);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex4i: procedure(x, y, z, w: GLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex4iv: procedure(const v: PGLint);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex4s: procedure(x, y, z, w: GLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertex4sv: procedure(const v: PGLshort);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glVertexPointer: procedure(size: GLint; atype: GLenum; stride: GLsizei; const pointer: Pointer);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
  glViewport: procedure(x, y: GLint; width, height: GLsizei);{$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

{$IFDEF MULTITHREADOPENGL}
threadvar
{$else}
var
{$ENDIF}

   // GL 1.2
   glDrawRangeElements: procedure(mode: TGLEnum; Astart, Aend: TGLuint; count: TGLsizei; Atype: TGLEnum;
                                  indices: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glTexImage3D: procedure(target: TGLEnum; level: TGLint; internalformat: TGLEnum; width, height, depth: TGLsizei;
                           border: TGLint; format: TGLEnum; Atype: TGLEnum; pixels: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL 1.2 ARB imaging
   glBlendColor: procedure(red, green, blue, alpha: TGLclampf); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glBlendEquation: procedure(mode: TGLEnum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glColorSubTable: procedure(target: TGLEnum; start, count: TGLsizei; format, Atype: TGLEnum; data: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCopyColorSubTable: procedure(target: TGLEnum; start: TGLsizei; x, y: TGLint; width: TGLsizei); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glColorTable: procedure(target, internalformat: TGLEnum; width: TGLsizei; format, Atype: TGLEnum;
     table: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCopyColorTable: procedure(target, internalformat: TGLEnum; x, y: TGLint; width: TGLsizei); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glColorTableParameteriv: procedure(target, pname: TGLEnum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glColorTableParameterfv: procedure(target, pname: TGLEnum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetColorTable: procedure(target, format, Atype: TGLEnum; table: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetColorTableParameteriv: procedure(target, pname: TGLEnum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetColorTableParameterfv: procedure(target, pname: TGLEnum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glConvolutionFilter1D: procedure(target, internalformat: TGLEnum; width: TGLsizei; format, Atype: TGLEnum;
     image: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glConvolutionFilter2D: procedure(target, internalformat: TGLEnum; width, height: TGLsizei; format, Atype: TGLEnum;
     image: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCopyConvolutionFilter1D: procedure(target, internalformat: TGLEnum; x, y: TGLint; width: TGLsizei); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCopyConvolutionFilter2D: procedure(target, internalformat: TGLEnum; x, y: TGLint; width, height: TGLsizei); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetConvolutionFilter: procedure(target, internalformat, Atype: TGLEnum; image: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSeparableFilter2D: procedure(target, internalformat: TGLEnum; width, height: TGLsizei; format, Atype: TGLEnum; row,
     column: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetSeparableFilter: procedure(target, format, Atype: TGLEnum; row, column, span: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glConvolutionParameteri: procedure(target, pname: TGLEnum; param: TGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glConvolutionParameteriv: procedure(target, pname: TGLEnum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glConvolutionParameterf: procedure(target, pname: TGLEnum; param: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glConvolutionParameterfv: procedure(target, pname: TGLEnum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetConvolutionParameteriv: procedure(target, pname: TGLEnum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetConvolutionParameterfv: procedure(target, pname: TGLEnum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glHistogram: procedure(target: TGLEnum; width: TGLsizei; internalformat: TGLEnum; sink: TGLboolean); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glResetHistogram: procedure(target: TGLEnum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetHistogram: procedure(target: TGLEnum; reset: TGLboolean; format, Atype: TGLEnum; values: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetHistogramParameteriv: procedure(target, pname: TGLEnum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetHistogramParameterfv: procedure(target, pname: TGLEnum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMinmax: procedure(target, internalformat: TGLEnum; sink: TGLboolean); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glResetMinmax: procedure(target: TGLEnum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetMinmax: procedure(target: TGLEnum; reset: TGLboolean; format, Atype: TGLEnum; values: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetMinmaxParameteriv: procedure(target, pname: TGLEnum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetMinmaxParameterfv: procedure(target, pname: TGLEnum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // ARB_multitexture
   glMultiTexCoord1dARB: procedure(target: TGLenum; s: TGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord1dVARB: procedure(target: TGLenum; v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord1fARB: procedure(target: TGLenum; s: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord1fVARB: procedure(target: TGLenum; v: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord1iARB: procedure(target: TGLenum; s: TGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord1iVARB: procedure(target: TGLenum; v: PGLInt); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord1sARB: procedure(target: TGLenum; s: TGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord1sVARB: procedure(target: TGLenum; v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord2dARB: procedure(target: TGLenum; s, t: TGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord2dvARB: procedure(target: TGLenum; v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord2fARB: procedure(target: TGLenum; s, t: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord2fvARB: procedure(target: TGLenum; v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord2iARB: procedure(target: TGLenum; s, t: TGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord2ivARB: procedure(target: TGLenum; v: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord2sARB: procedure(target: TGLenum; s, t: TGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord2svARB: procedure(target: TGLenum; v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord3dARB: procedure(target: TGLenum; s, t, r: TGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord3dvARB: procedure(target: TGLenum; v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord3fARB: procedure(target: TGLenum; s, t, r: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord3fvARB: procedure(target: TGLenum; v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord3iARB: procedure(target: TGLenum; s, t, r: TGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord3ivARB: procedure(target: TGLenum; v: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord3sARB: procedure(target: TGLenum; s, t, r: TGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord3svARB: procedure(target: TGLenum; v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord4dARB: procedure(target: TGLenum; s, t, r, q: TGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord4dvARB: procedure(target: TGLenum; v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord4fARB: procedure(target: TGLenum; s, t, r, q: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord4fvARB: procedure(target: TGLenum; v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord4iARB: procedure(target: TGLenum; s, t, r, q: TGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord4ivARB: procedure(target: TGLenum; v: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord4sARB: procedure(target: TGLenum; s, t, r, q: TGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiTexCoord4svARB: procedure(target: TGLenum; v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glActiveTextureARB: procedure(target: TGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glClientActiveTextureARB: procedure(target: TGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GLU extensions
   gluNurbsCallbackDataEXT: procedure(nurb: PGLUnurbs; userData: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   gluNewNurbsTessellatorEXT: function: PGLUnurbs; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   gluDeleteNurbsTessellatorEXT: procedure(nurb: PGLUnurbs); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // Extension functions
   glAreTexturesResidentEXT: function(n: TGLsizei; textures: PGLuint; residences: PGLBoolean): TGLboolean; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glArrayElementArrayEXT: procedure(mode: TGLEnum; count: TGLsizei; pi: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glBeginSceneEXT: procedure; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glBindTextureEXT: procedure(target: TGLEnum; texture: TGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glColorTableEXT: procedure(target, internalFormat: TGLEnum; width: TGLsizei; format, atype: TGLEnum; data: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glColorSubTableExt: procedure(target: TGLEnum; start, count: TGLsizei; format, atype: TGLEnum; data: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCopyTexImage1DEXT: procedure(target: TGLEnum; level: TGLint; internalFormat: TGLEnum; x, y: TGLint; width: TGLsizei; border: TGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCopyTexSubImage1DEXT: procedure(target: TGLEnum; level, xoffset, x, y: TGLint; width: TGLsizei); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCopyTexImage2DEXT: procedure(target: TGLEnum; level: TGLint; internalFormat: TGLEnum; x, y: TGLint; width, height: TGLsizei; border: TGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCopyTexSubImage2DEXT: procedure(target: TGLEnum; level, xoffset, yoffset, x, y: TGLint; width, height: TGLsizei); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCopyTexSubImage3DEXT: procedure(target: TGLEnum; level, xoffset, yoffset, zoffset, x, y: TGLint; width, height: TGLsizei); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glDeleteTexturesEXT: procedure(n: TGLsizei; textures: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glEndSceneEXT: procedure; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGenTexturesEXT: procedure(n: TGLsizei; textures: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetColorTableEXT: procedure(target, format, atype: TGLEnum; data: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetColorTablePameterfvEXT: procedure(target, pname: TGLEnum; params: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetColorTablePameterivEXT: procedure(target, pname: TGLEnum; params: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glIndexFuncEXT: procedure(func: TGLEnum; ref: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glIndexMaterialEXT: procedure(face: TGLEnum; mode: TGLEnum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glIsTextureEXT: function(texture: TGLuint): TGLboolean; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glPolygonOffsetEXT: procedure(factor, bias: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glPrioritizeTexturesEXT: procedure(n: TGLsizei; textures: PGLuint; priorities: PGLclampf); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glTexSubImage1DEXT: procedure(target: TGLEnum; level, xoffset: TGLint; width: TGLsizei; format, Atype: TGLEnum; pixels: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glTexSubImage2DEXT: procedure(target: TGLEnum; level, xoffset, yoffset: TGLint; width, height: TGLsizei; format, Atype: TGLEnum; pixels: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glTexSubImage3DEXT: procedure(target: TGLEnum; level, xoffset, yoffset, zoffset: TGLint; width, height, depth: TGLsizei; format, Atype: TGLEnum; pixels: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // EXT_compiled_vertex_array
   glLockArraysEXT: procedure(first: TGLint; count: TGLsizei); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUnlockArraysEXT: procedure; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // EXT_stencil_two_side
   glActiveStencilFaceEXT: procedure(face: TGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // WIN_swap_hint
   glAddSwapHintRectWIN: procedure(x, y: TGLint; width, height: TGLsizei); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_ARB_point_parameter
   glPointParameterfARB: procedure(pname: TGLenum; param: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glPointParameterfvARB: procedure(pname: TGLenum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_ARB_transpose_matrix
   glLoadTransposeMatrixfARB: procedure(m: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glLoadTransposeMatrixdARB: procedure(m: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultTransposeMatrixfARB: procedure(m: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultTransposeMatrixdARB: procedure(m: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_ARB_multisample
   glSampleCoverageARB: procedure(Value: TGLclampf; invert: TGLboolean); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSamplePassARB: procedure(pass: TGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_ARB_texture_compression
   glCompressedTexImage3DARB: procedure(target: TGLenum; level: TGLint; internalformat: TGLenum; Width, Height, depth: TGLsizei; border: TGLint; imageSize: TGLsizei; data: pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCompressedTexImage2DARB: procedure(target: TGLenum; level: TGLint; internalformat: TGLenum; Width, Height: TGLsizei; border: TGLint; imageSize: TGLsizei; data: pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCompressedTexImage1DARB: procedure(target: TGLenum; level: TGLint; internalformat: TGLenum; Width: TGLsizei; border: TGLint; imageSize: TGLsizei; data: pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCompressedTexSubImage3DARB: procedure(target: TGLenum; level: TGLint; xoffset, yoffset, zoffset: TGLint; width, height, depth: TGLsizei; Format: TGLenum; imageSize: TGLsizei; data: pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCompressedTexSubImage2DARB: procedure(target: TGLenum; level: TGLint; xoffset, yoffset: TGLint; width, height: TGLsizei; Format: TGLenum; imageSize: TGLsizei; data: pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCompressedTexSubImage1DARB: procedure(target: TGLenum; level: TGLint; xoffset: TGLint; width: TGLsizei; Format: TGLenum; imageSize: TGLsizei; data: pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetCompressedTexImageARB: procedure(target: TGLenum; level: TGLint; img: pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_ARB_vertex_program
   glVertexAttrib1sARB: procedure(index: GLuint; x: GLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib1fARB: procedure(index: GLuint; x: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib1dARB: procedure(index: GLuint; x: GLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib2sARB: procedure(index: GLuint; x: GLshort; y: GLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib2fARB: procedure(index: GLuint; x: GLfloat; y: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib2dARB: procedure(index: GLuint; x: GLdouble; y: GLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib3sARB: procedure(index: GLuint; x: GLshort; y: GLshort; z: GLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib3fARB: procedure(index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib3dARB: procedure(index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4sARB: procedure(index: GLuint; x: GLshort; y: GLshort; z: GLshort; w: GLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4fARB: procedure(index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4dARB: procedure(index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4NubARB: procedure(index: GLuint; x: GLubyte; y: GLubyte; z: GLubyte; w: GLubyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib1svARB: procedure(index: GLuint; const v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib1fvARB: procedure(index: GLuint; const v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib1dvARB: procedure(index: GLuint; const v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib2svARB: procedure(index: GLuint; const v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib2fvARB: procedure(index: GLuint; const v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib2dvARB: procedure(index: GLuint; const v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib3svARB: procedure(index: GLuint; const v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib3fvARB: procedure(index: GLuint; const v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib3dvARB: procedure(index: GLuint; const v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4bvARB: procedure(index: GLuint; const v: PGLbyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4svARB: procedure(index: GLuint; const v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4ivARB: procedure(index: GLuint; const v: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4ubvARB: procedure(index: GLuint; const v: PGLubyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4usvARB: procedure(index: GLuint; const v: PGLushort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4uivARB: procedure(index: GLuint; const v: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4fvARB: procedure(index: GLuint; const v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4dvARB: procedure(index: GLuint; const v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4NbvARB: procedure(index: GLuint; const v: PGLbyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4NsvARB: procedure(index: GLuint; const v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4NivARB: procedure(index: GLuint; const v: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4NubvARB: procedure(index: GLuint; const v: PGLubyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4NusvARB: procedure(index: GLuint; const v: PGLushort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4NuivARB: procedure(index: GLuint; const v: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribPointerARB: procedure(index: GLuint; size: GLint; _type: GLenum; normalized: GLboolean; stride: GLsizei; const _pointer: pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glEnableVertexAttribArrayARB: procedure(index: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glDisableVertexAttribArrayARB: procedure(index: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramStringARB: procedure(target: GLenum; format: GLenum; len: GLsizei; const _string: pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glBindProgramARB: procedure(target: GLenum; _program: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glDeleteProgramsARB: procedure(n: GLsizei; const programs: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGenProgramsARB: procedure(n: GLsizei; programs: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramEnvParameter4dARB: procedure(target: GLenum; index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramEnvParameter4dvARB: procedure(target: GLenum; index: GLuint; const params: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramEnvParameter4fARB: procedure(target: GLenum; index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramEnvParameter4fvARB: procedure(target: GLenum; index: GLuint; const params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramLocalParameter4dARB: procedure(target: GLenum; index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramLocalParameter4dvARB: procedure(target: GLenum; index: GLuint; const params: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramLocalParameter4fARB: procedure(target: GLenum; index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramLocalParameter4fvARB: procedure(target: GLenum; index: GLuint; const params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetProgramEnvParameterdvARB: procedure(target: GLenum; index: GLuint; params: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetProgramEnvParameterfvARB: procedure(target: GLenum; index: GLuint; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetProgramLocalParameterdvARB: procedure(target: GLenum; index: GLuint; params: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetProgramLocalParameterfvARB: procedure(target: GLenum; index: GLuint; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetProgramivARB: procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetProgramStringARB: procedure(target: GLenum; pname: GLenum; _string: pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetVertexAttribdvARB: procedure(index: GLuint; pname: GLenum; params: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetVertexAttribfvARB: procedure(index: GLuint; pname: GLenum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetVertexAttribivARB: procedure(index: GLuint; pname: GLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetVertexAttribPointervARB: procedure(index: GLuint; pname: GLenum; _pointer: pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glIsProgramARB: function(_program: GLuint): GLboolean; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_ARB_vertex_buffer_object
   glBindBufferARB: procedure(target: GLenum; buffer: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glDeleteBuffersARB: procedure(n: GLsizei; const buffers: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGenBuffersARB: procedure(n: GLsizei; buffers: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glIsBufferARB: function(buffer: GLuint): GLboolean; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glBufferDataARB: procedure(target: GLenum; size: GLsizei; const data: Pointer; usage: GLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glBufferSubDataARB: procedure(target: GLenum; offset: GLuint; size: GLsizei; const data: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetBufferSubDataARB: procedure(target: GLenum; offset: GLuint; size: GLsizei; data: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMapBufferARB: function(target: GLenum; access: GLenum): Pointer; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUnmapBufferARB: function(target: GLenum): GLboolean; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetBufferParameterivARB: procedure(target: GLenum; pname: GLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetBufferPointervARB: procedure(target: GLenum; pname: GLenum; params: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_ARB_shader_objects
   glDeleteObjectARB: procedure(obj: GLhandleARB); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetHandleARB: function(pname: GLenum): GLhandleARB; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glDetachObjectARB: procedure(containerObj: GLhandleARB; attachedObj: GLhandleARB); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCreateShaderObjectARB: function(shaderType: GLenum): GLhandleARB; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glShaderSourceARB: procedure(shaderObj: GLhandleARB; count: GLsizei; const _string: PGLPCharArray; const length: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCompileShaderARB: procedure(shaderObj: GLhandleARB); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCreateProgramObjectARB: function(): GLhandleARB; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glAttachObjectARB: procedure(containerObj: GLhandleARB; obj: GLhandleARB); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glLinkProgramARB: procedure(programObj: GLhandleARB); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUseProgramObjectARB: procedure(programObj: GLhandleARB); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glValidateProgramARB: procedure(programObj: GLhandleARB); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform1fARB: procedure(location: GLint; v0: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform2fARB: procedure(location: GLint; v0: GLfloat; v1: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform3fARB: procedure(location: GLint; v0: GLfloat; v1: GLfloat; v2: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform4fARB: procedure(location: GLint; v0: GLfloat; v1: GLfloat; v2: GLfloat; v3: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform1iARB: procedure(location: GLint; v0: GLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform2iARB: procedure(location: GLint; v0: GLint; v1: GLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform3iARB: procedure(location: GLint; v0: GLint; v1: GLint; v2: GLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform4iARB: procedure(location: GLint; v0: GLint; v1: GLint; v2: GLint; v3: GLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform1fvARB: procedure(location: GLint; count: GLsizei; value: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform2fvARB: procedure(location: GLint; count: GLsizei; value: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform3fvARB: procedure(location: GLint; count: GLsizei; value: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform4fvARB: procedure(location: GLint; count: GLsizei; value: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform1ivARB: procedure(location: GLint; count: GLsizei; value: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform2ivARB: procedure(location: GLint; count: GLsizei; value: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform3ivARB: procedure(location: GLint; count: GLsizei; value: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniform4ivARB: procedure(location: GLint; count: GLsizei; value: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniformMatrix2fvARB: procedure(location: GLint; count: GLsizei; transpose: GLboolean; value: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniformMatrix3fvARB: procedure(location: GLint; count: GLsizei; transpose: GLboolean; value: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glUniformMatrix4fvARB: procedure(location: GLint; count: GLsizei; transpose: GLboolean; value: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetObjectParameterfvARB: procedure(obj: GLhandleARB; pname: GLenum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetObjectParameterivARB: procedure(obj: GLhandleARB; pname: GLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetInfoLogARB: procedure(obj: GLhandleARB; maxLength: GLsizei; length: PGLsizei; infoLog: PChar); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetAttachedObjectsARB: procedure(containerObj: GLhandleARB; maxCount: GLsizei; count: PGLsizei; obj: PGLhandleARB); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetUniformLocationARB: function(programObj: GLhandleARB; const name: PChar): GLint; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetActiveUniformARB: procedure(programObj: GLhandleARB; index: GLuint; maxLength: GLsizei; length: PGLsizei; size: PGLint; _type: PGLenum; name: PChar); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetUniformfvARB: procedure(programObj: GLhandleARB; location: GLint; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetUniformivARB: procedure(programObj: GLhandleARB; location: GLint; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetShaderSourceARB: procedure(obj: GLhandleARB; maxLength: GLsizei; length: PGLsizei; source: PChar); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_ARB_vertex_shader
   glBindAttribLocationARB: procedure(programObj: GLhandleARB; index: GLuint; const name: PChar); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetActiveAttribARB: procedure(programObj: GLhandleARB; index: GLuint; maxLength: GLsizei; length: PGLsizei; size: PGLint; _type: PGLenum; name: PChar); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetAttribLocationARB: function(programObj: GLhandleARB; const name: PChar): GLint; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_EXT_blend_color
   glBlendColorEXT: procedure(red, green, blue: TGLclampf; alpha: TGLclampf); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_EXT_texture3D
   glTexImage3DEXT: procedure(target: TGLenum; level: TGLint; internalformat: TGLenum; width, height, depth: TGLsizei; border: TGLint; Format, AType: TGLenum; pixels: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_SGIS_multisample
   glSampleMaskSGIS: procedure(Value: TGLclampf; invert: TGLboolean); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSamplePatternSGIS: procedure(pattern: TGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_EXT_blend_minmax
   glBlendEquationEXT: procedure(mode: TGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_EXT_paletted_texture
   glGetColorTableParameterivEXT: procedure(target, pname: TGLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetColorTableParameterfvEXT: procedure(target, pname: TGLenum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_EXT_draw_range_elements
   glDrawRangeElementsEXT: procedure(mode: TGLenum; start, Aend: TGLuint; Count: TGLsizei; Atype: TGLenum; indices: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_EXT_secondary_color
   glSecondaryColor3bEXT: procedure(red, green, blue: TGLbyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColor3bvEXT: procedure(v: PGLbyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColor3dEXT: procedure(red, green, blue: TGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColor3dvEXT: procedure(v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColor3fEXT: procedure(red, green, blue: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColor3fvEXT: procedure(v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColor3iEXT: procedure(red, green, blue: TGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColor3ivEXT: procedure(v: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   glSecondaryColor3sEXT: procedure(red, green, blue: TGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColor3svEXT: procedure(v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColor3ubEXT: procedure(red, green, blue: TGLubyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColor3ubvEXT: procedure(v: PGLubyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColor3uiEXT: procedure(red, green, blue: TGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColor3uivEXT: procedure(v: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColor3usEXT: procedure(red, green, blue: TGLushort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColor3usvEXT: procedure(v: PGLushort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSecondaryColorPointerEXT: procedure(Size: TGLint; Atype: TGLenum; stride: TGLsizei; p: pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_EXT_multi_draw_arrays
   glMultiDrawArraysEXT: procedure(mode: TGLenum; First: PGLint; Count: PGLsizei; primcount: TGLsizei); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glMultiDrawElementsEXT: procedure(mode: TGLenum; Count: PGLsizei; AType: TGLenum; var indices; primcount: TGLsizei); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_EXT_fog_coord
   glFogCoordfEXT: procedure(coord: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glFogCoordfvEXT: procedure(coord: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glFogCoorddEXT: procedure(coord: TGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glFogCoorddvEXT: procedure(coord: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glFogCoordPointerEXT: procedure(AType: TGLenum; stride: TGLsizei; p: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_EXT_blend_func_separate
   glBlendFuncSeparateEXT: procedure(sfactorRGB, dfactorRGB, sfactorAlpha, dfactorAlpha: TGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_NV_vertex_array_range
   glFlushVertexArrayRangeNV: procedure; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexArrayRangeNV: procedure(Size: TGLsizei; p: pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   wglAllocateMemoryNV: function(size: TGLsizei; readFrequency, writeFrequency, priority: Single): Pointer; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   wglFreeMemoryNV: procedure(ptr: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_NV_register_combiners
   glCombinerParameterfvNV: procedure(pname: TGLenum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCombinerParameterfNV: procedure(pname: TGLenum; param: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCombinerParameterivNV: procedure(pname: TGLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCombinerParameteriNV: procedure(pname: TGLenum; param: TGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCombinerInputNV: procedure(stage, portion, variable, input, mapping, componentUsage: TGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCombinerOutputNV: procedure(stage, portion, abOutput, cdOutput, sumOutput, scale, bias: TGLenum; abDotProduct, cdDotProduct, muxSum: TGLboolean); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glFinalCombinerInputNV: procedure(variable, input, mapping, componentUsage: TGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetCombinerInputParameterfvNV: procedure(stage, portion, variable, pname: TGLenum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetCombinerInputParameterivNV: procedure(stage, portion, variable, pname: TGLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetCombinerOutputParameterfvNV: procedure(stage, portion, pname: TGLenum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetCombinerOutputParameterivNV: procedure(stage, portion, pname: TGLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetFinalCombinerInputParameterfvNV: procedure(variable, pname: TGLenum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetFinalCombinerInputParameterivNV: procedure(variable, pname: TGLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_NV_fence
   glGenFencesNV: procedure(n: TGLsizei; fences: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glDeleteFencesNV: procedure(n: TGLsizei; fences: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSetFenceNV: procedure(fence: TGLuint; condition: TGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glTestFenceNV: function(fence: TGLuint): TGLboolean; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glFinishFenceNV: procedure(fence: TGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glIsFenceNV: function(fence: TGLuint): TGLboolean; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetFenceivNV: procedure(fence: TGLuint; pname: TGLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_NV_occlusion_query
   glGenOcclusionQueriesNV: procedure(n: TGLsizei; ids: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glDeleteOcclusionQueriesNV: procedure(n: TGLsizei; const ids: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glIsOcclusionQueryNV: function(id: TGLuint): TGLboolean; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glBeginOcclusionQueryNV: procedure(id: TGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glEndOcclusionQueryNV: procedure; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetOcclusionQueryivNV: procedure(id: TGLuint; pname: TGLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetOcclusionQueryuivNV: procedure(id: TGLuint; pname: TGLenum; params: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_MESA_resize_buffers
   glResizeBuffersMESA: procedure; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_3DFX_tbuffer
   glTbufferMask3DFX: procedure(mask: TGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_EXT_multisample
   glSampleMaskEXT: procedure(Value: TGLclampf; invert: TGLboolean); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glSamplePatternEXT: procedure(pattern: TGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_SGIS_texture_color_mask
   glTextureColorMaskSGIS: procedure(red, green, blue, alpha: TGLboolean); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_NV_vertex_program
   glAreProgramsResidentNV: procedure(n: TGLSizei; programs: PGLuint; residences: PGLboolean); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glBindProgramNV: procedure(target: TGLenum; id: TGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glDeleteProgramsNV: procedure(n: TGLSizei; programs: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glExecuteProgramNV: procedure(target: TGLenum; id: TGLuint; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGenProgramsNV: procedure(n: TGLSizei; programs: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetProgramParameterdvNV: procedure (target: TGLenum; index: TGLuint; pname: TGLenum; params: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetProgramParameterfvNV: procedure (target: TGLenum; index: TGLuint; pname: TGLenum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetProgramivNV: procedure (id: TGLuint; pname: TGLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetProgramStringNV: procedure (id: TGLuint; pname: TGLenum; programIdx: PGLubyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetTrackMatrixivNV: procedure (target: TGLenum; address: TGLuint; pname: TGLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetVertexAttribdvNV: procedure (index: TGLuint; pname: TGLenum; params: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetVertexAttribfvNV: procedure (index: TGLuint; pname: TGLenum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetVertexAttribivNV: procedure (index: TGLuint; pname: TGLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetVertexAttribPointervNV: procedure (index: TGLuint; pname: TGLenum; pointer: PGLPointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glIsProgramNV: function (id: TGLuint): TGLboolean; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glLoadProgramNV: procedure (target: TGLenum; id: TGLuint; len: TGLSizei; programIdx: PGLubyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramParameter4dNV: procedure (target: TGLenum; index: TGLuint; x, y, z, w: TGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramParameter4dvNV: procedure (target: TGLenum; index: TGLuint; v: PGLdouble ); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramParameter4fNV: procedure (target: TGLenum; index: TGLuint; x, y, z, w: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramParameter4fvNV: procedure (target: TGLenum; index: TGLuint; v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramParameters4dvNV: procedure (target: TGLenum; index: TGLuint; count: TGLSizei; v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glProgramParameters4fvNV: procedure (target: TGLenum; index: TGLuint; count: TGLSizei; v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glRequestResidentProgramsNV: procedure (n: TGLSizei; programs: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glTrackMatrixNV: procedure (target: TGLenum; address: TGLuint; matrix: TGLenum; transform: TGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribPointerNV: procedure (index: TGLuint; fsize: TGLint; vertextype: TGLenum; stride: TGLSizei; pointer: Pointer); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib1dNV: procedure (index: TGLuint; x: TGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib1dvNV: procedure (index: TGLuint; v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib1fNV: procedure (index: TGLuint; x: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib1fvNV: procedure (index: TGLuint; v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib1sNV: procedure (index: TGLuint; x: TGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib1svNV: procedure (index: TGLuint; v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib2dNV: procedure (index: TGLuint; x: TGLdouble; y: TGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib2dvNV: procedure (index: TGLuint; v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib2fNV: procedure (index: TGLuint; x: TGLfloat; y: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib2fvNV: procedure (index: TGLuint; v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib2sNV: procedure (index: TGLuint; x: TGLshort; y: TGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib2svNV: procedure (index: TGLuint; v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib3dNV: procedure (index: TGLuint; x: TGLdouble; y: TGLdouble; z: TGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib3dvNV: procedure (index: TGLuint; v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib3fNV: procedure (index: TGLuint; x: TGLfloat; y: TGLfloat; z: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib3fvNV: procedure (index: TGLuint; v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib3sNV: procedure (index: TGLuint; x: TGLshort; y: TGLshort; z: TGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib3svNV: procedure (index: TGLuint; v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4dNV: procedure (index: TGLuint; x: TGLdouble; y: TGLdouble; z: TGLdouble; w: TGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4dvNV: procedure (index: TGLuint; v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4fNV: procedure(index: TGLuint; x: TGLfloat; y: TGLfloat; z: TGLfloat; w: TGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4fvNV: procedure(index: TGLuint; v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4sNV: procedure (index: TGLuint; x: TGLshort; y: TGLshort; z: TGLdouble; w: TGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4svNV: procedure (index: TGLuint; v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttrib4ubvNV: procedure (index: TGLuint; v: PGLubyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribs1dvNV: procedure (index: TGLuint; count: TGLSizei; v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribs1fvNV: procedure (index: TGLuint; count: TGLSizei; v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribs1svNV: procedure (index: TGLuint; count: TGLSizei; v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribs2dvNV: procedure (index: TGLuint; count: TGLSizei; v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribs2fvNV: procedure (index: TGLuint; count: TGLSizei; v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribs2svNV: procedure (index: TGLuint; count: TGLSizei; v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribs3dvNV: procedure (index: TGLuint; count: TGLSizei; v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribs3fvNV: procedure (index: TGLuint; count: TGLSizei; v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribs3svNV: procedure (index: TGLuint; count: TGLSizei; v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribs4dvNV: procedure (index: TGLuint; count: TGLSizei; v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribs4fvNV: procedure (index: TGLuint; count: TGLSizei; v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribs4svNV: procedure (index: TGLuint; count: TGLSizei; v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glVertexAttribs4ubvNV: procedure (index: TGLuint; count: TGLSizei; v: PGLubyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_ATI_draw_buffers
   glDrawBuffersATI: procedure(n: GLsizei; const bufs: PGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}

   // GL_EXT_framebuffer_object
   glIsRenderbufferEXT: function(renderbuffer: TGLuint): TGLboolean; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glBindRenderbufferEXT: procedure(target: TGLenum; renderbuffer: TGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glDeleteRenderbuffersEXT: procedure(n: TGLsizei; renderbuffers: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGenRenderbuffersEXT: procedure(n: TGLsizei; renderbuffers: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glRenderbufferStorageEXT: procedure(target: TGLenum; internalformat: TGLenum; width: TGLsizei; height: TGLsizei); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetRenderbufferParameterivEXT: procedure(target: TGLenum; pname: TGLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glIsFramebufferEXT: function(framebuffer: TGLuint): TGLboolean; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glBindFramebufferEXT: procedure(target: TGLenum; framebuffer: TGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glDeleteFramebuffersEXT: procedure(n: TGLsizei; framebuffers: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGenFramebuffersEXT: procedure(n: TGLsizei; framebuffers: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glCheckFramebufferStatusEXT: function(target: TGLenum): TGLenum; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glFramebufferTexture1DEXT: procedure(target: TGLenum; attachment: TGLenum; textarget: TGLenum; texture: TGLuint; level: TGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glFramebufferTexture2DEXT: procedure(target: TGLenum; attachment: TGLenum; textarget: TGLenum; texture: TGLuint; level: TGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glFramebufferTexture3DEXT: procedure(target: TGLenum; attachment: TGLenum; textarget: TGLenum; texture: TGLuint; level: TGLint; zoffset: TGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glFramebufferRenderbufferEXT: procedure(target: TGLenum; attachment: TGLenum; renderbuffertarget: TGLenum; renderbuffer: TGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGetFramebufferAttachmentParameterivEXT: procedure(target: TGLenum; attachment: TGLenum; pname: TGLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}
   glGenerateMipmapEXT: procedure(target: TGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF UNIX} cdecl; {$ENDIF}



   // GL 2.0
   glBlendEquationSeparate: procedure(modeRGB: GLenum; modeAlpha: GLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glDrawBuffers: procedure(n: GLsizei; const bufs: PGLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glStencilOpSeparate: procedure(face: GLenum; sfail: GLenum; dpfail: GLenum; dppass: GLenum); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glStencilFuncSeparate: procedure(frontfunc: GLenum; backfunc: GLenum; ref: GLint; mask: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glStencilMaskSeparate: procedure(face: GLenum; mask: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glAttachShader: procedure(_program: GLuint; shader: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glBindAttribLocation: procedure(_program: GLuint; index: GLuint; const name: PGLchar); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glCompileShader: procedure(shader: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glCreateProgram: function(): GLuint; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glCreateShader: function(_type: GLenum): GLuint; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glDeleteProgram: procedure(_program: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glDeleteShader: procedure(shader: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glDetachShader: procedure(_program: GLuint; shader: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glDisableVertexAttribArray: procedure(index: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glEnableVertexAttribArray: procedure(index: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetActiveAttrib: procedure(_program: GLuint; index: GLuint; bufSize: GLsizei; length: PGLsizei; size: PGLint; _type: PGLenum; name: PGLchar); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetActiveUniform: procedure(_program: GLuint; index: GLuint; bufSize: GLsizei; length: PGLsizei; size: PGLint; _type: PGLenum; name: PGLchar); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetAttachedShaders: procedure(_program: GLuint; maxCount: GLsizei; count: PGLsizei; obj: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetAttribLocation: function(_program: GLuint; const name: PGLchar): GLint; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetProgramiv: procedure(_program: GLuint; pname: GLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetProgramInfoLog: procedure(_program: GLuint; bufSize: GLsizei; length: PGLsizei; infoLog: PGLchar); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetShaderiv: procedure(shader: GLuint; pname: GLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetShaderInfoLog: procedure(shader: GLuint; bufSize: GLsizei; length: PGLsizei; infoLog: PGLchar); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetShaderSource: procedure(shader: GLuint; bufSize: GLsizei; length: PGLsizei; source: PGLchar); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetUniformLocation: function(_program: GLuint; const name: PGLchar): GLint; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetUniformfv: procedure(_program: GLuint; location: GLint; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetUniformiv: procedure(_program: GLuint; location: GLint; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetVertexAttribdv: procedure(index: GLuint; pname: GLenum; params: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetVertexAttribfv: procedure(index: GLuint; pname: GLenum; params: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetVertexAttribiv: procedure(index: GLuint; pname: GLenum; params: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glGetVertexAttribPointerv: procedure(index: GLuint; pname: GLenum; pointer: PGLvoid); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glIsProgram: function(_program: GLuint): GLboolean; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glIsShader: function(shader: GLuint): GLboolean; {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glLinkProgram: procedure(_program: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glShaderSource: procedure(shader: GLuint; count: GLsizei; const _string: PGLchar; const length: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUseProgram: procedure(_program: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform1f: procedure(location: GLint; v0: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform2f: procedure(location: GLint; v0: GLfloat; v1: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform3f: procedure(location: GLint; v0: GLfloat; v1: GLfloat; v2: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform4f: procedure(location: GLint; v0: GLfloat; v1: GLfloat; v2: GLfloat; v3: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform1i: procedure(location: GLint; v0: GLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform2i: procedure(location: GLint; v0: GLint; v1: GLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform3i: procedure(location: GLint; v0: GLint; v1: GLint; v2: GLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform4i: procedure(location: GLint; v0: GLint; v1: GLint; v2: GLint; v3: GLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform1fv: procedure(location: GLint; count: GLsizei; const value: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform2fv: procedure(location: GLint; count: GLsizei; const value: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform3fv: procedure(location: GLint; count: GLsizei; const value: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform4fv: procedure(location: GLint; count: GLsizei; const value: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform1iv: procedure(location: GLint; count: GLsizei; const value: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform2iv: procedure(location: GLint; count: GLsizei; const value: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform3iv: procedure(location: GLint; count: GLsizei; const value: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniform4iv: procedure(location: GLint; count: GLsizei; const value: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniformMatrix2fv: procedure(location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniformMatrix3fv: procedure(location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glUniformMatrix4fv: procedure(location: GLint; count: GLsizei; transpose: GLboolean; const value: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glValidateProgram: procedure(_program: GLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib1d: procedure(index: GLuint; x: GLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib1dv: procedure(index: GLuint; const v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib1f: procedure(index: GLuint; x: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib1fv: procedure(index: GLuint; const v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib1s: procedure(index: GLuint; x: GLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib1sv: procedure(index: GLuint; const v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib2d: procedure(index: GLuint; x: GLdouble; y: GLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib2dv: procedure(index: GLuint; const v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib2f: procedure(index: GLuint; x: GLfloat; y: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib2fv: procedure(index: GLuint; const v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib2s: procedure(index: GLuint; x: GLshort; y: GLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib2sv: procedure(index: GLuint; const v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib3d: procedure(index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib3dv: procedure(index: GLuint; const v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib3f: procedure(index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib3fv: procedure(index: GLuint; const v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib3s: procedure(index: GLuint; x: GLshort; y: GLshort; z: GLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib3sv: procedure(index: GLuint; const v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4Nbv: procedure(index: GLuint; const v: PGLbyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4Niv: procedure(index: GLuint; const v: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4Nsv: procedure(index: GLuint; const v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4Nub: procedure(index: GLuint; x: GLubyte; y: GLubyte; z: GLubyte; w: GLubyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4Nubv: procedure(index: GLuint; const v: PGLubyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4Nuiv: procedure(index: GLuint; const v: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4Nusv: procedure(index: GLuint; const v: PGLushort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4bv: procedure(index: GLuint; const v: PGLbyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4d: procedure(index: GLuint; x: GLdouble; y: GLdouble; z: GLdouble; w: GLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4dv: procedure(index: GLuint; const v: PGLdouble); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4f: procedure(index: GLuint; x: GLfloat; y: GLfloat; z: GLfloat; w: GLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4fv: procedure(index: GLuint; const v: PGLfloat); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4iv: procedure(index: GLuint; const v: PGLint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4s: procedure(index: GLuint; x: GLshort; y: GLshort; z: GLshort; w: GLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4sv: procedure(index: GLuint; const v: PGLshort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4ubv: procedure(index: GLuint; const v: PGLubyte); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4uiv: procedure(index: GLuint; const v: PGLuint); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttrib4usv: procedure(index: GLuint; const v: PGLushort); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}
   glVertexAttribPointer: procedure(index: GLuint; size: GLint; _type: GLenum; normalized: GLboolean; stride: GLsizei; const pointer: PGLvoid); {$IFDEF MSWINDOWS} stdcall; {$ENDIF} {$IFDEF unix} cdecl; {$ENDIF}


// Buffer ID's for Multiple-Render-Targets (using GL_ATI_draw_buffers)
const
  MRT_BUFFERS: array [0..3] of GLenum = (GL_FRONT_LEFT, GL_AUX0, GL_AUX1, GL_AUX2);

const

  OSMESA_COLOR_INDEX	= GL_COLOR_INDEX;
  OSMESA_RGBA	 = GL_RGBA;
  OSMESA_BGRA	 = $1;
  OSMESA_ARGB	 = $2;
  OSMESA_RGB	 = GL_RGB;
  OSMESA_BGR	 =	$4;
  OSMESA_RGB_565 =		$5;

  OSMESA_ROW_LENGTH    = $10;
  OSMESA_Y_UP	       = $11;

type

  OSMesaContext = cardinal;

var
  OSMesaLib: cardinal;

  OSMesaCreateContext: function (format: GLenum; sharelist: Pointer): OSMesaContext; stdcall;
  OSMesaCreateContextExt: function (format: GLenum; depthBits: GLint; stencilBits: GLint;
    accumBits: GLint; sharelist: Pointer): OSMesaContext; stdcall;
  OSMesaDestroyContext: procedure (ctx: OSMesaContext); stdcall;
  OSMesaMakeCurrent: function (ctx: OSMesaContext; Buf: Pointer; typ: GLenum;
                   width, height: GLsizei): GLBoolean; stdcall;
  OSMesaPixelStore: procedure (pname: GLint; value: GLint); stdcall;

var
   GLHandle: HINST;

// ************** Extensions ********************

// ReadExtensions
//
procedure ReadExtensions;
   // To be used in an active rendering context only!
begin
   // Extensions integrated into 1.2 core

   // GL 1.2
   glDrawRangeElements := GetProcAddress(GLHandle, 'glDrawRangeElements');
   glTexImage3D := GetProcAddress(GLHandle, 'glTexImage3D');

   // GL 1.2 ARB imaging
   glBlendColor := GetProcAddress(GLHandle, 'glBlendColor');
   glBlendEquation := GetProcAddress(GLHandle, 'glBlendEquation');
   glColorSubTable := GetProcAddress(GLHandle, 'glColorSubTable'); 
   glCopyColorSubTable := GetProcAddress(GLHandle, 'glCopyColorSubTable');
   glColorTable := GetProcAddress(GLHandle, 'glCopyColorSubTable');
   glCopyColorTable := GetProcAddress(GLHandle, 'glCopyColorTable'); 
   glColorTableParameteriv := GetProcAddress(GLHandle, 'glColorTableParameteriv'); 
   glColorTableParameterfv := GetProcAddress(GLHandle, 'glColorTableParameterfv');
   glGetColorTable := GetProcAddress(GLHandle, 'glGetColorTable'); 
   glGetColorTableParameteriv := GetProcAddress(GLHandle, 'glGetColorTableParameteriv');
   glGetColorTableParameterfv := GetProcAddress(GLHandle, 'glGetColorTableParameterfv');
   glConvolutionFilter1D := GetProcAddress(GLHandle, 'glConvolutionFilter1D'); 
   glConvolutionFilter2D := GetProcAddress(GLHandle, 'glConvolutionFilter2D'); 
   glCopyConvolutionFilter1D := GetProcAddress(GLHandle, 'glCopyConvolutionFilter1D');
   glCopyConvolutionFilter2D := GetProcAddress(GLHandle, 'glCopyConvolutionFilter2D');
   glGetConvolutionFilter := GetProcAddress(GLHandle, 'glGetConvolutionFilter'); 
   glSeparableFilter2D := GetProcAddress(GLHandle, 'glSeparableFilter2D'); 
   glGetSeparableFilter := GetProcAddress(GLHandle, 'glGetSeparableFilter');
   glConvolutionParameteri := GetProcAddress(GLHandle, 'glConvolutionParameteri'); 
   glConvolutionParameteriv := GetProcAddress(GLHandle, 'glConvolutionParameteriv');
   glConvolutionParameterf := GetProcAddress(GLHandle, 'glConvolutionParameterf');
   glConvolutionParameterfv := GetProcAddress(GLHandle, 'glConvolutionParameterfv');
   glGetConvolutionParameteriv := GetProcAddress(GLHandle, 'glGetConvolutionParameteriv');
   glGetConvolutionParameterfv := GetProcAddress(GLHandle, 'glGetConvolutionParameterfv'); 
   glHistogram := GetProcAddress(GLHandle, 'glHistogram');
   glResetHistogram := GetProcAddress(GLHandle, 'glResetHistogram');
   glGetHistogram := GetProcAddress(GLHandle, 'glGetHistogram');
   glGetHistogramParameteriv := GetProcAddress(GLHandle, 'glGetHistogramParameteriv');
   glGetHistogramParameterfv := GetProcAddress(GLHandle, 'glGetHistogramParameterfv');
   glMinmax := GetProcAddress(GLHandle, 'glMinmax');
   glResetMinmax := GetProcAddress(GLHandle, 'glResetMinmax');
   glGetMinmax := GetProcAddress(GLHandle, 'glGetMinmax');
   glGetMinmaxParameteriv := GetProcAddress(GLHandle, 'glGetMinmaxParameteriv');
   glGetMinmaxParameterfv := GetProcAddress(GLHandle, 'glGetMinmaxParameterfv');

   // GL extensions
   glArrayElementArrayEXT := GetProcAddress(GLHandle, 'glArrayElementArrayEXT');
   glColorTableEXT := GetProcAddress(GLHandle, 'glColorTableEXT');
   glColorSubTableEXT := GetProcAddress(GLHandle, 'glColorSubTableEXT');
   glGetColorTableEXT := GetProcAddress(GLHandle, 'glGetColorTableEXT');
   glGetColorTablePameterivEXT := GetProcAddress(GLHandle, 'glGetColorTablePameterivEXT');
   glGetColorTablePameterfvEXT := GetProcAddress(GLHandle, 'glGetColorTablePameterfvEXT');
   glCopyTexImage1DEXT := GetProcAddress(GLHandle, 'glCopyTexImage1DEXT');
   glCopyTexSubImage1DEXT := GetProcAddress(GLHandle, 'glCopyTexSubImage1DEXT');
   glCopyTexImage2DEXT := GetProcAddress(GLHandle, 'glCopyTexImage2DEXT');
   glCopyTexSubImage2DEXT := GetProcAddress(GLHandle, 'glCopyTexSubImage2DEXT');
   glCopyTexSubImage3DEXT := GetProcAddress(GLHandle, 'glCopyTexSubImage3DEXT');
   glIndexFuncEXT := GetProcAddress(GLHandle, 'glIndexFuncEXT');
   glIndexMaterialEXT := GetProcAddress(GLHandle, 'glIndexMaterialEXT');
   glPolygonOffsetEXT := GetProcAddress(GLHandle, 'glPolygonOffsetEXT');
   glTexSubImage1dEXT := GetProcAddress(GLHandle, 'glTexSubImage1DEXT');
   glTexSubImage2dEXT := GetProcAddress(GLHandle, 'glTexSubImage2DEXT');
   glTexSubImage3dEXT := GetProcAddress(GLHandle, 'glTexSubImage3DEXT');
   glGenTexturesEXT := GetProcAddress(GLHandle, 'glGenTexturesEXT');
   glDeleteTexturesEXT := GetProcAddress(GLHandle, 'glDeleteTexturesEXT');
   glBindTextureEXT := GetProcAddress(GLHandle, 'glBindTextureEXT');
   glPrioritizeTexturesEXT := GetProcAddress(GLHandle, 'glPrioritizeTexturesEXT');
   glAreTexturesResidentEXT := GetProcAddress(GLHandle, 'glAreTexturesResidentEXT');
   glIsTextureEXT := GetProcAddress(GLHandle, 'glIsTextureEXT');

   // EXT_compiled_vertex_array
   glLockArraysEXT := GetProcAddress(GLHandle, 'glLockArraysEXT');
   glUnlockArraysEXT := GetProcAddress(GLHandle, 'glUnlockArraysEXT');

   // ARB_multitexture
   glMultiTexCoord1dARB := GetProcAddress(GLHandle, 'glMultiTexCoord1dARB');
   glMultiTexCoord1dVARB := GetProcAddress(GLHandle, 'glMultiTexCoord1dVARB');
   glMultiTexCoord1fARB := GetProcAddress(GLHandle, 'glMultiTexCoord1fARB');
   glMultiTexCoord1fVARB := GetProcAddress(GLHandle, 'glMultiTexCoord1fVARB');
   glMultiTexCoord1iARB := GetProcAddress(GLHandle, 'glMultiTexCoord1iARB'); 
   glMultiTexCoord1iVARB := GetProcAddress(GLHandle, 'glMultiTexCoord1iVARB');
   glMultiTexCoord1sARB := GetProcAddress(GLHandle, 'glMultiTexCoord1sARB'); 
   glMultiTexCoord1sVARB := GetProcAddress(GLHandle, 'glMultiTexCoord1sVARB'); 
   glMultiTexCoord2dARB := GetProcAddress(GLHandle, 'glMultiTexCoord2dARB');
   glMultiTexCoord2dvARB := GetProcAddress(GLHandle, 'glMultiTexCoord2dvARB'); 
   glMultiTexCoord2fARB := GetProcAddress(GLHandle, 'glMultiTexCoord2fARB');
   glMultiTexCoord2fvARB := GetProcAddress(GLHandle, 'glMultiTexCoord2fvARB');
   glMultiTexCoord2iARB := GetProcAddress(GLHandle, 'glMultiTexCoord2iARB');
   glMultiTexCoord2ivARB := GetProcAddress(GLHandle, 'glMultiTexCoord2ivARB');
   glMultiTexCoord2sARB := GetProcAddress(GLHandle, 'glMultiTexCoord2sARB'); 
   glMultiTexCoord2svARB := GetProcAddress(GLHandle, 'glMultiTexCoord2svARB');
   glMultiTexCoord3dARB := GetProcAddress(GLHandle, 'glMultiTexCoord3dARB'); 
   glMultiTexCoord3dvARB := GetProcAddress(GLHandle, 'glMultiTexCoord3dvARB'); 
   glMultiTexCoord3fARB := GetProcAddress(GLHandle, 'glMultiTexCoord3fARB'); 
   glMultiTexCoord3fvARB := GetProcAddress(GLHandle, 'glMultiTexCoord3fvARB'); 
   glMultiTexCoord3iARB := GetProcAddress(GLHandle, 'glMultiTexCoord3iARB'); 
   glMultiTexCoord3ivARB := GetProcAddress(GLHandle, 'glMultiTexCoord3ivARB'); 
   glMultiTexCoord3sARB := GetProcAddress(GLHandle, 'glMultiTexCoord3sARB'); 
   glMultiTexCoord3svARB := GetProcAddress(GLHandle, 'glMultiTexCoord3svARB');
   glMultiTexCoord4dARB := GetProcAddress(GLHandle, 'glMultiTexCoord4dARB'); 
   glMultiTexCoord4dvARB := GetProcAddress(GLHandle, 'glMultiTexCoord4dvARB');
   glMultiTexCoord4fARB := GetProcAddress(GLHandle, 'glMultiTexCoord4fARB');
   glMultiTexCoord4fvARB := GetProcAddress(GLHandle, 'glMultiTexCoord4fvARB'); 
   glMultiTexCoord4iARB := GetProcAddress(GLHandle, 'glMultiTexCoord4iARB');
   glMultiTexCoord4ivARB := GetProcAddress(GLHandle, 'glMultiTexCoord4ivARB');
   glMultiTexCoord4sARB := GetProcAddress(GLHandle, 'glMultiTexCoord4sARB');
   glMultiTexCoord4svARB := GetProcAddress(GLHandle, 'glMultiTexCoord4svARB'); 
   glActiveTextureARB := GetProcAddress(GLHandle, 'glActiveTextureARB');
   glClientActiveTextureARB := GetProcAddress(GLHandle, 'glClientActiveTextureARB');

   // EXT_stencil_two_side
   glActiveStencilFaceEXT := GetProcAddress(GLHandle, 'glActiveStencilFaceEXT');

   // WIN_swap_hint
   glAddSwapHintRectWIN := GetProcAddress(GLHandle, 'glAddSwapHintRectWIN'); 

   // GL_ARB_point_parameter
   glPointParameterfARB := GetProcAddress(GLHandle, 'glPointParameterfARB');
   glPointParameterfvARB := GetProcAddress(GLHandle, 'glPointParameterfvARB');

   // GL_ARB_transpose_matrix
   glLoadTransposeMatrixfARB := GetProcAddress(GLHandle, 'glLoadTransposeMatrixfARB');
   glLoadTransposeMatrixdARB := GetProcAddress(GLHandle, 'glLoadTransposeMatrixdARB');
   glMultTransposeMatrixfARB := GetProcAddress(GLHandle, 'glMultTransposeMatrixfARB'); 
   glMultTransposeMatrixdARB := GetProcAddress(GLHandle, 'glMultTransposeMatrixdARB'); 

   glSampleCoverageARB := GetProcAddress(GLHandle, 'glSampleCoverageARB');
   glSamplePassARB := GetProcAddress(GLHandle, 'glSamplePassARB'); 

   // GL_ARB_multisample
   glCompressedTexImage3DARB := GetProcAddress(GLHandle, 'glCompressedTexImage3DARB');
   glCompressedTexImage2DARB := GetProcAddress(GLHandle, 'glCompressedTexImage2DARB');
   glCompressedTexImage1DARB := GetProcAddress(GLHandle, 'glCompressedTexImage1DARB');
   glCompressedTexSubImage3DARB := GetProcAddress(GLHandle, 'glCompressedTexSubImage3DARB');
   glCompressedTexSubImage2DARB := GetProcAddress(GLHandle, 'glCompressedTexSubImage2DARB');
   glCompressedTexSubImage1DARB := GetProcAddress(GLHandle, 'glCompressedTexSubImage1DARB');
   glGetCompressedTexImageARB := GetProcAddress(GLHandle, 'glGetCompressedTexImageARB');

   // GL_ARB_vertex_program
   glVertexAttrib1sARB := GetProcAddress(GLHandle, 'glVertexAttrib1sARB');
   glVertexAttrib1fARB := GetProcAddress(GLHandle, 'glVertexAttrib1fARB');
   glVertexAttrib1dARB := GetProcAddress(GLHandle, 'glVertexAttrib1dARB');
   glVertexAttrib2sARB := GetProcAddress(GLHandle, 'glVertexAttrib2sARB');
   glVertexAttrib2fARB := GetProcAddress(GLHandle, 'glVertexAttrib2fARB');
   glVertexAttrib2dARB := GetProcAddress(GLHandle, 'glVertexAttrib2dARB');
   glVertexAttrib3sARB := GetProcAddress(GLHandle, 'glVertexAttrib3sARB');
   glVertexAttrib3fARB := GetProcAddress(GLHandle, 'glVertexAttrib3fARB');
   glVertexAttrib3dARB := GetProcAddress(GLHandle, 'glVertexAttrib3dARB');
   glVertexAttrib4sARB := GetProcAddress(GLHandle, 'glVertexAttrib4sARB');
   glVertexAttrib4fARB := GetProcAddress(GLHandle, 'glVertexAttrib4fARB');
   glVertexAttrib4dARB := GetProcAddress(GLHandle, 'glVertexAttrib4dARB');
   glVertexAttrib4NubARB := GetProcAddress(GLHandle, 'glVertexAttrib4NubARB');
   glVertexAttrib1svARB := GetProcAddress(GLHandle, 'glVertexAttrib1svARB');
   glVertexAttrib1fvARB := GetProcAddress(GLHandle, 'glVertexAttrib1fvARB');
   glVertexAttrib1dvARB := GetProcAddress(GLHandle, 'glVertexAttrib1dvARB');
   glVertexAttrib2svARB := GetProcAddress(GLHandle, 'glVertexAttrib2svARB');
   glVertexAttrib2fvARB := GetProcAddress(GLHandle, 'glVertexAttrib2fvARB');
   glVertexAttrib2dvARB := GetProcAddress(GLHandle, 'glVertexAttrib2dvARB');
   glVertexAttrib3svARB := GetProcAddress(GLHandle, 'glVertexAttrib3svARB');
   glVertexAttrib3fvARB := GetProcAddress(GLHandle, 'glVertexAttrib3fvARB');
   glVertexAttrib3dvARB := GetProcAddress(GLHandle, 'glVertexAttrib3dvARB');
   glVertexAttrib4bvARB := GetProcAddress(GLHandle, 'glVertexAttrib4bvARB');
   glVertexAttrib4svARB := GetProcAddress(GLHandle, 'glVertexAttrib4svARB');
   glVertexAttrib4ivARB := GetProcAddress(GLHandle, 'glVertexAttrib4ivARB');
   glVertexAttrib4ubvARB := GetProcAddress(GLHandle, 'glVertexAttrib4ubvARB');
   glVertexAttrib4usvARB := GetProcAddress(GLHandle, 'glVertexAttrib4usvARB');
   glVertexAttrib4uivARB := GetProcAddress(GLHandle, 'glVertexAttrib4uivARB');
   glVertexAttrib4fvARB := GetProcAddress(GLHandle, 'glVertexAttrib4fvARB');
   glVertexAttrib4dvARB := GetProcAddress(GLHandle, 'glVertexAttrib4dvARB');
   glVertexAttrib4NbvARB := GetProcAddress(GLHandle, 'glVertexAttrib4NbvARB');
   glVertexAttrib4NsvARB := GetProcAddress(GLHandle, 'glVertexAttrib4NsvARB');
   glVertexAttrib4NivARB := GetProcAddress(GLHandle, 'glVertexAttrib4NivARB');
   glVertexAttrib4NubvARB := GetProcAddress(GLHandle, 'glVertexAttrib4NubvARB');
   glVertexAttrib4NusvARB := GetProcAddress(GLHandle, 'glVertexAttrib4NusvARB');
   glVertexAttrib4NuivARB := GetProcAddress(GLHandle, 'glVertexAttrib4NuivARB');
   glVertexAttribPointerARB := GetProcAddress(GLHandle, 'glVertexAttribPointerARB');
   glEnableVertexAttribArrayARB := GetProcAddress(GLHandle, 'glEnableVertexAttribArrayARB');
   glDisableVertexAttribArrayARB := GetProcAddress(GLHandle, 'glDisableVertexAttribArrayARB');
   glProgramStringARB := GetProcAddress(GLHandle, 'glProgramStringARB');
   glBindProgramARB := GetProcAddress(GLHandle, 'glBindProgramARB');
   glDeleteProgramsARB := GetProcAddress(GLHandle, 'glDeleteProgramsARB');
   glGenProgramsARB := GetProcAddress(GLHandle, 'glGenProgramsARB');
   glProgramEnvParameter4dARB := GetProcAddress(GLHandle, 'glProgramEnvParameter4dARB');
   glProgramEnvParameter4dvARB := GetProcAddress(GLHandle, 'glProgramEnvParameter4dvARB');
   glProgramEnvParameter4fARB := GetProcAddress(GLHandle, 'glProgramEnvParameter4fARB');
   glProgramEnvParameter4fvARB := GetProcAddress(GLHandle, 'glProgramEnvParameter4fvARB');
   glProgramLocalParameter4dARB := GetProcAddress(GLHandle, 'glProgramLocalParameter4dARB');
   glProgramLocalParameter4dvARB := GetProcAddress(GLHandle, 'glProgramLocalParameter4dvARB');
   glProgramLocalParameter4fARB := GetProcAddress(GLHandle, 'glProgramLocalParameter4fARB');
   glProgramLocalParameter4fvARB := GetProcAddress(GLHandle, 'glProgramLocalParameter4fvARB');
   glGetProgramEnvParameterdvARB := GetProcAddress(GLHandle, 'glGetProgramEnvParameterdvARB');
   glGetProgramEnvParameterfvARB := GetProcAddress(GLHandle, 'glGetProgramEnvParameterfvARB');
   glGetProgramLocalParameterdvARB := GetProcAddress(GLHandle, 'glGetProgramLocalParameterdvARB');
   glGetProgramLocalParameterfvARB := GetProcAddress(GLHandle, 'glGetProgramLocalParameterfvARB');
   glGetProgramivARB := GetProcAddress(GLHandle, 'glGetProgramivARB');
   glGetProgramStringARB := GetProcAddress(GLHandle, 'glGetProgramStringARB');
   glGetVertexAttribdvARB := GetProcAddress(GLHandle, 'glGetVertexAttribdvARB');
   glGetVertexAttribfvARB := GetProcAddress(GLHandle, 'glGetVertexAttribfvARB');
   glGetVertexAttribivARB := GetProcAddress(GLHandle, 'glGetVertexAttribivARB');
   glGetVertexAttribPointervARB := GetProcAddress(GLHandle, 'glGetVertexAttribPointervARB');
   glIsProgramARB := GetProcAddress(GLHandle, 'glIsProgramARB');

   // GL_ARB_vertex_buffer_object
   glBindBufferARB := GetProcAddress(GLHandle, 'glBindBufferARB');
   glDeleteBuffersARB := GetProcAddress(GLHandle, 'glDeleteBuffersARB');
   glGenBuffersARB := GetProcAddress(GLHandle, 'glGenBuffersARB');
   glIsBufferARB := GetProcAddress(GLHandle, 'glIsBufferARB');
   glBufferDataARB := GetProcAddress(GLHandle, 'glBufferDataARB');
   glBufferSubDataARB := GetProcAddress(GLHandle, 'glBufferSubDataARB');
   glGetBufferSubDataARB := GetProcAddress(GLHandle, 'glGetBufferSubDataARB');
   glMapBufferARB := GetProcAddress(GLHandle, 'glMapBufferARB');
   glUnmapBufferARB := GetProcAddress(GLHandle, 'glUnmapBufferARB');
   glGetBufferParameterivARB := GetProcAddress(GLHandle, 'glGetBufferParameterivARB');
   glGetBufferPointervARB := GetProcAddress(GLHandle, 'glGetBufferPointervARB');

   // GL_ARB_shader_objects
   glDeleteObjectARB := GetProcAddress(GLHandle, 'glDeleteObjectARB');
   glGetHandleARB := GetProcAddress(GLHandle, 'glGetHandleARB');
   glDetachObjectARB := GetProcAddress(GLHandle, 'glDetachObjectARB');
   glCreateShaderObjectARB := GetProcAddress(GLHandle, 'glCreateShaderObjectARB');
   glShaderSourceARB := GetProcAddress(GLHandle, 'glShaderSourceARB');
   glCompileShaderARB := GetProcAddress(GLHandle, 'glCompileShaderARB');
   glCreateProgramObjectARB := GetProcAddress(GLHandle, 'glCreateProgramObjectARB');
   glAttachObjectARB := GetProcAddress(GLHandle, 'glAttachObjectARB');
   glLinkProgramARB := GetProcAddress(GLHandle, 'glLinkProgramARB');
   glUseProgramObjectARB := GetProcAddress(GLHandle, 'glUseProgramObjectARB');
   glValidateProgramARB := GetProcAddress(GLHandle, 'glValidateProgramARB');
   glUniform1fARB := GetProcAddress(GLHandle, 'glUniform1fARB');
   glUniform2fARB := GetProcAddress(GLHandle, 'glUniform2fARB');
   glUniform3fARB := GetProcAddress(GLHandle, 'glUniform3fARB');
   glUniform4fARB := GetProcAddress(GLHandle, 'glUniform4fARB');
   glUniform1iARB := GetProcAddress(GLHandle, 'glUniform1iARB');
   glUniform2iARB := GetProcAddress(GLHandle, 'glUniform2iARB');
   glUniform3iARB := GetProcAddress(GLHandle, 'glUniform3iARB');
   glUniform4iARB := GetProcAddress(GLHandle, 'glUniform4iARB');
   glUniform1fvARB := GetProcAddress(GLHandle, 'glUniform1fvARB');
   glUniform2fvARB := GetProcAddress(GLHandle, 'glUniform2fvARB');
   glUniform3fvARB := GetProcAddress(GLHandle, 'glUniform3fvARB');
   glUniform4fvARB := GetProcAddress(GLHandle, 'glUniform4fvARB');
   glUniform1ivARB := GetProcAddress(GLHandle, 'glUniform1ivARB');
   glUniform2ivARB := GetProcAddress(GLHandle, 'glUniform2ivARB');
   glUniform3ivARB := GetProcAddress(GLHandle, 'glUniform3ivARB');
   glUniform4ivARB := GetProcAddress(GLHandle, 'glUniform4ivARB');
   glUniformMatrix2fvARB := GetProcAddress(GLHandle, 'glUniformMatrix2fvARB');
   glUniformMatrix3fvARB := GetProcAddress(GLHandle, 'glUniformMatrix3fvARB');
   glUniformMatrix4fvARB := GetProcAddress(GLHandle, 'glUniformMatrix4fvARB');
   glGetObjectParameterfvARB := GetProcAddress(GLHandle, 'glGetObjectParameterfvARB');
   glGetObjectParameterivARB := GetProcAddress(GLHandle, 'glGetObjectParameterivARB');
   glGetInfoLogARB := GetProcAddress(GLHandle, 'glGetInfoLogARB');
   glGetAttachedObjectsARB := GetProcAddress(GLHandle, 'glGetAttachedObjectsARB');
   glGetUniformLocationARB := GetProcAddress(GLHandle, 'glGetUniformLocationARB');
   glGetActiveUniformARB := GetProcAddress(GLHandle, 'glGetActiveUniformARB');
   glGetUniformfvARB := GetProcAddress(GLHandle, 'glGetUniformfvARB');
   glGetUniformivARB := GetProcAddress(GLHandle, 'glGetUniformivARB');
   glGetShaderSourceARB := GetProcAddress(GLHandle, 'glGetShaderSourceARB');

   // GL_ARB_vertex_shader
   glBindAttribLocationARB := GetProcAddress(GLHandle, 'glBindAttribLocationARB');
   glGetActiveAttribARB := GetProcAddress(GLHandle, 'glGetActiveAttribARB');
   glGetAttribLocationARB := GetProcAddress(GLHandle, 'glGetAttribLocationARB');

   // GL_EXT_blend_color
   glBlendColorEXT := GetProcAddress(GLHandle, 'glBlendColorEXT');

   // GL_EXT_texture3D
   glTexImage3DEXT := GetProcAddress(GLHandle, 'glTexImage3DEXT');

   // GL_SGIS_multisample
   glSampleMaskSGIS := GetProcAddress(GLHandle, 'glSampleMaskSGIS');
   glSamplePatternSGIS := GetProcAddress(GLHandle, 'glSamplePatternSGIS');

   // GL_EXT_blend_minmax
   glBlendEquationEXT := GetProcAddress(GLHandle, 'glBlendEquationEXT');

   // GL_EXT_paletted_texture
   glGetColorTableParameterivEXT := GetProcAddress(GLHandle, 'glGetColorTableParameterivEXT');
   glGetColorTableParameterfvEXT := GetProcAddress(GLHandle, 'glGetColorTableParameterfvEXT');

   // GL_EXT_draw_range_elements
   glDrawRangeElementsEXT := GetProcAddress(GLHandle, 'glDrawRangeElementsEXT');

   // GL_EXT_secondary_color
   glSecondaryColor3bEXT := GetProcAddress(GLHandle, 'glSecondaryColor3bEXT');
   glSecondaryColor3bvEXT := GetProcAddress(GLHandle, 'glSecondaryColor3bvEXT');
   glSecondaryColor3dEXT := GetProcAddress(GLHandle, 'glSecondaryColor3dEXT'); 
   glSecondaryColor3dvEXT := GetProcAddress(GLHandle, 'glSecondaryColor3dvEXT'); 
   glSecondaryColor3fEXT := GetProcAddress(GLHandle, 'glSecondaryColor3fEXT'); 
   glSecondaryColor3fvEXT := GetProcAddress(GLHandle, 'glSecondaryColor3fvEXT'); 
   glSecondaryColor3iEXT := GetProcAddress(GLHandle, 'glSecondaryColor3iEXT'); 
   glSecondaryColor3ivEXT := GetProcAddress(GLHandle, 'glSecondaryColor3ivEXT'); 
   glSecondaryColor3sEXT := GetProcAddress(GLHandle, 'glSecondaryColor3sEXT');
   glSecondaryColor3svEXT := GetProcAddress(GLHandle, 'glSecondaryColor3svEXT'); 
   glSecondaryColor3ubEXT := GetProcAddress(GLHandle, 'glSecondaryColor3ubEXT'); 
   glSecondaryColor3ubvEXT := GetProcAddress(GLHandle, 'glSecondaryColor3ubvEXT'); 
   glSecondaryColor3uiEXT := GetProcAddress(GLHandle, 'glSecondaryColor3uiEXT'); 
   glSecondaryColor3uivEXT := GetProcAddress(GLHandle, 'glSecondaryColor3uivEXT'); 
   glSecondaryColor3usEXT := GetProcAddress(GLHandle, 'glSecondaryColor3usEXT');
   glSecondaryColor3usvEXT := GetProcAddress(GLHandle, 'glSecondaryColor3usvEXT');
   glSecondaryColorPointerEXT := GetProcAddress(GLHandle, 'glSecondaryColorPointerEXT');

   // GL_EXT_multi_draw_arrays
   glMultiDrawArraysEXT := GetProcAddress(GLHandle, 'glMultiDrawArraysEXT'); 
   glMultiDrawElementsEXT := GetProcAddress(GLHandle, 'glMultiDrawElementsEXT');

   // GL_EXT_fog_coord
   glFogCoordfEXT := GetProcAddress(GLHandle, 'glFogCoordfEXT'); 
   glFogCoordfvEXT := GetProcAddress(GLHandle, 'glFogCoordfvEXT'); 
   glFogCoorddEXT := GetProcAddress(GLHandle, 'glFogCoorddEXT'); 
   glFogCoorddvEXT := GetProcAddress(GLHandle, 'glFogCoorddvEXT'); 
   glFogCoordPointerEXT := GetProcAddress(GLHandle, 'glFogCoordPointerEXT'); 

   // GL_EXT_blend_func_separate
   glBlendFuncSeparateEXT := GetProcAddress(GLHandle, 'glBlendFuncSeparateEXT');

   // GL_NV_vertex_array_range
   glFlushVertexArrayRangeNV := GetProcAddress(GLHandle, 'glFlushVertexArrayRangeNV'); 
   glVertexArrayRangeNV := GetProcAddress(GLHandle, 'glVertexArrayRangeNV'); 
   wglAllocateMemoryNV := GetProcAddress(GLHandle, 'wglAllocateMemoryNV'); 
   wglFreeMemoryNV := GetProcAddress(GLHandle, 'wglFreeMemoryNV'); 

   // GL_NV_register_combiners
   glCombinerParameterfvNV := GetProcAddress(GLHandle, 'glCombinerParameterfvNV'); 
   glCombinerParameterfNV := GetProcAddress(GLHandle, 'glCombinerParameterfNV');
   glCombinerParameterivNV := GetProcAddress(GLHandle, 'glCombinerParameterivNV'); 
   glCombinerParameteriNV := GetProcAddress(GLHandle, 'glCombinerParameteriNV'); 
   glCombinerInputNV := GetProcAddress(GLHandle, 'glCombinerInputNV');
   glCombinerOutputNV := GetProcAddress(GLHandle, 'glCombinerOutputNV'); 
   glFinalCombinerInputNV := GetProcAddress(GLHandle, 'glFinalCombinerInputNV'); 
   glGetCombinerInputParameterfvNV := GetProcAddress(GLHandle, 'glGetCombinerInputParameterfvNV');
   glGetCombinerInputParameterivNV := GetProcAddress(GLHandle, 'glGetCombinerInputParameterivNV'); 
   glGetCombinerOutputParameterfvNV := GetProcAddress(GLHandle, 'glGetCombinerOutputParameterfvNV');
   glGetCombinerOutputParameterivNV := GetProcAddress(GLHandle, 'glGetCombinerOutputParameterivNV');
   glGetFinalCombinerInputParameterfvNV := GetProcAddress(GLHandle, 'glGetFinalCombinerInputParameterfvNV');
   glGetFinalCombinerInputParameterivNV := GetProcAddress(GLHandle, 'glGetFinalCombinerInputParameterivNV');

   // GL_NV_fence
   glGenFencesNV := GetProcAddress(GLHandle, 'glGenFencesNV');
   glDeleteFencesNV := GetProcAddress(GLHandle, 'glDeleteFencesNV');
   glSetFenceNV := GetProcAddress(GLHandle, 'glSetFenceNV');
   glTestFenceNV := GetProcAddress(GLHandle, 'glTestFenceNV');
   glFinishFenceNV := GetProcAddress(GLHandle, 'glFinishFenceNV');
   glIsFenceNV := GetProcAddress(GLHandle, 'glIsFenceNV');
   glGetFenceivNV := GetProcAddress(GLHandle, 'glGetFenceivNV');

   // GL_NV_occlusion_query
   glGenOcclusionQueriesNV := GetProcAddress(GLHandle, 'glGenOcclusionQueriesNV');
   glDeleteOcclusionQueriesNV := GetProcAddress(GLHandle, 'glDeleteOcclusionQueriesNV');
   glIsOcclusionQueryNV := GetProcAddress(GLHandle, 'glIsOcclusionQueryNV');
   glBeginOcclusionQueryNV := GetProcAddress(GLHandle, 'glBeginOcclusionQueryNV');
   glEndOcclusionQueryNV := GetProcAddress(GLHandle, 'glEndOcclusionQueryNV');
   glGetOcclusionQueryivNV := GetProcAddress(GLHandle, 'glGetOcclusionQueryivNV');
   glGetOcclusionQueryuivNV := GetProcAddress(GLHandle, 'glGetOcclusionQueryuivNV');

   // GL_MESA_resize_buffers
   glResizeBuffersMESA := GetProcAddress(GLHandle, 'glResizeBuffersMESA');

   // GL_3DFX_tbuffer
   glTbufferMask3DFX := GetProcAddress(GLHandle, 'glTbufferMask3DFX');

   // GL_EXT_multisample
   glSampleMaskEXT := GetProcAddress(GLHandle, 'glSampleMaskEXT');
   glSamplePatternEXT := GetProcAddress(GLHandle, 'glSamplePatternEXT');

   // GL_SGIS_texture_color_mask
   glTextureColorMaskSGIS := GetProcAddress(GLHandle, 'glTextureColorMaskSGIS');

   // GLU extensions
   gluNurbsCallbackDataEXT := GetProcAddress(GLHandle, 'gluNurbsCallbackDataEXT');
   gluNewNurbsTessellatorEXT := GetProcAddress(GLHandle, 'gluNewNurbsTessellatorEXT'); 
   gluDeleteNurbsTessellatorEXT := GetProcAddress(GLHandle, 'gluDeleteNurbsTessellatorEXT');

   // GL_NV_vertex_program
   glAreProgramsResidentNV := GetProcAddress(GLHandle, 'glAreProgramsResidentNV'); 
   glBindProgramNV := GetProcAddress(GLHandle, 'glBindProgramNV');
   glDeleteProgramsNV := GetProcAddress(GLHandle, 'glDeleteProgramsNV');
   glExecuteProgramNV := GetProcAddress(GLHandle, 'glExecuteProgramNV'); 
   glGenProgramsNV := GetProcAddress(GLHandle, 'glGenProgramsNV');
   glGetProgramParameterdvNV := GetProcAddress(GLHandle, 'glGetProgramParameterdvNV'); 
   glGetProgramParameterfvNV := GetProcAddress(GLHandle, 'glGetProgramParameterfvNV');
   glGetProgramivNV := GetProcAddress(GLHandle, 'glGetProgramivNV');
   glGetProgramStringNV := GetProcAddress(GLHandle, 'glGetProgramStringNV'); 
   glGetTrackMatrixivNV := GetProcAddress(GLHandle, 'glGetTrackMatrixivNV'); 
   glGetVertexAttribdvNV:= GetProcAddress(GLHandle, 'glGetVertexAttribdvNV');
   glGetVertexAttribfvNV:= GetProcAddress(GLHandle, 'glGetVertexAttribfvNV'); 
   glGetVertexAttribivNV:= GetProcAddress(GLHandle, 'glGetVertexAttribivNV');
   glGetVertexAttribPointervNV := GetProcAddress(GLHandle, 'glGetVertexAttribPointervNV');
   glIsProgramNV := GetProcAddress(GLHandle, 'glIsProgramNV'); 
   glLoadProgramNV := GetProcAddress(GLHandle, 'glLoadProgramNV'); 
   glProgramParameter4dNV := GetProcAddress(GLHandle, 'glProgramParameter4dNV'); 
   glProgramParameter4dvNV := GetProcAddress(GLHandle, 'glProgramParameter4dvNV'); 
   glProgramParameter4fNV := GetProcAddress(GLHandle, 'glProgramParameter4fNV'); 
   glProgramParameter4fvNV := GetProcAddress(GLHandle, 'glProgramParameter4fvNV'); 
   glProgramParameters4dvNV := GetProcAddress(GLHandle, 'glProgramParameters4dvNV');
   glProgramParameters4fvNV := GetProcAddress(GLHandle, 'glProgramParameters4fvNV');
   glRequestResidentProgramsNV := GetProcAddress(GLHandle, 'glRequestResidentProgramsNV');
   glTrackMatrixNV := GetProcAddress(GLHandle, 'glTrackMatrixNV'); 
   glVertexAttribPointerNV := GetProcAddress(GLHandle, 'glVertexAttribPointerNV');
   glVertexAttrib1dNV := GetProcAddress(GLHandle, 'glVertexAttrib1dNV'); 
   glVertexAttrib1dvNV := GetProcAddress(GLHandle, 'glVertexAttrib1dvNV'); 
   glVertexAttrib1fNV := GetProcAddress(GLHandle, 'glVertexAttrib1fNV');
   glVertexAttrib1fvNV := GetProcAddress(GLHandle, 'glVertexAttrib1fvNV'); 
   glVertexAttrib1sNV := GetProcAddress(GLHandle, 'glVertexAttrib1sNV'); 
   glVertexAttrib1svNV := GetProcAddress(GLHandle, 'glVertexAttrib1svNV'); 
   glVertexAttrib2dNV := GetProcAddress(GLHandle, 'glVertexAttrib2dNV');
   glVertexAttrib2dvNV := GetProcAddress(GLHandle, 'glVertexAttrib2dvNV');
   glVertexAttrib2fNV := GetProcAddress(GLHandle, 'glVertexAttrib2fNV'); 
   glVertexAttrib2fvNV := GetProcAddress(GLHandle, 'glVertexAttrib2fvNV');
   glVertexAttrib2sNV := GetProcAddress(GLHandle, 'glVertexAttrib2sNV'); 
   glVertexAttrib2svNV := GetProcAddress(GLHandle, 'glVertexAttrib2svNV'); 
   glVertexAttrib3dNV := GetProcAddress(GLHandle, 'glVertexAttrib3dNV'); 
   glVertexAttrib3dvNV := GetProcAddress(GLHandle, 'glVertexAttrib3dvNV');
   glVertexAttrib3fNV := GetProcAddress(GLHandle, 'glVertexAttrib3fNV');
   glVertexAttrib3fvNV := GetProcAddress(GLHandle, 'glVertexAttrib3fvNV');
   glVertexAttrib3sNV := GetProcAddress(GLHandle, 'glVertexAttrib3sNV');
   glVertexAttrib3svNV := GetProcAddress(GLHandle, 'glVertexAttrib3svNV');
   glVertexAttrib4dNV := GetProcAddress(GLHandle, 'glVertexAttrib4dNV');
   glVertexAttrib4dvNV := GetProcAddress(GLHandle, 'glVertexAttrib4dvNV');
   glVertexAttrib4fNV := GetProcAddress(GLHandle, 'glVertexAttrib4fNV');
   glVertexAttrib4fvNV := GetProcAddress(GLHandle, 'glVertexAttrib4fvNV');
   glVertexAttrib4sNV := GetProcAddress(GLHandle, 'glVertexAttrib4sNV');
   glVertexAttrib4svNV := GetProcAddress(GLHandle, 'glVertexAttrib4svNV');
   glVertexAttrib4ubvNV := GetProcAddress(GLHandle, 'glVertexAttrib4ubvNV');
   glVertexAttribs1dvNV := GetProcAddress(GLHandle, 'glVertexAttribs1dvNV');
   glVertexAttribs1fvNV := GetProcAddress(GLHandle, 'glVertexAttribs1fvNV');
   glVertexAttribs1svNV := GetProcAddress(GLHandle, 'glVertexAttribs1svNV');
   glVertexAttribs2dvNV := GetProcAddress(GLHandle, 'glVertexAttribs2dvNV');
   glVertexAttribs2fvNV := GetProcAddress(GLHandle, 'glVertexAttribs2fvNV');
   glVertexAttribs2svNV := GetProcAddress(GLHandle, 'glVertexAttribs2svNV');
   glVertexAttribs3dvNV := GetProcAddress(GLHandle, 'glVertexAttribs3dvNV');
   glVertexAttribs3fvNV := GetProcAddress(GLHandle, 'glVertexAttribs3fvNV');
   glVertexAttribs3svNV := GetProcAddress(GLHandle, 'glVertexAttribs3svNV');
   glVertexAttribs4dvNV := GetProcAddress(GLHandle, 'glVertexAttribs4dvNV');
   glVertexAttribs4fvNV := GetProcAddress(GLHandle, 'glVertexAttribs4fvNV');
   glVertexAttribs4svNV := GetProcAddress(GLHandle, 'glVertexAttribs4svNV');
   glVertexAttribs4ubvNV := GetProcAddress(GLHandle, 'glVertexAttribs4ubvN');

   // GL_ATI_draw_buffers
   glDrawBuffersATI := GetProcAddress(GLHandle, 'glDrawBuffersATI');

   // GL_EXT_framebuffer_object
   glIsRenderbufferEXT := GetProcAddress(GLHandle, 'glIsRenderbufferEXT');
   glBindRenderbufferEXT := GetProcAddress(GLHandle, 'glBindRenderbufferEXT');
   glDeleteRenderbuffersEXT := GetProcAddress(GLHandle, 'glDeleteRenderbuffersEXT');
   glGenRenderbuffersEXT := GetProcAddress(GLHandle, 'glGenRenderbuffersEXT');
   glRenderbufferStorageEXT := GetProcAddress(GLHandle, 'glRenderbufferStorageEXT');
   glGetRenderbufferParameterivEXT := GetProcAddress(GLHandle, 'glGetRenderbufferParameterivEXT');
   glIsFramebufferEXT := GetProcAddress(GLHandle, 'glIsFramebufferEXT');
   glBindFramebufferEXT := GetProcAddress(GLHandle, 'glBindFramebufferEXT');
   glDeleteFramebuffersEXT := GetProcAddress(GLHandle, 'glDeleteFramebuffersEXT');
   glGenFramebuffersEXT := GetProcAddress(GLHandle, 'glGenFramebuffersEXT');
   glCheckFramebufferStatusEXT := GetProcAddress(GLHandle, 'glCheckFramebufferStatusEXT');
   glFramebufferTexture1DEXT := GetProcAddress(GLHandle, 'glFramebufferTexture1DEXT');
   glFramebufferTexture2DEXT := GetProcAddress(GLHandle, 'glFramebufferTexture2DEXT');
   glFramebufferTexture3DEXT := GetProcAddress(GLHandle, 'glFramebufferTexture3DEXT');
   glFramebufferRenderbufferEXT := GetProcAddress(GLHandle, 'glFramebufferRenderbufferEXT');
   glGetFramebufferAttachmentParameterivEXT := GetProcAddress(GLHandle, 'glGetFramebufferAttachmentParameterivEXT');
   glGenerateMipmapEXT := GetProcAddress(GLHandle, 'glGenerateMipmapEXT');


   // GL 2.0
   glBlendEquationSeparate := GetProcAddress(GLHandle, 'glBlendEquationSeparate');
   glDrawBuffers := GetProcAddress(GLHandle, 'glDrawBuffers');
   glStencilOpSeparate := GetProcAddress(GLHandle, 'glStencilOpSeparate');
   glStencilFuncSeparate := GetProcAddress(GLHandle, 'glStencilFuncSeparate');
   glStencilMaskSeparate := GetProcAddress(GLHandle, 'glStencilMaskSeparate');
   glAttachShader := GetProcAddress(GLHandle, 'glAttachShader');
   glBindAttribLocation := GetProcAddress(GLHandle, 'glBindAttribLocation');
   glCompileShader := GetProcAddress(GLHandle, 'glCompileShader');
   glCreateProgram := GetProcAddress(GLHandle, 'glCreateProgram');
   glCreateShader := GetProcAddress(GLHandle, 'glCreateShader');
   glDeleteProgram := GetProcAddress(GLHandle, 'glDeleteProgram');
   glDeleteShader := GetProcAddress(GLHandle, 'glDeleteShader');
   glDetachShader := GetProcAddress(GLHandle, 'glDetachShader');
   glDisableVertexAttribArray := GetProcAddress(GLHandle, 'glDisableVertexAttribArray');
   glEnableVertexAttribArray := GetProcAddress(GLHandle, 'glEnableVertexAttribArray');
   glGetActiveAttrib := GetProcAddress(GLHandle, 'glGetActiveAttrib');
   glGetActiveUniform := GetProcAddress(GLHandle, 'glGetActiveUniform');
   glGetAttachedShaders := GetProcAddress(GLHandle, 'glGetAttachedShaders');
   glGetAttribLocation := GetProcAddress(GLHandle, 'glGetAttribLocation');
   glGetProgramiv := GetProcAddress(GLHandle, 'glGetProgramiv');
   glGetProgramInfoLog := GetProcAddress(GLHandle, 'glGetProgramInfoLog');
   glGetShaderiv := GetProcAddress(GLHandle, 'glGetShaderiv');
   glGetShaderInfoLog := GetProcAddress(GLHandle, 'glGetShaderInfoLog');
   glGetShaderSource := GetProcAddress(GLHandle, 'glGetShaderSource');
   glGetUniformLocation := GetProcAddress(GLHandle, 'glGetUniformLocation');
   glGetUniformfv := GetProcAddress(GLHandle, 'glGetUniformfv');
   glGetUniformiv := GetProcAddress(GLHandle, 'glGetUniformiv');
   glGetVertexAttribdv := GetProcAddress(GLHandle, 'glGetVertexAttribdv');
   glGetVertexAttribfv := GetProcAddress(GLHandle, 'glGetVertexAttribfv');
   glGetVertexAttribiv := GetProcAddress(GLHandle, 'glGetVertexAttribiv');
   glGetVertexAttribPointerv := GetProcAddress(GLHandle, 'glGetVertexAttribPointerv');
   glIsProgram := GetProcAddress(GLHandle, 'glIsProgram');
   glIsShader := GetProcAddress(GLHandle, 'glIsShader');
   glLinkProgram := GetProcAddress(GLHandle, 'glLinkProgram');
   glShaderSource := GetProcAddress(GLHandle, 'glShaderSource');
   glUseProgram := GetProcAddress(GLHandle, 'glUseProgram');
   glUniform1f := GetProcAddress(GLHandle, 'glUniform1f');
   glUniform2f := GetProcAddress(GLHandle, 'glUniform2f');
   glUniform3f := GetProcAddress(GLHandle, 'glUniform3f');
   glUniform4f := GetProcAddress(GLHandle, 'glUniform4f');
   glUniform1i := GetProcAddress(GLHandle, 'glUniform1i');
   glUniform2i := GetProcAddress(GLHandle, 'glUniform2i');
   glUniform3i := GetProcAddress(GLHandle, 'glUniform3i');
   glUniform4i := GetProcAddress(GLHandle, 'glUniform4i');
   glUniform1fv := GetProcAddress(GLHandle, 'glUniform1fv');
   glUniform2fv := GetProcAddress(GLHandle, 'glUniform2fv');
   glUniform3fv := GetProcAddress(GLHandle, 'glUniform3fv');
   glUniform4fv := GetProcAddress(GLHandle, 'glUniform4fv');
   glUniform1iv := GetProcAddress(GLHandle, 'glUniform1iv');
   glUniform2iv := GetProcAddress(GLHandle, 'glUniform2iv');
   glUniform3iv := GetProcAddress(GLHandle, 'glUniform3iv');
   glUniform4iv := GetProcAddress(GLHandle, 'glUniform4iv');
   glUniformMatrix2fv := GetProcAddress(GLHandle, 'glUniformMatrix2fv');
   glUniformMatrix3fv := GetProcAddress(GLHandle, 'glUniformMatrix3fv');
   glUniformMatrix4fv := GetProcAddress(GLHandle, 'glUniformMatrix4fv');
   glValidateProgram := GetProcAddress(GLHandle, 'glValidateProgram');
   glVertexAttrib1d := GetProcAddress(GLHandle, 'glVertexAttrib1d');
   glVertexAttrib1dv := GetProcAddress(GLHandle, 'glVertexAttrib1dv');
   glVertexAttrib1f := GetProcAddress(GLHandle, 'glVertexAttrib1f');
   glVertexAttrib1fv := GetProcAddress(GLHandle, 'glVertexAttrib1fv');
   glVertexAttrib1s := GetProcAddress(GLHandle, 'glVertexAttrib1s');
   glVertexAttrib1sv := GetProcAddress(GLHandle, 'glVertexAttrib1sv');
   glVertexAttrib2d := GetProcAddress(GLHandle, 'glVertexAttrib2d');
   glVertexAttrib2dv := GetProcAddress(GLHandle, 'glVertexAttrib2dv');
   glVertexAttrib2f := GetProcAddress(GLHandle, 'glVertexAttrib2f');
   glVertexAttrib2fv := GetProcAddress(GLHandle, 'glVertexAttrib2fv');
   glVertexAttrib2s := GetProcAddress(GLHandle, 'glVertexAttrib2s');
   glVertexAttrib2sv := GetProcAddress(GLHandle, 'glVertexAttrib2sv');
   glVertexAttrib3d := GetProcAddress(GLHandle, 'glVertexAttrib3d');
   glVertexAttrib3dv := GetProcAddress(GLHandle, 'glVertexAttrib3dv');
   glVertexAttrib3f := GetProcAddress(GLHandle, 'glVertexAttrib3f');
   glVertexAttrib3fv := GetProcAddress(GLHandle, 'glVertexAttrib3fv');
   glVertexAttrib3s := GetProcAddress(GLHandle, 'glVertexAttrib3s');
   glVertexAttrib3sv := GetProcAddress(GLHandle, 'glVertexAttrib3sv');
   glVertexAttrib4Nbv := GetProcAddress(GLHandle, 'glVertexAttrib4Nbv');
   glVertexAttrib4Niv := GetProcAddress(GLHandle, 'glVertexAttrib4Niv');
   glVertexAttrib4Nsv := GetProcAddress(GLHandle, 'glVertexAttrib4Nsv');
   glVertexAttrib4Nub := GetProcAddress(GLHandle, 'glVertexAttrib4Nub');
   glVertexAttrib4Nubv := GetProcAddress(GLHandle, 'glVertexAttrib4Nubv');
   glVertexAttrib4Nuiv := GetProcAddress(GLHandle, 'glVertexAttrib4Nuiv');
   glVertexAttrib4Nusv := GetProcAddress(GLHandle, 'glVertexAttrib4Nusv');
   glVertexAttrib4bv := GetProcAddress(GLHandle, 'glVertexAttrib4bv');
   glVertexAttrib4d := GetProcAddress(GLHandle, 'glVertexAttrib4d');
   glVertexAttrib4dv := GetProcAddress(GLHandle, 'glVertexAttrib4dv');
   glVertexAttrib4f := GetProcAddress(GLHandle, 'glVertexAttrib4f');
   glVertexAttrib4fv := GetProcAddress(GLHandle, 'glVertexAttrib4fv');
   glVertexAttrib4iv := GetProcAddress(GLHandle, 'glVertexAttrib4iv');
   glVertexAttrib4s := GetProcAddress(GLHandle, 'glVertexAttrib4s');
   glVertexAttrib4sv := GetProcAddress(GLHandle, 'glVertexAttrib4sv');
   glVertexAttrib4ubv := GetProcAddress(GLHandle, 'glVertexAttrib4ubv');
   glVertexAttrib4uiv := GetProcAddress(GLHandle, 'glVertexAttrib4uiv');
   glVertexAttrib4usv := GetProcAddress(GLHandle, 'glVertexAttrib4usv');
   glVertexAttribPointer := GetProcAddress(GLHandle, 'glVertexAttribPointer');
end;

// TrimAndSplitVersionString
//
procedure TrimAndSplitVersionString(Buffer: String; var Max, Min: Integer);
// Peels out the X.Y form from the given Buffer which must contain a version string like "text Minor.Major.Build text"
// at least however "Major.Minor".
var
  Separator: Integer;
begin
  try
    // There must be at least one dot to separate major and minor version number.
    Separator := Pos('.', Buffer);
    // At least one number must be before and one after the dot.
    if (Separator > 1) and (Separator < Length(Buffer)) and (Buffer[Separator - 1] in ['0'..'9']) and
      (Buffer[Separator + 1] in ['0'..'9']) then
    begin
      // OK, it's a valid version string. Now remove unnecessary parts.
      Dec(Separator); 
      // Find last non-numeric character before version number.
      while (Separator > 0) and (Buffer[Separator] in ['0'..'9']) do
        Dec(Separator); 
      // Delete leading characters which do not belong to the version string.
      Delete(Buffer, 1, Separator);
      Separator := Pos('.', Buffer) + 1;
      // Find first non-numeric character after version number
      while (Separator <= Length(Buffer)) and (Buffer[Separator] in ['0'..'9']) do
        Inc(Separator);
      // delete trailing characters not belonging to the version string
      Delete(Buffer, Separator, 255);
      // Now translate the numbers.
      Separator := Pos('.', Buffer); // This is necessary because the buffer length might have changed.
      Max := StrToInt(Copy(Buffer, 1, Separator - 1));
      Min := StrToInt(Copy(Buffer, Separator + 1, 255));
    end
    else
      Abort;
  except
    Min := 0;
    Max := 0;
  end;
end;

// ReadImplementationProperties
//
procedure ReadImplementationProperties;
var
   Buffer : String;
   MajorVersion, MinorVersion: Integer;

   // Checks if the given Extension string is in Buffer.
   function CheckExtension(const Extension: string): Boolean;
   var
     ExtPos: Integer;
   begin
     // First find the position of the extension string as substring in Buffer.
     ExtPos := Pos(Extension, Buffer);
     Result := ExtPos > 0;
     // Now check that it isn't only a substring of another extension.
     if Result then
       Result := ((ExtPos + Length(Extension) - 1)= Length(Buffer))
                 or (Buffer[ExtPos + Length(Extension)]=' ');
   end;

begin
   // determine version of implementation
   // GL
   buffer := glGetString(GL_VERSION);
   TrimAndSplitVersionString(buffer, majorversion, minorVersion);
   GL_VERSION_1_0:=True;
   GL_VERSION_1_1:=(minorVersion>=1) or (majorVersion>1);
   GL_VERSION_1_2:=(minorVersion>=2) or (majorVersion>1);
   GL_VERSION_1_3:=(minorVersion>=3) or (majorVersion>1);
   GL_VERSION_1_4:=(minorVersion>=4) or (majorVersion>1);
   GL_VERSION_1_5:=(minorVersion>=5) or (majorVersion>1);
   GL_VERSION_2_0:=majorVersion > 1;
   GL_VERSION_2_1:=((minorVersion >= 1) and (majorVersion > 1)) or (majorVersion > 2);
   GL_VERSION_2_2:=((minorVersion >= 2) and (majorVersion > 1)) or (majorVersion > 2);

   // check supported extensions
   // GL
   Buffer := StrPas(glGetString(GL_EXTENSIONS));

   GL_3DFX_multisample := CheckExtension('GL_3DFX_multisample');
   GL_3DFX_tbuffer := CheckExtension('GL_3DFX_tbuffer');
   GL_3DFX_texture_compression_FXT1 := CheckExtension('GL_3DFX_texture_compression_FXT1');

   GL_ARB_imaging := CheckExtension('GL_ARB_imaging');
   GL_ARB_multisample := CheckExtension(' GL_ARB_multisample'); // ' ' to avoid collision with WGL variant
   GL_ARB_multitexture := CheckExtension('GL_ARB_multitexture');
   GL_ARB_depth_texture := CheckExtension('GL_ARB_depth_texture');
   GL_ARB_shadow := CheckExtension('GL_ARB_shadow');
   GL_ARB_texture_border_clamp := CheckExtension('GL_ARB_texture_border_clamp');
   GL_ARB_texture_compression := CheckExtension('GL_ARB_texture_compression');
   GL_ARB_texture_cube_map := CheckExtension('GL_ARB_texture_cube_map');
   GL_ARB_transpose_matrix := CheckExtension('GL_ARB_transpose_matrix');
   GL_ARB_vertex_blend := CheckExtension('GL_ARB_vertex_blend');
   GL_ARB_point_parameters := CheckExtension('GL_ARB_point_parameters');
   GL_ARB_texture_env_combine := CheckExtension('GL_ARB_texture_env_combine');
   GL_ARB_texture_env_crossbar := CheckExtension('GL_ARB_texture_env_crossbar');
   GL_ARB_texture_env_dot3 := CheckExtension('GL_ARB_texture_env_dot3');
   GL_ARB_vertex_program := CheckExtension('GL_ARB_vertex_program');
   GL_ARB_vertex_buffer_object := CheckExtension('GL_ARB_vertex_buffer_object');
   GL_ARB_pixel_buffer_object := CheckExtension('GL_ARB_pixel_buffer_object');
   GL_ARB_shader_objects := CheckExtension('GL_ARB_shader_objects');
   GL_ARB_vertex_shader := CheckExtension('GL_ARB_vertex_shader');
   GL_ARB_fragment_shader := CheckExtension('GL_ARB_fragment_shader');
   GL_ARB_fragment_program := CheckExtension('GL_ARB_fragment_program');
   GL_ARB_texture_float := CheckExtension('GL_ARB_texture_float');
   GL_ARB_texture_rectangle := CheckExtension('GL_ARB_texture_rectangle');
   // NPOT
   GL_ARB_texture_non_power_of_two := CheckExtension('GL_ARB_texture_non_power_of_two');

   GL_EXT_abgr := CheckExtension('GL_EXT_abgr');
   GL_EXT_bgra := CheckExtension('GL_EXT_bgra');
   GL_EXT_blend_color := CheckExtension('GL_EXT_blend_color');
   GL_EXT_blend_func_separate := CheckExtension('GL_EXT_blend_func_separate');
   GL_EXT_blend_logic_op := CheckExtension('GL_EXT_blend_logic_op');
   GL_EXT_blend_minmax := CheckExtension('GL_EXT_blend_minmax');
   GL_EXT_blend_subtract := CheckExtension('GL_EXT_blend_subtract');
   GL_EXT_Cg_shader := CheckExtension('GL_EXT_Cg_shader');
   GL_EXT_compiled_vertex_array := CheckExtension('GL_EXT_compiled_vertex_array');
   GL_EXT_copy_texture := CheckExtension('GL_EXT_copy_texture');
   GL_EXT_draw_range_elements := CheckExtension('GL_EXT_draw_range_elements');
   GL_EXT_fog_coord := CheckExtension('GL_EXT_fog_coord');
   GL_EXT_multi_draw_arrays := CheckExtension('GL_EXT_multi_draw_arrays');
   GL_EXT_multisample := CheckExtension('GL_EXT_multisample');
   GL_EXT_packed_pixels := CheckExtension('GL_EXT_packed_pixels');
   GL_EXT_paletted_texture := CheckExtension('GL_EXT_paletted_texture');
   GL_EXT_polygon_offset := CheckExtension('GL_EXT_polygon_offset');
   GL_EXT_rescale_normal := CheckExtension('GL_EXT_rescale_normal');
   GL_EXT_secondary_color := CheckExtension('GL_EXT_secondary_color');
   GL_EXT_separate_specular_color := CheckExtension('GL_EXT_separate_specular_color');
   GL_EXT_shared_texture_palette := CheckExtension('GL_EXT_shared_texture_palette');
   GL_EXT_stencil_wrap := CheckExtension('GL_EXT_stencil_wrap');
   GL_EXT_stencil_two_side := CheckExtension('EXT_stencil_two_side');
   GL_EXT_texture_compression_s3tc := CheckExtension('GL_EXT_texture_compression_s3tc');
   GL_EXT_texture_cube_map := CheckExtension('GL_EXT_texture_cube_map');
   GL_EXT_texture_edge_clamp := CheckExtension('GL_EXT_texture_edge_clamp');
   GL_EXT_texture_env_add := CheckExtension('GL_EXT_texture_env_add');
   GL_EXT_texture_env_combine := CheckExtension('GL_EXT_texture_env_combine');
   GL_EXT_texture_filter_anisotropic := CheckExtension('GL_EXT_texture_filter_anisotropic');
   GL_EXT_texture_lod_bias := CheckExtension('GL_EXT_texture_lod_bias');
   GL_EXT_texture_object := CheckExtension('GL_EXT_texture_object');
   GL_EXT_texture3D := CheckExtension('GL_EXT_texture3D');
   GL_EXT_clip_volume_hint := CheckExtension('GL_EXT_clip_volume_hint');
   GL_EXT_framebuffer_object := CheckExtension('GL_EXT_framebuffer_object');
   GL_EXT_texture_rectangle := CheckExtension('GL_EXT_texture_rectangle');
   GL_EXT_pixel_buffer_object := CheckExtension('GL_EXT_pixel_buffer_object');

   GL_HP_occlusion_test := CheckExtension('GL_HP_occlusion_test');

   GL_IBM_rasterpos_clip := CheckExtension('GL_IBM_rasterpos_clip');

   GL_KTX_buffer_region := CheckExtension('GL_KTX_buffer_region');

   GL_MESA_resize_buffers := CheckExtension('GL_MESA_resize_buffers');

   GL_NV_blend_square := CheckExtension('GL_NV_blend_square');
   GL_NV_fog_distance := CheckExtension('GL_NV_fog_distance');
   GL_NV_light_max_exponent := CheckExtension('GL_NV_light_max_exponent');
   GL_NV_register_combiners := CheckExtension('GL_NV_register_combiners');
   GL_NV_texgen_reflection := CheckExtension('GL_NV_texgen_reflection');
   GL_NV_texture_env_combine4 := CheckExtension('GL_NV_texture_env_combine4');
   GL_NV_vertex_array_range := CheckExtension('GL_NV_vertex_array_range');
   GL_NV_multisample_filter_hint  := CheckExtension('GL_NV_multisample_filter_hint');
   GL_NV_vertex_program := CheckExtension('GL_NV_vertex_program');
   GL_NV_fence := CheckExtension('GL_NV_fence');
   GL_NV_occlusion_query := CheckExtension('GL_NV_occlusion_query');
   GL_NV_texture_rectangle := CheckExtension('GL_NV_texture_rectangle');

   GL_ATI_texture_float := CheckExtension('GL_ATI_texture_float');
   GL_ATI_draw_buffers := CheckExtension('GL_ATI_draw_buffers');
   GL_ARB_draw_buffers := CheckExtension('GL_ARB_draw_buffers');

   GL_SGI_color_matrix := CheckExtension('GL_SGI_color_matrix');

   GL_SGIS_generate_mipmap := CheckExtension('GL_SGIS_generate_mipmap');
   GL_SGIS_multisample := CheckExtension('GL_SGIS_multisample');
   GL_SGIS_texture_border_clamp := CheckExtension('GL_SGIS_texture_border_clamp');
   GL_SGIS_texture_color_mask := CheckExtension('GL_SGIS_texture_color_mask');
   GL_SGIS_texture_edge_clamp := CheckExtension('GL_SGIS_texture_edge_clamp');
   GL_SGIS_texture_lod := CheckExtension('GL_SGIS_texture_lod');

   GL_SGIX_depth_texture := CheckExtension('GL_SGIX_depth_texture');
   GL_SGIX_shadow := CheckExtension('GL_SGIX_shadow'); 
   GL_SGIX_shadow_ambient := CheckExtension('GL_SGIX_shadow_ambient');

   GL_WIN_swap_hint := CheckExtension('GL_WIN_swap_hint');

   WGL_ARB_extensions_string := CheckExtension('WGL_ARB_extensions_string');
end;


function LoadOpenGL(const GLName: String) : Boolean;
begin
   Result := False;

   GLHandle := loadLibrary(PChar(GLName));

   if (GLHandle<>INVALID_MODULEHANDLE) then
   begin
      glAccum := GetProcAddress(GLHandle, 'glAccum');
      glAlphaFunc := GetProcAddress(GLHandle, 'glAlphaFunc');
      glAreTexturesResident := GetProcAddress(GLHandle, 'glAreTexturesResident');
      glArrayElement := GetProcAddress(GLHandle, 'glArrayElement');
      glBegin := GetProcAddress(GLHandle, 'glBegin');
      glBindTexture := GetProcAddress(GLHandle, 'glBindTexture');
      glBitmap := GetProcAddress(GLHandle, 'glBitmap');
      glBlendFunc := GetProcAddress(GLHandle, 'glBlendFunc');
      glCallList := GetProcAddress(GLHandle, 'glCallList');
      glCallLists := GetProcAddress(GLHandle, 'glCallLists');
      glClear := GetProcAddress(GLHandle, 'glClear');
      glClearAccum := GetProcAddress(GLHandle, 'glClearAccum');
      glClearColor := GetProcAddress(GLHandle, 'glClearColor');
      glClearDepth := GetProcAddress(GLHandle, 'glClearDepth');
      glClearIndex := GetProcAddress(GLHandle, 'glClearIndex');
      glClearStencil := GetProcAddress(GLHandle, 'glClearStencil');
      glClipPlane := GetProcAddress(GLHandle, 'glClipPlane');
      glColor3b := GetProcAddress(GLHandle, 'glColor3b');
      glColor3bv := GetProcAddress(GLHandle, 'glColor3bv');
      glColor3d := GetProcAddress(GLHandle, 'glColor3d');
      glColor3dv := GetProcAddress(GLHandle, 'glColor3dv');
      glColor3f := GetProcAddress(GLHandle, 'glColor3f');
      glColor3fv := GetProcAddress(GLHandle, 'glColor3fv');
      glColor3i := GetProcAddress(GLHandle, 'glColor3i');
      glColor3iv := GetProcAddress(GLHandle, 'glColor3iv');
      glColor3s := GetProcAddress(GLHandle, 'glColor3s');
      glColor3sv := GetProcAddress(GLHandle, 'glColor3sv');
      glColor3ub := GetProcAddress(GLHandle, 'glColor3ub');
      glColor3ubv := GetProcAddress(GLHandle, 'glColor3ubv');
      glColor3ui := GetProcAddress(GLHandle, 'glColor3ui');
      glColor3uiv := GetProcAddress(GLHandle, 'glColor3uiv');
      glColor3us := GetProcAddress(GLHandle, 'glColor3us');
      glColor3usv := GetProcAddress(GLHandle, 'glColor3usv');
      glColor4b := GetProcAddress(GLHandle, 'glColor4b');
      glColor4bv := GetProcAddress(GLHandle, 'glColor4bv');
      glColor4d := GetProcAddress(GLHandle, 'glColor4d');
      glColor4dv := GetProcAddress(GLHandle, 'glColor4dv');
      glColor4f := GetProcAddress(GLHandle, 'glColor4f');
      glColor4fv := GetProcAddress(GLHandle, 'glColor4fv');
      glColor4i := GetProcAddress(GLHandle, 'glColor4i');
      glColor4iv := GetProcAddress(GLHandle, 'glColor4iv');
      glColor4s := GetProcAddress(GLHandle, 'glColor4s');
      glColor4sv := GetProcAddress(GLHandle, 'glColor4sv');
      glColor4ub := GetProcAddress(GLHandle, 'glColor4ub');
      glColor4ubv := GetProcAddress(GLHandle, 'glColor4ubv');
      glColor4ui := GetProcAddress(GLHandle, 'glColor4ui');
      glColor4uiv := GetProcAddress(GLHandle, 'glColor4uiv');
      glColor4us := GetProcAddress(GLHandle, 'glColor4us');
      glColor4usv := GetProcAddress(GLHandle, 'glColor4usv');
      glColorMask := GetProcAddress(GLHandle, 'glColorMask');
      glColorMaterial := GetProcAddress(GLHandle, 'glColorMaterial');
      glColorPointer := GetProcAddress(GLHandle, 'glColorPointer');
      glCopyPixels := GetProcAddress(GLHandle, 'glCopyPixels');
      glCopyTexImage1D := GetProcAddress(GLHandle, 'glCopyTexImage1D');
      glCopyTexImage2D := GetProcAddress(GLHandle, 'glCopyTexImage2D');
      glCopyTexSubImage1D := GetProcAddress(GLHandle, 'glCopyTexSubImage1D');
      glCopyTexSubImage2D := GetProcAddress(GLHandle, 'glCopyTexSubImage2D');
      glCullFace := GetProcAddress(GLHandle, 'glCullFace');
      glDeleteLists := GetProcAddress(GLHandle, 'glDeleteLists');
      glDeleteTextures := GetProcAddress(GLHandle, 'glDeleteTextures');
      glDepthFunc := GetProcAddress(GLHandle, 'glDepthFunc');
      glDepthMask := GetProcAddress(GLHandle, 'glDepthMask');
      glDepthRange := GetProcAddress(GLHandle, 'glDepthRange');
      glDisable := GetProcAddress(GLHandle, 'glDisable');
      glDisableClientState := GetProcAddress(GLHandle, 'glDisableClientState');
      glDrawArrays := GetProcAddress(GLHandle, 'glDrawArrays');
      glDrawBuffer := GetProcAddress(GLHandle, 'glDrawBuffer');
      glDrawElements := GetProcAddress(GLHandle, 'glDrawElements');
      glDrawPixels := GetProcAddress(GLHandle, 'glDrawPixels');
      glEdgeFlag := GetProcAddress(GLHandle, 'glEdgeFlag');
      glEdgeFlagPointer := GetProcAddress(GLHandle, 'glEdgeFlagPointer');
      glEdgeFlagv := GetProcAddress(GLHandle, 'glEdgeFlagv');
      glEnable := GetProcAddress(GLHandle, 'glEnable');
      glEnableClientState := GetProcAddress(GLHandle, 'glEnableClientState');
      glEnd := GetProcAddress(GLHandle, 'glEnd');
      glEndList := GetProcAddress(GLHandle, 'glEndList');
      glEvalCoord1d := GetProcAddress(GLHandle, 'glEvalCoord1d');
      glEvalCoord1dv := GetProcAddress(GLHandle, 'glEvalCoord1dv');
      glEvalCoord1f := GetProcAddress(GLHandle, 'glEvalCoord1f');
      glEvalCoord1fv := GetProcAddress(GLHandle, 'glEvalCoord1fv');
      glEvalCoord2d := GetProcAddress(GLHandle, 'glEvalCoord2d');
      glEvalCoord2dv := GetProcAddress(GLHandle, 'glEvalCoord2dv');
      glEvalCoord2f := GetProcAddress(GLHandle, 'glEvalCoord2f');
      glEvalCoord2fv := GetProcAddress(GLHandle, 'glEvalCoord2fv');
      glEvalMesh1 := GetProcAddress(GLHandle, 'glEvalMesh1');
      glEvalMesh2 := GetProcAddress(GLHandle, 'glEvalMesh2');
      glEvalPoint1 := GetProcAddress(GLHandle, 'glEvalPoint1');
      glEvalPoint2 := GetProcAddress(GLHandle, 'glEvalPoint2');
      glFeedbackBuffer := GetProcAddress(GLHandle, 'glFeedbackBuffer');
      glFinish := GetProcAddress(GLHandle, 'glFinish');
      glFlush := GetProcAddress(GLHandle, 'glFlush');
      glFogf := GetProcAddress(GLHandle, 'glFogf');
      glFogfv := GetProcAddress(GLHandle, 'glFogfv');
      glFogi := GetProcAddress(GLHandle, 'glFogi');
      glFogiv := GetProcAddress(GLHandle, 'glFogiv');
      glFrontFace := GetProcAddress(GLHandle, 'glFrontFace');
      glFrustum := GetProcAddress(GLHandle, 'glFrustum');
      glGenLists := GetProcAddress(GLHandle, 'glGenLists');
      glGenTextures := GetProcAddress(GLHandle, 'glGenTextures');
      glGetBooleanv := GetProcAddress(GLHandle, 'glGetBooleanv');
      glGetClipPlane := GetProcAddress(GLHandle, 'glGetClipPlane');
      glGetDoublev := GetProcAddress(GLHandle, 'glGetDoublev');
      glGetError := GetProcAddress(GLHandle, 'glGetError');
      glGetFloatv := GetProcAddress(GLHandle, 'glGetFloatv');
      glGetIntegerv := GetProcAddress(GLHandle, 'glGetIntegerv');
      glGetLightfv := GetProcAddress(GLHandle, 'glGetLightfv');
      glGetLightiv := GetProcAddress(GLHandle, 'glGetLightiv');
      glGetMapdv := GetProcAddress(GLHandle, 'glGetMapdv');
      glGetMapfv := GetProcAddress(GLHandle, 'glGetMapfv');
      glGetMapiv := GetProcAddress(GLHandle, 'glGetMapiv');
      glGetMaterialfv := GetProcAddress(GLHandle, 'glGetMaterialfv');
      glGetMaterialiv := GetProcAddress(GLHandle, 'glGetMaterialiv');
      glGetPixelMapfv := GetProcAddress(GLHandle, 'glGetPixelMapfv');
      glGetPixelMapuiv := GetProcAddress(GLHandle, 'glGetPixelMapuiv');
      glGetPixelMapusv := GetProcAddress(GLHandle, 'glGetPixelMapusv');
      glGetPointerv := GetProcAddress(GLHandle, 'glGetPointerv');
      glGetPolygonStipple := GetProcAddress(GLHandle, 'glGetPolygonStipple');
      glGetString := GetProcAddress(GLHandle, 'glGetString');
      glGetTexEnvfv := GetProcAddress(GLHandle, 'glGetTexEnvfv');
      glGetTexEnviv := GetProcAddress(GLHandle, 'glGetTexEnviv');
      glGetTexGendv := GetProcAddress(GLHandle, 'glGetTexGendv');
      glGetTexGenfv := GetProcAddress(GLHandle, 'glGetTexGenfv');
      glGetTexGeniv := GetProcAddress(GLHandle, 'glGetTexGeniv');
      glGetTexImage := GetProcAddress(GLHandle, 'glGetTexImage');
      glGetTexLevelParameterfv := GetProcAddress(GLHandle, 'glGetTexLevelParameterfv');
      glGetTexLevelParameteriv := GetProcAddress(GLHandle, 'glGetTexLevelParameteriv');
      glGetTexParameterfv := GetProcAddress(GLHandle, 'glGetTexParameterfv');
      glGetTexParameteriv := GetProcAddress(GLHandle, 'glGetTexParameteriv');
      glHint := GetProcAddress(GLHandle, 'glHint');
      glIndexMask := GetProcAddress(GLHandle, 'glIndexMask');
      glIndexPointer := GetProcAddress(GLHandle, 'glIndexPointer');
      glIndexd := GetProcAddress(GLHandle, 'glIndexd');
      glIndexdv := GetProcAddress(GLHandle, 'glIndexdv');
      glIndexf := GetProcAddress(GLHandle, 'glIndexf');
      glIndexfv := GetProcAddress(GLHandle, 'glIndexfv');
      glIndexi := GetProcAddress(GLHandle, 'glIndexi');
      glIndexiv := GetProcAddress(GLHandle, 'glIndexiv');
      glIndexs := GetProcAddress(GLHandle, 'glIndexs');
      glIndexsv := GetProcAddress(GLHandle, 'glIndexsv');
      glIndexub := GetProcAddress(GLHandle, 'glIndexub');
      glIndexubv := GetProcAddress(GLHandle, 'glIndexubv');
      glInitNames := GetProcAddress(GLHandle, 'glInitNames');
      glInterleavedArrays := GetProcAddress(GLHandle, 'glInterleavedArrays');
      glIsEnabled := GetProcAddress(GLHandle, 'glIsEnabled');
      glIsList := GetProcAddress(GLHandle, 'glIsList');
      glIsTexture := GetProcAddress(GLHandle, 'glIsTexture');
      glLightModelf := GetProcAddress(GLHandle, 'glLightModelf');
      glLightModelfv := GetProcAddress(GLHandle, 'glLightModelfv');
      glLightModeli := GetProcAddress(GLHandle, 'glLightModeli');
      glLightModeliv := GetProcAddress(GLHandle, 'glLightModeliv');
      glLightf := GetProcAddress(GLHandle, 'glLightf');
      glLightfv := GetProcAddress(GLHandle, 'glLightfv');
      glLighti := GetProcAddress(GLHandle, 'glLighti');
      glLightiv := GetProcAddress(GLHandle, 'glLightiv');
      glLineStipple := GetProcAddress(GLHandle, 'glLineStipple');
      glLineWidth := GetProcAddress(GLHandle, 'glLineWidth');
      glListBase := GetProcAddress(GLHandle, 'glListBase');
      glLoadIdentity := GetProcAddress(GLHandle, 'glLoadIdentity');
      glLoadMatrixd := GetProcAddress(GLHandle, 'glLoadMatrixd');
      glLoadMatrixf := GetProcAddress(GLHandle, 'glLoadMatrixf');
      glLoadName := GetProcAddress(GLHandle, 'glLoadName');
      glLogicOp := GetProcAddress(GLHandle, 'glLogicOp');
      glMap1d := GetProcAddress(GLHandle, 'glMap1d');
      glMap1f := GetProcAddress(GLHandle, 'glMap1f');
      glMap2d := GetProcAddress(GLHandle, 'glMap2d');
      glMap2f := GetProcAddress(GLHandle, 'glMap2f');
      glMapGrid1d := GetProcAddress(GLHandle, 'glMapGrid1d');
      glMapGrid1f := GetProcAddress(GLHandle, 'glMapGrid1f');
      glMapGrid2d := GetProcAddress(GLHandle, 'glMapGrid2d');
      glMapGrid2f := GetProcAddress(GLHandle, 'glMapGrid2f');
      glMaterialf := GetProcAddress(GLHandle, 'glMaterialf');
      glMaterialfv := GetProcAddress(GLHandle, 'glMaterialfv');
      glMateriali := GetProcAddress(GLHandle, 'glMateriali');
      glMaterialiv := GetProcAddress(GLHandle, 'glMaterialiv');
      glMatrixMode := GetProcAddress(GLHandle, 'glMatrixMode');
      glMultMatrixd := GetProcAddress(GLHandle, 'glMultMatrixd');
      glMultMatrixf := GetProcAddress(GLHandle, 'glMultMatrixf');
      glNewList := GetProcAddress(GLHandle, 'glNewList');
      glNormal3b := GetProcAddress(GLHandle, 'glNormal3b');
      glNormal3bv := GetProcAddress(GLHandle, 'glNormal3bv');
      glNormal3d := GetProcAddress(GLHandle, 'glNormal3d');
      glNormal3dv := GetProcAddress(GLHandle, 'glNormal3dv');
      glNormal3f := GetProcAddress(GLHandle, 'glNormal3f');
      glNormal3fv := GetProcAddress(GLHandle, 'glNormal3fv');
      glNormal3i := GetProcAddress(GLHandle, 'glNormal3i');
      glNormal3iv := GetProcAddress(GLHandle, 'glNormal3iv');
      glNormal3s := GetProcAddress(GLHandle, 'glNormal3s');
      glNormal3sv := GetProcAddress(GLHandle, 'glNormal3sv');
      glNormalPointer := GetProcAddress(GLHandle, 'glNormalPointer');
      glOrtho := GetProcAddress(GLHandle, 'glOrtho');
      glPassThrough := GetProcAddress(GLHandle, 'glPassThrough');
      glPixelMapfv := GetProcAddress(GLHandle, 'glPixelMapfv');
      glPixelMapuiv := GetProcAddress(GLHandle, 'glPixelMapuiv');
      glPixelMapusv := GetProcAddress(GLHandle, 'glPixelMapusv');
      glPixelStoref := GetProcAddress(GLHandle, 'glPixelStoref');
      glPixelStorei := GetProcAddress(GLHandle, 'glPixelStorei');
      glPixelTransferf := GetProcAddress(GLHandle, 'glPixelTransferf');
      glPixelTransferi := GetProcAddress(GLHandle, 'glPixelTransferi');
      glPixelZoom := GetProcAddress(GLHandle, 'glPixelZoom');
      glPointSize := GetProcAddress(GLHandle, 'glPointSize');
      glPolygonMode := GetProcAddress(GLHandle, 'glPolygonMode');
      glPolygonOffset := GetProcAddress(GLHandle, 'glPolygonOffset');
      glPolygonStipple := GetProcAddress(GLHandle, 'glPolygonStipple');
      glPopAttrib := GetProcAddress(GLHandle, 'glPopAttrib');
      glPopClientAttrib := GetProcAddress(GLHandle, 'glPopClientAttrib');
      glPopMatrix := GetProcAddress(GLHandle, 'glPopMatrix');
      glPopName := GetProcAddress(GLHandle, 'glPopName');
      glPrioritizeTextures := GetProcAddress(GLHandle, 'glPrioritizeTextures');
      glPushAttrib := GetProcAddress(GLHandle, 'glPushAttrib');
      glPushClientAttrib := GetProcAddress(GLHandle, 'glPushClientAttrib');
      glPushMatrix := GetProcAddress(GLHandle, 'glPushMatrix');
      glPushName := GetProcAddress(GLHandle, 'glPushName');
      glRasterPos2d := GetProcAddress(GLHandle, 'glRasterPos2d');
      glRasterPos2dv := GetProcAddress(GLHandle, 'glRasterPos2dv');
      glRasterPos2f := GetProcAddress(GLHandle, 'glRasterPos2f');
      glRasterPos2fv := GetProcAddress(GLHandle, 'glRasterPos2fv');
      glRasterPos2i := GetProcAddress(GLHandle, 'glRasterPos2i');
      glRasterPos2iv := GetProcAddress(GLHandle, 'glRasterPos2iv');
      glRasterPos2s := GetProcAddress(GLHandle, 'glRasterPos2s');
      glRasterPos2sv := GetProcAddress(GLHandle, 'glRasterPos2sv');
      glRasterPos3d := GetProcAddress(GLHandle, 'glRasterPos3d');
      glRasterPos3dv := GetProcAddress(GLHandle, 'glRasterPos3dv');
      glRasterPos3f := GetProcAddress(GLHandle, 'glRasterPos3f');
      glRasterPos3fv := GetProcAddress(GLHandle, 'glRasterPos3fv');
      glRasterPos3i := GetProcAddress(GLHandle, 'glRasterPos3i');
      glRasterPos3iv := GetProcAddress(GLHandle, 'glRasterPos3iv');
      glRasterPos3s := GetProcAddress(GLHandle, 'glRasterPos3s');
      glRasterPos3sv := GetProcAddress(GLHandle, 'glRasterPos3sv');
      glRasterPos4d := GetProcAddress(GLHandle, 'glRasterPos4d');
      glRasterPos4dv := GetProcAddress(GLHandle, 'glRasterPos4dv');
      glRasterPos4f := GetProcAddress(GLHandle, 'glRasterPos4f');
      glRasterPos4fv := GetProcAddress(GLHandle, 'glRasterPos4fv');
      glRasterPos4i := GetProcAddress(GLHandle, 'glRasterPos4i');
      glRasterPos4iv := GetProcAddress(GLHandle, 'glRasterPos4iv');
      glRasterPos4s := GetProcAddress(GLHandle, 'glRasterPos4s');
      glRasterPos4sv := GetProcAddress(GLHandle, 'glRasterPos4sv');
      glReadBuffer := GetProcAddress(GLHandle, 'glReadBuffer');
      glReadPixels := GetProcAddress(GLHandle, 'glReadPixels');
      glRectd := GetProcAddress(GLHandle, 'glRectd');
      glRectdv := GetProcAddress(GLHandle, 'glRectdv');
      glRectf := GetProcAddress(GLHandle, 'glRectf');
      glRectfv := GetProcAddress(GLHandle, 'glRectfv');
      glRecti := GetProcAddress(GLHandle, 'glRecti');
      glRectiv := GetProcAddress(GLHandle, 'glRectiv');
      glRects := GetProcAddress(GLHandle, 'glRects');
      glRectsv := GetProcAddress(GLHandle, 'glRectsv');
      glRenderMode := GetProcAddress(GLHandle, 'glRenderMode');
      glRotated := GetProcAddress(GLHandle, 'glRotated');
      glRotatef := GetProcAddress(GLHandle, 'glRotatef');
      glScaled := GetProcAddress(GLHandle, 'glScaled');
      glScalef := GetProcAddress(GLHandle, 'glScalef');
      glScissor := GetProcAddress(GLHandle, 'glScissor');
      glSelectBuffer := GetProcAddress(GLHandle, 'glSelectBuffer');
      glShadeModel := GetProcAddress(GLHandle, 'glShadeModel');
      glStencilFunc := GetProcAddress(GLHandle, 'glStencilFunc');
      glStencilMask := GetProcAddress(GLHandle, 'glStencilMask');
      glStencilOp := GetProcAddress(GLHandle, 'glStencilOp');
      glTexCoord1d := GetProcAddress(GLHandle, 'glTexCoord1d');
      glTexCoord1dv := GetProcAddress(GLHandle, 'glTexCoord1dv');
      glTexCoord1f := GetProcAddress(GLHandle, 'glTexCoord1f');
      glTexCoord1fv := GetProcAddress(GLHandle, 'glTexCoord1fv');
      glTexCoord1i := GetProcAddress(GLHandle, 'glTexCoord1i');
      glTexCoord1iv := GetProcAddress(GLHandle, 'glTexCoord1iv');
      glTexCoord1s := GetProcAddress(GLHandle, 'glTexCoord1s');
      glTexCoord1sv := GetProcAddress(GLHandle, 'glTexCoord1sv');
      glTexCoord2d := GetProcAddress(GLHandle, 'glTexCoord2d');
      glTexCoord2dv := GetProcAddress(GLHandle, 'glTexCoord2dv');
      glTexCoord2f := GetProcAddress(GLHandle, 'glTexCoord2f');
      glTexCoord2fv := GetProcAddress(GLHandle, 'glTexCoord2fv');
      glTexCoord2i := GetProcAddress(GLHandle, 'glTexCoord2i');
      glTexCoord2iv := GetProcAddress(GLHandle, 'glTexCoord2iv');
      glTexCoord2s := GetProcAddress(GLHandle, 'glTexCoord2s');
      glTexCoord2sv := GetProcAddress(GLHandle, 'glTexCoord2sv');
      glTexCoord3d := GetProcAddress(GLHandle, 'glTexCoord3d');
      glTexCoord3dv := GetProcAddress(GLHandle, 'glTexCoord3dv');
      glTexCoord3f := GetProcAddress(GLHandle, 'glTexCoord3f');
      glTexCoord3fv := GetProcAddress(GLHandle, 'glTexCoord3fv');
      glTexCoord3i := GetProcAddress(GLHandle, 'glTexCoord3i');
      glTexCoord3iv := GetProcAddress(GLHandle, 'glTexCoord3iv');
      glTexCoord3s := GetProcAddress(GLHandle, 'glTexCoord3s');
      glTexCoord3sv := GetProcAddress(GLHandle, 'glTexCoord3sv');
      glTexCoord4d := GetProcAddress(GLHandle, 'glTexCoord4d');
      glTexCoord4dv := GetProcAddress(GLHandle, 'glTexCoord4dv');
      glTexCoord4f := GetProcAddress(GLHandle, 'glTexCoord4f');
      glTexCoord4fv := GetProcAddress(GLHandle, 'glTexCoord4fv');
      glTexCoord4i := GetProcAddress(GLHandle, 'glTexCoord4i');
      glTexCoord4iv := GetProcAddress(GLHandle, 'glTexCoord4iv');
      glTexCoord4s := GetProcAddress(GLHandle, 'glTexCoord4s');
      glTexCoord4sv := GetProcAddress(GLHandle, 'glTexCoord4sv');
      glTexCoordPointer := GetProcAddress(GLHandle, 'glTexCoordPointer');
      glTexEnvf := GetProcAddress(GLHandle, 'glTexEnvf');
      glTexEnvfv := GetProcAddress(GLHandle, 'glTexEnvfv');
      glTexEnvi := GetProcAddress(GLHandle, 'glTexEnvi');
      glTexEnviv := GetProcAddress(GLHandle, 'glTexEnviv');
      glTexGend := GetProcAddress(GLHandle, 'glTexGend');
      glTexGendv := GetProcAddress(GLHandle, 'glTexGendv');
      glTexGenf := GetProcAddress(GLHandle, 'glTexGenf');
      glTexGenfv := GetProcAddress(GLHandle, 'glTexGenfv');
      glTexGeni := GetProcAddress(GLHandle, 'glTexGeni');
      glTexGeniv := GetProcAddress(GLHandle, 'glTexGeniv');
      glTexImage1D := GetProcAddress(GLHandle, 'glTexImage1D');
      glTexImage2D := GetProcAddress(GLHandle, 'glTexImage2D');
      glTexParameterf := GetProcAddress(GLHandle, 'glTexParameterf');
      glTexParameterfv := GetProcAddress(GLHandle, 'glTexParameterfv');
      glTexParameteri := GetProcAddress(GLHandle, 'glTexParameteri');
      glTexParameteriv := GetProcAddress(GLHandle, 'glTexParameteriv');
      glTexSubImage1D := GetProcAddress(GLHandle, 'glTexSubImage1D');
      glTexSubImage2D := GetProcAddress(GLHandle, 'glTexSubImage2D');
      glTranslated := GetProcAddress(GLHandle, 'glTranslated');
      glTranslatef := GetProcAddress(GLHandle, 'glTranslatef');
      glVertex2d := GetProcAddress(GLHandle, 'glVertex2d');
      glVertex2dv := GetProcAddress(GLHandle, 'glVertex2dv');
      glVertex2f := GetProcAddress(GLHandle, 'glVertex2f');
      glVertex2fv := GetProcAddress(GLHandle, 'glVertex2fv');
      glVertex2i := GetProcAddress(GLHandle, 'glVertex2i');
      glVertex2iv := GetProcAddress(GLHandle, 'glVertex2iv');
      glVertex2s := GetProcAddress(GLHandle, 'glVertex2s');
      glVertex2sv := GetProcAddress(GLHandle, 'glVertex2sv');
      glVertex3d := GetProcAddress(GLHandle, 'glVertex3d');
      glVertex3dv := GetProcAddress(GLHandle, 'glVertex3dv');
      glVertex3f := GetProcAddress(GLHandle, 'glVertex3f');
      glVertex3fv := GetProcAddress(GLHandle, 'glVertex3fv');
      glVertex3i := GetProcAddress(GLHandle, 'glVertex3i');
      glVertex3iv := GetProcAddress(GLHandle, 'glVertex3iv');
      glVertex3s := GetProcAddress(GLHandle, 'glVertex3s');
      glVertex3sv := GetProcAddress(GLHandle, 'glVertex3sv');
      glVertex4d := GetProcAddress(GLHandle, 'glVertex4d');
      glVertex4dv := GetProcAddress(GLHandle, 'glVertex4dv');
      glVertex4f := GetProcAddress(GLHandle, 'glVertex4f');
      glVertex4fv := GetProcAddress(GLHandle, 'glVertex4fv');
      glVertex4i := GetProcAddress(GLHandle, 'glVertex4i');
      glVertex4iv := GetProcAddress(GLHandle, 'glVertex4iv');
      glVertex4s := GetProcAddress(GLHandle, 'glVertex4s');
      glVertex4sv := GetProcAddress(GLHandle, 'glVertex4sv');
      glVertexPointer := GetProcAddress(GLHandle, 'glVertexPointer');
      glViewport := GetProcAddress(GLHandle, 'glViewport');
      Result := True;

      ReadExtensions;
   end
   else
   begin
      if GLHandle<>INVALID_MODULEHANDLE then
         FreeLibrary(Cardinal(GLHandle));
   end;
end;

procedure FreeOpenGL;
begin
   if GLHandle <> INVALID_MODULEHANDLE then
   begin
      glAccum := nil;
      glAlphaFunc := nil;
      glAreTexturesResident := nil;
      glArrayElement := nil;
      glBegin := nil;
      glBindTexture := nil;
      glBitmap := nil;
      glBlendFunc := nil;
      glCallList := nil;
      glCallLists := nil;
      glClear := nil;
      glClearAccum := nil;
      glClearColor := nil;
      glClearDepth := nil;
      glClearIndex := nil;
      glClearStencil := nil;
      glClipPlane := nil;
      glColor3b := nil;
      glColor3bv := nil;
      glColor3d := nil;
      glColor3dv := nil;
      glColor3f := nil;
      glColor3fv := nil;
      glColor3i := nil;
      glColor3iv := nil;
      glColor3s := nil;
      glColor3sv := nil;
      glColor3ub := nil;
      glColor3ubv := nil;
      glColor3ui := nil;
      glColor3uiv := nil;
      glColor3us := nil;
      glColor3usv := nil;
      glColor4b := nil;
      glColor4bv := nil;
      glColor4d := nil;
      glColor4dv := nil;
      glColor4f := nil;
      glColor4fv := nil;
      glColor4i := nil;
      glColor4iv := nil;
      glColor4s := nil;
      glColor4sv := nil;
      glColor4ub := nil;
      glColor4ubv := nil;
      glColor4ui := nil;
      glColor4uiv := nil;
      glColor4us := nil;
      glColor4usv := nil;
      glColorMask := nil;
      glColorMaterial := nil;
      glColorPointer := nil;
      glCopyPixels := nil;
      glCopyTexImage1D := nil;
      glCopyTexImage2D := nil;
      glCopyTexSubImage1D := nil;
      glCopyTexSubImage2D := nil;
      glCullFace := nil;
      glDeleteLists := nil;
      glDeleteTextures := nil;
      glDepthFunc := nil;
      glDepthMask := nil;
      glDepthRange := nil;
      glDisable := nil;
      glDisableClientState := nil;
      glDrawArrays := nil;
      glDrawBuffer := nil;
      glDrawElements := nil;
      glDrawPixels := nil;
      glEdgeFlag := nil;
      glEdgeFlagPointer := nil;
      glEdgeFlagv := nil;
      glEnable := nil;
      glEnableClientState := nil;
      glEnd := nil;
      glEndList := nil;
      glEvalCoord1d := nil;
      glEvalCoord1dv := nil;
      glEvalCoord1f := nil;
      glEvalCoord1fv := nil;
      glEvalCoord2d := nil;
      glEvalCoord2dv := nil;
      glEvalCoord2f := nil;
      glEvalCoord2fv := nil;
      glEvalMesh1 := nil;
      glEvalMesh2 := nil;
      glEvalPoint1 := nil;
      glEvalPoint2 := nil;
      glFeedbackBuffer := nil;
      glFinish := nil;
      glFlush := nil;
      glFogf := nil;
      glFogfv := nil;
      glFogi := nil;
      glFogiv := nil;
      glFrontFace := nil;
      glFrustum := nil;
      glGenLists := nil;
      glGenTextures := nil;
      glGetBooleanv := nil;
      glGetClipPlane := nil;
      glGetDoublev := nil;
      glGetError := nil;
      glGetFloatv := nil;
      glGetIntegerv := nil;
      glGetLightfv := nil;
      glGetLightiv := nil;
      glGetMapdv := nil;
      glGetMapfv := nil;
      glGetMapiv := nil;
      glGetMaterialfv := nil;
      glGetMaterialiv := nil;
      glGetPixelMapfv := nil;
      glGetPixelMapuiv := nil;
      glGetPixelMapusv := nil;
      glGetPointerv := nil;
      glGetPolygonStipple := nil;
      glGetString := nil;
      glGetTexEnvfv := nil;
      glGetTexEnviv := nil;
      glGetTexGendv := nil;
      glGetTexGenfv := nil;
      glGetTexGeniv := nil;
      glGetTexImage := nil;
      glGetTexLevelParameterfv := nil;
      glGetTexLevelParameteriv := nil;
      glGetTexParameterfv := nil;
      glGetTexParameteriv := nil;
      glHint := nil;
      glIndexMask := nil;
      glIndexPointer := nil;
      glIndexd := nil;
      glIndexdv := nil;
      glIndexf := nil;
      glIndexfv := nil;
      glIndexi := nil;
      glIndexiv := nil;
      glIndexs := nil;
      glIndexsv := nil;
      glIndexub := nil;
      glIndexubv := nil;
      glInitNames := nil;
      glInterleavedArrays := nil;
      glIsEnabled := nil;
      glIsList := nil;
      glIsTexture := nil;
      glLightModelf := nil;
      glLightModelfv := nil;
      glLightModeli := nil;
      glLightModeliv := nil;
      glLightf := nil;
      glLightfv := nil;
      glLighti := nil;
      glLightiv := nil;
      glLineStipple := nil;
      glLineWidth := nil;
      glListBase := nil;
      glLoadIdentity := nil;
      glLoadMatrixd := nil;
      glLoadMatrixf := nil;
      glLoadName := nil;
      glLogicOp := nil;
      glMap1d := nil;
      glMap1f := nil;
      glMap2d := nil;
      glMap2f := nil;
      glMapGrid1d := nil;
      glMapGrid1f := nil;
      glMapGrid2d := nil;
      glMapGrid2f := nil;
      glMaterialf := nil;
      glMaterialfv := nil;
      glMateriali := nil;
      glMaterialiv := nil;
      glMatrixMode := nil;
      glMultMatrixd := nil;
      glMultMatrixf := nil;
      glNewList := nil;
      glNormal3b := nil;
      glNormal3bv := nil;
      glNormal3d := nil;
      glNormal3dv := nil;
      glNormal3f := nil;
      glNormal3fv := nil;
      glNormal3i := nil;
      glNormal3iv := nil;
      glNormal3s := nil;
      glNormal3sv := nil;
      glNormalPointer := nil;
      glOrtho := nil;
      glPassThrough := nil;
      glPixelMapfv := nil;
      glPixelMapuiv := nil;
      glPixelMapusv := nil;
      glPixelStoref := nil;
      glPixelStorei := nil;
      glPixelTransferf := nil;
      glPixelTransferi := nil;
      glPixelZoom := nil;
      glPointSize := nil;
      glPolygonMode := nil;
      glPolygonOffset := nil;
      glPolygonStipple := nil;
      glPopAttrib := nil;
      glPopClientAttrib := nil;
      glPopMatrix := nil;
      glPopName := nil;
      glPrioritizeTextures := nil;
      glPushAttrib := nil;
      glPushClientAttrib := nil;
      glPushMatrix := nil;
      glPushName := nil;
      glRasterPos2d := nil;
      glRasterPos2dv := nil;
      glRasterPos2f := nil;
      glRasterPos2fv := nil;
      glRasterPos2i := nil;
      glRasterPos2iv := nil;
      glRasterPos2s := nil;
      glRasterPos2sv := nil;
      glRasterPos3d := nil;
      glRasterPos3dv := nil;
      glRasterPos3f := nil;
      glRasterPos3fv := nil;
      glRasterPos3i := nil;
      glRasterPos3iv := nil;
      glRasterPos3s := nil;
      glRasterPos3sv := nil;
      glRasterPos4d := nil;
      glRasterPos4dv := nil;
      glRasterPos4f := nil;
      glRasterPos4fv := nil;
      glRasterPos4i := nil;
      glRasterPos4iv := nil;
      glRasterPos4s := nil;
      glRasterPos4sv := nil;
      glReadBuffer := nil;
      glReadPixels := nil;
      glRectd := nil;
      glRectdv := nil;
      glRectf := nil;
      glRectfv := nil;
      glRecti := nil;
      glRectiv := nil;
      glRects := nil;
      glRectsv := nil;
      glRenderMode := nil;
      glRotated := nil;
      glRotatef := nil;
      glScaled := nil;
      glScalef := nil;
      glScissor := nil;
      glSelectBuffer := nil;
      glShadeModel := nil;
      glStencilFunc := nil;
      glStencilMask := nil;
      glStencilOp := nil;
      glTexCoord1d := nil;
      glTexCoord1dv := nil;
      glTexCoord1f := nil;
      glTexCoord1fv := nil;
      glTexCoord1i := nil;
      glTexCoord1iv := nil;
      glTexCoord1s := nil;
      glTexCoord1sv := nil;
      glTexCoord2d := nil;
      glTexCoord2dv := nil;
      glTexCoord2f := nil;
      glTexCoord2fv := nil;
      glTexCoord2i := nil;
      glTexCoord2iv := nil;
      glTexCoord2s := nil;
      glTexCoord2sv := nil;
      glTexCoord3d := nil;
      glTexCoord3dv := nil;
      glTexCoord3f := nil;
      glTexCoord3fv := nil;
      glTexCoord3i := nil;
      glTexCoord3iv := nil;
      glTexCoord3s := nil;
      glTexCoord3sv := nil;
      glTexCoord4d := nil;
      glTexCoord4dv := nil;
      glTexCoord4f := nil;
      glTexCoord4fv := nil;
      glTexCoord4i := nil;
      glTexCoord4iv := nil;
      glTexCoord4s := nil;
      glTexCoord4sv := nil;
      glTexCoordPointer := nil;
      glTexEnvf := nil;
      glTexEnvfv := nil;
      glTexEnvi := nil;
      glTexEnviv := nil;
      glTexGend := nil;
      glTexGendv := nil;
      glTexGenf := nil;
      glTexGenfv := nil;
      glTexGeni := nil;
      glTexGeniv := nil;
      glTexImage1D := nil;
      glTexImage2D := nil;
      glTexParameterf := nil;
      glTexParameterfv := nil;
      glTexParameteri := nil;
      glTexParameteriv := nil;
      glTexSubImage1D := nil;
      glTexSubImage2D := nil;
      glTranslated := nil;
      glTranslatef := nil;
      glVertex2d := nil;
      glVertex2dv := nil;
      glVertex2f := nil;
      glVertex2fv := nil;
      glVertex2i := nil;
      glVertex2iv := nil;
      glVertex2s := nil;
      glVertex2sv := nil;
      glVertex3d := nil;
      glVertex3dv := nil;
      glVertex3f := nil;
      glVertex3fv := nil;
      glVertex3i := nil;
      glVertex3iv := nil;
      glVertex3s := nil;
      glVertex3sv := nil;
      glVertex4d := nil;
      glVertex4dv := nil;
      glVertex4f := nil;
      glVertex4fv := nil;
      glVertex4i := nil;
      glVertex4iv := nil;
      glVertex4s := nil;
      glVertex4sv := nil;
      glVertexPointer := nil;
      glViewport := nil;
      FreeLibrary(Cardinal(GLHandle));
      GLHandle := INVALID_MODULEHANDLE;
   end;
end;

procedure LoadOSMesa(const dll: String);
begin
  OSMesaLib := LoadLibrary(PChar(dll));
  if OSMesaLib <> 0 then
  begin
    OSMesaCreateContext := GetProcAddress(OSMesaLib, 'OSMesaCreateContext');
    OSMesaCreateContextExt := GetProcAddress(OSMesaLib, 'OSMesaCreateContextExt');
    OSMesaDestroyContext := GetProcAddress(OSMesaLib, 'OSMesaDestroyContext');
    OSMesaMakeCurrent := GetProcAddress(OSMesaLib, 'OSMesaMakeCurrent');
    OSMesaPixelStore := GetProcAddress(OSMesaLib, 'OSMesaPixelStore');
  end;
end;

procedure FreeOSMesa;
begin
  if OSMesaLib <> 0 then
    FreeLibrary(OSMesaLib);
  OSMesaCreateContext := nil;
  OSMesaDestroyContext := nil;
  OSMesaMakeCurrent := nil;
  OSMesaPixelStore := nil;
end;


