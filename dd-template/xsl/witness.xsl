<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:svg="http://www.w3.org/2000/svg" xmlns:math="http://www.w3.org/1998/Math/MathML"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes=" xs xi svg math" version="2.0">
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>
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
    <xsl:include href="extent2.xsl"/>
    <xsl:include href="support.xsl"/>
    <xsl:template match="witness">
        <witness>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="witnessSigil"/>
            </xsl:attribute>
            <msDesc>
                <msIdentifier>
                    <settlement>
                        <xsl:value-of select="archivePlaceName"/>
                    </settlement>
                    <repository>
                        <xsl:value-of select="archiveName" />
		</repository>
		<collection>
		  <xsl:value-of select="collectionName" />
		</collection>
                    <idno>
                        <xsl:value-of select="inventoryNumber" />
                    </idno>
                    <msName>
                        <xsl:value-of select="manuscriptName" />
                    </msName>
                </msIdentifier>
                <!--<msContents>
                    <xsl:apply-templates select="//summaryText" />
		   <msItemStruct>
                        <xsl:apply-templates select="filiationDescription"/>
		    </msItemStruct>
                </msContents>-->
                <physDesc>
                    <objectDesc>
                        <supportDesc>
                            <xsl:attribute name="material">
                                <xsl:value-of select="manuscriptMaterial" />
                            </xsl:attribute>
                            <xsl:call-template name="support" />
                            <xsl:call-template name="extent2" />
                            <xsl:apply-templates select="conditionDescription" />
                        </supportDesc>
                        <xsl:apply-templates select="layoutDescription" />
                    </objectDesc>
                    <xsl:apply-templates select="handDescription" />
                    <xsl:apply-templates select="additionsToText" />
                    <sealDesc>
                        <xsl:apply-templates select="seal" />
                    </sealDesc>
                </physDesc>
                <xsl:apply-templates select="witnessHistory" />
                <!--<additional>
                    <xsl:apply-templates select="../listBibl"/>
                </additional>-->
            </msDesc>
        </witness>
    </xsl:template>
</xsl:stylesheet>
