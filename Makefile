# Makefile per la tesi

PDFLATEX	=	pdflatex
PDFLATEXFLAGS	=	--output-format=pdf \
					-halt-on-error

BIBTEX		=	bibtex

MAINFILE	=	Curriculum.tex
MAINTEX		=	$(MAINFILE:.tex=)

IMAGES		=	res.cls

TARGET		=	Curriculum.pdf

BUILDDIR	=	build

.PHONY: clean distclean bd

all: $(TARGET)

bd:
	mkdir -p $(BUILDDIR)

$(TARGET): bd $(MAINFILE) $(TEXFILES)
	cp $(MAINFILE) $(TEXFILES) $(IMAGES) $(BUILDDIR)
	cd $(BUILDDIR) && \
	$(PDFLATEX) $(PDFLATEXFLAGS) $(MAINTEX)
	cd $(BUILDDIR) && \
	$(PDFLATEX) $(PDFLATEXFLAGS) $(MAINTEX)
	mv $(BUILDDIR)/$(TARGET) .

distclean: clean
	rm -fr $(TARGET)

clean:
	rm -fr $(BUILDDIR)

ex-novo: distclean $(TARGET)
