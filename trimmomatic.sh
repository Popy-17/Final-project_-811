#!/bin/bash
    source activate genomics
      R1=$1
      R2=$2
   ADAPTERS="/home/share/anaconda/envs/genomics/share/trimmomatic-0.39-2/adapters/TruSeq3-PE.fa"
   mkdir -p trimmed-reads/
   o_for="$(basename $R1)"
   o_rev="$(basename $R2)"
   trimmomatic PE -threads 32 "$R1" "$R2" \
  "trimmed-reads/$o_for" "trimmed-reads/unpaired-$o_for" \
  "trimmed-reads/$o_rev" "trimmed-reads/unpaired-$o_rev" \
  ILLUMINACLIP:"$ADAPTERS":2:30:10:8:true \
  LEADING:3 TRAILING:3 SLIDINGWINDOW:4:10 MINLEN:36
