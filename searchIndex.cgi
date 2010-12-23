#!/home/gb/bin/python2.6

import cgi
import cgitb
cgitb.enable()
import whoosh.index as index
from whoosh.qparser import QueryParser
import sys

print "Content-Type: text/html"     # HTML is following
print                               # blank line, end of headers

form = cgi.FieldStorage()
q = form['q'].value

indexDir = '/home/gb/Web/gb/indexdir'

ix = index.open_dir(indexDir)

searcher = ix.searcher()
query = QueryParser("content").parse(q)
results = searcher.search(query)
for result in results:
    print '''<a href="%s">%s</a>''' % (result['path'], result['title'])

