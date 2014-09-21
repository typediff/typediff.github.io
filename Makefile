ICONS=\
	favicon.ico\
	images/favicon.png

all:	content

content:	$(ICONS)

favicon.ico:	images/icon.svg
	convert $? \
		-bordercolor white -border 0 \
		\( -clone 0 -resize 16x16 \) \
		\( -clone 0 -resize 32x32 \) \
		\( -clone 0 -resize 48x48 \) \
		\( -clone 0 -resize 64x64 \) \
		-delete 0 -alpha off -colors 256 $@

images/favicon.png:	images/icon.svg
	convert $? $@

init::
	gem install jekyll

serve:	content
	jekyll serve --baseurl '' --watch

clean::
	rm -rf _site $(ICONS)
