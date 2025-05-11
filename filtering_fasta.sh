#!/bin/bash

   set -e

  BLOB_TABLE="blob_taxonomy.blob_out.blobDB.table.txt"
  CONTIG_LIST="list_of_contigs_to_keep_len500_cov20.txt"  
  ASSEMBLY="02_UNH_WGS001_final.fasta"
  UNIVEC_DB="UniVec"
  BLAST_OUTPUT="genome_vs_univec.6"

echo "Calculate weighted average coverage from filtered contigs"

   awk_coverage='{
       len += $2;
      cov += $2 * $5; 
      }
   END {
    if (len > 0) {
    printf "Average coverage (filtered contigs): %.2f×\n", cov / len;
     } else {
      print "No data found for contigs in list.";
    }
      }'

       grep -f "$CONTIG_LIST" "$BLOB_TABLE" | awk "$awk_coverage"

        if [ ! -f "$UNIVEC_DB" ]; then
       echo "Downloading UniVec database from NCBI"
       wget "https://ftp.ncbi.nlm.nih.gov/pub/UniVec/UniVec" -O "$UNIVEC_DB"
      else
      echo "UniVec database already exists."
        fi


  echo "Running BLASTn to screen for UniVec contamination"
      blastn -query "$ASSEMBLY" \
        -subject "$UNIVEC_DB" \
        -reward 1 -penalty -5 -gapopen 3 -gapextend 3 \
        -dust yes -soft_masking true \
        -evalue 700 -searchsp 1750000000000 \
        -outfmt 6 -out "$BLAST_OUTPUT"

          echo "BLAST output saved to $BLAST_OUTPUT"

         if [ -s "$BLAST_OUTPUT" ]; then
  echo "WARNING: Potential UniVec contamination detected:"
  cut -f1 "$BLAST_OUTPUT" | sort | uniq -c
else
  echo "No UniVec hits found. Assembly appears clean."
fi
