<%@ page import="compendium.data.Project; compendium.data.Country" %>
<html>
<head>

    <title>SOPAC Compendium</title>
    <meta name="layout" content="main"/>

    <resource:autoComplete skin="default"/>

    <script type="text/javascript"
            src="${resource(dir: 'js', file: 'dojo/dojo/dojo.js')}"></script>
    <script type="text/javascript">
        dojo.require("dojox.widget.FisheyeList");
        dojo.require("dojo.parser");
        dojo.addOnLoad(function() {
            dojo.parser.parse();
        });
    </script>

    <style type="text/css" media="screen">

    fieldset, img {
        border: 0 none;
    }

    address, caption, cite, code, dfn, th, var {
        font-style: normal;
        font-weight: normal;
    }

    caption, th {
        text-align: left;
    }

    q:before, q:after {
        content: "";
    }

    abbr, acronym {
        border: 0;
    }

    blockquote {
        font-size: 0.916em;
        margin-top: 3.272em;
        margin-bottom: 3.272em;
        line-height: 1.636em;
        padding: 1.636em;
        border-top: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
    }

    ol li, ul li {
        font-size: 1em;
        line-height: 1.5em;
        margin: 0;
    }

    pre, code {
        font-size: 115%;
        *font-size: 100%;
        font-family: Courier, "Courier New";
        background-color: #efefef;
        border: 1px solid #ccc;
    }

    pre {
        border-width: 1px 0;
        padding: 1.5em;
    }

    table {
        font-size: 100%;
    }

    table.dojoTabular {
        border-collapse: collapse;
        border-spacing: 0;
        border: 1px solid #ccc;
        margin: 0 1.5em;
    }

    .dojoTabular th {
        text-align: center;
        font-weight: bold;
    }

    table.dojoTabular thead, table.dojoTabular tfoot {
        background-color: #efefef;
        border: 1px solid #ccc;
        border-width: 1px 0;
    }

    table.dojoTabular thead tr th, table.dojoTabular thead tr td, table.dojoTabular tbody tr td, table.dojoTabular tfoot tr td {
        padding: 0.25em 0.5em;
    }

    .dojoxFisheyeListItemLabel {
        font-family: Arial, Helvetica, sans-serif;
        background-color: #eee;
        border: 2px solid #666;
        padding: 2px;
        text-align: center;
        position: absolute;
        display: none;
        white-space: pre;
    }

    .dojoxFisheyeListItemLabel.dojoxFishSelected {
        display: block;
    }

    .dojoxFisheyeListItemImage {
        border: 0px;
        position: absolute;
    }

    .dojoxFisheyeListItem {
        position: absolute;
        z-index: 2;
    }

    .dojoxFisheyeListBar {
        position: relative;
    }

    .dojoxFisheyeListBar {
        margin: 0 auto;
        text-align: center;
    }

    .outerbar {
        background-color: #666;
        text-align: center;
        position: absolute;
        left: 0px;
        top: 0px;
        width: 100%;
        border-bottom: 2px solid #333;
    }

    #nav {
        margin-top: 20px;
        margin-left: 30px; /*width: 228px;  */
        width: 228px;
        float: left;

    }

    .homePagePanel * {
        margin: 0px;
    }

    .homePagePanel .panelBody ul {
        list-style-type: none;
        margin-bottom: 10px;
    }

    .homePagePanel .panelBody h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin-bottom: 10px;
    }

    .homePagePanel .panelBody {
        background: url(images/leftnav_midstretch.png) repeat-y top;
        margin: 0px;
        padding: 15px;
    }

    .homePagePanel .panelBtm {
        background: url(images/leftnav_btm.png) no-repeat top;
        height: 20px;
        margin: 0px;
    }

    .homePagePanel .panelTop {
        background: url(images/leftnav_top.png) no-repeat top;
        height: 11px;
        margin: 0px;
    }

    h2 {
        margin-top: 15px;
        margin-bottom: 15px;
        font-size: 1.2em;
    }

    #pageBody {
        margin-left: 280px;
        margin-right: 20px;
    }
    </style>
</head>

<body>

<div class="nav">
    %{--<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>--}%
    <span class="menuButton" style="margin-left: 20px;"><b>Digital collection of the entire body of knowledge of SOPAC/CCOP from 1972 - 2010</b>
    </span>

</div>


