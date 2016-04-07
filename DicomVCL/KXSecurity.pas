{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit KXSecurity;

interface

{$IFDEF VER100}
Uses
   Windows;
   
Type
   LongWord=DWord;
{$ENDIF}

Const
{$IFNDEF BCB}
   //Encoding/decoding algoritms
   X509_ASN_ENCODING = 1;
   PKCS_7_ASN_ENCODING = 2;

   //certificat vervion
   CERT_V1=1;
   CERT_V2=2;
   CERT_V3=3;
{$ENDIF}
   //OID of algorithm
   szOID_RSA='1.2.840.113549';
   szOID_PKCS='1.2.840.113549.1';
   szOID_RSA_HASH='1.2.840.113549.2';
   szOID_RSA_ENCRYPT='1.2.840.113549.3';
   szOID_PKCS_1='1.2.840.113549.1.1';
   szOID_PKCS_2='1.2.840.113549.1.2';
   szOID_PKCS_3='1.2.840.113549.1.3';
   szOID_PKCS_4='1.2.840.113549.1.4';
   szOID_PKCS_5='1.2.840.113549.1.5';
   szOID_PKCS_6='1.2.840.113549.1.6';
   szOID_PKCS_7='1.2.840.113549.1.7';
   szOID_PKCS_8='1.2.840.113549.1.8';
   szOID_PKCS_9='1.2.840.113549.1.9';
   szOID_PKCS_10='1.2.840.113549.1.10';
   szOID_PKCS_12='1.2.840.113549.1.12';
   szOID_RSA_MD2='1.2.840.113549.1.1.2';
   szOID_RSA_MD4='1.2.840.113549.1.1.3';
   szOID_RSA_MD5='1.2.840.113549.1.1.4';
   szOID_RSA_RSA='1.2.840.113549.1.1.1';
   szOID_RSA_MD2RSA='1.2.840.113549.1.1.2';
   szOID_RSA_MD4RSA='1.2.840.113549.1.1.3';
   szOID_RSA_MD5RSA='1.2.840.113549.1.1.4';
   szOID_RSA_SHA1RSA='1.2.840.113549.1.1.5';
   szOID_RSA_SETOAEP_RSA='1.2.840.113549.1.1.5';
   szOID_RSA_DH='1.2.840.113549.1.3.1';
   szOID_RSA_data='1.2.840.113549.1.7.1';
   szOID_RSA_signedData='1.2.840.113549.1.7.2';
   szOID_RSA_envelopedData='1.2.840.113549.1.7.3';
   szOID_RSA_signEnvData='1.2.840.113549.1.7.4';
   szOID_RSA_digestedData='1.2.840.113549.1.7.5';
   szOID_RSA_hashedData='1.2.840.113549.1.7.5';
   szOID_RSA_encryptedData='1.2.840.113549.1.7.6';
   szOID_RSA_emailAddr='1.2.840.113549.1.9.1';
   szOID_RSA_unstructName='1.2.840.113549.1.9.2';
   szOID_RSA_contentType='1.2.840.113549.1.9.3';
   szOID_RSA_messageDigest='1.2.840.113549.1.9.4';
   szOID_RSA_signingTime='1.2.840.113549.1.9.5';
   szOID_RSA_counterSign='1.2.840.113549.1.9.6';
   szOID_RSA_challengePwd='1.2.840.113549.1.9.7';
   szOID_RSA_unstructAddr='1.2.840.113549.1.9.8';
   szOID_RSA_extCertAttrs='1.2.840.113549.1.9.9';
   szOID_RSA_SMIMECapabilities='1.2.840.113549.1.9.15';
   szOID_RSA_preferSignedData='1.2.840.113549.1.9.15.1';
   szOID_RSA_RC2CBC='1.2.840.113549.3.2';
   szOID_RSA_RC4='1.2.840.113549.3.4';
   szOID_RSA_DES_EDE3_CBC='1.2.840.113549.3.7';
   szOID_RSA_RC5_CBCPad='1.2.840.113549.3.9';
   szOID_ANSI_x942='1.2.840.10046';
   szOID_ANSI_x942_DH='1.2.840.10046.2.1';
   szOID_X957='1.2.840.10040';
   szOID_X957_DSA='1.2.840.10040.4.1';
   szOID_DATA_STRUCTURE='1.2.840.10040.4.3';
   szOId_DS='2.5';
   szOID_DSALG='2.5.8';
   szOID_DSALG_CRPT='2.5.8.1';
   szOID_DSALG_HASH='2.5.8.2';
   szOID_DSALG_SIGN='2.5.8.3';
   szOID_DSALG_RSA='2.5.8.1.1';
   szOID_OIW='1.3.14';
   szOID_OIWSEC='1.3.14.3.2';
   szOID_OIWSEC_md4RSA='1.3.14.3.2.2';
   szOID_OIWSEC_md5RSA='1.3.14.3.2.3';
   szOID_OIWSEC_md4RSA2='1.3.14.3.2.4';
   szOID_OIWSEC_desECB='1.3.14.3.2.6';
   szOID_OIWSEC_desCBC='1.3.14.3.2.7';
   szOID_OIWSEC_desOFB='1.3.14.3.2.8';
   szOID_OIWSEC_desCFB='1.3.14.3.2.9';
   szOID_OIWSEC_desMAC='1.3.14.3.2.10';
   szOID_OIWSEC_rsaSign='1.3.14.3.2.11';
   szOID_OIWSEC_dsa='1.3.14.3.2.12';
   szOID_OIWSEC_shaDSA='1.3.14.3.2.13';
   szOID_OIWSEC_mdc2RSA='1.3.14.3.2.14';
   szOID_OIWSEC_shaRSA='1.3.14.3.2.15';
   szOID_OIWSEC_dhCommMod='1.3.14.3.2.16';
   szOID_OIWSEC_desEDE='1.3.14.3.2.17';
   szOID_OIWSEC_sha='1.3.14.3.2.18';
   szOID_OIWSEC_mdc2='1.3.14.3.2.19';
   szOID_OIWSEC_dsaComm='1.3.14.3.2.20';
   szOID_OIWSEC_dsaCommSHA='1.3.14.3.2.21';
   szOID_OIWSEC_rsaXchg='1.3.14.3.2.22';
   szOID_OIWSEC_keyHashSeal='1.3.14.3.2.23';
   szOID_OIWSEC_md2RSASign='1.3.14.3.2.24';
   szOID_OIWSEC_md5RSASign='1.3.14.3.2.25';
   szOID_OIWSEC_sha1='1.3.14.3.2.26';
   szOID_OIWSEC_dsaSHA1='1.3.14.3.2.27';
   szOID_OIWSEC_dsaCommSHA1='1.3.14.3.2.28';
   szOID_OIWSEC_sha1RSASign='1.3.14.3.2.29';
   szOID_OIWDIR='1.3.14.7.2';
   szOID_OIWDIR_CRPT='1.3.14.7.2.1';
   szOID_OIWDIR_HASH='1.3.14.7.2.2';
   szOID_OIWDIR_SIGN='1.3.14.7.2.3';
   szOID_OIWDIR_md2='1.3.14.7.2.2.1';
   szOID_OIWDIR_md2RSA='1.3.14.7.2.3.1';
   szOID_INFOSEC='2.16.840.1.101.2.1';
   szOID_INFOSEC_sdnsSignature='2.16.840.1.101.2.1.1.1';
   szOID_INFOSEC_mosaicSignature='2.16.840.1.101.2.1.1.2';
   szOID_INFOSEC_sdnsConfidentiality='2.16.840.1.101.2.1.1.3';
   szOID_INFOSEC_mosaicConfidentiality='2.16.840.1.101.2.1.1.4';
   szOID_INFOSEC_sdnsIntegrity='2.16.840.1.101.2.1.1.5';
   szOID_INFOSEC_mosaicIntegrity='2.16.840.1.101.2.1.1.6';
   szOID_INFOSEC_sdnsTokenProtection='2.16.840.1.101.2.1.1.7';
   szOID_INFOSEC_mosaicTokenProtection='2.16.840.1.101.2.1.1.8';
   szOID_INFOSEC_sdnsKeyManagement='2.16.840.1.101.2.1.1.9';
   szOID_INFOSEC_mosaicKeyManagement='2.16.840.1.101.2.1.1.10';
   szOID_INFOSEC_sdnsKMandSig='2.16.840.1.101.2.1.1.11';
   szOID_INFOSEC_mosaicKMandSig='2.16.840.1.101.2.1.1.12';
   szOID_INFOSEC_SuiteASignature='2.16.840.1.101.2.1.1.13';
   szOID_INFOSEC_SuiteAConfidentiality='2.16.840.1.101.2.1.1.14';
   szOID_INFOSEC_SuiteAIntegrity='2.16.840.1.101.2.1.1.15';
   szOID_INFOSEC_SuiteATokenProtection='2.16.840.1.101.2.1.1.16';
   szOID_INFOSEC_SuiteAKeyManagement='2.16.840.1.101.2.1.1.17';
   szOID_INFOSEC_SuiteAKMandSig='2.16.840.1.101.2.1.1.18';
   szOID_INFOSEC_mosaicUpdatedSig='2.16.840.1.101.2.1.1.19';
   szOID_INFOSEC_mosaicKMandUpdSig='2.16.840.1.101.2.1.1.20';
   szOID_INFOSEC_mosaicUpdatedInteg='2.16.840.1.101.2.1.1.21';

   //predefine algorithm types
   X509_DSS_PARAMETERS = szOID_OIWSEC_dsa;
   PKCS_RC2_CBC_PARAMETERS = szOID_RSA_RC2CBC;
   X509_OCTET_STRING = szOID_OIWSEC_desCBC;
{   X509_OCTET_STRING = szOID_RSA_DES_EDE3_CBC;
   X509_OCTET_STRING = szOID_RSA_RC4;}

Type
   HCERTSTORE = Cardinal;

///////////////////////////////////////////////////////////////////////////////
// MSDN:
// The CryptoAPI BLOB structure is used for an arbitrary array of bytes.
// It is declared in Wincrypt.h and provides
// flexibility for objects that can contain various data types.
///////////////////////////////////////////////////////////////////////////////
   TBLOB = record
      cbData:LONGWORD;
      pbData:^BYTE;
   End;

   TCRYPT_INTEGER_BLOB=TBLOB;
   PCRYPT_INTEGER_BLOB=^TBLOB;
   TCRYPT_UINT_BLOB=TBLOB;
   PCRYPT_UINT_BLOB=^TBLOB;
   TCRYPT_OBJID_BLOB=TBLOB;
   PCRYPT_OBJID_BLOB=^TBLOB;
   TCERT_NAME_BLOB=TBLOB;
   PCERT_NAME_BLOB=^TBLOB;
   TCERT_RDN_VALUE_BLOB=TBLOB;
   PCERT_RDN_VALUE_BLOB=^TBLOB;
   TCERT_BLOB=TBLOB;
   PCERT_BLOB=^TBLOB;
   TCRL_BLOB=TBLOB;
   PCRL_BLOB=^TBLOB;
   TDATA_BLOB=TBLOB;
   PDATA_BLOB=^TBLOB;
   TCRYPT_DATA_BLOB=TBLOB;
   PCRYPT_DATA_BLOB=^TBLOB;
   TCRYPT_HASH_BLOB=TBLOB;
   PCRYPT_HASH_BLOB=^TBLOB;
   TCRYPT_DIGEST_BLOB=TBLOB;
   PCRYPT_DIGEST_BLOB=^TBLOB;
   TCRYPT_DER_BLOB=TBLOB;
   PCRYPT_DER_BLOB=^TBLOB;
   TCRYPT_ATTR_BLOB=TBLOB;
   PCRYPT_ATTR_BLOB=^TBLOB;

///////////////////////////////////////////////////////////////////////////////
// MSDN:
// The CRYPT_BIT_BLOB structure contains an array of bytes. In a
// CRYPT_BIT_BLOB the last byte in the array can contain zero to seven
// unused bits. Therefore, the number of meaningful bits in the pbData
// member is cbData * 8 – cUnusedBits.
///////////////////////////////////////////////////////////////////////////////
   PCRYPT_BIT_BLOB=^TCRYPT_BIT_BLOB;
   TCRYPT_BIT_BLOB = packed record
      cbData:LONGWORD;
      pbData:^BYTE;
      cUnusedBits:LONGWORD;
   End;

///////////////////////////////////////////////////////////////////////////////
// MSDN:
// The CRYPT_ALGORITHM_IDENTIFIER structure specifies an algorithm.
// The structure includes the object identifier (OID) of the algorithm and
// any needed parameters for that algorithm. The parameters contained in
// its CRYPT_OBJID_BLOB are encoded.
///////////////////////////////////////////////////////////////////////////////
   PCRYPT_ALGORITHM_IDENTIFIER=^TCRYPT_ALGORITHM_IDENTIFIER;
   TCRYPT_ALGORITHM_IDENTIFIER = packed record
      pszObjId:String;
      Parameters:TCRYPT_OBJID_BLOB;
   End;

///////////////////////////////////////////////////////////////////////////////
// MSDN:
// The CERT_PUBLIC_KEY_INFO structure contains a public key and its algorithm.
///////////////////////////////////////////////////////////////////////////////
   PCERT_PUBLIC_KEY_INFO=^TCERT_PUBLIC_KEY_INFO;
   TCERT_PUBLIC_KEY_INFO = packed record
      Algorithm:TCRYPT_ALGORITHM_IDENTIFIER;
      PublicKey:TCRYPT_BIT_BLOB;
   End;

///////////////////////////////////////////////////////////////////////////////
// MSDN:
// The CERT_EXTENSION structure contains the extension information for a
// certificate, Certificate Revocation List (CRL)
// or Certificate Trust List (CTL).
///////////////////////////////////////////////////////////////////////////////
   PCERT_EXTENSION = ^TCERT_EXTENSION;
   TCERT_EXTENSION = packed record
      pszObjId:String;
      fCritical:Boolean;
      Value:TCRYPT_OBJID_BLOB;
   End;

///////////////////////////////////////////////////////////////////////////////
// MSDN:
// The CERT_INFO structure contains a certificate's information.
///////////////////////////////////////////////////////////////////////////////
   PCERT_INFO=^TCERT_INFO;
   TCERT_INFO = packed record
      dwVersion:LONGWORD;
      SerialNumber:TCRYPT_INTEGER_BLOB;
      SignatureAlgorithm:TCRYPT_ALGORITHM_IDENTIFIER;
      Issuer:TCERT_NAME_BLOB;
      NotBefore:TDATETIME;
      NotAfter:TDATETIME;
      Subject:TCERT_NAME_BLOB;
      SubjectPublicKeyInfo:TCERT_PUBLIC_KEY_INFO;
      IssuerUniqueId:TCRYPT_BIT_BLOB;
      SubjectUniqueId:TCRYPT_BIT_BLOB;
      cExtension:LONGWORD;
      rgExtension:PCERT_EXTENSION;
   End;

///////////////////////////////////////////////////////////////////////////////
// MSDN:
// The CERT_CONTEXT structure contains both the encoded and decoded
// representations of a certificate. A certificate context returned by one
// of the functions defined in Wincrypt.h must be freed by calling the
// CertFreeCertificateContext function. The CertDuplicateCertificateContext
// function can be called to make a duplicate copy (which also must be
// freed by calling CertFreeCertificateContext).
///////////////////////////////////////////////////////////////////////////////
   PCERT_CONTEXT=^TCERT_CONTEXT;
   TCERT_CONTEXT = packed record
      dwCertEncodingType:LONGWORD;
      pbCertEncoded:^BYTE;
      cbCertEncoded:LONGWORD;
      pCertInfo:^PCERT_INFO;
      hCertStore:HCERTSTORE;
   End;

implementation

end.
