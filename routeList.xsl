<?xml version="1.0" encoding="UTF-8" ?>
<!--
   Author: 
   Date:   

   Filename:         routeList.xsl
   Supporting Files: 
-->


<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   
    <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />

   <xsl:template match="/">
      <html>
         <head>
            <title>Climbing Goal Dashboard</title>
            
             <!-- Required meta tags -->
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
             <!--Headers for date chooser-->
             <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
            <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
            <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
             

            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
            <!-- My custom Stylesheet -->
            <link href="style.css" rel="stylesheet" type="text/css" />
        </head>

            <body>
                <h1>New Listings</h1>
                <table class="table table-hover">
                  <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Location</th>
                        <th scope="col">Difficulty</th>
                        <th scope="col">Rating</th>
                        <th scope="col">Completed</th>
                        <th scope="col">Date Completed</th>
                        
                    </tr>
                  </thead>
                  <tbody>
                      <form method="POST" action="index.php">
                        <xsl:for-each select="routes/route">
                            <xsl:variable name="i" select="position()" />
                            <xsl:variable name="thisName">
                                <xsl:value-of select="Name" />
                            </xsl:variable>
                            <tr>
                                <th scope="row">
                                    <xsl:copy>
                                        <xsl:value-of select="$i" />
                                    </xsl:copy>
                                
                                </th>
                                
                                <!--Create variable so quotes can be removed-->
                                <xsl:variable name='routeString'>
                                    <xsl:value-of select="Route" />
                                </xsl:variable>
                                <!--Create variable so location can be formatted-->
                                 <xsl:variable name='fullRouteLocation'>
                                    <xsl:value-of select="Location" />
                                </xsl:variable>
                                <!--Get crag name by only selecting text before &gt-->
                                <xsl:variable name='justCragName'>
                                    <xsl:value-of select="substring-before($fullRouteLocation,'&gt;')"/>
                                </xsl:variable>
                                
                       
                            
                                <!--Remove quotes from route names-->
                                <td id="name">
                                    <xsl:value-of select="replace($routeString, '&quot;','')" />
                                </td>
                                <!--Remove quotes from crag names-->
                                <td><xsl:value-of select="replace($justCragName, '&quot;','')" /></td>
                                <td><xsl:value-of select="Rating" /></td>
                                <td><xsl:value-of select="Avg_Stars" /></td>
                                <td> 
                                    
                                </td>
                                <td>
                                    
                                </td>
                                <td>
                               
                                    
                                </td>
                                
                            </tr>
                        </xsl:for-each>
                          </form>
                    </tbody>
             </table>
                    
          
          </body>

      </html>
   </xsl:template>
    
</xsl:stylesheet>
