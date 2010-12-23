#!/home/gb/bin/python2.6

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

postdir = '_posts'

posts = os.listdir(postdir)

permalink = re.compile(r'(?<=^permalink:).*$', re.M)
title = re.compile(r'(?<=^title:).*$', re.M)
divider = re.compile(r'^---$', re.M)

for post in posts:
    text = file(os.path.join(postdir, post), 'r').read()
    empty, header, content = divider.split(text)
    P = permalink.search(header).group(0).strip().decode('utf-8')
    T = title.search(header).group(0).strip().decode('utf-8')
    C = T + ' ' + ''.join(BeautifulSoup(content.decode('utf-8')).findAll(text=True))
    writer.add_document(title=T, path=P, content=C)
writer.commit()
t1 = time.time()

print t1 - t0, len(posts)

