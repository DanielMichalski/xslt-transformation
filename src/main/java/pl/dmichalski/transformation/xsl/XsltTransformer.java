package pl.dmichalski.transformation.xsl;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.FileOutputStream;

/**
 * Author: Daniel
 */
public class XsltTransformer {

    public void transform(String[] data) throws Exception {
        if (data.length < 5) {
            throw new IllegalArgumentException("Missing parameters!!\n" +
                    "Usage: XsltTransform <src_xml_file> <src_xls_file> <dest_xml_file> <page_type> <total_pages>");
        } else {
            String srcXmlFile = data[0];
            String srcXlsFile = data[1];
            String destXmlFile = data[2];
            String pageType = data[3];
            String totalPages = data[4];

            TransformerFactory tFactory = TransformerFactory.newInstance();
            StreamSource xlsSource = new StreamSource(srcXlsFile);
            Transformer transformer = tFactory.newTransformer(xlsSource);

            transformer.setParameter("pageType", pageType);
            transformer.setParameter("totalPages", totalPages);
            transformer.setParameter("currentPageNo", "1");

            StreamSource xmlSource = new StreamSource(srcXmlFile);
            StreamResult result = new StreamResult(new FileOutputStream(destXmlFile));
            transformer.transform(xmlSource, result);
        }
    }

}
