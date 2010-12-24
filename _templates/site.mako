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
        <nav>
          <ul id="menu" class="clearfix">
            <li ${iscurrent('about')}><a href="/~gb/">About</a></li>
            <li ${iscurrent('blog')}><a href="/~gb/blog/">Blog</a></li>
            <li ${iscurrent('calendar')}><a href="/~gb/calendar.html">Calendar</a></li>
            <li ${iscurrent('important')}><a href="/~gb/important/">Important</a></li>
            <li ${iscurrent('publications')}><a href="/~gb/publications.html">Publications</a></li>
            <li ${iscurrent('research')}><a href="/~gb/research/">Research</a></li>
            <li ${iscurrent('students')}><a href="/~gb/students.html">Students</a></li>
            <li ${iscurrent('teaching')}><a href="/~gb/teaching.html">Teaching</a></li>
          </ul>
          <br class="clear" />
        </nav>
        <div id="main" class="grid_8 alpha">
           ${next.body()}
        </div> <!-- end main -->
        <div id="sidebar" class="grid_4 omega">
          <aside class="widget">
            <form action="/~gb/search.html">
              <input type="search" results="10" placeholder="Search..." name="q" />
              <input type="submit" value="Search..." />
            </form>
          </aside>
          <aside class="widget">
            <h3>Contact</h3>
            <p>255 Sitterson Hall CB 3175<br/>
            Chapel Hill, NC 27599-3175<br/>
            <br/>
            Mail: <a href="mailto:gb@cs.unc.edu">gb@cs.unc.edu</a><br/>
            Phone: 919-962-1886<br/>
            Feeds: <a class="feed" href="${bf.util.site_path_helper(bf.config.blog.path,'feed/')}">Posts</a>
% if bf.config.blog.disqus.enabled:
              and <a class="feed" href="http://${bf.config.blog.disqus.name}.disqus.com/latest.rss">Comments</a>
% endif
            </p>
          </aside>
          <aside class="widget">
            <h3>Categories</h3>
            <ul>
<%
  all_categories = bf.config.blog.all_categories
  all_categories.sort(key=lambda i: i[0].name)
%>
          % for category, num_posts in sorted(all_categories):
               <li><a href="${category.path}">${category}</a> (${num_posts})</li>
          % endfor
            </ul>
          </aside>
          <aside class="widget">
            <h3>Archives</h3>
              <select onchange="location=this.options[this.selectedIndex].value;">
              % for link, name, num_posts in bf.config.blog.archive_links:
                <option value="${bf.util.site_path_helper(bf.config.blog.path,link)}/1">${name}&nbsp;(${num_posts})</option>
              % endfor
              </select>
          </aside>
          <aside class="widget" style="height: 300px">
<script type="text/javascript" src="https://www.google.com/reader/ui/publisher-en.js"></script>
<script type="text/javascript" src="https://www.google.com/reader/public/javascript/user/05640245229867820301/state/com.google/broadcast?n=5&callback=GRC_p(%7Bc%3A%22-%22%2Ct%3A%22My%20shared%20items%22%2Cs%3A%22false%22%2Cn%3A%22false%22%2Cb%3A%22false%22%7D)%3Bnew%20GRC"></script>        
          </aside>
        </div> <!-- end sidebar -->
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
