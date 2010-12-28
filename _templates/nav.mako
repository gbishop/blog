<%page args="current"/>
        <nav>
          <ul id="menu" class="clearfix">
            ${item("", "About")}
            ${item("blog/", "Blog")}
            ${item("calendar.html", "Calendar")}
            ${item("important/", "Important")}
            ${item("publications.html", "Publications")}
            ${item("research/", "Research")}
            ${item("students.html", "Students")}
            ${item("teaching.html", "Teaching")}
          </ul>
          <br class="clear" />
        </nav>
<%def name="item(link, text)" ><% 
  if current == text.lower():
    cl = ' class="current"'
  else:
    cl = ''
  %><li${cl}><a href="${bf.config.site.root}${link}">${text}</a></li>
</%def>