<div id="nav">
    <div class="homePagePanel">
        <div class="panelTop"></div>

        <div class="panelBody">
            <h1>Collections by Country</h1>
            <ul>
                <g:each in="${Country.list()}">
                    <li>${it.name} (${it.projects.size()})</li>
                </g:each>
            </ul>

            <h1>Collections by Category</h1>
            <ul>
                <g:each in="${Project.executeQuery('select distinct p.category1 from Project p')}">
                    <g:if test="${!it.toString().trim().equals('')}">

                        <g:if test="${it.toString().contains('(')}">
                            <li>${it.substring(0, it.indexOf('('))} (${Project.findAllWhere(category1: it).size()})</li>
                        </g:if>
                        <g:else>
                            <li>${it} (${Project.findAllWhere(category1: it).size()})</li>
                        </g:else>

                    </g:if>
                </g:each>
            </ul>


            <h1>Collections by Type</h1>
            <ul>
                <g:each in="${Project.executeQuery('select distinct p.type from Project p')}">
                    <g:if test="${!it.toString().trim().equals('')}">
                        <li>${it} (${Project.findAllWhere(type: it).size()})</li>
                    </g:if>
                </g:each>
                <g:set var="sql" value="select distinct p.id from Project p where p.type=''"/>
                <li>Unknown Type (${Project.executeQuery(sql).size()})</li>
            </ul>
            %{--
                <h1>Collections by Year</h1>

                <g:each in="${Project.executeQuery('select distinct p.projectYear from Project p').sort()}">
                  <g:if test="${!it.toString().trim().equals('')}">
                    <b>${it}</b> (${Project.findAllWhere(projectYear: it).size()});
                  </g:if>
                </g:each>
            --}%
            <br/>
            <hr/>

            <h1>Total Collections: <span style="color: black"><b>${Project.count()}</b></span></h1>

        </div>

        <div class="panelBtm"></div>
    </div>
</div>

