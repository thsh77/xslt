<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
	<xsl:output method="xml" encoding="utf-8" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:variable name="lbnr">
		<xsl:value-of select="//LB.NR"/>
	</xsl:variable>
	<xsl:variable name="translation"
		select="document('file:///home/th/dipdan/dipred/dd-drb_5rk/thomas/dev/xml/dd4/translations/translate1412.xml')/items/item[number=$lbnr]"/>
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
		<xsl:analyze-string select="//DATUM" regex="(\d{{4}}).?\s*(\d{{1,2}}).?\s*(\c{{3,9}})">
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
						<xsl:element name="date">2014</xsl:element>
						<idno type="dd">
							<xsl:value-of select="$makeId"/>
						</idno>
						<idno type="isbn">nil</idno>
						<idno type="dd-4">
							<xsl:variable name="filename">
								<xsl:value-of
									select="substring-after(substring-before(base-uri(), '.xml'), 'file:/filebase/dipdan/dipred/Dd/')"
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
							<ab>Copyright &#169; 2014, Danske Sprog- og Litteraturselskab</ab>
						</availability>
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
							<xsl:choose>
								<xsl:when test="//TEKST//FORLAEG">
									<xsl:value-of select="replace(//TEKST//FORLAEG, ':\s*$', '')"/>
								</xsl:when>
								<xsl:otherwise>Tekst efter nil</xsl:otherwise>
							</xsl:choose>
						</ab>
						<!--  -->
					</samplingDecl>
					<projectDesc>
						<ab>DD-supplement</ab>
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
						<xsl:choose>
							<xsl:when test="contains(DIPL.OPL/TRYK, 'Gammeldanske Diplomer')">
								<language ident="gda"/>
							</xsl:when>
							<xsl:when test="contains($translation/org, 'dansk')">
								<language ident="da"/>
							</xsl:when>
							<xsl:when test="contains($translation/org, 'nedertysk')">
								<language ident="gml"/>
							</xsl:when>
							<xsl:when test="contains($translation/org, 'højtysk')">
								<language ident="gmh"/>
							</xsl:when>
							<xsl:otherwise>
								<language ident="nil"/>
							</xsl:otherwise>
						</xsl:choose>
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
					<div>
						<xsl:attribute name="xml:lang">
							<xsl:choose>
								<xsl:when test="contains(DIPL.OPL/TRYK, 'Gammeldanske Diplomer')"
									>gda</xsl:when>
								<xsl:when test="contains($translation/org, 'dansk')">xda</xsl:when>
								<xsl:when test="contains($translation/org, 'nedertysk')"
									>gml</xsl:when>
								<xsl:when test="contains($translation/org, 'højtysk')"
									>gmh</xsl:when>
								<xsl:otherwise>nil</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<p>
							<xsl:apply-templates select="//SPALTE/FORLAEG/following-sibling::node()"/>
							<xsl:apply-templates select="EXCERPT"/>
						</p>
					</div>
					<div xml:lang="da">
						<p>
							<xsl:value-of select="$translation/text"/>
						</p>
					</div>
				</body>
			</text>
		</TEI>
	</xsl:template>
	<xsl:template match="EXCERPT">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="//DATUM">
		<xsl:variable name="date">
			<xsl:analyze-string select="." regex="(\d{{3,4}}).?\s*(\d{{1,2}}).?\s*(\c{{3,9}})">
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
						if (regex-group(2) = '31') then '31' else ''
						)"
					/>
				</xsl:matching-substring>
			</xsl:analyze-string>
		</xsl:variable>
		<date>
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
				<!--<xsl:analyze-string select="." regex="(\d{{4}}).?\s*(\d{{1,2}}).?\s*(\c{{3,9}})">-->
				<!-- Forsøgte oprindelig denne regex 
						[(\d{{4}}).?\s*(\d{{1,2}}).?\s*(\c{{3,9}})-[\[\]]] 
						Men pga de skarpe parenteser, som skal sikre escape af '[' 
						og ']', kan jeg ikke referere til regex-group() ved 
						matching-substring-->
				<!--<xsl:matching-substring>
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
							if (regex-group(2) = '9') then '09' else ''
							)"
						/>
					</xsl:matching-substring>
					</xsl:analyze-string>-->
				<xsl:value-of select="$date"/>
			</xsl:attribute>
			<xsl:attribute name="notAfter">
				<xsl:value-of select="$date"/>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="matches($date, '([0]?[0-9][0-9][0-9])-([0-1][0-9])-([0-9][0-9])')">
					<xsl:variable name="tE" select="format-date(xs:date($date), '[Y]. [D]. [Mn]')"/>
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
			</xsl:choose>
		</date>
	</xsl:template>
	<xsl:template match="//STED">
		<xsl:choose>
			<xsl:when test="not(text())">
				<placeName cert="high">empty</placeName>
			</xsl:when>
			<xsl:otherwise>
				<placeName cert="high">
					<xsl:apply-templates/>
				</placeName>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//MANUS">
		<witness>
			<xsl:attribute name="xml:id">
				<xsl:choose>
					<xsl:when test="ID">
						<xsl:value-of select="ID"/>
					</xsl:when>
					<xsl:otherwise>Aa</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<msDesc>
				<xsl:choose>
					<xsl:when test="matches(OPL, 'tabt')">
						<msIdentifier>
							<settlement>empty</settlement>
							<repository>empty</repository>
							<idno>empty</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Åkjærske')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Åkjærske registratur
								(1611)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Viborg St. Hans')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Viborg St. Hans kl. reg.
								(1574)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Alling')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Alling kl. reg. (1580)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Antvorskov')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Registratur over Antvorskov
								Klosters Breve (1607)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Børglum')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Registratur over Børglum
								Klosters breve (1542)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Gudum')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Gudum kl. reg. (1592)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Kalundborgske')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Registratur over Brevene paa
								Folen paa Kalundborg (1551)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Lundebogen')">
						<msIdentifier>
							<settlement>Stockholm</settlement>
							<repository>Riksarkivet</repository>
							<idno>Registrum ecclesie Lundensis</idno>
							<msName>Lundebogen <xsl:value-of
								select="normalize-space(replace(substring-after(OPL, 'Lundebogen'), '\.\s*$', ''))"
								/></msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Lübeck')">
						<msIdentifier>
							<settlement>Lübeck</settlement>
							<repository>Stadtarchiv</repository>
							<idno><xsl:value-of
								select="normalize-space(replace(substring-after(OPL, 'Stadtarchiv'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Løgumbogen')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Det Kongelige Bibliotek</repository>
							<idno>Ny kgl. Saml. 811,2° = ms. phot. 45,2°</idno>
							<msName>Løgumbogen <xsl:value-of
								select="normalize-space(replace(substring-after(OPL, 'Løgumbogen'), '\.\s*$', ''))"
								/></msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Mariager')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Registratur over Breve i
								Mariager Klosters Arkiv 1584 (-1602)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Maribo')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Registratur over Maribo
								Klosters Breve (1624)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Roskildegårds')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Registratur over Breve paa
								Roskildegaard (ca. 1570)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Skanderborgske')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Skanderborgske Registratur
								(1606)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Vestervig')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Registratur over Vestervig
								Klosters Breve (1599)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Vordingborgske')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Vordingborgske reg.
								(1476)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Ålborghus')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Registratur over Breve paa
								Aalborghus (1573 og 1578)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Roskildegårds')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Registratur over Breve paa
								Roskildegaard (c. 1570)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Silkeborgske')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Registratur over brevene paa
								Silkeborg (1558)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Viborg stifts')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>De ældste danske arkivregistraturer, Registraturer over Viborg
								Stifts Breve (1540'erne og 1574)</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Aboensis')">
						<msIdentifier>
							<settlement>Stockholm</settlement>
							<repository>Riksarkivet</repository>
							<idno>RA 0201, Codex A 10</idno>
							<msName>Registrum ecclesiae Aboensis <xsl:value-of
								select="normalize-space(replace(substring-after(OPL, 'Aboensis'), '\.\s*$', ''))"
								/></msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'AM')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Arnamagnæanske Samling</repository>
							<idno>
								<xsl:value-of
									select="normalize-space(replace(substring-before(substring-after(OPL, 'AM.'), '.'), '\.\s*$', ''))"
								/>
							</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Bartholin', 'i')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Det Kongelige Bibliotek</repository>
							<idno>E Donatione Variorum 1, 2°</idno>
							<msName>Th. Bartholin Collectanea <xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Collectanea'), '\.\s*$', ''))"
								/></msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Berlin')">
						<msIdentifier>
							<settlement>Berlin</settlement>
							<repository>nil</repository>
							<idno>nil</idno>
							<msName>nil</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Braunschweig')">
						<msIdentifier>
							<settlement>Braunschweig</settlement>
							<repository>Stadtarchiv</repository>
							<idno><xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Stadtarchiv'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Bremen')">
						<msIdentifier>
							<settlement>Bremen</settlement>
							<repository>Stadtarchiv</repository>
							<idno><xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Stadtarchiv'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Bruxelles')">
						<msIdentifier>
							<settlement>Bruxelles</settlement>
							<repository>RA</repository>
							<idno>nil</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Brügge')">
						<msIdentifier>
							<settlement>Brügge</settlement>
							<repository>Archives de la ville</repository>
							<idno>nil</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Deventer')">
						<msIdentifier>
							<settlement>Deventer</settlement>
							<repository>nil</repository>
							<idno>nil</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Dordrecht')">
						<msIdentifier>
							<settlement>Dordrecht</settlement>
							<repository>nil</repository>
							<idno>nil</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Dueholms klosters brevbog')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Det arnamagnæanske Institut</repository>
							<idno>empty</idno>
							<msName>Dueholm klosters brevbog <xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'brevbog'), '\.\s*$', ''))"
								/></msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Eline Gøyes jordebog')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>empty</idno>
							<msName>Eline Gøyes jordebog <xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'jordebog'), '\.\s*$', ''))"
								/></msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Esrombogen')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Det Kongelige Bibliotek</repository>
							<idno>E Donatione Variorum 140, 4°</idno>
							<msName>Esrombogen <xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Esrombogen'), '\.\s*$', ''))"
								/></msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Firenze')">
						<msIdentifier>
							<settlement>Firenze</settlement>
							<repository>nil</repository>
							<idno>nil</idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Göttingen')">
						<msIdentifier>
							<settlement>Göttingen</settlement>
							<repository>Stadtarchiv</repository>
							<idno><xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Göttingen'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Hildesheim')">
						<msIdentifier>
							<settlement>Hildesheim</settlement>
							<repository>Stadtarchiv</repository>
							<idno><xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Hildesheim'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Köln', 'i')">
						<msIdentifier>
							<settlement>Köln</settlement>
							<repository>Historisches Archiv</repository>
							<idno><xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Köln'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Langebeks Dipl', 'i')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>empty</idno>
							<msName>Langebeks Diplomatarium</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Ledreborg', 'i')">
						<msIdentifier>
							<settlement>Ledreborg</settlement>
							<repository>Godsarkiv</repository>
							<idno>Ms. <xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'ms.'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'London', 'i')">
						<msIdentifier>
							<settlement>London</settlement>
							<repository>Public Record Office</repository>
							<idno><xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Office'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Lüneburg')">
						<msIdentifier>
							<settlement>Lüneburg</settlement>
							<repository>Stadtarchiv</repository>
							<idno><xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Stadtarchiv'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Løgumbogen')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Det Kongelige Bibliotek</repository>
							<idno>Ny kgl. Saml. 811,2° = ms. phot. 45,2°</idno>
							<msName>Løgumbogen <xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Løgumbogen'), '\.\s*$', ''))"
								/></msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'ny\s+kronol\.\s+rk\.?', 'i')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Rigsarkivet</repository>
							<idno>NKR <xsl:value-of
									select="normalize-space(replace(substring-before(substring-after(OPL, 'rk.'), '.'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Odensebogen')">
						<msIdentifier>
							<settlement>Uppsala</settlement>
							<repository>Universitetsbibliotek</repository>
							<idno>De la Gardies Donation nr. 39</idno>
							<msName>Odensebogen <xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Odensebogen'), '\.\s*$', ''))"
								/></msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Reg. Lat.')">
						<msIdentifier>
							<settlement>Rom</settlement>
							<repository>Archivio Segreto Vaticano</repository>
							<idno>Registra Lateranensia <xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Lat.'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Reg. Vat.')">
						<msIdentifier>
							<settlement>Rom</settlement>
							<repository>Archivio Segreto Vaticano</repository>
							<idno>Registra Vaticana <xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Vat.'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Reval')">
						<msIdentifier>
							<settlement>Talinn</settlement>
							<repository>Byarkiv</repository>
							<idno><xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Reval'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Slesvig LA.')">
						<msIdentifier>
							<settlement>Slesvig</settlement>
							<repository>Landesarchiv Schleswig-Holstein</repository>
							<idno><xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'LA.'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Sorø gavebog', 'i')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Det Kongelige Bibliotek</repository>
							<idno>Gl. kgl. Saml. 2485,4° = ms. phot. 75,4°</idno>
							<msName>Sorø gavebog <xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'avebog'), '\.\s*$', ''))"
								/></msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Stralsund')">
						<msIdentifier>
							<settlement>Stralsund</settlement>
							<repository>Stadtarchiv</repository>
							<idno><xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Stralsund'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Sv. RA.')">
						<msIdentifier>
							<settlement>Stockholm</settlement>
							<repository>Riksarkivet</repository>
							<idno><xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'RA.'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Talinn')">
						<msIdentifier>
							<settlement>Talinn</settlement>
							<repository>Byarkiv</repository>
							<idno><xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Talinn'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Thorn')">
						<msIdentifier>
							<settlement>Thorn</settlement>
							<repository>Byarkiv</repository>
							<idno><xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Thorn'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Wismar')">
						<msIdentifier>
							<settlement>Wismar</settlement>
							<repository>Stadtarchiv</repository>
							<idno><xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Wismar'), '\.\s*$', ''))"
								/></idno>
							<msName>empty</msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Æbelholtbogen', 'i')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Det Kongelige Bibliotek</repository>
							<idno>Additamenta 51,2°</idno>
							<msName>Æbelholtbogen <xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Æbelholtbogen'), '\.\s*$', ''))"
								/></msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Örnhjelms', 'i')">
						<msIdentifier>
							<settlement>Stockholm</settlement>
							<repository>Riksarkivet</repository>
							<idno>empty</idno>
							<msName>Örnhjelms Diplomatarium <xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Örnhjelms Diplomatarium'), '\.\s*$', ''))"
								/></msName>
						</msIdentifier>
					</xsl:when>
					<xsl:when test="matches(OPL, 'Århusbogen', 'i')">
						<msIdentifier>
							<settlement>København</settlement>
							<repository>Det Kongelige Bibliotek</repository>
							<idno>E Donatione Variorum 53, 2°</idno>
							<msName>Århusbogen <xsl:value-of
									select="normalize-space(replace(substring-after(OPL, 'Århusbogen'), '\.\s*$', ''))"
								/></msName>
						</msIdentifier>
					</xsl:when>
					<xsl:otherwise>
						<msIdentifier>
							<settlement>nil</settlement>
							<repository>nil</repository>
							<idno>nil</idno>
							<msName>nil</msName>
						</msIdentifier>
					</xsl:otherwise>
				</xsl:choose>
				<msContents>
					<summary>
						<xsl:choose>
							<xsl:when test="$translation/regest">
								<xsl:value-of select="replace($translation/regest, '\.\s*$', '')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="/DIPLOM/REGEST">
										<xsl:apply-templates select="/DIPLOM/REGEST"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="/DIPLOM/EXCERPT"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</summary>
					<msItemStruct>
						<filiation>
							<ab>empty</ab>
						</filiation>
					</msItemStruct>
				</msContents>
				<physDesc>
					<objectDesc>
						<xsl:choose>
							<xsl:when test="contains(OPL, 'Perg.')">
								<supportDesc material="parch">
									<support>
										<ab>Pergament</ab>
									</support>
									<extent>
										<dimensions unit="cm">
											<xsl:choose>
												<xsl:when test="contains(OPL, '×')">
												<xsl:analyze-string select="OPL"
												regex="(\d?\d?),?(\d?)\s?×\s?(\d?\d?),?(\d?)">
												<xsl:matching-substring>
												<height>
												<!--<xsl:value-of
												select="normalize-space(substring-before(., '×'))"/>-->
												<xsl:value-of
												select="substring-before(replace(., '(\d?\d?),?(\d?)\s?×\s?(\d?\d?),?(\d?)', '$1.$2×$3.$4'), '×')"
												/>
												</height>
												<width>
												<xsl:value-of
												select="substring-after(replace(., '(\d?\d?),?(\d?)\s?×\s?(\d?\d?),?(\d?)', '$1.$2×$3.$4'), '×')"
												/>
												</width>
												</xsl:matching-substring>
												</xsl:analyze-string>
												</xsl:when>
												<xsl:otherwise>
												<height>empty</height>
												<width>empty</width>
												</xsl:otherwise>
											</xsl:choose>
										</dimensions>
									</extent>
									<condition>
										<ab>empty</ab>
									</condition>
								</supportDesc>
							</xsl:when>
							<xsl:when test="contains(OPL, 'Papir')">
								<supportDesc material="paper">
									<support>
										<ab>Papir</ab>
									</support>
									<extent>
										<dimensions unit="cm">
											<xsl:choose>
												<xsl:when test="contains(OPL, '×')">
												<xsl:analyze-string select="OPL"
												regex="(\d?\d?),?(\d?)\s?×\s?(\d?\d?),?(\d?)">
												<xsl:matching-substring>
												<height>
												<!--<xsl:value-of
																	select="normalize-space(substring-before(., '×'))"/>-->
												<xsl:value-of
												select="substring-before(replace(., '(\d?\d?),?(\d?)\s?×\s?(\d?\d?),?(\d?)', '$1.$2×$3.$4'), '×')"
												/>
												</height>
												<width>
												<xsl:value-of
												select="substring-after(replace(., '(\d?\d?),?(\d?)\s?×\s?(\d?\d?),?(\d?)', '$1.$2×$3.$4'), '×')"
												/>
												</width>
												</xsl:matching-substring>
												</xsl:analyze-string>
												</xsl:when>
												<xsl:otherwise>
												<height>empty</height>
												<width>empty</width>
												</xsl:otherwise>
											</xsl:choose>
										</dimensions>
									</extent>
								</supportDesc>
							</xsl:when>
							<xsl:otherwise>
								<supportDesc material="empty">
									<support>
										<ab>empty</ab>
									</support>
									<extent>
										<dimensions unit="cm">
											<height>0</height>
											<width>0</width>
										</dimensions>
									</extent>
									<condition>
										<ab>empty</ab>
									</condition>
								</supportDesc>
							</xsl:otherwise>
						</xsl:choose>
						<layoutDesc>
							<ab>empty</ab>
						</layoutDesc>
					</objectDesc>
					<handDesc>
						<handNote>
							<ab>
								<xsl:choose>
									<xsl:when test="contains(OPL, 'afskrift')">Afskrift</xsl:when>
									<xsl:when test="contains(OPL, 'Afskrift af')">Afskrift af
											<xsl:value-of
											select="normalize-space(substring-after(., 'Afskrift af'))"
										/>
									</xsl:when>
									<xsl:when test="contains(OPL, 'Afskrift af')">Afskrift efter
											<xsl:value-of
											select="normalize-space(substring-after(., 'Afskrift efter'))"
										/>
									</xsl:when>
									<xsl:when test="contains(OPL, 'Afskrift')">Afskrift</xsl:when>
									<xsl:when test="contains(../ANDET, 'samme hånd som')">Skrevet
										med samme hånd som <xsl:value-of
											select="normalize-space(substring-after(../ANDET, 'som'))"
										/></xsl:when>
									<xsl:otherwise>empty</xsl:otherwise>
								</xsl:choose>
							</ab>
						</handNote>
					</handDesc>
					<additions>
						<ab>
							<xsl:choose>
								<xsl:when test="OPL/fh">Påskrift: <q>
										<xsl:apply-templates select="OPL/fh"/>
									
									</q>
								</xsl:when>
								<xsl:otherwise>empty</xsl:otherwise>
							</xsl:choose>
						</ab>
					</additions>
					<sealDesc>
					<xsl:choose>
							<xsl:when test="contains(OPL, '1:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '1: perg')">
										<seal n="1" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '1: seglsnit')">
										<seal n="1" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="1" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '1:'), '2'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '1-\d:\s*perg')">
								<seal n="1" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '1-\d:\s*segl')">
								<seal n="1" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '2:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '2: perg')">
										<seal n="2" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '2: seglsnit')">
										<seal n="2" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="2" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '2:'), '3'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '2-\d:\s*perg')">
								<seal n="2" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '2-\d:\s*segl')">
								<seal n="2" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '3:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '3: perg')">
										<seal n="3" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '3: seglsnit')">
										<seal n="3" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="3" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '3:'), '4'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '3-\d:\s*perg')">
								<seal n="3" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '3-\d:\s*segl')">
								<seal n="3" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '4:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '4: perg')">
										<seal n="4" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '4: seglsnit')">
										<seal n="4" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="4" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '4:'), '5'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '4-\d:\s*perg')">
								<seal n="4" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '4-\d:\s*segl')">
								<seal n="4" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '5:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '5: perg')">
										<seal n="5" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '5: seglsnit')">
										<seal n="5" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="5" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '5:'), '6'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '5-\d:\s*perg')">
								<seal n="5" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '5-\d:\s*segl')">
								<seal n="5" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '6:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '6: perg')">
										<seal n="6" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '6: seglsnit')">
										<seal n="6" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="6" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '6:'), '7'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '6-\d:\s*perg')">
								<seal n="6" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '6-\d:\s*segl')">
								<seal n="6" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '7:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '7: perg')">
										<seal n="7" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '7: seglsnit')">
										<seal n="7" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="7" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '7:'), '8'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '7-\d:\s*perg')">
								<seal n="7" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '7-\d:\s*segl')">
								<seal n="7" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '8:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '8: perg')">
										<seal n="8" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '8: seglsnit')">
										<seal n="8" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="8" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '8:'), '9'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '8-\d:\s*perg')">
								<seal n="8" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '8-\d:\s*segl')">
								<seal n="8" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '9:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '9: perg')">
										<seal n="9" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '9: seglsnit')">
										<seal n="9" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="9" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '9:'), '10'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '9-\d:\s*perg')">
								<seal n="9" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '9-\d:\s*segl')">
								<seal n="9" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '10:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '10: perg')">
										<seal n="10" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '10: seglsnit')">
										<seal n="10" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="10" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '10:'), '11'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '10-\d:\s*perg')">
								<seal n="10" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '10-\d:\s*segl')">
								<seal n="10" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '11:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '11: perg')">
										<seal n="11" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '11: seglsnit')">
										<seal n="11" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="11" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '11:'), '12'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '11-\d:\s*perg')">
								<seal n="11" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '11-\d:\s*segl')">
								<seal n="11" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '12:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '12: perg')">
										<seal n="12" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '12: seglsnit')">
										<seal n="12" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="12" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '12:'), '13'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '12-\d:\s*perg')">
								<seal n="12" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '12-\d:\s*segl')">
								<seal n="12" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '13:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '13: perg')">
										<seal n="13" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '13: seglsnit')">
										<seal n="13" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="13" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '13:'), '14'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '13-\d:\s*perg')">
								<seal n="13" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '13-\d:\s*segl')">
								<seal n="13" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '14:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '14: perg')">
										<seal n="14" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '14: seglsnit')">
										<seal n="14" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="14" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '14:'), '15'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '14-\d:\s*perg')">
								<seal n="14" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '14-\d:\s*segl')">
								<seal n="14" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '15:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '15: perg')">
										<seal n="15" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '15: seglsnit')">
										<seal n="15" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="15" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '15:'), '16'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '15-\d:\s*perg')">
								<seal n="15" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '15-\d:\s*segl')">
								<seal n="15" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '16:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '16: perg')">
										<seal n="16" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '16: seglsnit')">
										<seal n="16" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="16" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '16:'), '17'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '16-\d:\s*perg')">
								<seal n="16" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '16-\d:\s*segl')">
								<seal n="16" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '17:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '17: perg')">
										<seal n="17" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '17: seglsnit')">
										<seal n="17" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="17" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '17:'), '18'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '17-\d:\s*perg')">
								<seal n="17" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '17-\d:\s*segl')">
								<seal n="17" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '18:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '18: perg')">
										<seal n="18" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '18: seglsnit')">
										<seal n="18" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="18" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '18:'), '19'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '18-\d:\s*perg')">
								<seal n="18" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '18-\d:\s*segl')">
								<seal n="18" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '19:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '19: perg')">
										<seal n="19" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '19: seglsnit')">
										<seal n="19" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="19" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '19:'), '20'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '19-\d:\s*perg')">
								<seal n="19" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '19-\d:\s*segl')">
								<seal n="19" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '20:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '20: perg')">
										<seal n="20" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '20: seglsnit')">
										<seal n="20" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="20" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '20:'), '21'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '20-\d:\s*perg')">
								<seal n="20" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '20-\d:\s*segl')">
								<seal n="20" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '21:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '21: perg')">
										<seal n="21" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '21: seglsnit')">
										<seal n="21" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="21" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '21:'), '22'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '21-\d:\s*perg')">
								<seal n="21" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '21-\d:\s*segl')">
								<seal n="21" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '22:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '22: perg')">
										<seal n="22" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '22: seglsnit')">
										<seal n="22" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="22" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '22:'), '23'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '22-\d:\s*perg')">
								<seal n="22" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '22-\d:\s*segl')">
								<seal n="22" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '23:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '23: perg')">
										<seal n="23" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '23: seglsnit')">
										<seal n="23" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="23" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '23:'), '24'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '23-\d:\s*perg')">
								<seal n="23" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '23-\d:\s*segl')">
								<seal n="23" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '24:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '24: perg')">
										<seal n="24" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '24: seglsnit')">
										<seal n="24" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="24" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '24:'), '25'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '24-\d:\s*perg')">
								<seal n="24" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '24-\d:\s*segl')">
								<seal n="24" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '25:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '25: perg')">
										<seal n="25" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '25: seglsnit')">
										<seal n="25" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="25" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '25:'), '26'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '25-\d:\s*perg')">
								<seal n="25" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '25-\d:\s*segl')">
								<seal n="25" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '26:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '26: perg')">
										<seal n="26" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '26: seglsnit')">
										<seal n="26" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="26" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '26:'), '27'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '26-\d:\s*perg')">
								<seal n="26" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '26-\d:\s*segl')">
								<seal n="26" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '27:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '27: perg')">
										<seal n="27" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '27: seglsnit')">
										<seal n="27" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="27" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '27:'), '28'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '27-\d:\s*perg')">
								<seal n="27" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '27-\d:\s*segl')">
								<seal n="27" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '28:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '28: perg')">
										<seal n="28" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '28: seglsnit')">
										<seal n="28" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="28" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '28:'), '29'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '28-\d:\s*perg')">
								<seal n="28" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '28-\d:\s*segl')">
								<seal n="28" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '29:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '29: perg')">
										<seal n="29" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '29: seglsnit')">
										<seal n="29" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="29" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '29:'), '39'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '29-\d:\s*perg')">
								<seal n="29" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '29-\d:\s*segl')">
								<seal n="29" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="contains(OPL, '30:')">
								<xsl:choose>
									<xsl:when test="contains(OPL, '30: perg')">
										<seal n="30" type="missing">
											<ab>perg.rem</ab>
										</seal>
									</xsl:when>
									<xsl:when test="contains(OPL, '30: seglsnit')">
										<seal n="30" type="missing">
											<ab>seglsnit</ab>
										</seal>
									</xsl:when>
									<xsl:otherwise>
										<seal n="30" type="pendant">
											<ab>
												<xsl:value-of
												select="normalize-space(replace(substring-before(substring-after(OPL, '30:'), '31'), '\.\s*$', ''))"
												/>
											</ab>
										</seal>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="matches(OPL, '30-\d:\s*perg')">
								<seal n="30" type="missing">
									<ab>perg.rem</ab>
								</seal>
							</xsl:when>
							<xsl:when test="matches(OPL, '30-\d:\s*segl')">
								<seal n="30" type="missing">
									<ab>seglsnit</ab>
								</seal>
							</xsl:when>
							<xsl:otherwise>
						
								<!-- Naar ikke der er segl, defaulter elementet saaledes-->
								<seal n="0" type="empty">
									<ab>empty</ab>
								</seal>
							</xsl:otherwise>
						
						</xsl:choose>
						
					</sealDesc>
				</physDesc>
				<history>
					<ab>
						<xsl:choose>
							<xsl:when test="contains(OPL, 'tabt')">Tabt<xsl:choose>
									<xsl:when test="contains(OPL, 'registreret')">Registreret
											<xsl:value-of
											select="normalize-space(substring-after(OPL, 'registreret'))"
										/></xsl:when>
									<xsl:when test="contains(OPL, 'Registreret')">Registreret
											<xsl:value-of
											select="normalize-space(substring-after(OPL, 'Registreret'))"
										/></xsl:when>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="contains(OPL, 'registreret')">Registreret <xsl:value-of
									select="normalize-space(substring-after(OPL, 'registreret'))"
								/></xsl:when>
							<xsl:when test="contains(OPL, 'Registreret')">Registreret <xsl:value-of
									select="normalize-space(substring-after(OPL, 'Registreret'))"/>
							</xsl:when>
							<xsl:otherwise>empty</xsl:otherwise>
						</xsl:choose>
					</ab>
				</history>
				<additional>
					<listBibl>
						<bibl>
							<xsl:choose>
								<xsl:when test="../TRYK">
									<xsl:value-of select="replace(../TRYK, '\.\s*$', '')"/>
								</xsl:when>
								<xsl:when test="../REGISTR">
									<xsl:value-of select="replace(../TRYK, '\.\s*$', '')"/>
								</xsl:when>
								<xsl:otherwise>empty</xsl:otherwise>
							</xsl:choose>
						</bibl>
					</listBibl>
				</additional>
			</msDesc> &lt;!-- <xsl:apply-templates select="OPL"/>
			<xsl:text> </xsl:text>
			<xsl:if test="position()=last()">
				<xsl:apply-templates select="//ANDET"/>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="position()=last()">
				<xsl:apply-templates select="//TRYK"/>
				<xsl:apply-templates select="//REGISTR"/>
				<xsl:text> </xsl:text>
			</xsl:if>--&gt; </witness>
	</xsl:template>
	<xsl:template match="ANDET/fh">
		<q>
			<xsl:apply-templates/>
		</q>
	</xsl:template>
	<xsl:template match="//REGEST">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="//REGEST//fh">
		<ex>
			<xsl:value-of select="text()"/>
		</ex>
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
		<ex>
			<xsl:value-of select="text()"/>
		</ex>
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
					<xsl:value-of select="replace(., '\.\s*$', '')"/>
				</rdg>
			</app>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="OPL">
		<xsl:value-of select="text()"/>
	</xsl:template>
	<xsl:template match="C-ref">
		<xsl:variable name="citnr" select="@citatid"/>
		<xsl:for-each select="//CIT[@citatid=$citnr]">
			<cit>
				<quote/>
				<bibl>
					<xsl:apply-templates select="text()"/>
				</bibl>
			</cit>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="REF">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="REF/fh">
		<ex>
			<xsl:value-of select="text()"/>
		</ex>
	</xsl:template>
	<xsl:template match="h">
		<hi rend="sup">
			<xsl:apply-templates/>
		</hi>
	</xsl:template>
</xsl:stylesheet>
