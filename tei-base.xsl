<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
  xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei" version="2.0">
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>
  <xsl:preserve-space elements="tei:p"/>
  <xsl:template match="node() | @*">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="tei:ref | tei:note | tei:note/tei:p"/>
  <xsl:template match="/">
    <xsl:apply-templates select="tei:TEI"/>
  </xsl:template>
  <xsl:template match="tei:TEI">
    <xsl:apply-templates select="tei:text"/>
  </xsl:template>

  <!--text part-->
  <xsl:template match="tei:text">
    <xsl:apply-templates select="tei:body"/>
  </xsl:template>
  <xsl:template match="tei:body">
    <xsl:for-each select="tei:div[starts-with(@xml:id, 'workid')]">
      <xsl:variable name="work-dir">
        <xsl:value-of select="replace(tei:head/string(), ' ', '-')"/>
      </xsl:variable>
      <xsl:for-each select="tei:div[starts-with(@xml:id, 'workid')]">
        <!-- Extract page number from current section -->
        <xsl:variable name="from-page" select="tei:div//tei:pb/@n"/>          
        
        <xsl:variable name="author-dir">
          <xsl:value-of
            select="lower-case(concat(//tei:sourceDesc//tei:author//tei:surname, '_', //tei:sourceDesc//tei:author//tei:forename))"
          />
        </xsl:variable>
        <xsl:variable name="work-title">
          <xsl:value-of
            select="lower-case(replace((tei:head/normalize-space(text()[position() = 1])), ' ', '-'))"
          />
        </xsl:variable>
        <xsl:result-document href="{$author-dir}/{$work-dir}/{$work-title}.xml">
          <TEI>
            <teiHeader>
              <fileDesc>
                <titleStmt>
                  <title>
                    <xsl:value-of select="tei:head"/>
                  </title>
                  <author>
                    <xsl:value-of>
                      <xsl:value-of select="//tei:sourceDesc//tei:author//tei:surname"/>,
                        <xsl:value-of select="//tei:sourceDesc//tei:author//tei:forename"
                      /></xsl:value-of>
                  </author>
                  <editor xml:id="th"/>
                </titleStmt>
                <publicationStmt>
                  <publisher>Society for Danish Language and Literature</publisher>
                  <pubPlace>Copenhagen</pubPlace>
                  <date>
                    <xsl:value-of select="current-date()"/>
                  </date>
                  <idno/>
                  <availability status="free">
                    <ab>GNU license</ab>
                  </availability>
                </publicationStmt>
                <sourceDesc>
                  <listWit>
                    <witness xml:id="A">empty</witness>
                  </listWit>
                  <listBibl>
                    <xsl:copy-of select="//tei:sourceDesc/tei:bibl"/>
                    <xsl:value-of>
                      <xsl:value-of select="$from-page"/>
                    </xsl:value-of>
                  </listBibl>
                </sourceDesc>
              </fileDesc>
              <encodingDesc/>
              <profileDesc/>
              <revisionDesc/>
            </teiHeader>
            <text>
              <body>
                <xsl:copy-of select="."/>
              </body>
            </text>
          </TEI>
        </xsl:result-document>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
