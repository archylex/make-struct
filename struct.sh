#!/bin/bash
input="tree.txt"
count=0
source_dir="test"
dist_dir=""
type="txt"
echo "*** Starting to structure files..."
while IFS= read -r line
do
  firstchar=`echo "$line" | cut -c1-1`
  if [ $firstchar = "-" ]; then
    filename=${line:1:-1}
    current_name=`printf %04d $count`
    echo "file: $filename.$type"
    cp "$source_dir/$current_name.$type" "$dist_dir/$filename.$type"
    count=$((count+1))
  else
    echo "folder: $line"
    dir=${line::-1}
    mkdir "$dir"
    dist_dir="$dir"
  fi
done < "$input"
echo "*** Done"
