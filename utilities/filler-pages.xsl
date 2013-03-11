<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="date-time.xsl" />

  <!-- Заполняем домашную страницу -->
  <xsl:template name="fill-main-page">
    <xsl:variable name="page" select="/data/home-page[1]/entry" />
    <xsl:variable name="main-banner-id" select="$page/banner/item/@id" />
    <xsl:variable name="main-banner-entity"
      select="/data/image-files/entry[@id=$main-banner-id]" />
    <xsl:variable name="main-videobanner-id" select="$page/videobanner/item/@id" />
    <xsl:variable name="main-videobanner" select="/data/video-for-home-page/entry[@id=$main-videobanner-id]"/>
    <xsl:choose><xsl:when test="count(/data/banner-images/entry)&gt;0">
      <div id="banner_slideshow">
        <xsl:for-each select="/data/banner-images/entry">
          <xsl:variable name="banner_img_class_name">
            <xsl:choose>
              <xsl:when test="position()=1">showed_banner_image</xsl:when>
              <xsl:otherwise>hidden_banner_image</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <img class="{$banner_img_class_name}" src="{$workspace}/{./file/@path}/{./file/filename}"/>
        </xsl:for-each>
      </div>
    </xsl:when>
    <xsl:otherwise>
      <img id="banner_img"
        src="{$workspace}/{$main-banner-entity/file/@path}/{$main-banner-entity/file/filename}" />
    </xsl:otherwise>
    </xsl:choose>
      <div class="left_column">
        <div class="left_column_text">
          <xsl:value-of select="$page/left-column" />
        </div>
      </div>
    <div class="right_column">
      <div class="right_column_text">
        <xsl:value-of select="$page/right-column" />
      </div>
    </div>
  </xsl:template>
  <!-- Заполняем домашную страницу -->

  <!-- заполнение контента для страницы с двумя колонками и галереей -->
  <xsl:template name="fill-page-two-collumn-with-galery"
    match="two-column-page-with-galery-right-by-1st-menu|two-column-page-with-galery-right-by-2nd-menu">
    <xsl:choose>
      <xsl:when test="number(./entry/@id)">
        <div class="left_column">
          <xsl:call-template name="second-menu-filler" />
          <xsl:choose><xsl:when test="count(//data/submenu-by-main-menu/entry) != 0">
            <div class="delimiter"></div>          
          </xsl:when></xsl:choose>
          
          <div class="left_column_text">
            <xsl:value-of select="./entry/left-column" />
          </div>
        </div>
        <div class="right_column">
          <div class="wr_galery">
            <div class="galleria">
              <xsl:for-each select="/data/gallery-items/entry/imagefile">
                <xsl:variable name="item" select="." />
                <img src="{$workspace}/{$item/@path}/{$item/filename}" />
              </xsl:for-each>
            </div>
          </div>
          <div class="right_column_text">
            <div id="galery_description">
              <xsl:value-of select="./entry/right-column" />
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
        <xsl:variable name="banner-id" select="./entry/map-image/item/@id" />
        <xsl:variable name="banner-entity"
          select="/data/image-files/entry[@id=$banner-id]" />
        <img id="banner_img"
          src="{$workspace}/{$banner-entity/file/@path}/{$banner-entity/file/filename}" />
        <div class="left_column">
          <p>
            <div class="contact_list_item">
              <xsl:value-of select="entry/full-address" />
            </div>
            <div class="contact_list_item">
              <xsl:value-of select="entry/how-to-find" />
            </div>
            <div class="contact_list_item">
              <xsl:value-of select="entry/email" />
            </div>
            <div class="contact_list_item">
              <a href="javascript:window.print(); void 0;">
                <xsl:value-of
                  select="/data/ml-strings/entry/value[@handle-en='print-the-map']" />
              </a>
            </div>
            <div class="contact_list_item">
              <a
                href="http://maps.yandex.ru/?um=G5NwOK95Oc7c3yzcxk94HQE3YRPnhDrl&amp;l=map"
                target="_blank">
                <xsl:value-of
                  select="/data/ml-strings/entry/value[@handle-en='show-on-yandex-maps']" />
              </a>
            </div>
          </p>
        </div>
        <div class="right_column">
          <div class="right_column_text contact_description_text">
            <xsl:value-of select="./entry/right-column" />
          </div>
        </div>
        <div style="clear:both"></div>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <!-- Заполняем страницу контакты -->

  <!-- Заполняем страницу Схема -->
  <xsl:template name="fill-scheme-page" match="scheme-page">
    <div id="wr_scheme_img">
      <img id="scheme_img"
        src="{$workspace}/{./entry/scheme-picture/@path}/{./entry/scheme-picture/filename}" />
      <xsl:for-each select="/data/scheme-item/entry">
        <img
          src="{$workspace}/{./push-pin-image/@path}/{./push-pin-image/filename}"
          id="scheme_pushpin_{position()}" class="scheme_pushpin"
          style="left: {./x}px; top: {./y}px" onclick="pinclick({position()})" />
      </xsl:for-each>
    </div>
    <div class="scheme_left_column">
      <div class="left_column_text">
        <xsl:for-each select="/data/scheme-item/entry">
          <div class="wr_scheme_item_title" id="wr_scheme_item_title_{position()}">
            <img
              src="{$workspace}/{./push-pin-image/@path}/{./push-pin-image/filename}"
              class="scheme_item_pushpin" onclick="pinclick({position()})" />
            <div class="scheme_item_title" onclick="pinclick({position()})">
              <xsl:value-of select="./title" />
            </div>
            <div style="clear:both" />
          </div>
        </xsl:for-each>
      </div>
    </div>
    <div class="scheme_right_column">
      <div class="right_column_text">
        <div id="scheme_entire_page_text">
          <xsl:value-of select="entry/right-column" />
        </div>
      </div>
      <xsl:for-each select="/data/scheme-item/entry">
        <div class="right_column_text scheme_item_description" id="scheme_item_description_{position()}">
          <xsl:copy-of select="./content[@mode='normal']" />
          <div onclick="showAllPins()" class="show_all_pins_btn">
            <xsl:copy-of
              select="/data/ml-strings/entry[name='показать все пины']/value" />
          </div>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>
  <!-- Заполняем страницу Схема -->

  <!-- Заполняем страницу Новости -->
  <xsl:template name="fill-news-page" match="news-page-by-1st-menu">
    <xsl:choose>
      <xsl:when test="number(./entry/@id)">
        <div class="left_column">
          <span id="cur_year">
            2013
            <xsl:value-of select="/data/ml-strings/entry[name='год']/value" />
          </span>
          <div class="delimiter"></div>
          <div class="left_column_text">
            <xsl:for-each select="./entry/news-items/item">
              <xsl:variable name="item-id" select="./@id" />
              <div class="wr_news_item">
                <xsl:variable name="item"
                  select="/data/news-items/entry[@id=$item-id]" />
                <div class="news_date">
                  <xsl:call-template name="format-date">
                    <xsl:with-param name="date" select="$item/date" />
                    <xsl:with-param name="format" select="'d.n.Y'" />
                  </xsl:call-template>
                </div>
                <div class="news_short_desc">
                  <xsl:value-of select="$item/short-text" />
                </div>
                <div class="more_button" onclick="selectNews('_{position()}');">
                  <xsl:value-of
                    select="/data/ml-strings/entry[name='подробнее']/value" />
                </div>
              </div>
            </xsl:for-each>
          </div>
        </div>
        <div class="right_column">
          <xsl:for-each select="./entry/news-items/item">
            <xsl:variable name="item-id" select="./@id" />
            <xsl:variable name="display">
              <xsl:choose>
                <xsl:when test="position()>1">
                  none
                </xsl:when>
                <xsl:otherwise>
                  block
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:variable name="wrapper-class">
              <xsl:choose>
                <xsl:when test="position()>1">
                  hidenNewsItem
                </xsl:when>
                <xsl:otherwise>
                  shownNewsItem
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:variable name="gallery-class">
              <xsl:choose>
                <xsl:when test="position()>1"></xsl:when>
                <xsl:otherwise>
                  galleria
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <div class="wr_news_full {$wrapper-class}" id="wr_news_item_{position()}"
              style="display:{$display}">
              <xsl:variable name="news-item"
                select="/data/news-items/entry[@id=$item-id]" />
              <xsl:variable name="galery"
                select="/data/page-galery/entry[@id=$news-item/galery/item/@id]" />
              <div class="wr_galery">
                <div class="{$gallery-class}">
                  <xsl:for-each select="/data/gallery-items/entry/imagefile">
                    <xsl:variable name="item" select="." />
                    <img src="{$workspace}/{$item/@path}/{$item/filename}" />
                  </xsl:for-each>
                </div>
              </div>
              <div class="right_column_text">
                <div class="news_full_text">
                  <xsl:value-of select="$news-item/full-text" />
                </div>
              </div>
            </div>
          </xsl:for-each>

        </div>
        <div style="clear:both"></div>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <!-- Заполняем страницу Новости -->

  <!-- Заполнаяем страницу Видео -->
  <xsl:template name="fill-video-page" match="video-page-by-1st-menu">
    <xsl:variable name="page" select="./entry"/>
    <xsl:variable name="video-item-id" select="./entry/video/item/@id" />
    <xsl:variable name="video-item" select="/data/video-for-video-page/entry[@id=$video-item-id]"/>
    <xsl:variable name="path-to-video">
        <xsl:value-of select="$workspace"/>/<xsl:value-of select="$video-item/video-file/@path"/>/<xsl:value-of select="$video-item/video-file/filename"/>        
    </xsl:variable>
    <xsl:variable name="path-to-preview">
        <xsl:value-of select="$workspace"/>/<xsl:value-of select="$video-item/preview/@path"/>/<xsl:value-of select="$video-item/preview/filename"/>        
    </xsl:variable>
    
    <div id="video">
      <div class="flowplayer no-background  play-button functional">
        <video preload="auto"  poster="{$path-to-preview}">
          <xsl:choose><xsl:when test="string($video-item/webm-file/filename)">
            <xsl:variable name="path-to-webm">
              <xsl:value-of select="$workspace"/>/<xsl:value-of select="$video-item/webm-file/@path"/>/<xsl:value-of select="$video-item/webm-file/filename"/>        
            </xsl:variable>
            <source type="video/webm" src="{$path-to-webm}" /> 
          </xsl:when></xsl:choose>

          <source type="video/mp4" src="{$path-to-video}" />
          

         <xsl:choose><xsl:when test="string($video-item/ogv-file/filename)">
            <xsl:variable name="path-to-ogv">
              <xsl:value-of select="$workspace"/>/<xsl:value-of select="$video-item/ogv-file/@path"/>/<xsl:value-of select="$video-item/ogv-file/filename"/>        
            </xsl:variable>
            <source type="video/ogg" src="{$path-to-ogv}" /> 
          </xsl:when></xsl:choose>
          
          <source type="video/flash" src="mp4:workspace/video/flvs/videozil.mp4"/>
         </video>
      </div>
    </div>
    <div class="left_column">
      <div class="left_column_text">
        <xsl:value-of select="$page/left-column" />
      </div>
    </div>
    <div class="right_column">
      <div class="right_column_text">
        <xsl:value-of select="$page/right-column" />
      </div>
    </div>
  </xsl:template>
  <!-- Заполнаяем страницу Видео -->

</xsl:stylesheet>