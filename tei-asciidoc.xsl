<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs tei" version="2.0">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>
  <xsl:preserve-space elements="tei:p"/>
  <xsl:template match="/">
    <xsl:apply-templates select="tei:TEI"/>
  </xsl:template>


  <xsl:template match="tei:TEI">
    
    <xsl:result-document>
      
    </xsl:result-document>
    <xsl:apply-templates select="tei:teiHeader | tei:text"/>
  </xsl:template>
  
  <!--Title and author-->
  <xsl:template match="tei:teiHeader">
    <xsl:variable name="titleName">
      <xsl:value-of select="lower-case(//tei:fileDesc/tei:titleStmt/tei:title)"/>
    </xsl:variable>
    <xsl:result-document href="{$titleName}.asc">= <xsl:apply-templates select="//tei:fileDesc/tei:titleStmt/tei:title"/><xsl:text>&#xa;</xsl:text>
<xsl:apply-templates select="//tei:sourceDesc//tei:author//tei:forename"/><xsl:text> </xsl:text><xsl:apply-templates
      select="//tei:sourceDesc//tei:author//tei:surname"/> 
v0.1 
:doctype: book
:toc: right

<xsl:for-each select="//tei:text/tei:body/tei:div">
  <xsl:variable name="chapterNumber">
    <xsl:number format="001"/>
  </xsl:variable>
<xsl:value-of>include::book/chapters/<xsl:value-of select="$chapterNumber"/>/<xsl:value-of select="$chapterNumber"/>.asc[]

</xsl:value-of>  
</xsl:for-each>
    </xsl:result-document>
  </xsl:template>
  <xsl:template match="tei:text">
    <xsl:apply-templates select="tei:body"/>
  </xsl:template>
  <xsl:template match="tei:body">
    <xsl:apply-templates select="tei:div"/>
  </xsl:template>


<!-- Match a chapter -->
  <xsl:template match="tei:body/tei:div">
    <xsl:variable name="chapterNumberFiles">
      <xsl:number format="001"/>
    </xsl:variable>
    <xsl:variable name="chapterNumber">
      <xsl:number/>
    </xsl:variable>
    <xsl:variable name="file" select="concat($chapterNumberFiles, '.asc')"/>
    <xsl:result-document href="book/chapters/{$chapterNumberFiles}/{$file}">
      <xsl:choose>
        <xsl:when test="tei:head">
          <xsl:value-of>[_<xsl:value-of select="$chapterNumber"/>]
== <xsl:value-of select="tei:head"/></xsl:value-of>
        </xsl:when>
        <xsl:otherwise>
<xsl:value-of>[_<xsl:value-of select="$chapterNumber"/>]
== <xsl:value-of select="$chapterNumber"/>

</xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
     <xsl:choose>
<!-- If there text directly below body/div, make one section -->
        <xsl:when test="tei:p">
include::sections/001.asc[]
        </xsl:when>
        <xsl:otherwise>
          <xsl:for-each select="tei:div">
            <xsl:variable name="sectionNumber">
              <xsl:number format="001"/>
            </xsl:variable>
<xsl:value-of>

include::sections/<xsl:value-of select="$sectionNumber"/>.asc[]</xsl:value-of>
          </xsl:for-each>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="tei:div"/>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="tei:body/tei:div/tei:p">
    <xsl:apply-templates/>
  </xsl:template>

<!--Handle a native section-->
  <xsl:template match="tei:body/tei:div/tei:div">
    <xsl:variable name="chapterNumber">
      <xsl:number count="tei:body/tei:div" format="001"/>
    </xsl:variable>
    <!-- This is for folder and file names -->
    <xsl:variable name="sectionNumberFiles">
      <xsl:number format="001"/>
    </xsl:variable>
    <!-- This is for numbering sections in text -->
    <xsl:variable name="sectionNumber">
      <xsl:number format="1"/>
    </xsl:variable>
    <xsl:result-document  href="book/chapters/{$chapterNumber}/sections/{$sectionNumberFiles}.asc">
      <xsl:choose>
        <xsl:when test="tei:head">
          <xsl:value-of select="."/>
        </xsl:when>
        <xsl:otherwise>
=== <xsl:value-of select="$sectionNumber"/><xsl:text>&#xa;</xsl:text>
        </xsl:otherwise>
      </xsl:choose>

      <xsl:apply-templates select="tei:p"/>
    </xsl:result-document>
  </xsl:template>

<!-- Make a section if there's only text beneath body/div -->
<xsl:template match="tei:body/tei:div[tei:p]">
  <xsl:variable name="chapterNumber">
    <xsl:number count="tei:body/tei:div" format="001"/>
  </xsl:variable>
  <xsl:result-document href="book/chapters/{$chapterNumber}/sections/001.asc">
<xsl:text>
[_1]
=== 1

</xsl:text>
<xsl:apply-templates select="tei:p"/>
  </xsl:result-document>
</xsl:template>

<xsl:template match="tei:p">
  <xsl:apply-templates/>
  
  
</xsl:template>

  <xsl:template match="tei:hi">
    <xsl:choose>
      <xsl:when test="@rend='italics'">
        _<xsl:value-of select="."/>_
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:app">
    <xsl:apply-templates select="tei:lem"/>
  </xsl:template>

</xsl:stylesheet>
