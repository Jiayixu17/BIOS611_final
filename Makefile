# Makefile for BIOS611 Final Project

DATA_DIR   = data
REPORT_DIR = report
OUTPUT_DIR = output

DATA  = $(DATA_DIR)/city_lifestyle.csv
RMD   = $(REPORT_DIR)/report.Rmd
PDF   = $(OUTPUT_DIR)/report.pdf
HTML  = $(OUTPUT_DIR)/report.html

.PHONY: all report html clean

all: report

report: $(PDF)

$(PDF): $(RMD) $(DATA)
	Rscript -e "rmarkdown::render('$(RMD)', output_file = '$(PDF)')"

html: $(HTML)

$(HTML): $(RMD) $(DATA)
	Rscript -e \"rmarkdown::render('$(RMD)', output_format = 'html_document', output_file = '$(HTML)')\"

clean:
	rm -f $(OUTPUT_DIR)/*
