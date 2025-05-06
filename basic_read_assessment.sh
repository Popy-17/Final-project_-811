#!/bin/bash
    read_length=250
    genome_size=7000000
    for item in ./*_R1_001.fastq.gz;do
    echo item:$(basename $item)
    num_reads=$(zgrep -c "^@" $item)
    echo num_reads:$num_reads
    total_bases=$(($num_reads * read_length *2))
    echo bases:$total_bases
    coverage=$(($total_bases / genome_size))
    echo coverage:$coverage
    done

