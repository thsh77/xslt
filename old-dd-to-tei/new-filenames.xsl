<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	exclude-result-prefixes="xs tei" version="2.0">
	<xsl:output method="xml" encoding="utf-8" indent="yes"/>
	<!--<xsl:strip-space elements="*"/>-->
	<xsl:template match="/">
		<xsl:variable name="ddNumber" select="concat(//tei:idno[@type='dd'], '.xml')"/>
		<xsl:result-document href="{$ddNumber}">
			<xsl:copy-of select="."/>
		</xsl:result-document>
	</xsl:template>
</xsl:stylesheet>
