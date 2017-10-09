<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:svg="http://www.w3.org/2000/svg" xmlns:math="http://www.w3.org/1998/Math/MathML"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes=" xs xi svg math" version="2.0">
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
        <xd:desc>
            <xd:detail>Licensed by Thomas Hansen under the Creative Commons Attribution-Share Alike
                3.0 United States license. You are free to copy, distribute, transmit, and remix
                this work, provided you attribute the work to Thomas Hansen as the original author
                and reference the Society for Danish Language and Literature [http://dsl.dk] for the
                work. If you alter, transform, or build upon this work, you may distribute the
                resulting work only under the same, similar or a compatible license. Any of the
                above conditions can be waived if you get permission from the copyright holder. For
                any reuse or distribution, you must make clear to others the license terms of this
                work. The best way to do this is with a link to the license
                [http://creativecommons.org/licenses/by-sa/3.0/deed.en].</xd:detail>
            <xd:p><xd:b>Created on:</xd:b> Jan 5, 2010</xd:p>
            <xd:p><xd:b>Author:</xd:b> Thomas Hansen</xd:p>
            <xd:copyright>2010, Society for Danish Language and Literature</xd:copyright>
        </xd:desc>
    </xd:doc>
    <xsl:include href="additionsToText.xsl"/>
    <xsl:include href="bibliographicEntry.xsl"/>
    <xsl:include href="conditionDescription.xsl"/>
    <xsl:include href="creation.xsl"/>
    <xsl:include href="editorInitials.xsl"/>
    <xsl:include href="extent.xsl"/>
    <!--<xsl:include href="filiationDescription.xsl"/>-->
    <xsl:include href="handDescription.xsl"/>
    <xsl:include href="language.xsl"/>
    <xsl:include href="layoutDescription.xsl"/>
    <xsl:include href="listBibl.xsl"/>
    <!--<xsl:include href="p.xsl"/>-->
    <xsl:include href="revision.xsl"/>
    <xsl:include href="samplingMethod.xsl"/>
    <xsl:include href="seal.xsl"/>
    <xsl:include href="summaryText.xsl"/>
    <!--<xsl:include href="text.xsl"/>-->
    <!--<xsl:include href="textLevelTemplates.xsl"/>-->
    <xsl:include href="witness.xsl"/>
    <xsl:include href="witnessHistory.xsl"/>
    <xsl:template match="/">
        <xsl:processing-instruction name="oxygen"
            select="'RNGSchema=&quot;http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng&quot;', 'type=&quot;xml&quot;'"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="ddTemplate">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader type="text">
                <fileDesc>
                    <titleStmt>
                        <title>Diplomatarium Danicum</title>
                        <editor>
                            <xsl:apply-templates select="editorInitials"/>
                        </editor>
                        <funder>Carlsbergfondet</funder>
                    </titleStmt>
                    <xsl:call-template name="extent"/>
                    <publicationStmt>
                        <publisher>Danske Sprog- og Litteraturselskab</publisher>
                        <pubPlace>København</pubPlace>
                        <date>
                            <xsl:value-of select="format-date(current-date(), '[Y]')"/>
                        </date>
                        <idno type="dd">
                            <xsl:value-of select="textId"/>
                        </idno>
                        <idno type="isbn">nil</idno>
                        <availability status="restricted">
                            <ab>Copyright &#169; <xsl:value-of
                                    select="format-date(current-date(), '[Y]')"/>, Danske Sprog- og
                                Litteraturselskab</ab>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <listWit>
                            <xsl:apply-templates select="witness"/>
                        </listWit>
                        <xsl:apply-templates select="listBibl"/>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <samplingDecl>
                        <xsl:apply-templates select="samplingMethod"/>
                    </samplingDecl>
                    <projectDesc>
                        <ab>DD-5</ab>
                    </projectDesc>
                    <appInfo>
                        <application xml:id="app_nil" type="nil" subtype="nil" ident="nil"
                            version="99999999">
                            <desc>nil</desc>
                        </application>
                    </appInfo>
                </encodingDesc>
                <profileDesc>
                    <xsl:call-template name="creation"/>
                    <xsl:call-template name="language"/>
                    <abstract>
                        <xsl:apply-templates select="summaryText"/>
                    </abstract>
                </profileDesc>
                <revisionDesc>
                    <xsl:apply-templates select="revision"/>
                </revisionDesc>
            </teiHeader>
            <facsimile>
                <graphic url="nil"/>
            </facsimile>
            <text>
                <body>
                    <div>
                        <xsl:attribute name="xml:lang">
                            <xsl:value-of select="textLanguage"/>
                        </xsl:attribute>
                        <xsl:apply-templates select="text"/>
                    </div>
                    <div xml:lang="da">
                        <xsl:apply-templates select="translation"/>
                    </div>
                </body>
            </text>
        </TEI>
    </xsl:template>
    <xsl:template match="text">
        <xsl:for-each select="p">
		<p>
			<xsl:attribute name="n">
				<xsl:text>a#</xsl:text>
				<xsl:number value="position()"></xsl:number>
</xsl:attribute><xsl:apply-templates />
</p>
</xsl:for-each>
</xsl:template>
    <xsl:template match="translation">
        <xsl:for-each select="p">
		<p>
			<xsl:attribute name="n">
				<xsl:text>b#</xsl:text><xsl:number value="position()"></xsl:number></xsl:attribute>
			<xsl:apply-templates />
</p>
</xsl:for-each>
</xsl:template>
    <!--<xsl:template match="text">
        <xsl:apply-templates select="node()"/>
        </xsl:template>-->
    <xsl:template match="app">
        <app>
            <xsl:apply-templates/>
        </app>
    </xsl:template>
    <!--<xsl:template match="bibl">
        <bibl>
            <xsl:apply-templates/>
        </bibl>
    </xsl:template>-->
    <xsl:template match="cit">
        <cit>
            <xsl:apply-templates/>
        </cit>
    </xsl:template>
    <xsl:template match="damage">
        <damage>
            <xsl:apply-templates/>
        </damage>
    </xsl:template>
    <xsl:template match="em">
	<emph>
             <xsl:apply-templates/>
        </emph>
    </xsl:template>
    <xsl:template match="ex">
        <ex>
            <xsl:apply-templates/>
        </ex>
    </xsl:template>
    <xsl:template match="figureDescription">
        <figure>
            <figDesc>
                <xsl:apply-templates />
            </figDesc>
        </figure>
    </xsl:template>
    <xsl:template match="hi">
        <hi>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()"/>
        </hi>
    </xsl:template>
    <xsl:template match="item">
        <item>
            <xsl:apply-templates/>
        </item>
    </xsl:template>
    <xsl:template match="lem">
        <lem>
            <xsl:apply-templates/>
        </lem>
    </xsl:template>
    <xsl:template match="list">
        <list>
            <xsl:apply-templates/>
        </list>
    </xsl:template>
    <xsl:template match="note">
        <note>
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="q">
        <q>
            <xsl:apply-templates/>
        </q>
    </xsl:template>
    <xsl:template match="quote">
        <quote>
            <xsl:apply-templates/>
        </quote>
    </xsl:template>
    <xsl:template match="ref">
	<ref>
	    <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="rdg">
        <rdg>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()"/>
        </rdg>
    </xsl:template>
    <xsl:template match="supplied">
        <supplied>
            <xsl:apply-templates/>
        </supplied>
    </xsl:template>
    <xsl:template match="persName">
        <persName>
            <xsl:apply-templates />
        </persName>
    </xsl:template>
    <xsl:template match="placeName">
        <placeName>
            <xsl:apply-templates />
        </placeName>
    </xsl:template>
</xsl:stylesheet>
