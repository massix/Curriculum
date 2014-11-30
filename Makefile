# Makefile per la tesi

PDFLATEXFLAGS	=	--output-format=pdf -halt-on-error
XELATEX   = /usr/texbin/xelatex
BIBTEX		=	/usr/texbin/bibtex

NEWTARGET_MAINFILE = NewCurriculum.tex
NEWTARGET_MAINTEX = $(NEWTARGET_MAINFILE:.tex=)

IMAGES		=	res.cls friggeri-cv.cls
NEWTARGET = NewCurriculum.pdf

BUILDDIR	=	build

.PHONY: clean distclean bd

# all: $(TARGET) $(ENG_TARGET) $(TECH_TARGET)
all: $(NEWTARGET)

bd:
	mkdir -p $(BUILDDIR)

$(NEWTARGET): bd $(NEWTARGET_MAINFILE) $(TEXFILES)
	cp $(NEWTARGET_MAINFILE) $(IMAGES) $(BUILDDIR)
	cd $(BUILDDIR) && \
	  $(XELATEX) $(PDFLATEXFLAGS) $(NEWTARGET_MAINTEX)
	cd $(BUILDDIR) && \
	  $(XELATEX) $(PDFLATEXFLAGS) $(NEWTARGET_MAINTEX)
	mv $(BUILDDIR)/$(NEWTARGET) .


distclean: clean
	rm -fr $(NEWTARGET)

clean:
	rm -fr $(BUILDDIR)

ex-novo: distclean $(TARGET)
