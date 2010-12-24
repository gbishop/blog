<%inherit file="site.mako" />
% for post in posts:
  <%include file="post_excerpt.mako" args="post=post" />
  <hr class="interblog" />
% endfor
% if prev_link:
 <a href="${prev_link}">« Previous Page</a>
% endif
% if prev_link and next_link:
  --  
% endif
% if next_link:
 <a href="${next_link}">Next Page »</a>
% endif
<%def name="robots_meta()">
  <meta name="robots" content="noindex,follow">
</%def>
