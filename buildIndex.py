#!/home/gb/bin/python2.6

# ignore the directories so we don't index archives and such
ignoreDirs = [ 'css', 'fonts', 'indexdir', 'archive', 'category', 'feed', 'page' ]
ignorePaths = [ '_site/blog/index.html' ]

import os, os.path
from whoosh import index
from whoosh.fields import *
import time
from BeautifulSoup import BeautifulSoup

indexDir = '/home/gb/Web/gb/indexdir'
t0 = time.time()
if not os.path.exists(indexDir):
    os.mkdir(indexDir)

schema = Schema(title=TEXT(stored=True), path=ID(stored=True), content=TEXT)
ix = index.create_in(indexDir, schema)
writer = ix.writer()

count = 0
for root, dirs, files in os.walk('_site'):
    for d in ignoreDirs:
        if d in dirs:
            dirs.remove(d)
            
    for f in files:
        if not f.endswith('.html'):
            continue
        count += 1
        fpath = os.path.join(root, f)
        if fpath in ignorePaths:
            continue
        parts = fpath.split('/')
        parts[0] = '/~gb'
        if parts[-1] == 'index.html':
            del parts[-1]
        upath = '/'.join(parts)
        soup = BeautifulSoup(file(fpath, 'r'))
        content = soup.find('div', id="main")
        title = content.find('h1').find(text=True)
        permalink = upath.decode('utf-8')
        toIndex = content.find('div', 'textToIndex')
        if toIndex:
            text = title + ' ' + ''.join(toIndex.findAll(text=True))
        else:
            text = ''.join(content.findAll(text=True))
        writer.add_document(title=title, path=permalink, content=text)
        
writer.commit()
t1 = time.time()

print t1 - t0, count

