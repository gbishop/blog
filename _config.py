# -*- coding: utf-8 -*-

######################################################################
# This is the main Blogofile configuration file.
# www.Blogofile.com
######################################################################

######################################################################
# Basic Settings
#  (almost all sites will want to configure these settings)
######################################################################
## site_url -- Your site's full URL
# Your "site" is the same thing as your _site directory.
#  If you're hosting a blogofile powered site as a subdirectory of a larger
#  non-blogofile site, then you would set the site_url to the full URL
#  including that subdirectory: "http://www.yoursite.com/path/to/blogofile-dir"
site.host = "http://www.cs.unc.edu"
site.root = "/~gb/"
site.url = site.host + site.root

#### Blog Settings ####
blog = controllers.blog

## blog_enabled -- Should the blog be enabled?
#  (You don't _have_ to use blogofile to build blogs)
blog.enabled = True

## blog_path -- Blog path.
#  This is the path of the blog relative to the site_url.
#  If your site_url is "http://www.yoursite.com/~ryan"
#  and you set blog_path to "/blog" your full blog URL would be
#  "http://www.yoursite.com/~ryan/blog"
#  Leave blank "" to set to the root of site_url
blog.path = "blog"

## blog_name -- Your Blog's name.
# This is used repeatedly in default blog templates
blog.name = "Gary Bishop"

## blog_description -- A short one line description of the blog
# used in the RSS/Atom feeds.
blog.description = "Geeks making the world a bit better."

## blog_timezone -- the timezone that you normally write your blog posts from
blog.timezone = "US/Eastern"

blog.disqus.name = 'garybishop'
blog.disqus.enabled = True
blog.post_excerpts.enabled = True
blog.post_excerpts.word_length = 25
blog.posts_per_page = 10
blog.auto_permalink.path = site.root + blog.path + "/:year/:month/:day/:title"

### colors
class Bag(object):
    pass
colors = Bag()

# carolina blue is #56A0D3, H=204 S=59, B=83
shades = [
    'black',    # B=0
    '#0A131A',  # B=10
    '#152733',  # B=20
    '#1F3A4D',  # B=30
    '#2A4D66',  # B=40
    '#346180',  # B=50
    '#3E7499',  # B=60
    '#4987B3',  # B=70
    '#56A0D3',  # B=83  Carolina Blue
    '#5EAEE6',  # B=90
    '#68C1FF',  # B=100
    '#80CBFF',  # B=100 S=50
    '#99D5FF',  # B=100 S=40
    '#B3E0FF',  # B=100 S=30
    '#CCEAFF',  # B=100 S=20
    '#E6F5FF',  # B=100 S=10
    'white',    # B=100 S=0
]
    
colors.bodyBackground = shades[8] + ' url(images/bg.png) repeat'
colors.body = shades[1]
colors.a = shades[4]
colors.button = 'white'
colors.buttonBackground = shades[8]
colors.buttonShadow = 'black'
colors.aHoverBackground = shades[8]
colors.aHover = 'white'
colors.aHoverShadow = 'black'
colors.aShadow = 'white'
colors.hrBorder = shades[2]
colors.preBackground = shades[15]
colors.preBorder = shades[4]
colors.codeBackground = shades[14]
colors.blockquote = shades[6]
colors.header = shades[3]
colors.contentBackground = 'white'
colors.contentBorder = shades[8]
colors.menuBorderBottom = shades[8]
colors.postH2A = shades[2]

