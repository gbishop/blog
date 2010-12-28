<%!
  current_ = ''
%>
<%inherit file="_templates/site.mako" />
<h1>Results <span id="query"></span></h1>
<div id="results"></div>
<%def name="header_extra()">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/dojo/1.5/dojo/dojo.xd.js"></script>
<script type="text/javascript" src="${bf.config.site.root}js/search.js"></script>
</%def>

