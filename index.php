
<?php

//start a new session if none exists.
session_start(); 

    /*create session  variable if needed
        $_SESSION["Rollnumber"] = "11"; 
        */

    /*Later using session data.  
        echo 'The Name of the student is :' . $_SESSION["Name"] . '<br>';  
        */

    /*Destroy a session
        session_destroy();
        */  
        
    //get user name if desired


    //pull ticks and save as ticks.csv
        //https://www.mountainproject.com/user/200907314/janna-thomas/tick-export
    
    $ticksCSV = file_get_contents("https://www.mountainproject.com/user/200907314/janna-thomas/tick-export");
    $domTicksCSV = new DOMDocument();
    $domTicksCSV->load($ticksCSV);

    #echo $ticksCSV;    looks fine
    //$csvConvert=newDOMDocument();
    //$csvConvert->load('csvconvert.xsl');
    
    //$csvConvertProcessor = new XSLTProcessor();
    //$csvConvertProcessor->importStyleSheet($csvConvert);

    //echo $csvConvertProcessor->transformToXML($ticksCSV);

    //$ticksCSVFile = fopen("ticks.csv","w");
    //fwrite($ticksCSVFile, $csvConvertProcessor);
    //fclose($ticksCSVFile);


    //pull routes and save as routes.csv
        //https://www.mountainproject.com/route-finder-export?type=rock&diffMinrock=1000&diffMinboulder=20000&diffMinaid=70000&diffMinice=30000&diffMinmixed=50000&diffMaxrock=12400&diffMaxboulder=20050&diffMaxaid=75260&diffMaxice=38500&diffMaxmixed=60000&is_sport_climb=1&stars=0&pitches=0&selectedIds=105867829
    //transform ticks.csv to ticks.xml   prefer php, but can use script
    //transform routes.csc to routes.xml  prefer php, but can use script

    //create an updated routes list that marks ticked routes

//check POST variables
//Send parameters to xsl document

//Run and transformation
$xml = new DOMDocument();
$xml->load('routeList.xml');
 
$xsl = new DOMDocument;
$xsl->load('routeList.xsl');
 
$proc = new XSLTProcessor();
$proc->importStyleSheet($xsl);
 
//Create HTML output
echo $proc->transformToXML($xml);
?> 