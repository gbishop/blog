import docutils.core
import re

config = {
    'name': "reStructuredText",
    'description': "Renders reStructuredText formatted text to HTML",
    'aliases': ['rst']
    }

morePattern = re.compile(r'^<!--more-->\s*$', re.M)

def run(content):
    content = morePattern.sub('.. raw:: html\n\n  <!--more-->\n', content)
    return docutils.core.publish_parts(content, writer_name='html')['html_body']
