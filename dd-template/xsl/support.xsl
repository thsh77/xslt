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
    <xsl:template name="support">
        <support>
            <ab>
                <xsl:choose>
                    <xsl:when test="contains(., 'parch')">
                        <xsl:text>Pergament</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(., 'paper')">
                        <xsl:text>Papir</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(., 'mixed')">
                        <xsl:text>Blandet</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(., 'nil')">
                        <xsl:text>nil</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(., 'empty')">
                        <xsl:text>empty</xsl:text>
                    </xsl:when>
                </xsl:choose>
            </ab>
        </support>
    </xsl:template>
</xsl:stylesheet>
