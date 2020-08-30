#!/bin/bash
	pandoc --toc --template filters/template.tex \
	-H glossaries.tex default.yaml \
	--lua-filter=filters/diagram-filter.lua \
	--lua-filter=filters/include-files.lua \
	--lua-filter=filters/pandoc-gls.lua \
	--filter pandoc-citeproc \
	--filter mermaid-filter -s report.md -f markdown -t latex -o report.tex \
	--standalone \
	--pdf-engine tectonic \
	&& pdflatex report.tex \
	&& makeglossaries report \
	&& pdflatex report.tex \
	&& pdflatex report.tex \
	&& open -a Skim report.pdf \
	&& open -a Skim report.pdf