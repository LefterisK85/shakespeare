#!/bin/bash

# Exploratory text analysis using shell commands
# Get the 15 words with the highest frequency in the shakespeare.txt file

infile="shakespeare.txt"

echo first 10 lines:
head -10 $infile

echo "last 10 lines: "
tail -10 $infile

echo "the number of lines in the document is: "
wc -l < $infile

echo "the number of words in the document is: "
wc -w < $infile

echo "the size of the file in bytes is: "
wc -c < $infile

echo "the most common words and their frequency in the document are: "
sed -e 's/\s/\n/g' < shakespeare.txt | sort | sed '/^$/d' | uniq -c | sort -nr | head -15 > out.txt 
cat out.txt

# Breaking down the pipe:

# sed -e 's/\s/\n/g' --> stream editor 
# Replace every \s character (for space) with a \n character (for a new line)
# The result is a standard out stream of one word per line and some blank lines that existed prior to running this command
#
# < shakespeare.txt 
# Redirect standard input to come from shakespeare.txt
#
# sort
# The list of words, characters and blanks is sorted with the blanks coming first
#
# sed '/^$/d' 
# Delete the remaining blank lines
#
# uniq -c
# unique words in the file and their frequency 
#
# sort -nr | 
# The output is sorted by number (frequency) with the most frequent words at the top
#
# head -15
# Show the top 15 words with the highest frequency
#
# > out.txt
# The standard output is redirected to an out.txt file


# Produce a bar chart of the frequencies of the most common words using gnuplot
gnuplot
set term png # set image format to png
set output 'word-counts.png' # name of output file
set boxwidth 1 relative
set style data histograms
set style fill solid 1.0 border -1
plot [][0:] "out.txt" using 1:xticlabels(2)
exit

xdg-open word-counts.png





















