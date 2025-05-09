#!/bin/bash


for contig in $@
do
    outname=$(basename $contig)

    nohup blastn \
    -task megablast \
    -query $contig \
    -db /home/share/databases/ncbi_nt/nt \
    -outfmt '6 qseqid staxids bitscore std sscinames sskingdoms stitle' \
    -culling_limit 5 \
    -max_target_seqs 10 \
    -num_threads 48 \
    -evalue 1e-5 \
     -out $outname.vs.nt.cul5.maxt10.1e5.megablast.out &

done
