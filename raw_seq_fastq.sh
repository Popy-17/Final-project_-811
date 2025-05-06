#!/bin/bash
   source activate genomics

   mkdir fastqc_raw_reads
   
   for file in ./*.fastq.gz;do
   fastqc $file -o fastqc_raw_reads
done
  echo "fastqc is completed"
