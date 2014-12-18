<?xml version="1.0" encoding="ISO-8859-2"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" omit-xml-declaration="no"
                indent="yes"/>

    <xsl:param name="pageType"/>
    <xsl:param name="currentPageNo"/>
    <xsl:param name="totalPages"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Override for target element -->
    <xsl:template name="approvalPage" match="newApprovals">

        <!-- Copy the element -->
        <xsl:copy>
            <!-- Add new node (or whatever else you wanna do) -->
            <xsl:element name="approvalPage">
                <xsl:element name="pageType"><xsl:value-of select="$pageType"/></xsl:element>
                <xsl:element name="currentPageNo"><xsl:value-of select="$currentPageNo"/></xsl:element>
                <xsl:element name="totalPages"><xsl:value-of select="$totalPages"/></xsl:element>
                <!-- And everything inside it -->
                <xsl:apply-templates select="@* | *"/>
            </xsl:element>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>