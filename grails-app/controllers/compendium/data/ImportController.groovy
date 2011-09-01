package compendium.data

import groovy.sql.Sql
import jxl.Sheet
import jxl.Workbook
import org.apache.commons.validator.UrlValidator

class ImportController {

    def index = {
        response.setContentType("text/html")

        //for (Project p: Project.list()) p.delete(flush: true)
        //for (Country c: Country.list()) c.delete(flush: true)
        //for (Link l: Link.list()) l.delete(flush: true)
        //countries()
        //projects()                                                       .

        //testCategories()
        validate()
    }

    def validate() {
        render "<h1>Invalid Links</h1>"
        Link.list().each {
            String urlv = it.url
            UrlValidator v = new UrlValidator()
            if (!v.isValid(urlv)) {
                String h = " <a href='${createLink(controller: 'link', action: "edit", id: it.id)}'>edit</a>"
                render urlv + h + "<br/>"
            }
        }
        render "<hr/><h1>Missing Titles</h1>"
        Link.list().each {
            String urlv = it.url
            if (it.title.toString().trim().equals("")) {
                String h = " <a href='${createLink(controller: 'link', action: "edit", id: it.id)}'>edit</a>"
                render urlv + h + "<br/>"

            }
        }
    }

    public static SortedMap<String, String> getCategoryMap() {
        SortedMap<String, String> map = new TreeMap<String, String>()
        map.put("UC", "Uncategorised")
        map.put("WS", "Water and Sanitation")
        map.put("GIS", "Geographical Information Systems/Remote Sensing")
        map.put("E", "Energy")
        map.put("DRM", "Disaster Risk Management")
        map.put("CE", "Coastal Engineering")
        map.put("MHC", "Minerals and Hydrocarbon")
        map.put("MB", "Maritime Boundaries")
        map.put("M", "Minerals")
        map.put("H", "Hazards")
        map.put("HRD", "Human Resources Development")
        map.put("DM", "Data Management")
        map.put("C", "Cruises")
        map.put("CP", "Coastal Processes")
        map.put("A", "Aggregates")
        map.put("ICT", "Information Communications and Technology")
        map.put("G", "General")
        map.put(" ", " ")
        //map.put("Mapping", "Mapping")
        return map;
    }

    def String[] getCategories(String category) {
        category = category.replace("M & H/C", "MHC")
        category = category.replace("M & HC", "MHC")
        category = category.replace("/etc", "")
        if (category.toLowerCase().equals("minerals")) category = "M"
        if (category.toLowerCase().equals("cruises")) category = "C"
        if (category.toLowerCase().equals("?")) category = "UC"
        if (category.toLowerCase().equals("w")) category = "WS"
        if (category.toLowerCase().equals("hr")) category = "HRD"
        if (category.toLowerCase().equals("it")) category = "ICT"
        if (category.toLowerCase().equals("ucg")) category = "UC/G"
        if (category.toLowerCase().equals("hc")) category = "MHC"
        if (category.toLowerCase().equals("gis")) category = "GIS"
        if (category.toLowerCase().equals("gis/rs")) category = "GIS"
        if (category.toLowerCase().equals("gis/it")) category = "GIS/ICT"
        if (category.toLowerCase().equals("it/gis")) category = "GIS/ICT"

        category = category.replace(", ", "/")
        category = category.replace(" , ", "/")
        category = category.replace(" ,", "/")
        category = category.replace(" ", "")

        String c1 = "", c2 = " "
        if (category.contains("/")) {
            c1 = category.split("/")[0].toUpperCase()
            c2 = category.split("/")[1].toUpperCase()
        } else {
            c1 = category
        }

        if (c1.trim().equals("")) c1 = "UC"
        if (!getCategoryMap().keySet().contains(c1)) render "ERROR  - 1. " + c1 + "<br/>"
        if (!getCategoryMap().keySet().contains(c2)) render "ERROR  - 2. " + c2 + "<br/>"

        if (!c1.equals("")) {
            //render "(" + c1 + " | " + c2 + ") " + getCategoryMap().get(c1) + " | " + getCategoryMap().get(c2) + "<br/>"
        }

        String[] res = new String[2]
        res[0] = getCategoryMap().get(c1) + " (" + c1 + ")"
        res[1] = ""
        if (!res[1].trim().equals("")) res[1] = getCategoryMap().get(c2) + " (" + c2 + ")"
        return res

    }

