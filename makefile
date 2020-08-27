FILE = resume.md

all: resume.pdf resume.txt resume.html resume.docx resume.tex

%.pdf:
	pandoc  $(FILE) -t html --css=templates/style.css --metadata-file=metadata/htmltopdf.yaml --section-divs -o output/$@

%.txt:
	pandoc $(FILE) -f markdown -t plain -o output/$@

%.html:
	pandoc $(FILE) -f markdown -t html -c templates/style.css --section-divs -o output/$@ --self-contained 

%.docx:
	pandoc $(FILE) -o output/$@

%.tex:
	pandoc $(FILE) -t context -o output/$@
