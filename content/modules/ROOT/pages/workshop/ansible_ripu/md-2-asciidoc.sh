#!/bin/bash

# Find all .md files in the current dir and one level deeper
find . -maxdepth 2 -name "*.md" | while read file; do
  
  # Determine the output filename by stripping extension and adding .adoc
  output="${file%.md}.adoc"
  
  # Run pandoc conversion
  pandoc "$file" -f markdown -t asciidoc -o "$output"
  
  echo "Converted $file -> $output"
done