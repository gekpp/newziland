<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Заполняем домашную страницу -->
<xsl:template name="fill-main-page">
  <xsl:variable name="page" select="/data/home-page[1]/entry"/>
  <xsl:variable name="main-banner-id" select="$page/banner/item/@id"/>
  <xsl:variable name="main-banner-entity" select="/data/image-files/entry[@id=$main-banner-id]"/>
  <img id="banner_img" src="{$workspace}/{$main-banner-entity/file/@path}/{$main-banner-entity/file/filename}"/>
  <div class="left_column">
    <div class="left_column_text">
      <xsl:value-of select="$page/left-column"/>
    </div>
  </div>
  <div class="right_column">
    <div class="right_column_text"> 
      <xsl:value-of select="$page/right-column"/>
    </div>
  </div>
</xsl:template>
<!-- Заполняем домашную страницу -->

<!-- заполнение контента для страницы с двумя колонками и галереей -->
<xsl:template name="fill-page-two-collumn-with-galery" match="two-column-page-with-galery-right-by-1st-menu|two-column-page-with-galery-right-by-2nd-menu">
  <xsl:choose>
    <xsl:when test="number(./entry/@id)">
      <div class="left_column">
        <xsl:call-template name="second-menu-filler"/>
        <div class="delimiter"></div>
        <div class="left_column_text">
          <xsl:value-of select="./entry/left-column"/>
        </div>
      </div>
      <div class="right_column">
        <div class="wr_galery">
          <img src="/workspace/uploads/images/galerytemplate.png"/>
        </div>
        <div class="right_column_text">
          <div id="galery_description">
            <xsl:value-of select="./entry/right-column"/>
          </div>
        </div>
      </div>
      <div style="clear:both"></div>
    </xsl:when>
  </xsl:choose>
</xsl:template>
<!-- заполнение контента для страницы с двумя колонками и галереей -->

<!-- Заполняем страницу контакты -->
<xsl:template name="fill-contact-page" match="contact-page-by-1st-menu">
  <xsl:choose>
    <xsl:when test="number(./entry/@id)">
      <xsl:variable name="banner-id" select="./entry/map-image/item/@id"/>
      <xsl:variable name="banner-entity" select="/data/image-files/entry[@id=$banner-id]"/>
      <img id="banner_img" src="{$workspace}/{$banner-entity/file/@path}/{$banner-entity/file/filename}"/>
      <div class="left_column">
        <p>
          <div class="contact_list_item"><xsl:value-of select="entry/full-address"/></div>
          <div class="contact_list_item"><xsl:value-of select="entry/how-to-find"/></div>
          <div class="contact_list_item"><xsl:value-of select="entry/email"/></div>
          <div class="contact_list_item">
            <a href="#">
              <xsl:value-of select="/data/ml-strings/entry/value[@handle-en='print-the-map']"/>
            </a>
          </div>
          <div class="contact_list_item">
            <a href="#">
              <xsl:value-of select="/data/ml-strings/entry/value[@handle-en='show-on-yandex-maps']"/>
            </a>
          </div>
        </p>
      </div>
      <div class="right_column">
        <div class="right_column_text contact_description_text">
            <xsl:value-of select="./entry/right-column"/>
        </div>
      </div>
      <div style="clear:both"></div>
    </xsl:when>
  </xsl:choose>
</xsl:template>
<!-- Заполняем страницу контакты -->



</xsl:stylesheet>