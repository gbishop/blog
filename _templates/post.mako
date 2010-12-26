<%page args="post"/>
<article class="post">
  <header>
    <h1><a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a></h1>
    <p><% 
          t = post.date.strftime("%Y-%m-%dT%H:%M:%S%z")
          t = t[:-2] + ':' + t[-2:] %>
      <time datetime="${t}" pubdate>${post.date.strftime("%B %d, %Y at %I:%M %p")}
      </time> | categories: 
<% 
   category_links = []
   for category in post.categories:
       if post.draft:
           #For drafts, we don't write to the category dirs, so just write the categories as text
           category_links.append(category.name)
       else:
           category_links.append("<a href='%s'>%s</a>" % (category.path, category.name))
%>
${", ".join(category_links)}
% if bf.config.blog.disqus.enabled:
 | <a href="${post.permalink}#disqus_thread">View Comments</a>
% endif
    </p>
  </header>
  ${self.post_prose(post)}
</article>

<%def name="post_prose(post)">
  <div class="textToIndex">
    ${post.content}
  </div>
</%def>
