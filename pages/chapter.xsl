<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/zil-html-scelet-builder.xsl"/>
<xsl:output
     method="html"
     doctype-system="about:legacy-compat"
     encoding="UTF-8"
     indent="yes" />

<xsl:template match="/">
	<xsl:call-template name="write-html-and-children"/>
</xsl:template>

</xsl:stylesheet>