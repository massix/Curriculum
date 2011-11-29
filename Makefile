# Makefile per la tesi

PDFLATEX	=	pdflatex
PDFLATEXFLAGS	=	--output-format=pdf \
					-halt-on-error

BIBTEX		=	bibtex

MAINFILE	=	Curriculum.tex
ENG_MAINFILE=	Curriculum-eng.tex

MAINTEX		=	$(MAINFILE:.tex=)
ENG_MAINTEX	=	$(ENG_MAINFILE:.tex=)

IMAGES		=	res.cls

TARGET		=	Curriculum.pdf
ENG_TARGET	=	Curriculum-eng.pdf

BUILDDIR	=	build

.PHONY: clean distclean bd

all: $(TARGET) $(ENG_TARGET)

bd:
	mkdir -p $(BUILDDIR)

$(TARGET): bd $(MAINFILE) $(TEXFILES)
	cp $(MAINFILE) $(TEXFILES) $(IMAGES) $(BUILDDIR)
	cd $(BUILDDIR) && \
	$(PDFLATEX) $(PDFLATEXFLAGS) $(MAINTEX)
	cd $(BUILDDIR) && \
	$(PDFLATEX) $(PDFLATEXFLAGS) $(MAINTEX)
	mv $(BUILDDIR)/$(TARGET) .

$(ENG_TARGET): bd $(ENG_MAINFILE) $(TEXFILES)
	cp $(ENG_MAINFILE) $(TEXFILES) $(IMAGES) $(BUILDDIR)
	cd $(BUILDDIR) && \
	$(PDFLATEX) $(PDFLATEXFLAGS) $(ENG_MAINTEX)
	cd $(BUILDDIR) && \
	$(PDFLATEX) $(PDFLATEXFLAGS) $(ENG_MAINTEX)
	mv $(BUILDDIR)/$(ENG_TARGET) .
	

distclean: clean
	rm -fr $(TARGET)
	rm -fr $(ENG_TARGET)

clean:
	rm -fr $(BUILDDIR)

ex-novo: distclean $(TARGET)
