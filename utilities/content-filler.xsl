<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="filler-pages.xsl"/>
<xsl:import href="filler-menu.xsl"/>

<!-- Заполняем футер -->
<xsl:template name="fill-footer">
  <xsl:variable name="curlang" select="/data/params/url-language" />
    <ul class="bottom_menu menu">
      <xsl:variable name="footer-menu-item-width" select="100 div count(/data/menu-1st/entry)" />
      <xsl:for-each select="/data/menu-1st/entry">
        <xsl:variable name="backend-name" select="./backend-name/@handle"/>
        <li class="bottom_menu_item fl" style="width:{$footer-menu-item-width}%">
           <xsl:choose>
             <xsl:when test="string($curlang)">
               <a href="{$root}/{$curlang}/chapter/{$backend-name}"><span><xsl:value-of select="./title"/></span></a>
             </xsl:when>
             <xsl:otherwise>
               <a href="{$root}/chapter/{$backend-name}"><span><xsl:value-of select="./title"/></span></a>
             </xsl:otherwise>
           </xsl:choose>
        </li>
      </xsl:for-each>
      <div class="close_div"></div>
    </ul>
</xsl:template>
<!-- Заполняем футер -->

<!-- Заполняем главный контент -->
<xsl:template name="fill-main-content">
  <xsl:choose>
    <xsl:when test="'home'=$root-page">
      <xsl:call-template name="fill-main-page"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="number(/data/two-column-page-with-galery-right-by-2nd-menu/entry/@id)">     
          <xsl:apply-templates name="fill-page-two-collumn-with-galery" select="/data/two-column-page-with-galery-right-by-2nd-menu"/>
        </xsl:when>
        <xsl:when test="number(/data/two-column-page-with-galery-right-by-1nd-menu/entry/@id)">
          <xsl:apply-templates name="fill-page-two-collumn-with-galery" select="/data/two-column-page-with-galery-right-by-1st-menu"/>
        </xsl:when>
        <xsl:when test="number(/data/contact-page-by-1st-menu/entry/@id)">
          <xsl:apply-templates name="fill-contact-page" select="/data/contact-page-by-1st-menu"/>
        </xsl:when>
        <xsl:when test="number(/data/scheme-page/entry/@id)">
			<xsl:apply-templates name="fill-scheme-page" select="/data/scheme-page"/>
        </xsl:when>
        <xsl:when test="number(/data/news-page-by-1st-menu/entry/@id)">
          <xsl:apply-templates name="fill-news-page" select="/data/news-page-by-1st-menu"/>
        </xsl:when>
        <xsl:when test="number(/data/video-page-by-1st-menu/entry/@id)">
          <xsl:apply-templates name="fill-video-page" select="/data/video-page-by-1st-menu"/>
        </xsl:when>
        <xsl:otherwise><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text></xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
<!-- Заполняем главный контент -->

</xsl:stylesheet>