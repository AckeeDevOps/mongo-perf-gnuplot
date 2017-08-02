#!/bin/bash

file=report-launcher.json
file2=report-launcher-our.json

for i in $( jq -r --sort-keys '.results[].name' $file);
do
  echo "parsing test - $i"
  out1=1-"$i".log
  out2=2-"$i".log
  cat "$file"  | jq --sort-keys '.results[] | select(.name=='\"$i\"') | .results["1","2","4","8","16","32","64","128"].ops_per_sec' >$out1
  cat "$file2" | jq --sort-keys '.results[] | select(.name=='\"$i\"') | .results["1","2","4","8","16","32","64","128"].ops_per_sec' >$out2
  echo -e "1\n2\n4\n8\n16\n32\n64\n128\n" >header
  paste -d","  header $out1 $out2 >"${i}.csv"
  sed -i -e '/,,/d' -e 's/,/, /g' "${i}.csv"
  rm -- "$out1" "$out2" 

  gpfile="${i}.gp"
  touch "$gpfile"
  cp template.gp "$gpfile" 
  sed -i -e "s/OUTPUT_PLACEHOLDER/${i}.png/" \
         -e "s/TITLE_PLACEHOLDER/${i}/"      \
         -e "s/FILE_PLACEHOLDER/${i}.csv/" "$gpfile"
  gnuplot "$gpfile"
  rm "$gpfile"

done

