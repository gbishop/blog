        <div id="sidebar" class="grid_3 omega">
          <aside class="widget">
            <form action="${bf.config.site.root}search.html">
              <input type="search" placeholder="Search..." name="q" />
              <input type="submit" value="Search" />
            </form>
          </aside>
          <aside class="widget">
            <h3>Contact</h3>
            <p>Gary Bishop <a href="mailto:gb@cs.unc.edu">gb@cs.unc.edu</a><br/>
            919-962-1886<br/>
            255 Sitterson Hall<br/>
            Chapel Hill, NC 27599-3175<br/>
            </p>
          </aside>
          <aside class="widget">
            <h3>Recent posts</h3>
            <script src="${bf.config.site.root}recent.js"></script>
            <p>
            <a class="feed" href="${bf.util.site_path_helper(bf.config.blog.path,'feed/index.xml')}">Subscribe to posts</a>
% if bf.config.blog.disqus.enabled:
            <br/><a class="feed" href="http://${bf.config.blog.disqus.name}.disqus.com/latest.rss">Subscribe to comments</a>
% endif
            </p>
          </aside>
          <aside class="widget">
            <h3>Top Tags</h3>
              <div id="tags">
              % for tag, count in bf.config.blog.top_tags:
              <a href="${bf.util.site_path_helper(bf.config.blog.path,bf.config.blog.tag_dir,tag.slug)}" class="tag${tag.score}" title="${tag.count} posts">${tag.name}</a>
              % endfor
              </div>
          </aside>
          <aside class="widget">
          <aside class="widget">
            <h3>Archives</h3>
              <p>
              <select onchange="location=this.options[this.selectedIndex].value;">
                <option disabled="disabled">Choose a month</option>
              % for link, name, num_posts in bf.config.blog.archive_links:
                <option value="${bf.util.site_path_helper(bf.config.blog.path,link)}/1">${name}&nbsp;(${num_posts})</option>
              % endfor
              </select>
              </p>
          </aside>
          <aside class="widget" style="min-height: 300px">
<script type="text/javascript" src="https://www.google.com/reader/ui/publisher-en.js"></script>
<script type="text/javascript" src="https://www.google.com/reader/public/javascript/user/05640245229867820301/state/com.google/broadcast?n=5&callback=GRC_p(%7Bc%3A%22-%22%2Ct%3A%22Google%20reader%22%2Cs%3A%22false%22%2Cn%3A%22false%22%2Cb%3A%22false%22%7D)%3Bnew%20GRC"></script>        
          </aside>
        </div> <!-- end sidebar -->

