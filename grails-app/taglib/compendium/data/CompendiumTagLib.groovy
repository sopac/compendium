package compendium.data

class CompendiumTagLib {

    def thumbnail = { attrs, body ->
        String uuid = attrs.uuid.trim()


        String xml = new URL("http://geonetwork.sopac.org/geonetwork/srv/en/iso19139.xml?uuid=" + uuid).getText().replaceAll("gmd:", "")
        def node = new XmlSlurper().parseText(xml);
        String thumbnail = node.identificationInfo.MD_DataIdentification.graphicOverview.MD_BrowseGraphic.fileName[0]
        thumbnail = thumbnail.replace("_s.png", ".jpg")
        thumbnail = "http://ict.sopac.org/compendium-thumbnails/" + thumbnail

        String html = "<img align='middle' height='200px' border='1' src='" + thumbnail + "'/>"
        html = html + "<a target='_blank' href='" + thumbnail + "'>  View Larger Size</a>"
        out << html
    }

}
