<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" encoding="utf-8" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:variable name="lbnr">
		<xsl:value-of select="//LB.NR"/>
	</xsl:variable>
	<xsl:template name="a">
		<xsl:for-each select="collection('/home/th/1401')">
			<xsl:result-document>
				<xsl:apply-templates select="/"></xsl:apply-templates>
			</xsl:result-document>				
		</xsl:for-each>
	</xsl:template>
	<!--<xsl:variable name="file">
		<xsl:for-each select="collection('/filebase/dipdan/dipred/Dd/1401')/DIPLOM[HOVED/LB.NR=$lbnr+1]">
				<xsl:value-of select="document-uri(.)" />
		</xsl:for-each>
	</xsl:variable>-->
	<xsl:template match="/">
			<xsl:apply-templates select="DIPLOM"/>
			<xsl:call-template name="a" />
	</xsl:template>
	<xsl:template match="DIPLOM">
		<TEI>
			<teiHeader>
				<fileDesc>
					<titleStmt>
						<title>Diplomatarium Danicum</title>
						<editor>
							<name xml:id="th">
								<persName>
									<forename type="first">Thomas</forename>
									<surname>Hansen</surname>
								</persName>
							</name>
						</editor>
						<funder>Carlsbergfondet</funder>
					</titleStmt>
					<publicationStmt>
						<publisher>Det Danske Sprog- og Litteraturselskab</publisher>
						<xsl:element name="pubPlace">København</xsl:element>
						<xsl:element name="date">2010</xsl:element>
						<idno type="dd">
							<xsl:call-template name="makeId"/>
						</idno>
						<idno type="isbn">nil</idno>
						<xsl:element name="availability">
							<xsl:element name="ab">Copyright &#169; 2010, Danske Sprog- og
								Litteraturselskab</xsl:element>
						</xsl:element>
					</publicationStmt>
					<xsl:element name="sourceDesc">
						<xsl:element name="listWit">
							<xsl:apply-templates select="//MANUS"/>
						</xsl:element>
					</xsl:element>
				</fileDesc>
				<encodingDesc>
					<samplingDecl>
						<ab>
							<xsl:apply-templates select="//TEKST//FORLAEG"/>
						</ab>
						<!--  -->
					</samplingDecl>
					<projectDesc>
						<ab>DD-4</ab>
					</projectDesc>
					<appInfo>
						<application xml:id="app_nil" type="nil" subtype="nil" ident="nil"
							version="99999999">
							<desc>nil</desc>
						</application>
					</appInfo>
				</encodingDesc>
				<profileDesc>
					<creation>
						<!-- Template DATUM-->
						<xsl:apply-templates select="//DATUM"/>
						<!-- Template STED -->
						<xsl:apply-templates select="//STED"/>
					</creation>
					<langUsage>
						<language ident="nil"/>
					</langUsage>
				</profileDesc>
				<revisionDesc>
					<change when="2010-09-21" who="#th">Filen etableret af #th 2010-09-21. </change>
					<change when="99999999" who="#nil">Kladde: 1. korrektur mangler. </change>
					<change when="99999999" who="#nil">Kladde: 2. korrektur mangler. </change>
					<change when="99999999" who="#nil">Kladde: 3. korrektur mangler. </change>
				</revisionDesc>
			</teiHeader>
			<text>
				<body>
					<div xml:lang="nil">
						<!-- Template TEKST -->
						<p>
							<xsl:apply-templates select="//SPALTE/FORLAEG/following-sibling::node()"
							/>
						</p>
					</div>
					<div xml:lang="da">
						<p>
								<xsl:apply-templates
									select="collection('/filebase/dipdan/dipred/Drb/1401')/DRBREV[HOVED/LB.NR=$lbnr]//SPALTE" />
						</p>
						<!-- Template oversættelse -->
					</div>
				</body>
			</text>
		</TEI>
	</xsl:template>
	<xsl:template match="//DATUM">
		<xsl:element name="date">
			<xsl:attribute name="cert">
				<xsl:choose>
					<xsl:when test="contains(., '[')">
						<xsl:value-of>
							<xsl:text>low</xsl:text>
						</xsl:value-of>
					</xsl:when>
					<xsl:when test="not(contains(., '['))">
						<xsl:value-of>
							<xsl:text>high</xsl:text>
						</xsl:value-of>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>nil</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="notBefore">
				<xsl:analyze-string select="." regex="(\d{{4}}).?\s*(\d{{1,2}}).?\s*(\c{{3,9}})">
					<!-- Forsøgte oprindelig denne regex 
						[(\d{{4}}).?\s*(\d{{1,2}}).?\s*(\c{{3,9}})-[\[\]]] 
						Men pga de skarpe parenteser, som skal sikre escape af '[' 
						og ']', kan jeg ikke referere til regex-group() ved 
						matching-substring-->
					<xsl:matching-substring>
						<xsl:value-of
							select="concat(regex-group(1), '-',
							if (regex-group(3) = 'januar') then '01' else '',
							if (regex-group(3) = 'februar') then '02' else '',
							if (regex-group(3) = 'marts') then '03' else '', 
							if (regex-group(3) = 'april') then '04' else '',
							if (regex-group(3) = 'maj') then '05' else '',
							if (regex-group(3) = 'juni') then '06' else '',
							if (regex-group(3) = 'juli') then '07' else '',
							if (regex-group(3) = 'august') then '08' else '',
							if (regex-group(3) = 'september') then '09' else '',
							if (regex-group(3) = 'oktober') then '10' else '',
							if (regex-group(3) = 'november') then '11' else '',
							if (regex-group(3) = 'december') then '12' else '','-', 
							if (regex-group(2) = '1') then '01' else '',
							if (regex-group(2) = '2') then '02' else '',
							if (regex-group(2) = '3') then '03' else '',
							if (regex-group(2) = '4') then '04' else '',
							if (regex-group(2) = '5') then '05' else '',
							if (regex-group(2) = '6') then '06' else '',
							if (regex-group(2) = '7') then '07' else '',
							if (regex-group(2) = '8') then '08' else '',
							if (regex-group(2) = '9') then '09' else regex-group(2)
							)"
						/>
					</xsl:matching-substring>
				</xsl:analyze-string>
			</xsl:attribute>
			<xsl:attribute name="notAfter">
				<xsl:analyze-string select="." regex="(\d{{4}}).?\s*(\d{{1,2}}).?\s*(\c{{3,9}})">
					<!-- Forsøgte oprindelig denne regex 
						[(\d{{4}}).?\s*(\d{{1,2}}).?\s*(\c{{3,9}})-[\[\]]] 
						Men pga de skarpe parenteser, som skal sikre escape af '[' 
						og ']', kan jeg ikke referere til regex-group() ved 
						matching-substring-->
					<xsl:matching-substring>
						<xsl:value-of
							select="concat(regex-group(1), '-',
							if (regex-group(3) = 'januar') then '01' else '',
							if (regex-group(3) = 'februar') then '02' else '',
							if (regex-group(3) = 'marts') then '03' else '', 
							if (regex-group(3) = 'april') then '04' else '',
							if (regex-group(3) = 'maj') then '05' else '',
							if (regex-group(3) = 'juni') then '06' else '',
							if (regex-group(3) = 'juli') then '07' else '',
							if (regex-group(3) = 'august') then '08' else '',
							if (regex-group(3) = 'september') then '09' else '',
							if (regex-group(3) = 'oktober') then '10' else '',
							if (regex-group(3) = 'november') then '11' else '',
							if (regex-group(3) = 'december') then '12' else '','-', 
							if (regex-group(2) = '1') then '01' else '',
							if (regex-group(2) = '2') then '02' else '',
							if (regex-group(2) = '3') then '03' else '',
							if (regex-group(2) = '4') then '04' else '',
							if (regex-group(2) = '5') then '05' else '',
							if (regex-group(2) = '6') then '06' else '',
							if (regex-group(2) = '7') then '07' else '',
							if (regex-group(2) = '8') then '08' else '',
							if (regex-group(2) = '9') then '09' else regex-group(2)
							)"
						/>
					</xsl:matching-substring>
				</xsl:analyze-string>
			</xsl:attribute>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//STED">
		<xsl:choose>
			<xsl:when test="not(text())">
				<placeName cert="high">empty</placeName>
			</xsl:when>
			<xsl:otherwise>
				<placeName cert="empty">
					<xsl:apply-templates/>
				</placeName>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//MANUS">
		<witness>
			<xsl:attribute name="xml:id">
				<xsl:value-of select="ID"/>
			</xsl:attribute>
			<xsl:apply-templates select="OPL"/>
			<xsl:text> </xsl:text>
			<xsl:if test="position()=last()">
				<xsl:apply-templates select="//ANDET"/>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="position()=last()">
				<bibl>
					<xsl:apply-templates select="//TRYK"/>
					<xsl:apply-templates select="//REGISTR"/>
					<xsl:text> </xsl:text>
				</bibl>
			</xsl:if>
		</witness>
	</xsl:template>
	<xsl:template match="//REGEST">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="REGISTR">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="TRYK">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="//FORLAEG">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="//SPALTE">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="//SPALTE//fh">
		<xsl:element name="ex">
			<xsl:value-of select="text()"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//OPL/fh/fh">
		<xsl:value-of select="text()"/>
	</xsl:template>
	<xsl:template name="makeId">
		<xsl:analyze-string select="//DATUM" regex="(\d{{4}}).?\s*(\d{{1,2}}).?\s*(\c{{3,9}})">
			<!-- Forsøgte oprindelig denne regex 
				[(\d{{4}}).?\s*(\d{{1,2}}).?\s*(\c{{3,9}})-[\[\]]] 
				Men pga de skarpe parenteser, som skal sikre escape af '[' 
				og ']', kan jeg ikke referere til regex-group() ved 
				matching-substring-->
			<xsl:matching-substring>
				<xsl:value-of
					select="concat(regex-group(1), '',
					if (regex-group(3) = 'januar') then '01' else '',
					if (regex-group(3) = 'februar') then '02' else '',
					if (regex-group(3) = 'marts') then '03' else '', 
					if (regex-group(3) = 'april') then '04' else '',
					if (regex-group(3) = 'maj') then '05' else '',
					if (regex-group(3) = 'juni') then '06' else '',
					if (regex-group(3) = 'juli') then '07' else '',
					if (regex-group(3) = 'august') then '08' else '',
					if (regex-group(3) = 'september') then '09' else '',
					if (regex-group(3) = 'oktober') then '10' else '',
					if (regex-group(3) = 'november') then '11' else '',
					if (regex-group(3) = 'december') then '12' else '','', 
					if (regex-group(2) = '1') then '01' else '',
					if (regex-group(2) = '2') then '02' else '',
					if (regex-group(2) = '3') then '03' else '',
					if (regex-group(2) = '4') then '04' else '',
					if (regex-group(2) = '5') then '05' else '',
					if (regex-group(2) = '6') then '06' else '',
					if (regex-group(2) = '7') then '07' else '',
					if (regex-group(2) = '8') then '08' else '',
					if (regex-group(2) = '9') then '09' else regex-group(2), '001'
					)"
				/>
			</xsl:matching-substring>
		</xsl:analyze-string>
	</xsl:template>
	<xsl:template match="K-ref">
		<xsl:variable name="notenr">
			<xsl:value-of select="@noteid"/>
		</xsl:variable>
		<xsl:for-each select="//KRIT[@noteid=$notenr]">
			<app>
				<lem>
					<xsl:apply-templates select="REF"/>
				</lem>
				<rdg>
					<xsl:apply-templates select="OPL"/>
				</rdg>
			</app>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
