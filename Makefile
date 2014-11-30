# Makefile Curriculum

LATEXFLAGS		= -halt-on-error
XELATEX			= xelatex
BIBTEX			= bibtex

TARGET_MAINFILE	= Curriculum.tex
TARGET_MAINTEX	= $(TARGET_MAINFILE:.tex=)
TARGET			= $(TARGET_MAINFILE:.tex=.pdf)

TEMPLATES		= friggeri-cv.cls
BUILDDIR		= build

.PHONY: clean distclean bd

all: $(TARGET)

bd:
	mkdir -p $(BUILDDIR)

$(TARGET): bd $(TARGET_MAINFILE) $(TEXFILES)
	@cp $(TARGET_MAINFILE) $(TEMPLATES) $(BUILDDIR)
	@echo "Creating $(TARGET)"
	@cd $(BUILDDIR) && $(XELATEX) $(LATEXFLAGS) $(TARGET_MAINTEX) > /dev/null
	@cd $(BUILDDIR) && $(XELATEX) $(LATEXFLAGS) $(TARGET_MAINTEX) > /dev/null
	@echo "Done"
	@mv $(BUILDDIR)/$(TARGET) .

open: $(TARGET)
	@echo "Opening $(TARGET)"
	@open $(TARGET)


distclean: clean
	rm -fr $(TARGET)

clean:
	rm -fr $(BUILDDIR)

ex-novo: distclean $(TARGET)