    def testCategories() {
        Workbook workbook = Workbook.getWorkbook(new File("/home/sachin/vanuatu.xls"))
        for (int sheetNo = 0; sheetNo < 4; sheetNo++) {   //4 for vanuatu // 2 for niue
            Sheet sheet = workbook.getSheet(sheetNo);
            String year = ""
            int no_rows = -1

            //vanuatu.xls
            if (sheetNo == 0) no_rows = 93 + 1
            if (sheetNo == 1) no_rows = 161 + 1
            if (sheetNo == 2) no_rows = 140 + 1
            if (sheetNo == 3) no_rows = 35 + 1

            //niue.xls
            //if (sheetNo == 0) no_rows = 105 + 1
            //if (sheetNo == 1) no_rows = 56 + 1

            for (int r = 1; r < no_rows; r++) {
                String category = sheet.getCell(4, r).getContents().trim()
                getCategories(category)
            }
        }
        workbook.close()
        render "finish."
    }


    def projects = {
        render "Importing Projects...<br/>"

        int count = 0
        Workbook workbook = Workbook.getWorkbook(new File("/home/sachin/niue.xls"))

        for (int sheetNo = 0; sheetNo < 2; sheetNo++) {     //change to 4 for vanuatu, and 2 for niue
            Sheet sheet = workbook.getSheet(sheetNo);
            String year = ""

            int no_rows = -1
            //vanuatu.xls
            //if (sheetNo == 0) no_rows = 93 + 1
            //if (sheetNo == 1) no_rows = 161 + 1
            //if (sheetNo == 2) no_rows = 140 + 1
            //if (sheetNo == 3) no_rows = 35 + 1

            //niue.xls
            if (sheetNo == 0) no_rows = 105 + 1
            if (sheetNo == 1) no_rows = 56 + 1

            for (int r = 0; r < no_rows; r++) {

                if (sheet.getCell(0, r).getContents().trim().equals("AS")) {
                    year = sheet.getCell(1, r).getContents().trim()
                }

                String session = sheet.getCell(0, r).getContents()

                if (session.contains("/")) {
                    count++

                    String title = sheet.getCell(1, r).getContents()
                    String type = sheet.getCell(2, r).getContents().trim()
                    if (type.equals("Survey Cruise")) type = "Cruise"
                    if (type.equals("Programme (Survey Cruise)")) type = "Cruise"
                    if (type.equals("Field study")) type = "Study"
                    if (type.equals("Training Course")) type = "Training"
                    if (type.equals("coloured geological map")) type = "Map"
                    if (type.equals("Reports")) type = "Report"
                    if (type.equals("Task")) type = "Activity"
                    if (type.equals("project")) type = "Project"
                    if (type.equals("activity")) type = "Activity"
                    if (type.equals("study")) type = "Study"
                    if (type.equals("programme")) type = "Programme"
                    if (type.equals("Document")) type = "Report"
                    if (type.equals("Bathymetric Map")) type = "Map"

                    String description = sheet.getCell(3, r).getContents()

                    String[] tmp = getCategories(sheet.getCell(4, r).getContents())
                    String category1 = tmp[0]
                    String category2 = tmp[1]

                    String proposedYear = sheet.getCell(5, r).getContents()
                    String startDate = sheet.getCell(6, r).getContents()
                    String endDate = sheet.getCell(7, r).getContents()
                    String scope_ = sheet.getCell(8, r).getContents().trim()
                    String scope = ""
                    if (scope_.equals("N")) scope = "National"
                    if (scope_.equals("R")) scope = "Regional"
                    String partnerOrganisation = sheet.getCell(10, r).getContents().trim()
                    String partnerAssistance = sheet.getCell(11, r).getContents().trim()
                    String output = sheet.getCell(12, r).getContents().trim()
                    String keywords = sheet.getCell(14, r).getContents().trim()
                    String contactDetails = sheet.getCell(15, r).getContents().trim()
                    String reference = sheet.getCell(16, r).getContents().trim()
                    String comments = sheet.getCell(17, r).getContents().trim()

                    Project p = new Project();
                    p.title = title
                    p.projectYear = year
                    p.session = session.trim().substring(0, session.length() - 1)
                    p.type = type
                    p.description = description
                    p.category1 = category1
                    p.category2 = category2
                    p.proposedYear = proposedYear
                    p.startDate = startDate
                    p.endDate = endDate
                    p.scope = scope
                    p.partnerOrganisation = partnerOrganisation
                    p.partnerAssistance = partnerAssistance
                    p.projectOutput = output
                    p.keywords = keywords
                    p.contactDetails = contactDetails
                    p.reference = reference
                    p.comments = comments

                    //links - 13
                    String link_ = sheet.getCell(13, r).getContents().trim()
                    link_ = link_.replaceAll("(hardcopy)", " ").trim()
                    if (!link_.equals("")) {
                        String[] links = link_.split(";")
                        for (String l: links) {
                            Link dLink = new Link()
                            String url = "http://dev.sopac.org.fj/VirLib/" + l.trim() + ".pdf"
                            String linkTitle = ""
                            def sql = Sql.newInstance("jdbc:derby://202.62.0.38:1527/web_console_db", "sopac", "sopac", "org.apache.derby.jdbc.ClientDriver")
                            sql.eachRow("select Title from Library Where File='" + l.trim() + ".pdf'") {
                                linkTitle = it.Title
                            }
                            dLink.url = url
                            dLink.title = linkTitle
                            p.addToLinks(dLink)
                        }
                    }

                    //countries - 9
                    String country_ = sheet.getCell(9, r).getContents().trim()
                    country_ = country_.toUpperCase()
                    country_ = country_.replaceAll("VA", "VU")
                    country_ = country_.replaceAll("CI", "CK")
                    country_ = country_.replaceAll("SI", "SB")
                    country_ = country_.replaceAll("PNG", "PG")
                    country_ = country_.replaceAll("&", ",")
                    country_ = country_.replaceAll(";", ",")
                    if (!country_.equals("")) {
                        String[] countries = country_.split(",")
                        for (String code: countries) {
                            code = code.trim()
                            Country c = Country.findWhere(code: code)
                            if (c != null) {
                                p.addToCountries(c)
                            }
                        }
                    }

                    p.save(flush: true, failOnError: true)
                    render count + ". " + title + " (" + (sheetNo + 1) + ")" + "<br/>"
                }
            }

        }
        workbook.close()
        render "Projects Imported!<br/><hr/>"
    }

