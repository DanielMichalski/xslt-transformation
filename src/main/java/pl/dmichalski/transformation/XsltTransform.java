package pl.dmichalski.transformation;

import pl.dmichalski.transformation.xsl.XsltTransformer;

public class XsltTransform {

    public static void main(String[] args) throws Exception {
        XsltTransformer xsltTransformer = new XsltTransformer();
        xsltTransformer.transform(args);
    }

}