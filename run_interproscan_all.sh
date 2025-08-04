#!/bin/bash

# Set InterProScan path if needed (edit if not in PATH)
INTERPROSCAN=./interproscan.sh

# Input files
FILES=(
  "SC5314_clean.fasta"
  "B8441_clean.fasta"
  "B12211_clean.fasta"
  "S288C_clean.fasta"  # S. cerevisiae S288C from SGD
)

# Output name prefixes
PREFIXES=(
  "SC5314"
  "B8441"
  "B11221"
  "S288C"
)

# Run InterProScan
for i in "${!FILES[@]}"; do
  input="${FILES[$i]}"
  prefix="${PREFIXES[$i]}"

  echo "🔍 Running InterProScan on $input..."
  $INTERPROSCAN -i "$input" -f tsv -o "${prefix}_interpro.tsv" --goterms --pathways --appl  Pfam,SMART,Gene3D,PANTHER,SUPERFAMILY --cpu 4

  echo "✅ Finished: ${prefix}_interpro.tsv"
  echo
done

echo "🎉 All InterProScan runs completed."
