import os
import shutil
import operator
import feed
from post import Tag
from blogofile.cache import bf

blog = bf.config.controllers.blog


def run():
    write_tags()

def sort_into_tags():
    tags = set()
    for post in blog.posts:
        tags.update(post.tags)
    for tag in tags:
        tag_posts = [post for post in blog.posts
                            if tag in post.tags]
        blog.tagged_posts[tag] = tag_posts
        count = len(tag_posts)
        tag.count = count
        blog.all_tags.append((tag, count))
    # sort by count
    blog.all_tags.sort(key=operator.itemgetter(1), reverse=True)
    # keep only top tags
    blog.top_tags = blog.all_tags[:blog.top_tags_count]
    # find the max and the min of the top tags
    max_count = 0
    min_count = 1e308
    for tag, count in blog.top_tags:
        max_count = max(count, max_count)
        min_count = min(count, min_count)
    for tag, count in blog.top_tags:
        tag.score = int(round(blog.tag_bins * (count - min_count) / float(max_count - min_count)))
    # sort top tags by name
    blog.top_tags.sort(key=operator.itemgetter(0))
    # sort all tags by name
    blog.all_tags.sort(key=operator.itemgetter(0))
    
def write_tags():
    """Write all the blog posts in tags"""
    root = bf.util.path_join(blog.path, blog.tag_dir)
    #Find all the tags:
    tags = set()
    for post in blog.posts:
        tags.update(post.tags)
    for tag, tag_posts in blog.tagged_posts.items():
        #Write tag RSS feed
        rss_path = bf.util.fs_site_path_helper(
            blog.path, blog.tag_dir,
            tag.url_name, "feed")
        feed.write_feed(tag_posts,rss_path, "rss.mako")
        atom_path = bf.util.fs_site_path_helper(
            blog.path, blog.tag_dir,
            tag.url_name, "feed", "atom")
        feed.write_feed(tag_posts, atom_path, "atom.mako")
        page_num = 1
        while True:
            path = bf.util.path_join(root, tag.url_name,
                                str(page_num), "index.html")
            page_posts = tag_posts[:blog.posts_per_page]
            tag_posts = tag_posts[blog.posts_per_page:]
            #Forward and back links
            if page_num > 1:
                prev_link = bf.util.site_path_helper(
                    blog.path, blog.tag_dir, tag.url_name,
                                           str(page_num - 1))
            else:
                prev_link = None
            if len(tag_posts) > 0:
                next_link = bf.util.site_path_helper(
                    blog.path, blog.tag_dir, tag.url_name,
                                           str(page_num + 1))
            else:
                next_link = None
            
            env = {
                "posts": page_posts,
                "prev_link": prev_link,
                "next_link": next_link
            }
            bf.writer.materialize_template("chronological.mako", path, env)
            
            #Copy tag/1 to tag/index.html
            if page_num == 1:
                shutil.copyfile(
                        bf.util.path_join(bf.writer.output_dir, path),
                        bf.util.path_join(
                                bf.writer.output_dir, root, tag.url_name,
                                "index.html"))
            #Prepare next iteration
            page_num += 1
            if len(tag_posts) == 0:
                break
