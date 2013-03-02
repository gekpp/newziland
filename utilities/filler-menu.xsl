<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Заполнение главное меню -->
<xsl:template name="fill-left-1nd-menu">
  <xsl:param name="active-menu-id"/>
  <xsl:variable name="curlang" select="/data/params/url-language" />
  <div>
    <ul class="wr_left_menu menu">
      <xsl:for-each select="/data/menu-1st/entry">
        <xsl:variable name="backend-name" select="./backend-name/@handle"/>
        <xsl:variable name="isactive">
          <xsl:choose>
            <xsl:when test="number(/data/params/ds-active-1st-menu)=number(./@id)">selected_menu</xsl:when>
            <xsl:otherwise>not_selected_menu</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <li>
          <xsl:choose>
           <xsl:when test="string($curlang)">
             <a href="{$root}/{$curlang}/chapter/{$backend-name}"><span class="{$isactive}"><xsl:value-of select="./title"/></span></a>

           </xsl:when>
           <xsl:otherwise>
             <a href="{$root}/chapter/{$backend-name}"><span class="{$isactive}"><xsl:value-of select="./title"/></span>
             </a>

           </xsl:otherwise>
         </xsl:choose>
        </li>
      </xsl:for-each>
      <div class="close_div"></div>
    </ul>	
  </div>	
</xsl:template>
<!-- Заполнение главного меню -->

<!-- Заполнение меню второго уровня -->
<xsl:template name="second-menu-filler">
  <xsl:param name="active-menu-id"/>
  <xsl:variable name="curlang" select="/data/params/url-language" />
  <div>
    <ul class="wr_2nd_menu menu">
      <xsl:for-each select="/data/submenu-by-main-menu/entry">
        <xsl:variable name="backend-name" select="./backend-name/@handle"/>
        <xsl:variable name="isactive">
          <xsl:choose>
            <xsl:when test="number(./@id)=number(/data/params/ds-active-2nd-menu)">selected_menu</xsl:when>
            <xsl:otherwise>not_selected_menu</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <li>
          <xsl:choose>
           <xsl:when test="string($curlang)">
             <a href="{$root}/{$curlang}/chapter/{/data/active-1st-menu/entry/backend-name}/{$backend-name}"><span class="{$isactive}"><xsl:value-of select="./title"/></span></a>

           </xsl:when>
           <xsl:otherwise>
             <a href="{$root}/chapter/{/data/active-1st-menu/entry/backend-name}/{$backend-name}"><span class="{$isactive}"><xsl:value-of select="./title"/></span>
             </a>
           </xsl:otherwise>
         </xsl:choose>
        </li>
      </xsl:for-each>
      <div class="close_div"></div>
    </ul>	
  </div>	
</xsl:template>
<!-- Заполнение меню второго уровня -->



</xsl:stylesheet>