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
                        <th scope="col">Rating</th>
                        <th scope="col">Completed</th>
                        <th scope="col">Date Completed</th>
                        
                    </tr>
                  </thead>
                  <tbody>
                      <form id="form" method="post" action="">
                        <xsl:for-each select="routes/route">
                            <tr>
                                <th scope="row">1</th>
                                <td id="name"><xsl:value-of select="Name" /></td>
                                <td><xsl:value-of select="Location" /></td>
                                <td><xsl:value-of select="AvgStars" /></td>
                                <td> 
                                    <div class="form-check">
                                        <input class="form-check-input position-static checkbox" type="checkbox" id="blankCheckbox" value="option1" aria-label="..." onchange="$('#form').post();" name="checkbox" checked="true"/>
                                    </div>
                                </td>
                                <td>
                                    <xsl:if test="blackCheckbox"
                                    <!--<input id="datepicker" width="276" />
                                        <script>
                                            $('#datepicker').datepicker({
                                            uiLibrary: 'bootstrap4'
                                            });
                                        </script>-->
                                </td>
                                <td>
                                    <button type="button" class="btn btn-secondary btn-lg" disabled="yes">Update</button>
                                    
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
