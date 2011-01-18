#! /bin/sh

echo "Content-Type: text/html"     # HTML is following
echo                               # blank line, end of headers

cd /home/gb/Web/gb
/home/gb/Bin/git pull origin master
/home/gb/bin/blogofile build
cp -r _site/* /home/gb/public_html/
/home/gb/bin/python2.6 buildIndex.py

echo 'ok'
