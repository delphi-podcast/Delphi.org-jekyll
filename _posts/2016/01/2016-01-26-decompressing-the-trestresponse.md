---
id: 2204
title: 'Decompressing the TRESTResponse'
date: '2016-01-26T09:56:23-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2204'
permalink: /2016/01/decompressing-the-trestresponse/
categories:
    - News
tags:
    - compression
    - GZIP
    - JSON
    - News
    - REST
    - TIdCompressorZLib
    - TRESTClient
    - TRESTResponse
---

RAD Studio, Delphi and C++ 10 Seattle has a fantastic <a href="http://docwiki.embarcadero.com/RADStudio/en/REST_Client_Library">REST Client Library</a>. If you are unfamiliar with it, check out my <a href="http://delphi.org/2015/10/rest-client-video-challenge/">5 Minute REST Client video</a>.

The <strong><a href="http://docwiki.embarcadero.com/Libraries/en/REST.Client.TRESTRequest">TRESTRequest</a></strong> component has an <em>AcceptEncoding</em> property where you can specify the type of compression you would like applied to the response. The <strong><a href="http://docwiki.embarcadero.com/Libraries/en/REST.Client.TRESTResponse">TRESTResponse</a></strong> component has a <em>ContentEncoding</em> property that specifies the the encoding that the server chose. The most common compression encoding is <strong>gzip</strong>, followed by <strong>deflate</strong>. The others are rarely used (although <a href="http://google-opensource.blogspot.com/2015/09/introducing-brotli-new-compression.html">brotli</a> is a new compression that looks promising for the future.)

By default it is not encrypted if you leave AcceptEncoding blank. However when you use the <a href="https://api.stackexchange.com/docs">Stack Overflow API</a> it <a href="https://api.stackexchange.com/docs/compression">always compresses</a> with gzip if nothing is specified.

The TRESTResponse has two ways to access the response data directly, the RawBytes property and the Content property. Both are read-only. So we can read the compressed response data, but cannot update the TRESTResponse with the decompressed data. Updating the TRESTReponse allows it to work with the <a href="http://docwiki.embarcadero.com/Libraries/Seattle/en/REST.Response.Adapter.TRESTResponseDataSetAdapter">TRESTResponseDataSetAdapter</a>, which is a fantastic feature.

Luckily we can use the protected mode workaround to update the value. Here is a unit that you can include in your project to easily decompress the TRESTResponse and continue to use it with the Data Set Adapter.

[delphi]
unit RestDecompress;

interface

uses
  System.SysUtils, System.Types, System.Classes, IPPeerClient, REST.Client;

procedure DecodeRestResponse(ARestResponse: TRESTResponse);

implementation

uses
  System.Zlib,
  IdBaseComponent, IdException, IdZLibCompressorBase, IdCompressorZLib;

  type // protected mode work around
  TProtectedRESTResponse = class(TRESTResponse)
  end;


procedure DecodeRestResponse(ARestResponse: TRESTResponse);
var
  LCompressed: TMemoryStream;
  LDecompressed: TStringStream;
  LDecompress: TIdCompressorZLib;
begin
  if Length(ARestResponse.ContentEncoding) = 0 then exit;

  LCompressed := nil;
  LDecompressed := nil;
  LDecompress := nil;
  try
    LCompressed := TMemoryStream.Create;
    LDecompressed := TStringStream.Create;

    LCompressed.WriteData(ARESTResponse.RawBytes, Length(ARESTResponse.RawBytes));
    LCompressed.Position := 0;

    // Use the Indy decompression libraries because the HTTP stream doesn't
    //   have the proper headers that System.ZLib looks for.

    LDecompress :=TIdCompressorZLib.Create();

    if ARestResponse.ContentEncoding = 'gzip' then
      LDecompress.DecompressGZipStream(LCompressed, LDecompressed)
    else if ARestResponse.ContentEncoding = 'deflate' then
    begin
      // Due to variations in the deflate server side implementations,
      //   this rarely works, but is here for completeness and just in case
      LDecompress.DecompressHTTPDeflate(LCompressed, LDecompressed);
    end;

    TProtectedRESTResponse(ARESTResponse).SetContent(LDecompressed.DataString);
  finally
    LDecompressed.Free;
    LCompressed.Free;
    LDecompress.Free;
  end;
end;

end.
[/delphi]

Simply use this unit, and then add a call to DecodeRestResponse(RESTResponse) to RESTResponse's OnAfterExecute event handler. It checks the ContentEncoding and then uses the correct decompression and updates the content.

You'll notice it uses the Indy <strong>TIdCompressorZLib</strong> component instead of the new System.ZLib library. The reason is a GZip encoded HTTP response doesn't include the full headers expected by the ZLib library. There is a way to work around this, but no need to do that since the Indy library works fine.
