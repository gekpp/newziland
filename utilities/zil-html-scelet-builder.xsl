<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="content-filler.xsl" />

	<xsl:template name="write-html-and-children">
		<!-- <xsl:param name="title"/> <xsl:param name="keywords"/> <xsl:param 
			name="description/> -->
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<xsl:call-template name="write-title" />
				<xsl:call-template name="write-keywords-and-desc" />
				<xsl:call-template name="write-styles" />
				<xsl:call-template name="write-scripts" />
				<xsl:call-template name="write-print-styles" />
			</head>
			<body>
				<xsl:call-template name="write-body" />
			</body>
		</html>
	</xsl:template>

	<xsl:template name="write-title">
		<title>

		</title>
	</xsl:template>

	<xsl:template name="write-keywords-and-desc">
		<meta name="keywords" content="" />
		<meta name="description" content="" />
	</xsl:template>

	<xsl:template name="write-styles">
		<link rel="stylesheet" href="{$workspace}/css/common.css" type="text/css"
			media="screen, projection" />
		<link rel="stylesheet" href="{$workspace}/css/page_with_galery.css"
			type="text/css" media="screen, projection" />
		<xsl:choose>
			<xsl:when
				test="('home'=$root-page) or number(/data/contact-page-by-1st-menu/entry/@id)">
				<link rel="stylesheet" href="{$workspace}/css/like_main_page.css"
					type="text/css" media="screen, projection" />
			</xsl:when>
			<xsl:when
				test="number(/data/params/ds-scheme-page/item[1])">
				<link rel="stylesheet" href="{$workspace}/css/scheme_page.css" tyle="text/css" media="screen, projection" />
			</xsl:when>				
		</xsl:choose>
	</xsl:template>

        <xsl:template name="write-print-styles">
          <link rel="stylesheet" type="text/css" media="print" href="{$workspace}/css/print.css" />
        </xsl:template>

	<xsl:template name="write-scripts">
		<xsl:variable name="needJquery">
			<xsl:choose>
				<xsl:when test="number(/data/page-galery/entry/@id)">
					1
				</xsl:when>
				<xsl:otherwise>
					0
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="number($needJquery)=1">
				<script src="{$workspace}/js/jquery.js"></script>
				<script src="{$workspace}/galleria/galleria-1.2.9.min.js"></script>
				<script>
					$(document).ready(function (){
					//Galleria.
					Galleria.loadTheme("<xsl:value-of select="$workspace"/>/galleria/themes/classic/galleria.classic.min.js");
					//Galleria.DEBUG=false;
					Galleria.configure({lightbox: true, autoplay: 5000, imageCrop: 'height'});
					Galleria.run('#galleria');
					//Galleria.configure('debug',false);
					});
				</script>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="write-body">
		<xsl:variable name="home-link-name" value-of="" />
		<xsl:variable name="header-text-left-1st" value-of="" />
		<xsl:variable name="header-text-left-2nd" value-of="" />
		<xsl:variable name="header-text-right-1st" value-of="" />

		<body>
			<div class="wrapper">
				<div class="middle" id="header">
					<div class="container">
						<div class="content">
							<div class="center_content">
								<div class="left_column">
									<div class="header_1st_line" style="float: right">
										<xsl:value-of
											select="/data/ml-strings/entry[name='развитие территории']/value" />
									</div>
									<div class="header_2nd_line" style="float: right; padding-left: 45px;">
										<xsl:value-of
											select="/data/ml-strings/entry[name='полуостров зил']/value" />
									</div>
									<div class="close_div"></div>
								</div>
								<div class="right_column">
									<div style="float: left">
										<div class="header_1st_line">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</div>

									</div>
									<img style="float: right; padding-top: 15px" src="/workspace/uploads/images/zil-logo.png" />
								</div>
								<div style="clear:both"></div>
							</div>
						</div><!-- #content -->
					</div><!-- #container -->

					<div class="sidebar sideLeft menu">
						<xsl:variable name="item-class">
							<xsl:choose>
								<xsl:when test="'home'=$root-page">
									selected_menu
								</xsl:when>
								<xsl:otherwise />
							</xsl:choose>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="string(/data/params/url-language)">
								<div>
									<a href="{$root}/{$url-language}/home">
										<span class="{$item-class}">
											<xsl:value-of select="/data/ml-strings/entry[name='main']/value" />
										</span>
									</a>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div>
									<a href="{$root}/home">
										<span class="{$item-class}">
											<xsl:value-of select="/data/ml-strings/entry[name='main']/value" />
										</span>
									</a>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div><!-- .sidebar#sideLeft -->
				</div><!-- #middle -->

				<div class="middle" id="main_content">
					<div class="container">
						<div class="content">
							<div class="center_content">
								<xsl:call-template name="fill-main-content" />
							</div>
						</div><!-- #content -->
					</div><!-- #container -->

					<div class="sidebar sideLeft menu">
						<xsl:call-template name="fill-left-1nd-menu" />
					</div><!-- .sidebar#sideLeft -->
				</div><!-- #middle -->
				<div class="middle" id="header">
					<div class="container">
						<div class="content">
							<div class="center_content">
								<xsl:call-template name="fill-footer" />
							</div>
						</div><!-- #content -->
					</div><!-- #container -->

					<div class="sidebar sideLeft">
					</div><!-- .sidebar#sideLeft -->
				</div><!-- #middle -->
			</div> <!--wrapper -->
		</body>
	</xsl:template>

</xsl:stylesheet>