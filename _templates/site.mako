<%!
   current_ = 'blog'
%>
<%inherit file="base.mako" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    ${self.robots_meta()}
    <title>${bf.config.blog.name}</title>
    <link rel="alternate" type="application/rss+xml" title="RSS 2.0" 
      href="${bf.util.site_path_helper(bf.config.blog.path,'/feed/')}" />
    <link rel="alternate" type="application/atom+xml" title="Atom 1.0"
      href="${bf.util.site_path_helper(bf.config.blog.path,'/feed/atom/')}" />
    <link href="/~gb/css/960.css" rel="stylesheet" type="text/css" />
    <link href="/~gb/style.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 9]>
    	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
    <![endif]-->
    
    <!--[if lte IE 7]>
    	<link href="css/ie.css" rel="stylesheet" type="text/css" />
    <![endif]-->
    
    ${self.header_extra()}

  </head>
  <body>
    <div id="wrapper" class="container_12">
      <header id="header" class="grid_12">
        <h1><a href="#">${bf.config.blog.name}</a></h1>
        <h2>${bf.config.blog.description}</h2>
      </header>
      <div id="content">
        <%include file="nav.mako" args="current=self.attr.current_" />
        <div id="main" class="grid_9 alpha">
           ${next.body()}
        </div> <!-- end main -->
        <%include file="sidebar.mako" />
      </div> <!-- end content -->
     <div class="clear"></div>
     <%include file="footer.mako" />
    </div> <!-- end wrapper -->
  </body>
</html>
<%def name="iscurrent(t)">
  % if self.attr.current_ == t:
  class="current"
  % endif
</%def>
<%def name="robots_meta()">
  <meta name="robots" content="index,follow">
</%def>
<%def name="header_extra()">
</%def>
