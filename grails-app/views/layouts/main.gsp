<html>
<head>
  <title>SOPAC Compendium</title>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>
  <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
  <g:layoutHead/>
  <g:javascript library="application"/>
</head>
<body>
<div id="spinner" class="spinner" style="display:none;">
  <img src="${resource(dir: 'images', file: 'spinner.gif')}" alt="${message(code: 'spinner.alt', default: 'Loading...')}"/>
</div>
%{--<div id="grailsLogo"><a href="http://grails.org"><img src="${resource(dir:'images',file:'sopac.png')}" alt="Grails" border="0" /></a></div>--}%

<div style="height: 110px">
  <div id="grailsLogo" class="logo" style="text-align: right"><a title="Go Back" href="#" onclick="history.back();return false"><img src="${resource(dir: 'images', file: 'sopac.png')}" align="left" style="padding-left: 10px; padding-top:20px" alt="Grails" border="0"/></a>
    <h1>Digital collection of the entire body of knowledge of SOPAC<br/>from 1972 (than CCOP/SOPAC) to 2010</h1>

  </div>

</div>

<g:layoutBody/>
</body>
</html>