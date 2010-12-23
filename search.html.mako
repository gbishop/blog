<%!
  current_ = ''
%>
<%inherit file="_templates/site.mako" />
<h1>Results <span id="query"></span></h1>
<ol id="results"></ol>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/dojo/1.5/dojo/dojo.xd.js"></script>
<script type="text/javascript">
  dojo.require('dojo.io.script');
  dojo.ready(function() {
    var parms = dojo.queryToObject(window.location.search.substring(1));
    var targetNode = dojo.byId("results");
    var jsonpArgs = {
      url: "http://wwwx.cs.unc.edu/~gb/cgi-bin/searchIndex.cgi",
      callbackParamName: "callback",
      content: parms,
      load: function(data) {
          //Set the data from the search into the viewbox in nicely formatted JSON
          dojo.forEach(data.results, function(result) {
            var li = dojo.create('li', {}, targetNode);
            var a = dojo.create('a', { href: result.path, innerHTML: result.title }, li);
          });
      },
      error: function(error) {
          targetNode.innerHTML = "An unexpected error occurred: " + error;
      }
    };
    dojo.io.script.get(jsonpArgs);
  });
</script>

