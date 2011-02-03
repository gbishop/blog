preview:
	blogofile build
	-killall blogofile
	blogofile serve 8080 yes &
	
deploy:
	git commit -a -m `zenity --text --title="commit message"`
	git push origin

