<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <body>
    <h4>Production de Cafe</h4>
    <table border="1" style="border-collapse: collapse;"><tbody style="font-size:12px">
      <tr>
        <th style="text-align:left">N</th>
        <th style="text-align:left">Pays</th>
        <th style="text-align:left">Arabica</th>
        <th style="text-align:left">Robusta</th>
        <th style="text-align:left">Export</th>
        <th style="text-align:left">Total</th>
        <th style="text-align:left">Reste</th>
      </tr>
      <!-- Appliquer un template pour chaque element qui match cafe/pays -->
      <xsl:apply-templates  select="cafe/pays">
        <xsl:sort select="@name" />
      </xsl:apply-templates>
    </tbody></table>
  </body>
  </html>
  </xsl:template>
  <xsl:template match="pays">
    <xsl:variable name="export" select="export" />
    <xsl:variable name="total" select="sum(production)" />
    <xsl:variable name="p_robusta" select="production[@type='robusta']" />
    <xsl:variable name="p_arabica" select="production[@type='arabica']" />
    <xsl:variable name="Reste" select="production[@type='arabica']" />
    <xsl:variable name="row_style">
      <xsl:if test="position() mod 2 = 0">background-color:red; color:#fff;</xsl:if>
    </xsl:variable>
    <tr style="{$row_style}">
      <td><xsl:value-of  select="position()" /></td>
      <td><xsl:value-of  select="@name" /></td>
      <td>
        <xsl:call-template name="dash">
          <xsl:with-param name="prod_value" select="$p_arabica" />
        </xsl:call-template>
      </td>
      <td>
        <xsl:call-template name="dash">
          <xsl:with-param name="prod_value" select="$p_robusta" />
        </xsl:call-template>
      </td>
      <td>
        <xsl:call-template name="dash">
          <xsl:with-param name="prod_value" select="$export" />
        </xsl:call-template>
      </td>
      <td>
        <xsl:call-template name="dash">
          <xsl:with-param name="prod_value" select="$total" />
        </xsl:call-template>
      </td>
      <td>
        <xsl:call-template name="rest">
        <xsl:with-param name="export" select="$export" />
          <xsl:with-param name="total" select="$total" />
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="rest">
    <xsl:param name="export" />
    <xsl:param name="total" />
    <xsl:choose>
        <xsl:when test="$export">
            <xsl:value-of select="$total - $export" />
        </xsl:when>
        <xsl:otherwise><xsl:value-of select="$total" /></xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="dash">
    <xsl:param name="prod_value" />
    <xsl:choose>
        <xsl:when test="$prod_value">
            <xsl:value-of select="$prod_value" />
        </xsl:when>
        <xsl:otherwise>-</xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
