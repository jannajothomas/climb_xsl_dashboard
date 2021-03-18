<?php

	if ($_POST["btn_sub"] == "") 
        {  
		echo you successfully posted;		 
	   } 



$xml = new DOMDocument();
$xml->load('routeList.xml');
 
$xsl = new DOMDocument;
$xsl->load('routeList.xsl');
 
$proc = new XSLTProcessor();
$proc->importStyleSheet($xsl);
 
echo $proc->transformToXML($xml);
?> 