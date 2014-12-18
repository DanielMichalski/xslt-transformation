@echo off
rem ==========================================================================
rem Usage: do <src_xml_file> <src_xls_file> <dest_xml_file> <page_type> <total_pages>
rem        defaults:
rem            <src_xml_file> - source file in xml format 
rem            <src_xls_file> - xls transformation file
rem            <dest_xml_file> - destination xml file
rem            <page_type> - page type
rem            <total_pages> - total pages
rem ===========================================================================
set srcxmlfile=input.xml
set srcxlsfile=prepdata.xsl
set destxmlfile=output.xml
set pagetype=COMPACT_IN_SE
set totalpages=1
rem echo Parametry: %srcxmlfile% %srcxlsfile% %destxmlfile% %pagetype% %totalpages%
if "%3" == "" goto step3
set sqlfile=%3
:step3
if "%2" == "" goto step2
set resfile=%2
:step2
if "%1" == "" goto start
set srcfile=%1
:start
echo %srcxmlfile% %srcxlsfile% %destxmlfile% %pagetype% %totalpages%
java -jar XsltTransform.jar %srcxmlfile% %srcxlsfile% %destxmlfile% %pagetype% %totalpages%
REM set resfile=
REM set srcfile=