<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h3>Temporal Snapshot</h3>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Employee</th>
      <th>Department No</th>
      <th>Salary</th>
    </tr>
    <xsl:for-each select="employees/employee">
    <tr>
      <td><xsl:value-of select="name"/></td>
      <td><xsl:value-of select="deptno"/></td>
      <td><xsl:value-of select="salary"/></td>
    </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>