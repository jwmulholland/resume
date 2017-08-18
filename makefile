FILE = resume-traditional.md

all: resume.pdf resume.txt resume.html resume.docx resume.tex

# %.pdf:
# 	pandoc $(FILE) -t context --template templates/style.tex -o output/$@

# %.pdf:
# 	pandoc $(FILE) --latex-engine=xelatex --template templates/style.tex -s -o output/$@

# %.pdf:
	# pandoc metadata/htmltopdf.yaml $(FILE) -t html5 --section-divs -s --dpi=720 --css templates/style.css -o output/$@
%.pdf:
	pandoc $(FILE) -t html5 -c ../templates/style.css --section-divs -o output/temp.html
	wkhtmltopdf --page-size letter --dpi 192 output/temp.html output/$@
	rm output/temp.html

%.txt:
	pandoc $(FILE) -f markdown -t plain -o output/$@

%.html:
	pandoc $(FILE) -t html5 -c ../templates/style.css --section-divs -o output/$@ 

%.docx:
	pandoc $(FILE) -o output/$@

%.tex:
	pandoc $(FILE) -t context -o output/$@
