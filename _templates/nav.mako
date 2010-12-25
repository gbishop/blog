<%page args="current"/>
        <nav>
          <ul id="menu" class="clearfix">
            ${item("/~gb/", "About")}
            ${item("/~gb/blog/", "Blog")}
            ${item("/~gb/calendar.html", "Calendar")}
            ${item("/~gb/important/", "Important")}
            ${item("/~gb/publications.html", "Publications")}
            ${item("/~gb/research/", "Research")}
            ${item("/~gb/students.html", "Students")}
            ${item("/~gb/teaching.html", "Teaching")}
          </ul>
          <br class="clear" />
        </nav>
<%def name="item(link, text)" ><% 
  if current == text.lower():
    cl = ' class="current"'
  else:
    cl = ''
  %><li${cl}><a href="${link}">${text}</a></li>
</%def>