<div id="pageBody">
    %{--<h1 style="font-variant: small-caps">SOPAC Compendium</h1>--}%

    <br/>
    <br/>
    <br/>

    <!--logos -->

    <!--dojoeyemenu-->
    <div dojoType="dojox.widget.FisheyeList" itemWidth="128"
         itemHeight="128" itemMaxWidth="200" itemMaxHeight="200"
         orientation="horizontal" effectUnits="2" itemPadding="10"
         attachEdge="top" labelEdge="bottom" id="fisheye1">

        <div dojoType="dojox.widget.FisheyeListItem" label="Browse Collections by Country" onclick="window.location = '${createLink(controller:'country')}'"
             iconSrc="${createLinkTo(dir: 'images', file: 'country.png')}"></div>

        <div dojoType="dojox.widget.FisheyeListItem" label="Browse Collections by Category" onclick="window.location = '${createLink(controller:'category')}'"
             iconSrc="${createLinkTo(dir: 'images', file: 'category.png')}"></div>

        <div dojoType="dojox.widget.FisheyeListItem" label="Browse Collections by Type" onclick="window.location = '${createLink(controller:'type')}'"
             iconSrc="${createLinkTo(dir: 'images', file: 'type.png')}"></div>

        <div dojoType="dojox.widget.FisheyeListItem" label="Browse Collections" onclick="window.location = '${createLink(controller:'project')}'"
             iconSrc="${createLinkTo(dir: 'images', file: 'project.png')}"></div>

        <div dojoType="dojox.widget.FisheyeListItem" label="Search Collections" onclick="window.location = '${createLink(controller:'searchable')}'"
             iconSrc="${createLinkTo(dir: 'images', file: 'search.png')}"></div>

        <div dojoType="dojox.widget.FisheyeListItem" label="User Accounts" onclick="window.location = '${createLink(controller:'userAccount')}'"
             iconSrc="${createLinkTo(dir: 'images', file: 'contacts.png')}"></div>

        <div dojoType="dojox.widget.FisheyeListItem" label="Package and Download Collections" onclick="window.location = '${createLink(url:'invalid.gsp')}'"
             iconSrc="${createLinkTo(dir: 'images', file: 'package.png')}"></div>

    </div>


    <br/>
    <br/>


    <div style="background-color:#e0ffff; padding: 15px; border: blue; border-width: thick;">

        <div align="center" style="width: 100%; ">
            <g:if test="${session.user == null}">
                |
                <input type=button onClick="location.href = '${createLink(controller:'login', action:'index')}'" value='Login'>
                |
            </g:if>

            <g:if test="${session.user != null}">

                <g:form action="logout" controller="login" method="post">

                    <b>${session.user}</b> logged in
                    <br/>
                    <br/>
                    <hr width="50%"/>

                    <i>Search Sessions</i>
                    <richui:autoComplete name="name" action="${createLinkTo('dir': 'autoComplete/searchAJAX')}" onItemSelect="document.location.href = '${createLinkTo(dir: 'project/listSessions')}?session=' + id;"/>

                    <hr width="50%"/>

                    <input style="width: 142px" type=button onClick="location.href = '${createLink(controller:'project', action:'create')}'" value='Create New Collection'>
                    <br/>
                    <input style="width: 142px" type=button onClick="location.href = '${createLink(controller:'link', action:'list')}'" value='Define Linkages'>
                    <br/>
                    <input style="width: 142px" type=button onClick="location.href = '${createLink(controller:'log', action:'list')}'" value='View Logs'>
                    <br/>
                    <g:actionSubmit style="width: 142px" value="Logout"/>
                    <br/>

                    <hr width="50%"/>
                    <br/>

                </g:form>

            </g:if>
        </div>

        <div align="center">
            <br/>

            <h3>Latest 10 Entries</h3>
            <br/>
            <g:each in="${Project.listOrderById(order:'desc', max:10)}" var="e">
                <p><a href="${createLink(controller: 'project', action: 'show', id: e.id)}">${e.title}</a> <b>(${e.session})</b>
                </p>
            </g:each>
        </div>

        <br/>

        <p>
            The <b>SOPAC Geoscience Compendium</b> Project is a digital collection of the entire body of knowledge of SOPAC’s work in the Pacific Region from the time of its inception in 1972 to 2010.  The Compendium packages together various datasets and information on SOPAC’s work for each of its member countries.  The Compendium exercise is two fold in its purpose:
        </p>
        <br/>
        <ul style="margin-left: 60px; margin-right: 160px">
            <li>to inventory, collate, and hand over to island member states a copy of the Commissions holdings of intellectual property belonging to each in the event of transferring the lot to SPC; and</li>
            <li>to provide a basis / benchmark for island member states to monitor and measure the performance of the RIF-induced creation of the new Applied Geoscience and Technology Division of SPC</li>
        </ul>
        <br/>

        <p>
            The Compendium packages are largely for SOPAC member countries of namely (1) American Samoa, (2) Cook Islands, (3) Federated States of Micronesia, (4) Fiji Islands, (5) French Polynesia, (6) Guam, (7) Kiribati, (8) Marshall Islands, (9) Nauru, (10) New Caledonia, (11) Niue, (12) Palau, (13) Papua New Guinea, (14) Samoa, (15) Solomon Islands, (16) Tokelau, (17) Tonga, (18) Tuvalu and (19) Vanuatu; and for the region.
        </p>

        <br/>

        <h2>Organisation</h2>

        <p>
            SOPAC, the organisation is an independent, inter-governmental, regional organisation mandated by several Pacific nations to:
        </p>
        <br/>
        <ul style="margin-left: 60px; margin-right: 160px">
            <li>develop resource policy, and advise on the management and development of onshore and offshore mineral and aggregate resources;</li>
            <li>meet the needs for water resources, waste management, health and sanitation through the provision of resource policy and management advice, appropriate information and training;</li>
            <li>support the information requirements and enhance the skills required for management and operation of the energy sector in member countries;</li>
            <li>assist decision makers and planners to develop coastal zones and extract resources while protecting them from degradation;</li>
            <li>predict the effects of hazards on the health, wealth and development potential of member countries;</li>
            <li>assist decision makers and planners to understand ocean processes, develop ocean areas and extract resources while protecting oceans from over-exploitation and pollution;</li>
            <li>provide geoscientific and related education needs through the provision of a variety of training and education opportunities at all levels of geoscience and resource management;</li>
            <li>meet the demands for electronic information by member country governments and regional organisations to manage resources and risk;</li>
            <li>support National authorities in disaster management activities through advice information; and</li>
            <li>provide readily-available and current information in geoscience and related fields to member countries and others.</li>
        </ul>
        <br/>

        <p align="justify">
            The SOPAC member countries are currently American Samoa (Associate), Australia, Cook Islands, Federated States of Micronesia, Fiji Islands, French Polynesia (Associate); Guam, Kiribati, Marshall Islands, Nauru, New Caledonia (Associate), New Zealand, Niue, Palau, Papua New Guinea, Samoa, Solomon Islands, Tokelau (Associate), Tonga, Tuvalu and Vanuatu.
        </p>
        <br/>


        <div style="width: 100%;" align="center">
            <hr/>
            <br/>
            <i>Applied GeoScience and Technology Division, Secretariat of the Pacific Community, 2011</i>
        </div>

    </div>
</div>

</body>
</html>
