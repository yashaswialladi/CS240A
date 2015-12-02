<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>Temporal Join</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Emp No</th>
      <th>Name</th>
      <th>Dept No</th>
      <th>Manager</th>
      <th>Start Date</th>
      <th>End Date</th>
    </tr>
    <xsl:for-each select="employees/employee">
    <tr>
      <td><xsl:value-of select="empno"/></td>
      <td><xsl:value-of select="name"/></td>
      <td><xsl:value-of select="department/deptno"/></td>
      <td><xsl:value-of select="department/manager"/></td>
      <td><xsl:value-of select="period/@tstart"/></td>
      <td><xsl:value-of select="period/@tend"/></td>
    </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>