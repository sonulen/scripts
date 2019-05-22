#!/usr/bin/env bash

## Usage: ./print_sources.sh TITLENAME Децимальник


tex_file=$1.tex ## Random temp file name

cat<< EOF > $tex_file   ## Print the tex file header
% Espd
\documentclass[a4paper,12pt]{article}
\usepackage[T2A]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{lastpage}
\usepackage[russian]{babel}
\usepackage{uspd}
\usepackage{ifthen}

%variables
\newboolean{needtableofcontents}
\setboolean{needtableofcontents}{false}
\newboolean{needmilitary}
\setboolean{needmilitary}{false}


\usepackage{listings}
\usepackage{array} % для задания ширины столбцов массивов в supertabular

% Для таблиц
\usepackage{longtable}
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}

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
  extendedchars=false,
  numbers=left,                           % Line nums position
  numberstyle=\tiny,                      % Line-numbers fonts
  stepnumber=1,                           % Step between two line-numbers
  numbersep=5pt,                          % How far are line-numbers from code
  tabsize=2,                              % Default tab size
  captionpos=b,                           % Caption-position = bottom
  breaklines=true,                        % Automatic line breaking?
  breakatwhitespace=true,                % Automatic breaks only at whitespace?
  showspaces=false,                       % Dont make spaces visible
  showtabs=false,                         % Dont make tabls visible
  columns=flexible,                       % Column format
  keepspaces = true   %!!!! пробелы в комментариях
}
\usepackage[colorlinks=true,linkcolor=blue]{hyperref}

\usepackage{blindtext}

\newcommand{\docdecimalnumber}{$2}
\newcommand{\programnameshort}{}
\newcommand{\programnamefull}{Программное обеспечение $1}

% Для переноса по символам. можно не экранировать
\usepackage{seqsplit}
\newcommand{\cmd}[1]{\expandafter\seqsplit\expandafter{\detokenize{#1}}}
\usepackage{minted}
\begin{document}

\sloppy
\title{\programnamefull \\\\
~\\
Текст программ}

\begin{uspd}{\docdecimalnumber}

\section{Текст программы на исходном языке}

Текст программы находится в файлах, находящихся на прилагаемом к данному документу компакт-диске.
Список файлов предоставлен в следующей таблице.

\begin{longtable}{|C{.1\textwidth}|m{.8\textwidth}|}
	\caption{Список файлов} \\\\ \hline
	Номер & \centering{Относительный путь файла}
	\endfirsthead
	\hline
EOF

seq=1
find . -name \*.h -o -name \*.cpp -o -name \*.s  -o -name \*.S |
sed 's/^\..//' |                 ## Change ./foo/bar.src to foo/bar.src
while read  i; do                ## Loop through each file
    name=${i}
    echo "${seq} & \cmd{${name}} \\\\ \hline" >> $tex_file  ## Create a section for each filename
    seq=$((${seq} + 1))
done &&
echo "\end{longtable}" >> $tex_file &&

find . -name \*.h -o -name \*.cpp -o -name \*.s  -o -name \*.S |
sed 's/^\..//' |                 ## Change ./foo/bar.src to foo/bar.src
while read  i; do                ## Loop through each file
    name=${i//_/\\_}             ## escape underscores
    echo "\newpage" >> $tex_file   ## start each section on a new page
    echo "\subsection{${name}}" >> $tex_file  ## Create a section for each filename

   ## This command will include the file in the PDF
    echo "\lstinputlisting[style=customasm]{$i}" >> $tex_file
done &&

echo "\newpage" >> $tex_file  &&
echo "\end{uspd}" >> $tex_file  &&
echo "\end{document}" >> $tex_file  &&
pdflatex -shell-escape -interaction=nonstopmode $tex_file -output-directory . &&
pdflatex -shell-escape -interaction=nonstopmode $tex_file -output-directory .  ## This needs to be run twice
                                           ## for the TOC to be generated
