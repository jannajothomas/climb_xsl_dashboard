
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

    $tickURL="https://www.mountainproject.com/user/200907314/janna-thomas/tick-export";
    $ticksCSV = file_get_contents($tickURL);
    //echo $ticksCSV;
    
    $routesURL="https://www.mountainproject.com/route-finder-export?type=rock&diffMinrock=1000&diffMinboulder=20000&diffMinaid=70000&diffMinice=30000&diffMinmixed=50000&diffMaxrock=12400&diffMaxboulder=20050&diffMaxaid=75260&diffMaxice=38500&diffMaxmixed=60000&is_sport_climb=1&stars=0&pitches=0&selectedIds=105867829";
        
    $routesCSV = file_get_contents($routesURL);
    //echo $routesCSV;
    $output = shell_exec('commaIssue $routesCSV');
    echo $output;

echo "Test2";
    $domTicksCSV = new DOMDocument();
echo "Test3";
    $domTicksCSV->load($ticksCSV);
echo "Test4";
    $csvConvert=new DOMDocument();
echo "Test5";
    $csvConvert->load('csvconvert.xsl');
echo "test6";
    $csvConvertProcessor = new XSLTProcessor();
echo "Test7";
    $csvConvertProcessor->importStyleSheet($csvConvert);
echo "Test8";
    echo $csvConvertProcessor->transformToXML($ticksCSV);
echo "test9";
    //$ticksCSVFile = fopen("ticks.csv","w");
    //fwrite($ticksCSVFile, $csvConvertProcessor);
    //fclose($ticksCSVFile);

/*
    //pull routes and save as routes.csv
    $routesURL="https://www.mountainproject.com/route-finder-export?type=rock&diffMinrock=1000&diffMinboulder=20000&diffMinaid=70000&diffMinice=30000&diffMinmixed=50000&diffMaxrock=12400&diffMaxboulder=20050&diffMaxaid=75260&diffMaxice=38500&diffMaxmixed=60000&is_sport_climb=1&stars=0&pitches=0&selectedIds=105867829"
        
    $routesCSV = file_get_contents($routesURL);
    $domRoutesCSV = new DOMDocument();
    $domRoutesCSV->load($routesCSV);

    //$csvConvert=newDOMDocument();
    //$csvConvert->load('csvconvert.xsl');
    
    //$csvConvertProcessor = new XSLTProcessor();
    //$csvConvertProcessor->importStyleSheet($csvConvert);
    
    echo $csvConvertProcessor->transformToXML($routesCSV);
    
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
echo $proc->transformToXML($xml);*/
?> 