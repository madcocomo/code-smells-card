<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" 
    version="1.1">
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master page-height="148mm" page-width="105mm" font-size="10" master-name="card">
                    <fo:region-body region-name="card-region" margin="10mm" />
                    <fo:region-after region-name="card-footer" extent="10mm" margin="5mm" />
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="card" format="A">
                <fo:static-content flow-name="card-footer">
                    <fo:table>
                        <fo:table-column column-number="1" column-width="50%" number-columns-repeated="2"/>
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell> <fo:block font-size="6" text-align="left">Source    https://www.industriallogic.com</fo:block></fo:table-cell>
                                <fo:table-cell> <fo:block font-size="6" text-align="right">Recomposed by Vic  </fo:block></fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:static-content>
                <fo:flow flow-name="card-region">
                    <fo:block>
                        <xsl:apply-templates/>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="smell">
        <fo:block break-before="page">
            <fo:block font-weight="bold" text-align="center" border-bottom-style="solid" border-bottom-color="white" border-bottom-width="8mm">
                <fo:inline font-size="18"><xsl:value-of select="name"/></fo:inline>
            </fo:block>
            <fo:block  border-bottom-style="solid" border-bottom-color="white" border-bottom-width="5mm">
                <xsl:value-of select="description"/>
            </fo:block>
            <fo:block font-weight="bold" border-bottom-style="solid" border-bottom-color="white" border-bottom-width="3mm">
                <xsl:text>Refactorings</xsl:text>
            </fo:block>
            <fo:list-block>
                <xsl:apply-templates/>
            </fo:list-block>
        </fo:block>
    </xsl:template>

    <xsl:template match="refactoring">
        <fo:list-item>
            <fo:list-item-label>
                <fo:block>  </fo:block>
            </fo:list-item-label>
            <fo:list-item-body>
                <fo:block>
                    <fo:inline><xsl:value-of select="text()"/></fo:inline>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>
</xsl:stylesheet>
