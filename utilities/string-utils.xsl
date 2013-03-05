<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="get-lang-link">
  <xsl:param name="text"/>
  <xsl:param name="cur-lang"/>
  <xsl:param name="expected-lang"/>
  <xsl:variable name="cur-lang-subpath">/<xsl:value-of select="$cur-lang"/>/</xsl:variable>
  <xsl:variable name="expected-lang-subpath">/<xsl:value-of select="$expected-lang"/>/</xsl:variable>
  
<!--  HUHU-<xsl:value-of select="$text"/>  <xsl:value-of select="$cur-lang-subpath"/>  <xsl:value-of select="$expected-lang"/>-HUHU -->
  <xsl:choose>
    <xsl:when test="string($cur-lang)">
      <xsl:call-template name="replace-string">
        <xsl:with-param name="text" select="$text"/>
        <xsl:with-param name="replace" select="$cur-lang-subpath"/>
        <xsl:with-param name="with" select="$expected-lang-subpath"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      /<xsl:value-of select="$expected-lang"/><xsl:value-of select="$text"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="replace-string">
<xsl:param name="text"/>
<xsl:param name="replace"/>
<xsl:param name="with"/>
<xsl:choose>
<xsl:when test="contains($text,$replace)">
<xsl:value-of select="substring-before($text,$replace)"/>
<xsl:value-of select="$with"/>
<xsl:call-template name="replace-string">
<xsl:with-param name="text"
select="substring-after($text,$replace)"/>
<xsl:with-param name="replace" select="$replace"/>
<xsl:with-param name="with" select="$with"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="$text"/>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

</xsl:stylesheet>