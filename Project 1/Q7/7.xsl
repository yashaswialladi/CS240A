<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>Temporal Max for Department d005</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Salary</th>
      <th>Start Date</th>
      <th>End Date</th>
    </tr>
    <xsl:for-each select="department/max_salary">
    <tr>
      <td><xsl:value-of select="current()"/></td>
      <td><xsl:value-of select="@tstart"/></td>
      <td><xsl:value-of select="@tend"/></td>
    </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>