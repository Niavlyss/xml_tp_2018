<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <head>
    <style>
      .container .book {clear : both;}
      .container .image {float : left; width:200px; margin:5px;}
      .container .infos {float : left; width:400px; margin:5px;}
    </style>
  </head>
  <body>
    <div class="container">
      <xsl:apply-templates select="catalog/book" />
    </div>
  </body>
  </html>
</xsl:template>

<xsl:template match="book">
  <xsl:variable name="titre" select="title" />
  <div class="book">
    <div class="image">
      <img alt="{$titre}" width="200px" height="200px" />
    </div>
    <div class="infos">
      <div><span>Author: </span><span><xsl:value-of select="author" /></span></div>
      <div><span>Title: </span><span><xsl:value-of select="$titre" /></span></div>
      <div><span>Genre: </span><span><xsl:value-of select="genre" /></span></div>
      <div><span>Price: </span><span><xsl:value-of select="price" /></span></div>
      <div><span>Publish Date: </span><span><xsl:value-of select="publish_date" /></span></div>
      <div><span>Description: </span><span><xsl:value-of select="description" /></span></div>
    </div>
  </div>
</xsl:template>
</xsl:stylesheet>
