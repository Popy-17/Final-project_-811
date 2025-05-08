#!/bin/bash
  source activate genomics
  outdir=spades_assembly_default
  nohup spades.py \
  -1 ./02_S65_L001_R1_001.fastq.gz \
  -2 ./02_S65_L001_R2_001.fastq.gz \
  -1 ./03_S58_L001_R1_001.fastq.gz \
  -2 ./03_S58_L001_R2_001.fastq.gz \
  -s ./unpaired-02_S65_L001_R1_001.fastq.gz \
  -s ./unpaired-02_S65_L001_R2_001.fastq.gz \
  -s ./unpaired-03_S58_L001_R1_001.fastq.gz \
  -s ./unpaired-03_S58_L001_R2_001.fastq.gz \
  -o $outdir -t 24 &
