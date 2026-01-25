<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <!-- VAT variable -->
    <xsl:variable name="vat" select="/catalog/vat"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Component Catalogue</title>
                <meta charset="UTF-8"/>
                <link rel="stylesheet" type="text/css" href="../Styles/main.css"/>
            </head>
            
            <body>
                <header>
                    <h1>Component Catalogue</h1>
                    <header id="header">
                        <div class="inner">
                            <a href="#" class="logo">PC-PARTS</a>
                            <nav id="nav">
                                <a href="../index.html">Index</a>
                                <a href="../xmldata/catalog2.xml">Catagoric Catalog</a>
                                <a href="../web/contacto.html">Contact</a>								
                            </nav>
                        </div>
                    </header>
                    <a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

                </header>
                
                <section>
                    <p>
                        Total products:
                        <strong>
                            <xsl:value-of select="count(/catalog/components/component)"/>
                        </strong>
                    </p>
                    
                    <table border="1">
                        <tr>
                            <th>Image</th>
                            <th>Brand</th>
                            <th>Model</th>
                            <th>Category</th>
                            <th>Price (€)</th>
                            <th>Price + VAT (€)</th>
                            <th>Discount (%)</th>
                            <th>Link</th>
                        </tr>
                        
                        <xsl:for-each select="/catalog/components/component">
                            <tr>
                                <td>
                                    <img>
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="image"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="width">100</xsl:attribute>
                                    </img>
                                </td>
                                
                                <td><xsl:value-of select="brand"/></td>
                                <td><xsl:value-of select="model"/></td>
                                <td><xsl:value-of select="@category"/></td>
                                <td><xsl:value-of select="price"/></td>
                                
                                <!-- Price with VAT -->
                                <td>
                                    <xsl:value-of select="format-number(
                                                          price + (price * $vat div 100),
                                                          '0.00')"/>
                                </td>
                                
                                <td><xsl:value-of select="discount"/></td>
                                
                                <td>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="url"/>
                                        </xsl:attribute>
                                        More info
                                    </a>
                                </td>
                            </tr>
                        </xsl:for-each>
                        
                    </table>
                </section>
                
                <footer>
                    <p> 2026 - Emmanuel Ani, Jean-Paul Alvarez</p>
                </footer>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
