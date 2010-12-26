        <div id="sidebar" class="grid_4 omega">
          <aside class="widget">
            <form action="/~gb/search.html">
              <input type="search" placeholder="Search..." name="q" />
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
              <p>
              <select onchange="location=this.options[this.selectedIndex].value;">
              % for link, name, num_posts in bf.config.blog.archive_links:
                <option value="${bf.util.site_path_helper(bf.config.blog.path,link)}/1">${name}&nbsp;(${num_posts})</option>
              % endfor
              </select>
              </p>
          </aside>
          <aside class="widget" style="height: 300px">
<script type="text/javascript" src="https://www.google.com/reader/ui/publisher-en.js"></script>
<script type="text/javascript" src="https://www.google.com/reader/public/javascript/user/05640245229867820301/state/com.google/broadcast?n=5&callback=GRC_p(%7Bc%3A%22-%22%2Ct%3A%22My%20shared%20items%22%2Cs%3A%22false%22%2Cn%3A%22false%22%2Cb%3A%22false%22%7D)%3Bnew%20GRC"></script>        
          </aside>
        </div> <!-- end sidebar -->

