#!/home/gb/bin/python2.6

import cgi
import cgitb
cgitb.enable()
import whoosh.index as index
from whoosh.qparser import QueryParser
import sys
import json
import re

print "Content-Type: text/javascript"
print

form = cgi.FieldStorage()
if 'q' not in form:
    q = 'sourdough+walnut'
    callback = 'foo'
else:
    q = form['q'].value
    callback = form['callback'].value

q = re.sub(r'\W+', ' ', q)

indexDir = '/home/gb/Web/gb/indexdir'

ix = index.open_dir(indexDir)

searcher = ix.searcher()
query = QueryParser("content").parse(q)
results = [ { 'path': result['path'], 'title': result['title']}
            for result in searcher.search(query) ]
d = { 'results': results, 'query': q }
val = '%s(%s)' % (callback, json.dumps(d))
print val
