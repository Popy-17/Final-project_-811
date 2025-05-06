#!/bin/bash
   source activate genomics

   mkdir fastqc_trimmed_reads
   
   for file in ./*unpaired*.fastq.gz;do
   fastqc $file -o fastqc_trimmed_reads
done
  echo "fastqc is completed"
