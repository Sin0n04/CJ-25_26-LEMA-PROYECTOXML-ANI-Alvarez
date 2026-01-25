<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Catalogue by Category</title>
                <meta charset="UTF-8"/>
                <link rel="stylesheet" type="text/css" href="../Styles/main.css"/>
            </head>
            
            <body>
                <header>
                    <h1>Catalogue by Category</h1>
                    <header id="header">
                        <div class="inner">
                            <a href="#" class="logo">PC-PARTS</a>
                            <nav id="nav">
                                <a href="../index.html">Index</a>
                                <a href="../xmldata/catalog.xml">Catalog</a>
                                <a href="../web/contacto.html">Contact</a>								
                            </nav>
                        </div>
                    </header>
                    <a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

                </header>
                
                <section>
                    
                    <!-- Loop unique categories -->
                   <table>
                        <tr>
                             <xsl:for-each select="/catalog/components/component
                                          [not(@category = preceding-sibling::component/@category)]">
                                
                        <td>
                            <h2>
                                <xsl:value-of select="@category"/>
                            </h2>
                        </td>
                        <td>
                            <ul>
                                <xsl:for-each select="/catalog/components/component[@category = current()/@category]">
                                    <li>
                                        <strong>
                                            <xsl:value-of select="brand"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="model"/>
                                            <img> 
                                                <xsl:attribute name="src">
                                                <xsl:value-of select="image"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="width">200</xsl:attribute>
                                                <xsl:attribute name="height">140</xsl:attribute>
                                            </img>
                                            <a>
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="url"/>
                                                </xsl:attribute>
                                                <xsl:text>Product Link</xsl:text>
                                            </a>
                                        </strong>
                                        —
                                        <xsl:value-of select="price"/> €
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </td>
                    </xsl:for-each>
                        </tr>
                   </table>
                    
                </section>
                
                <footer>
                        <div class="inner">
                            <div class="copyright">
                               2026 Emmanuel Ani , Jean-Paul Alvarez.
                            </div>
                        </div>
                </footer>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
