<?php

	if ($_POST["btn_sub"] == "") 
        {  
		echo "you successfully posted";		 
	   } 
    else{
        echo "you didn't post";
    }

    if($_Post["checkbox"] == "")
    {
        echo  "checkbox"
    }
    else{
        echo "no Checkbox";
    }



$xml = new DOMDocument();
$xml->load('routeList.xml');
 
$xsl = new DOMDocument;
$xsl->load('routeList.xsl');
 
$proc = new XSLTProcessor();
$proc->importStyleSheet($xsl);
 
echo $proc->transformToXML($xml);
?> 