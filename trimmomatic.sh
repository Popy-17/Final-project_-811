#!/bin/bash
source activate genomics
mkdir -p trimmed-reads

for R1 in ./*_R1_*.fastq.gz; do
    base=$(basename "$R1" _R1_001.fastq.gz) # take help from "chatgpt" during this step"
    R2="${R1/_R1_001.fastq.gz/_R2_001.fastq.gz}" 
    trim_scriptV2.sh "$R1" "$R2"
   done

