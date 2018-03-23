<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <h2><xsl:value-of select="concat('My ', PARTS/TITLE)"/></h2>
  <table border="1">
    <tr>
      <th style="text-align:left">Name</th>
      <th style="text-align:left">Cost</th>
    </tr>
    <xsl:for-each select="PARTS/PART">
    <tr>
      <td><xsl:value-of select="concat(MANUFACTURER, ' ', ITEM)"/></td>
      <td><xsl:value-of select="concat(COST, '$')"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
