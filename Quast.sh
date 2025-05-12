#!/bin/bash
  source activate genomics
  outdir=quast_results
  file=*.fasta
  quast.py $file -o $outdir

