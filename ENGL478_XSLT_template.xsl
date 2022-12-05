<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="tei" version="2.0">

    <xsl:output method="html" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>

   

    <xsl:template match="/"> <!-- NOTICE THE SLASH THERE. In XPath this means root node (which in a TEI XML file is <TEI>).  
        
        I USE THIS TO ORGANIZE THE BASIC STRUCTURE  OF THE OUTPUT DOCUMENT. SO IT WILL INCLUDE BASIC DOCUMENT STRUCTURE TAGS AND ANY PULLING/REORGANIZING OF INFORMATION FROM THE ORIGINAL.-->
        
        <html>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>


   <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>


    <xsl:template match="tei:head">
        <h1>
            <xsl:apply-templates/>
        </h1>
        <br/>
    </xsl:template>
    
    
    <xsl:template match="tei:lg">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
       
    <xsl:template match="tei:l">
        <xsl:apply-templates/><br/>
    </xsl:template>    
    

    
    <xsl:template match="tei:lb">
        <xsl:apply-templates/><br/>
    </xsl:template>
    

    
    <xsl:template match="tei:hi[@rend='italic']">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    
    
    <xsl:template match="tei:choice/tei:corr"></xsl:template>
    
    
    <xsl:template match="tei:choice/tei:sic"><xsl:apply-templates/> [sic]
    </xsl:template>
    
    
    
    <xsl:template match="tei:note[@type='authorial']">
        <em><xsl:apply-templates/></em>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='instructions']/tei:list">
        <dl>
            <xsl:for-each select="child::tei:item">
                <dt><xsl:value-of select="."/></dt>
            </xsl:for-each>
        </dl>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='ingredients']/tei:list">
        <ul>
            <xsl:for-each select="child::tei:item">
                <li><xsl:value-of select="."/></li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader"/><!-- NOTICE THAT THIS ONE IS EMPTY. WE WILL TALK ABOUT WHAT THAT DOES. -->
    
    

</xsl:stylesheet>
