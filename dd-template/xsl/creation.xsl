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
    <xsl:template name="creation">
        <creation>
            <date>
                <xsl:attribute name="when">
                    <xsl:apply-templates select="textCreationTimeEarliest"/>
                </xsl:attribute>
                <xsl:attribute name="notBefore">
                    <xsl:apply-templates select="textCreationTimeEarliest"/>
                </xsl:attribute>
                <xsl:attribute name="notAfter">
                    <xsl:apply-templates select="textCreationTimeLatest"/>
                </xsl:attribute>
                <xsl:attribute name="cert">
                    <xsl:apply-templates select="textCreationTimeCertainty"/>
                </xsl:attribute>
                <xsl:variable name="timeEarliest" select="textCreationTimeEarliest"/>
                <xsl:variable name="timeLatest" select="textCreationTimeLatest"/>
                <xsl:choose>
                    <xsl:when test="$timeEarliest=$timeLatest">
                        <xsl:choose>
                            <xsl:when
                                test="matches($timeEarliest, '([1][4][0-9][0-9])-([0-1][0-9])-([0-9][0-9])')">
                                <xsl:variable name="tE"
                                    select="format-date(xs:date($timeEarliest), '[Y]. [D]. [Mn]')"/>
                                <xsl:choose>
                                    <xsl:when test="contains($tE, 'january')">
                                        <xsl:value-of select="replace($tE, 'january', 'januar')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'february')">
                                        <xsl:value-of select="replace($tE, 'february', 'februar')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'march')">
                                        <xsl:value-of select="replace($tE, 'march', 'marts')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'may')">
                                        <xsl:value-of select="replace($tE, 'may', 'maj')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'june')">
                                        <xsl:value-of select="replace($tE, 'june', 'juni')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'july')">
                                        <xsl:value-of select="replace($tE, 'july', 'juli')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'october')">
                                        <xsl:value-of select="replace($tE, 'october', 'oktober')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$tE"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!--<xsl:value-of
                                    select="format-date(xs:date($timeEarliest), '[Y]. [D]. [Mn]')" />-->
                            </xsl:when>
                            <xsl:when
                                test="matches($timeEarliest, '([1][4][0-9][0-9])-([0-1][0-9])')">
                                <xsl:variable name="tE"
                                    select="format-date(xs:date(concat($timeEarliest, '-01')), '[Y]. [Mn]')"/>
                                <xsl:choose>
                                    <xsl:when test="contains($tE, 'january')">
                                        <xsl:value-of select="replace($tE, 'january', 'januar')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'february')">
                                        <xsl:value-of select="replace($tE, 'february', 'februar')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'march')">
                                        <xsl:value-of select="replace($tE, 'march', 'marts')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'may')">
                                        <xsl:value-of select="replace($tE, 'may', 'maj')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'june')">
                                        <xsl:value-of select="replace($tE, 'june', 'juni')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'july')">
                                        <xsl:value-of select="replace($tE, 'july', 'juli')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'october')">
                                        <xsl:value-of select="replace($tE, 'october', 'oktober')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$tE"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!--<xsl:value-of
                                    select="format-date(xs:date(concat($timeEarliest, '-01')), '[Y]. [Mn]')"
                                />-->
                            </xsl:when>
                            <xsl:when test="matches($timeEarliest, '([1][4][0-9][0-9])')">
                                <xsl:value-of
                                    select="format-date(xs:date(concat($timeEarliest, '-01-01')), '[Y].')"
                                />
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when
                                test="matches($timeEarliest, '([1][4][0-9][0-9])-([0-1][0-9])-([0-9][0-9])')">
                                <xsl:variable name="tE"
                                    select="format-date(xs:date($timeEarliest), '[Y]. [D]. [Mn]')"/>
                                <xsl:choose>
                                    <xsl:when test="contains($tE, 'january')">
                                        <xsl:value-of select="replace($tE, 'january', 'januar')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'february')">
                                        <xsl:value-of select="replace($tE, 'february', 'februar')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'march')">
                                        <xsl:value-of select="replace($tE, 'march', 'marts')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'may')">
                                        <xsl:value-of select="replace($tE, 'may', 'maj')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'june')">
                                        <xsl:value-of select="replace($tE, 'june', 'juni')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'july')">
                                        <xsl:value-of select="replace($tE, 'july', 'juli')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'october')">
                                        <xsl:value-of select="replace($tE, 'october', 'oktober')"/>
                                    </xsl:when>

                                    <xsl:otherwise>
                                        <xsl:value-of select="$tE"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!--<xsl:value-of
                                    select="format-date(xs:date($timeEarliest), '[Y]. [D]. [Mn]')"/>-->
                                <xsl:text> - </xsl:text>
                            </xsl:when>
                            <xsl:when
                                test="matches($timeEarliest, '([1][4][0-9][0-9])-([0-1][0-9])')">
                                <xsl:variable name="tE"
                                    select="format-date(xs:date(concat($timeEarliest, '-01')), '[Y]. [Mn]')"/>
                                <xsl:choose>
                                    <xsl:when test="contains($tE, 'january')">
                                        <xsl:value-of select="replace($tE, 'january', 'januar')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'february')">
                                        <xsl:value-of select="replace($tE, 'february', 'februar')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'march')">
                                        <xsl:value-of select="replace($tE, 'march', 'marts')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'may')">
                                        <xsl:value-of select="replace($tE, 'may', 'maj')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'june')">
                                        <xsl:value-of select="replace($tE, 'june', 'juni')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'july')">
                                        <xsl:value-of select="replace($tE, 'july', 'juli')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tE, 'october')">
                                        <xsl:value-of select="replace($tE, 'october', 'oktober')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$tE"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!--<xsl:value-of
                                    select="format-date(xs:date(concat($timeEarliest, '-01')), '[Y]. [Mn]')"/>-->
                                <xsl:text> - </xsl:text>
                            </xsl:when>
                            <xsl:when test="matches($timeEarliest, '([1][4][0-9][0-9])')">
                                <xsl:value-of
                                    select="format-date(xs:date(concat($timeEarliest, '-01-01')), '[Y].')"/>
                                <xsl:text> - </xsl:text>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when
                                test="matches($timeLatest, '([1][4][0-9][0-9])-([0-1][0-9])-([0-9][0-9])')">
                                <xsl:variable name="tL"
                                    select="format-date(xs:date($timeLatest), '[Y]. [D]. [Mn]')"/>
                                <xsl:choose>
                                    <xsl:when test="contains($tL, 'january')">
                                        <xsl:value-of select="replace($tL, 'january', 'januar')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tL, 'february')">
                                        <xsl:value-of select="replace($tL, 'february', 'februar')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tL, 'march')">
                                        <xsl:value-of select="replace($tL, 'march', 'marts')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tL, 'may')">
                                        <xsl:value-of select="replace($tL, 'may', 'maj')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tL, 'june')">
                                        <xsl:value-of select="replace($tL, 'june', 'juni')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tL, 'july')">
                                        <xsl:value-of select="replace($tL, 'july', 'juli')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tL, 'october')">
                                        <xsl:value-of select="replace($tL, 'october', 'oktober')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$tL"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!--<xsl:value-of
                                    select="format-date(xs:date($timeLatest), '[Y]. [D]. [Mn]')"/>-->
                            </xsl:when>
                            <xsl:when test="matches($timeLatest, '([1][4][0-9][0-9])-([0-1][0-9])')">
                                <xsl:variable name="tL"
                                    select="format-date(xs:date(concat($timeLatest, '-01')), '[Y]. [Mn]')"/>
                                <xsl:choose>
                                    <xsl:when test="contains($tL, 'january')">
                                        <xsl:value-of select="replace($tL, 'january', 'januar')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tL, 'february')">
                                        <xsl:value-of select="replace($tL, 'february', 'februar')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tL, 'march')">
                                        <xsl:value-of select="replace($tL, 'march', 'marts')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tL, 'may')">
                                        <xsl:value-of select="replace($tL, 'may', 'maj')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tL, 'june')">
                                        <xsl:value-of select="replace($tL, 'june', 'juni')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tL, 'july')">
                                        <xsl:value-of select="replace($tL, 'july', 'juli')"/>
                                    </xsl:when>
                                    <xsl:when test="contains($tL, 'october')">
                                        <xsl:value-of select="replace($tL, 'october', 'oktober')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$tL"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!--<xsl:value-of
                                    select="format-date(xs:date(concat($timeLatest, '-01')), '[Y]. [Mn]')"
                                />-->
                            </xsl:when>
                            <xsl:when test="matches($timeLatest, '([1][4][0-9][0-9])')">
                                <xsl:value-of
                                    select="format-date(xs:date(concat($timeLatest, '-01-01')), '[Y].')"
                                />
                            </xsl:when>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="textCreationTimeNote[text()!='empty']">
                    <xsl:apply-templates select="textCreationTimeNote"/>
                </xsl:if>
            </date>
            <placeName>
                <xsl:attribute name="cert">
                    <xsl:choose>
                        <xsl:when test="matches(textCreationPlaceCertainty, 'empty')">
                            <xsl:text>unknown</xsl:text>
                        </xsl:when>
                        <xsl:when test="matches(textCreationPlaceCertainty, 'nil')">
                            <xsl:text>unknown</xsl:text>
                        </xsl:when>
                        <xsl:when test="matches(textCreationPlaceCertainty, 'high')">
                            <xsl:text>high</xsl:text>
                        </xsl:when>
                        <xsl:when test="matches(textCreationPlaceCertainty, 'low')">
                            <xsl:text>low</xsl:text>
                        </xsl:when>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:apply-templates select="textCreationPlace"/>
            </placeName>
        </creation>
    </xsl:template>
    <xsl:template match="textCreationTimeNote">
        <xsl:text> </xsl:text>
        <note>
            <xsl:apply-templates/>
        </note>
    </xsl:template>
</xsl:stylesheet>
