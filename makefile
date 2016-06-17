TEX = pandoc
src = template.tex details.yml ref.yml
FLAGS = --latex-engine=xelatex

all: ref.yml cv.pdf

ref.yml: publi.bib
	pandoc-citeproc -y $< $ > $@

cv.pdf : $(src)
	$(TEX)  $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)

.PHONY: all
clean :
	rm ref.yml cv.pdf