    def countries = {
        render "Importing Countries...<br/>"

        Map<String, String> map = new HashMap<String, String>()
        map.put("American Samoa", "AS")
        map.put("Australia", "AU")
        map.put("Cook Islands", "CK")
        map.put("Federated States of Micronesia", "FM")
        map.put("Fiji Islands", "FJ")
        map.put("French Polynesia", "PF")
        map.put("Guam", "GU")
        map.put("Kiribati", "KI")
        map.put("Marshall Islands", "MH")
        map.put("Nauru", "NR")
        map.put("New Caledonia", "NC")
        map.put("New Zealand", "NZ")
        map.put("Niue", "NU")
        map.put("Palau", "PW")
        map.put("Papua New Guinea", "PG")
        map.put("Samoa", "WS")
        map.put("Solomon Islands", "SB")
        map.put("Tokelau", "TK")
        map.put("Tonga", "TO")
        map.put("Tuvalu", "TV")
        map.put("Vanuatu", "VU")

        def sql = Sql.newInstance("jdbc:derby://202.62.0.38:1527/web_console_db", "sopac", "sopac", "org.apache.derby.jdbc.ClientDriver")
        sql.eachRow("select name, SOPACMembership from Country Order By Name") {
            Country c = new Country()
            c.name = it.name
            c.membership = it.SOPACMembership
            c.code = map.get(it.name)
            c.save(flush: true, failOnError: true)
        }
        render "Countries Imported!<br/><hr/>"
    }


}
