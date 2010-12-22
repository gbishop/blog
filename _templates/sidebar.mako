<aside id="sidebar">
  <section>
    <header>
      <h3>Contact</h3>
    </header>
    <p>Blogofile is written by <a href="http://www.enigmacurry.com" rel="external" target="_blank">Ryan McGuire</a>
  <br/><br/> 
  Please send technical questions to the <br/><a href="http://groups.google.com/group/blogofile-discuss">mailing list</a>. Or, if you need to contact me privately, you can <a href="http://mailhide.recaptcha.net/d?k=01VHGYFI7WE9jB_dHebD-0JQ==&c=3qCKNvkRgZtCa5B5PJcptJVgaDI5-xiMjUjHgQi3vIw=">send email</a>.</p>
  </section>
  <section>
    <header>
      <h3>Latest blog posts</h3>
    </header>
    <ul>
% for post in bf.config.blog.posts[:5]:
      <li><a href="${post.path}">${post.title}</a></li>
% endfor
    </ul>
  </section>
  <section>
    <header>
      <h3>Categories</h3>
    </header>
    <ul>
% for category, num_posts in bf.config.blog.all_categories:
     <li><a href="${category.path}">${category}</a> (<a href="${category.path}/feed">rss</a>) (${num_posts})</li>
% endfor
    </ul>
  </section> 
  <section>
    <header>
     <h3>Archives</h3>
    </header>
    <ul>
% for link, name, num_posts in bf.config.blog.archive_links[:3]:
      <li><a href="${bf.util.site_path_helper(bf.config.blog.path,link)}/1" title="${name}">${name}</a>&nbsp;(${num_posts})</li>
% endfor
    </ul>
  </section>

</aside>
