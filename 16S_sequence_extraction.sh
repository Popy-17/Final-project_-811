#!/bin/bash
  for file in ./*.ffn; do
  extract_sequences "16S ribosomal RNA" $file > 16S_sequence.fasta
  done
