<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h3>Temporal Avg. for each Job Title</h3>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Job Title</th>
      <th>
        Avg Salary History
        <table>
          <th width="100px">Salary</th>
          <th width="100px">Start Date</th>
          <th width="100px">End Date</th>
        </table>
      </th>
    </tr>
    <xsl:for-each select="titles/title">
    <tr>
      <td style="vertical-align: top;"><xsl:value-of select="@name"/></td>
      <td>
          <table>
          <xsl:for-each select= "average_salary">
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