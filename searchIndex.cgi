#!/home/gb/bin/python2.6

import cgi
import cgitb
cgitb.enable()
import whoosh.index as index
from whoosh.qparser import QueryParser
import sys

print "Content-Type: text/plain"
print

form = cgi.FieldStorage()
if 'q' not in form:
    q = 'sourdough'
    callback = 'foo'
else:
    q = form['q'].value
    callback = form['callback'].value

indexDir = '/home/gb/Web/gb/indexdir'

ix = index.open_dir(indexDir)

searcher = ix.searcher()
query = QueryParser("content").parse(q)
results = searcher.search(query)
s = ''.join('''<p><a href="%s">%s</a></p>''' % (result['path'], result['title']) for result in results)
val = '%s("%s")' % (callback, s)
print s
