#! /usr/bin/bash
qseq=$(grep -v ">" $1)
qlength=$(echo ${#qseq})
blastn -query $1 -subject $2 -task blastn-short -outfmt 6 | awk -v qlength=$qlength '$3==100.000 && $4==qlength' > $3
cat $3 | wc -l