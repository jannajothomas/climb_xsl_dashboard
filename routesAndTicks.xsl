//Create a new XML doc.

//For each item in the route list create a new XML file with a new field for date completed.

//Create a new XML file that has Each route with a column for date
//If tick exists, transform the date

<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 7
   Tutorial Case

   Real Estate Listings Style Sheet
   Author: Janna Thomas
   Date:   3/3/2021q,90=?""
   Filename:         listings.xsl
   Supporting Files: 
-->

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   
    <xsl:variable name="ticksDoc" select="document('tickList.xml')" />
    
    <xsl:key name="tKey" match="Route" use="@id" />

    <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />


   <xsl:template match="/">
      <html>
         <head>
            <title>Real Estate Listings</title>
            <link href="brstyles.css" rel="stylesheet" type="text/css" />
         </head>

         <body>
            <div id="wrap">
               <header>
                  <img src="brlogo.png" alt="Bowline Realty" />
               </header>

               <h1>New Listings</h1>
                

               <xsl:for-each select="//Route[generate-id()=generate-id(key('routeNames', Route)[1])]">
                    <xsl:sort select="Route" />
                    <h2 id="{generate-id()}"><xsl:value-of select="Route" /></h2>
                
                    <xsl:apply-templates select="key('routeNames', Route)">
                        <xsl:sort select="" order="descending" />
                    </xsl:apply-templates>      
                </xsl:for-each>
             </div>
         </body>
      </html>
   </xsl:template>

   <xsl:template match="property">
      <table class="head" cellpadding="2">
         <tr>
            <th>Price</th>
            <td><xsl:value-of select="format-number(price,'$#,##0')" /></td>
            <th>Sq. Feet</th>
            <td><xsl:value-of select="sqfeet" /></td>
         </tr>
         <tr>
            <th rowspan="2">Address</th>
            <td rowspan="2">
               <xsl:value-of select="street" /><br />
               <xsl:value-of select="city" />, <xsl:value-of select="state" />
               <xsl:text> </xsl:text><xsl:value-of select="zip" />
            </td>
            <th>Baths</th>
            <td><xsl:value-of select="bathrooms" /></td>
         </tr>
         <tr>  
            <th>Bedrooms</th>
            <td><xsl:value-of select="bedrooms" /></td>
         </tr>
         <tr>	
            <th>Style</th>
            <td><xsl:value-of select="style" /></td>
            <th>Garage</th>
            <td><xsl:value-of select="garage" /></td>
         </tr>
         <tr>
            <th>Age</th>
            <td><xsl:value-of select="age" /></td>
            <th>Listing #</th>
            <td><xsl:value-of select="@rln" /></td>
         </tr>
         <tr>
            <td class="description" colspan="4">
               <xsl:value-of select="description" />
            </td>
         </tr>
        <tr>
            <th colspan="2">Real Estate Agency</th>
            <th colspan="2">Agent</th>
          </tr>
          <tr>
            <td colspan="2">
              <xsl:variable name="fID" select="@firm" />
              <xsl:for-each select="$routesDoc">
                <xsl:value-of select="key('rKey', $fID)/name" /> <br/>
                <xsl:value-of select="key('rKey', $fID)/street" /> <br/>
                <xsl:value-of select="key('rKey', $fID)/city" /> <br/>
                <xsl:value-of select="key('rKey', $fID)/state" /> <br/>
                <xsl:value-of select="key('rKey', $fID)/zip" /> <br/>
                <xsl:value-of select="key('rKey', $fID)/phone" /> <br/>
                <xsl:value-of select="key('rKey', $fID)/web" />    
            </xsl:for-each>
              </td>
              <td colspan="2">
              <xsl:variable name="aID" select="@agent" />
            <xsl:for-each select="$ticksDoc">
                <xsl:value-of select="key('tKey', $aID)/name" /> <br/>
                <xsl:value-of select="key('tKey', $aID)/phone" /> <br />
                <xsl:value-of select="key('tKey', $aID)/email" /> 
                
                </xsl:for-each>
            </td>
          </tr>
      </table>
   </xsl:template>
    
    <xsl:template match="property" mode="cityList">
        <a href="#{generate-id()}">
            <xsl:value-of select="city" /> 
        </a>
        (<xsl:value-of select="count(key('routeNames', city))" />) |
    </xsl:template>

</xsl:stylesheet>