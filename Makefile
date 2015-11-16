#-----------------------------------------------------
MAIN=main
ICONSDIR=images/icons
IMAGESDIR=images
STYLE=/Users/bruel/dev/POO/COO/stylesheets/golo-jmb.css
ASCIIDOC=asciidoc -a icons -a iconsdir=$(ICONSDIR) -a imagesdir=$(IMAGESDIR) -a stylesheet=$(STYLE) -a data-uri
#ASCIIDOC=asciidoc -a icons -a iconsdir=$(ICONSDIR) -a data-uri
ASCIIDOCTOR=asciidoctor -a icons=font -a imagesdir=$(IMAGESDIR) -a data-uri -a toc2
EXT=asc
OUTPUT=.
DEP=definitions.txt asciidoc.conf
#-----------------------------------------------------

all: $(OUTPUT)/main.html


$(OUTPUT)/%.html: %.$(EXT) $(DEP)
	@echo '==> Compiling asciidoc files to generate HTML'
	$(ASCIIDOCTOR) -b html5 -a numbered -a eleve -o $@ $<
	cp main.html index.html

$(OUTPUT)/%.corrige.html: %.$(EXT)
	@echo '==> Compiling asciidoc files to generate Corrections'
	$(ASCIIDOCTOR) -b html5 -a numbered -a correction -a prof -o $@ $<

$(OUTPUT)/%.slides.html: %.$(EXT)
	@echo '==> Compiling asciidoc files to generate Deckjs'
	$(ASCIIDOC) -a slides -b deckjs -a deckjs_transition=horizontal-slide -a deckjs_theme=web-2.0 -o $@ $<

deploy:
	cp main.html index.html
	git commit -am "deploy updates"
	git push

clean:
	@echo '==> Cleaning compilation files'
	@# fichiers de compilation latex
	@rm -f *.log *.aux *.dvi *.toc *.lot *.lof *.ilg
	@# fichiers de bibtex
	@rm -f *.blg
