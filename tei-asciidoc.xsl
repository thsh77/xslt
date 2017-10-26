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
    <xsl:apply-templates select="tei:teiHeader|tei:text"/>
  </xsl:template>
  <!--Title and author-->
  <xsl:template match="tei:teiHeader">=<xsl:apply-templates select="//tei:fileDesc/tei:titleStmt/tei:title"/><xsl:text>&#xa;</xsl:text>
    <xsl:apply-templates select="//tei:sourceDesc//tei:author//tei:forename"/><xsl:text> </xsl:text><xsl:apply-templates select="//tei:sourceDesc//tei:author//tei:surname"/>
:doctype: book
  </xsl:template>
  <xsl:template match="tei:text">
    <xsl:apply-templates select="tei:body"/>
  </xsl:template>
  <xsl:template match="tei:body">
    <xsl:apply-templates select="tei:div"/>
  </xsl:template>
  <xsl:template match="tei:body/tei:div">
    <!--<xsl:number/>-->
    <xsl:choose>
      <xsl:when test="tei:head">
==<xsl:value-of select="tei:head"/><xsl:text>&#xa;</xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates select="tei:div"/>
  </xsl:template>
  <xsl:template match="tei:div/tei:div">
    <xsl:variable name="sectionNumber" >
      <xsl:number/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="tei:head">
        <xsl:value-of select="."/>
      </xsl:when>
      <xsl:otherwise>
===<xsl:value-of select="$sectionNumber"/><xsl:text>&#xa;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="tei:p"/>
  </xsl:template>

</xsl:stylesheet>
