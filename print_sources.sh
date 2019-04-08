#!/usr/bin/env bash

## Usage: ./print_sources.sh TITLENAME

tex_file=$(mktemp) ## Random temp file name

cat<< EOF > $tex_file   ## Print the tex file header
\documentclass{article}
\usepackage{listings}
\UseRawInputEncoding
\usepackage[usenames,dvipsnames]{color}  %% Allow color names
\lstdefinestyle{customasm}{
  belowcaptionskip=1\baselineskip,
  xleftmargin=\parindent,
  language=C++,   %% Change this to whatever you write in
  breaklines=true, %% Wrap long lines
  basicstyle=\footnotesize\ttfamily,
  commentstyle=\itshape\color{Gray},
  stringstyle=\color{Black},
  keywordstyle=\bfseries\color{OliveGreen},
  identifierstyle=\color{blue},
  xleftmargin=-8em,
}
\usepackage[colorlinks=true,linkcolor=blue]{hyperref}

\usepackage{blindtext}
\title{$1}
\begin{document}
\maketitle
%\tableofcontents
EOF

find . -name \*.h -o -name \*.cpp -o -name \*.s  -o -name \*.S |
sed 's/^\..//' |                 ## Change ./foo/bar.src to foo/bar.src
while read  i; do                ## Loop through each file
    name=${i//_/\\_}             ## escape underscores
    echo "\newpage" >> $tex_file   ## start each section on a new page
    echo "\section{${name}}" >> $tex_file  ## Create a section for each filename

   ## This command will include the file in the PDF
    echo "\lstinputlisting[style=customasm]{$i}" >>$tex_file
done &&
echo "\end{document}" >> $tex_file &&
pdflatex $tex_file -output-directory . &&
pdflatex $tex_file -output-directory .  ## This needs to be run twice
                                           ## for the TOC to be generated
