<?php

	if (isset($_POST["checkbox"])) { 
		$post_data = file_get_contents('php://input'); 
		echo "<div> POST BODY <br>".$post_data."</div>";		 
	} 



$xml = new DOMDocument();
$xml->load('routeList.xml');
 
$xsl = new DOMDocument;
$xsl->load('routeList.xsl');
 
$proc = new XSLTProcessor();
$proc->importStyleSheet($xsl);
 
echo $proc->transformToXML($xml);
?> 