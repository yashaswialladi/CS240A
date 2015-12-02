<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h3>Temporal Slicing</h3>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Department No</th>
      <th>Department Name</th>
      <th>
        Manager
        <table>
          <th width="100px">Manager No</th>
          <th width="100px">Start Date</th>
          <th width="100px">End Date</th>
        </table>
      </th>
    </tr>
    <xsl:for-each select="departments/department">
    <tr>
      <td><xsl:value-of select="deptno"/></td>
      <td><xsl:value-of select="deptname"/></td>
      <td>
          <table>
          <xsl:for-each select= "mgrno">
            <tr>
              <td width="100px"><xsl:value-of select="current()"/></td>
              <td width="100px"><xsl:value-of select="@tstart"/></td>
              <td width="100px"><xsl:value-of select="@tend"/></td>
            </tr>
          </xsl:for-each>
          </table>
      </td>
    </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>