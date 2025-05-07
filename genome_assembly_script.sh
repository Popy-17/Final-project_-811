#!/bin/bash
  source activate genomics
      outdir=spades_assembly_default
      cat ./*unpaired*.fastq.gz > combined_unpaired.fastq.gz      
      nohup spades.py -s combined_unpaired.fastq.gz -o $outdir -t 24 &

