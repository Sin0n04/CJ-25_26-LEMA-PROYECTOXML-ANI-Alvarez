<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/catalog">
        <html>
            <head>
                <title>Catalog</title>
                <link rel="stylesheet" type="text/css" href="./Styles/main.css"/>
            </head>
            <body>
                <h2>Catalog</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>Title</th>
                        <th>Author</th>
                        <th>Price</th>
                    </tr>
                    <xsl:for-each select="book">
                        <tr>
                            <td><xsl:value-of select="title"/></td>
                            <td><xsl:value-of select="author"/></td>
                            <td><xsl:value-of select="price"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>