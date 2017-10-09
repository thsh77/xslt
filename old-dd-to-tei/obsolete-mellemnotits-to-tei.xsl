<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
	<xsl:output method="xml" encoding="utf-8" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:variable name="lbnr">
		<xsl:value-of select="//LB.NR"/>
	</xsl:variable>
	<!--<xsl:variable name="translation"
		select="document('file:///home/th/dipdan/dipred/dd-drb_5rk/thomas/dev/xml/dd4/translations/translate1412.xml')/items/item[number=$lbnr]"/>-->
	<!--<xsl:template name="a">
		<xsl:for-each select="collection('/home/th/1401')">
			<xsl:result-document href="concat(position(), '.xml')">
				<xsl:apply-templates select="/"></xsl:apply-templates>
			</xsl:result-document>				
		</xsl:for-each>
	</xsl:template>-->
	<!--<xsl:variable name="file">
		<xsl:for-each select="collection('/filebase/dipdan/dipred/Dd/1401')/DIPLOM[HOVED/LB.NR=$lbnr+1]">
				<xsl:value-of select="document-uri(.)" />
		</xsl:for-each>
		</xsl:variable>-->
	<xsl:variable name="makeId">
		<xsl:analyze-string select="//ML.TXT/fed" regex="(\d{{4}}).?\s*(\d{{1,2}}).?\s*(\c{{3,9}})">
			<!-- Forsøgte oprindelig denne regex 
			[(\d{{4}}).?\s*(\d{{1,2}}).?\s*(\c{{3,9}})-[\[\]]] 
			Men pga de skarpe parenteser, som skal sikre escape af '[' 
			og ']', kan jeg ikke referere til regex-group() ved 
			matching-substring-->
			<xsl:matching-substring>
				<xsl:value-of
					select="concat(regex-group(1),
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
				if (regex-group(3) = 'december') then '12' else '', 
				if (regex-group(2) = '1') then '01' else '',
				if (regex-group(2) = '2') then '02' else '',
				if (regex-group(2) = '3') then '03' else '',
				if (regex-group(2) = '4') then '04' else '',
				if (regex-group(2) = '5') then '05' else '',
				if (regex-group(2) = '6') then '06' else '',
				if (regex-group(2) = '7') then '07' else '',
				if (regex-group(2) = '8') then '08' else '',
				if (regex-group(2) = '9') then '09' else '',
				if (regex-group(2) = '10') then '10' else '',
				if (regex-group(2) = '11') then '11' else '',
				if (regex-group(2) = '12') then '12' else '',
				if (regex-group(2) = '13') then '13' else '',
				if (regex-group(2) = '14') then '14' else '',
				if (regex-group(2) = '15') then '15' else '',
				if (regex-group(2) = '16') then '16' else '',
				if (regex-group(2) = '17') then '17' else '',
				if (regex-group(2) = '18') then '18' else '',
				if (regex-group(2) = '19') then '19' else '',
				if (regex-group(2) = '20') then '20' else '',
				if (regex-group(2) = '21') then '21' else '',
				if (regex-group(2) = '22') then '22' else '',
				if (regex-group(2) = '23') then '23' else '',
				if (regex-group(2) = '24') then '24' else '',
				if (regex-group(2) = '25') then '25' else '',
				if (regex-group(2) = '26') then '26' else '',
				if (regex-group(2) = '27') then '27' else '',
				if (regex-group(2) = '28') then '28' else '',
				if (regex-group(2) = '29') then '29' else '',
				if (regex-group(2) = '30') then '30' else '',
				if (regex-group(2) = '31') then '31' else '','001'
				)"
				/>
			</xsl:matching-substring>
		</xsl:analyze-string>
	</xsl:variable>
	<xsl:template match="/">
		<xsl:apply-templates select="DIPLOM"/>
	</xsl:template>
	<xsl:template match="DIPLOM">
		<TEI xmlns="http://www.tei-c.org/ns/1.0">
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
					<extent>
						<xsl:text>Base text, number of words: </xsl:text>
						<num n="words">99999999</num>
						<xsl:text>, paragraphs: </xsl:text>
						<num n="paragraphs">99999999</num>
						<xsl:text>. Translation, number of words: </xsl:text>
						<num n="words">99999999</num>
						<xsl:text>, paragraphs: </xsl:text>
						<num n="paragraphs">99999999</num>
					</extent>
					<publicationStmt>
						<publisher>Det Danske Sprog- og Litteraturselskab</publisher>
						<xsl:element name="pubPlace">København</xsl:element>
						<xsl:element name="date">2010</xsl:element>
						<idno type="dd">
							<xsl:value-of select="$makeId"/>
						</idno>
						<idno type="isbn">nil</idno>
						<idno type="dd-4">
							<xsl:variable name="filename">
								<xsl:value-of
									select="substring-after(substring-before(base-uri(), '.xml'), '/Users/th/Documents/Dsl/DipDan/XML/rk4/Dd/1401')"
								/>
							</xsl:variable>
							<xsl:value-of select="substring-after($filename, '/')"/>
						</idno>
						<idno type="dd-4-lbnr">
							<xsl:value-of select="$lbnr"/>
						</idno>
						<idno type="dd-4-kartotek">
							<xsl:value-of select="//KARTOTEK"/>
						</idno>
						<availability status="restricted">
							<ab>Copyright &#169; 2011, Danske Sprog- og Litteraturselskab</ab>
						</availability>
					</publicationStmt>
					<xsl:element name="sourceDesc">
						<listWit>
							<witness xml:id="empty">
								<msDesc>
									<msIdentifier>
										<settlement>empty</settlement>
										<repository>empty</repository>
										<idno>empty</idno>
										<msName>empty</msName>
									</msIdentifier>
									<msContents>
										<summary>
											<xsl:apply-templates select="//ML.TXT"/>
										</summary>
										<msItemStruct/>
									</msContents>
									<physDesc>
										<objectDesc>
											<supportDesc material="empty">
												<support>
													<ab>empty</ab>
												</support>
												<extent>
													<dimensions unit="cm">
														<width>0</width>
														<height>0</height>
													</dimensions>
												</extent>
												<condition>
													<ab>empty</ab>
												</condition>
											</supportDesc>
										</objectDesc>
										<handDesc>
											<handNote>
												<ab>empty</ab>
											</handNote>
										</handDesc>
										<additions>
											<ab>empty</ab>
										</additions>
										<sealDesc>
											<seal n="0" type="empty">
												<ab>empty</ab>
											</seal>
										</sealDesc>
									</physDesc>
									<history>
										<ab>empty</ab>
									</history>
									<additional>
										<listBibl>
											<bibl>empty</bibl>
										</listBibl>
									</additional>
								</msDesc>
							</witness>
						</listWit>
					</xsl:element>
				</fileDesc>
				<encodingDesc>
					<samplingDecl>
						<ab>empty</ab>
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
						<date cert="high" notBefore="1401" notAfter="1401"> 1401 </date>
						<placeName cert="high">empty</placeName>
					</creation>
					<langUsage>
						<language ident="empty"/>
					</langUsage>
				</profileDesc>
				<revisionDesc>
					<change>
						<xsl:attribute name="when">
							<xsl:value-of select="current-dateTime()"/>
						</xsl:attribute>
						<xsl:attribute name="who">#th</xsl:attribute> Filen etableret af #th
							<xsl:value-of select="current-dateTime()"/>
					</change>
					<change when="99999999" who="#nil">Kladde: 1. korrektur mangler. </change>
					<change when="99999999" who="#nil">Kladde: 2. korrektur mangler. </change>
					<change when="99999999" who="#nil">Kladde: 3. korrektur mangler. </change>
				</revisionDesc>
			</teiHeader>
			<text>
				<body>
					<div xml:lang="empty">
						<p/>
					</div>
					<div xml:lang="empty">
						<p/>
					</div>
				</body>
			</text>
		</TEI>
	</xsl:template>
	<xsl:template match="ML.NOTITS">
		<xsl:apply-templates/>
	</xsl:template>
</xsl:stylesheet>
