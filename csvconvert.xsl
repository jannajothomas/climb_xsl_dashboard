<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 8
   Tutorial Case

   Style Sheet to Collate Shipping Documents
   Author: Janna Thomas
   Date:   Mar 15, 2021
   Filename:         collection.xsl
   Supporting Files: 
-->

<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:xs="http://www.w3.org/2001/XMLSchema"
     exclude-result-prefixes="xs">
    
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*"/>
    <xsl:param name="csvFile" as="xs:string" />
    <xsl:param name="root" as="xs:string" />
    <xsl:param name="record" as="xs:string" />
    
    <xsl:variable name="dataText" select="unparsed-text($csvFile)" as="xs:string" />
    
    <xsl:template name="csvConvert">
        <xsl:variable name="rows" select="tokenize($dataText, '\r?\n')" as="xs:string*" />
        <xsl:variable name="elemNames" select="tokenize($rows[1], ',')" as="xs:string+" />
        
        <xsl:element name="{$root}">
            <xsl:for-each select="$rows[position()>1]">
                <xsl:element name="{$record}">
                    <xsl:variable name="dataValues" select="tokenize(., ',')" as="xs:string*" />
                    <xsl:for-each select="$elemNames">
                        <xsl:variable name="thisElementName" select="." />
                        <xsl:element name="{replace(replace($thisElementName,'\s','_'),'&quot;','')}">
                            
                            <xsl:choose>
                                <xsl:when test="$thisElementName != ''">
                                        <xsl:value-of select="$dataValues[index-of($elemNames, $thisElementName)]" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="0" />
                                </xsl:otherwise>
                            </xsl:choose>
                            </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

