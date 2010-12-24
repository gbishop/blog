#!/home/gb/bin/python2.6

'''script to search the Whoosh full text index with a jsonp interface'''

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
    # defaults for testing
    q = u'hark the sound'
    callback = 'foo'
else:
    q = form['q'].value.decode('utf-8')
    callback = form['callback'].value

# eliminate non-word junk
q = re.sub(r'\W+', ' ', q)

indexDir = '/home/gb/Web/gb/indexdir'

ix = index.open_dir(indexDir)

searcher = ix.searcher()
query = QueryParser("content", schema=ix.schema).parse(q)
results = searcher.search(query, limit=100)
# repackage for conversion to json
results = [ { 'path': result['path'], 'title': result['title']}
            for result in results ]
d = { 'results': results, 'query': q }
val = '%s(%s)' % (callback, json.dumps(d))
print val
