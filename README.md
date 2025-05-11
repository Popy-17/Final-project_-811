# Final-project_-811

# Project Name: Bacterial Genome Assembly

    Group Members: Popy Rani Debi, Ramesh JayaKumar

# Background
    In this project, Illumina HiSeq 2500 paired-end sequencing data (250 bp) was utilized to generate raw sequence data. The dataset consists of four FASTQ files:
       - Two forward reads (denoted "R1")
       - Two reverse reads (denoted "R2")

    The goal of the project is to: 
      1. Familiarize with various bioinformatics tools.
      2. Work through the sequencing pipeline.
      3. Reconstruct the raw sequencing data at chromosome-level resolution.
   

# Flowchart 
                      +-------------------+
                      |   Raw Reads       |
                      +-------------------+
                               |
                               v
                      +-------------------+
                      | Read Quality      |
                      |    (FASTQC)       |
                      +-------------------+
                               |
                               v
                +----------------------------+
                | Read Trimming and Filtering|
                |     (Trimmomatic)          |
                +----------------------------+
                               |
                               v
                      +-------------------+
                      |     FASTQC        |
                      +-------------------+
                               |
                               v
                      +-------------------+
                      | Genome Assembly   |
                      |    (SPAdes)       |
                      +-------------------+
                               |
                               v
                      +-------------------+
                      |      FASTA        |
                      +-------------------+
                               |
                               v
                +----------------------------+
                |     Genome Annotation      |
                |         (PROKKA)           |
                +----------------------------+
                               |
                               v
                +----------------------------+                    
                |   Expected Gene Content    |
                |           (BUSCO)          |                    
                +----------------------------+
                               |
               +-----------------------------+
               |      Genome Contiguity      | 
               |            (QUAST)          |
               +------------------------------
                               |
                               v
               +-----------------------------+
               |      Taxonomic Assignment   |
               |           (BLAST)           | 
               +-----------------------------+
                               |
                               v
                +----------------------------+
                |     Genome Assessment      |                     +-----------------------+ 
                |                            |---------------------|  Comparative Genomics |
                |  (Genome Coverage, BWA)    |                     +-----------------------+
                +----------------------------+
                             |
                             v
                +---------------------------+
                |    Genome Filtering       |
                |     (BlobTools)           |
                +---------------------------+
                               |
                               v
                      +-------------------+
                      |  Filtered Genome  |
                      +-------------------+
                               |
                               V
                      +-------------------------+
                      |  Genome Visualization   |
                      |       (python)          |
                      |                         |
                      +-------------------------+


# Software tools

       1. FASTQC

             -- FASTQC is a standard tool used for assessing the quality of sequencing reads before proceeding with high-throughput analysis.
             -- It was used both before and after trimming to evaluate the quality of raw reads and trimmed reads.
             -- Provides summary reports with visual plots showing per-base quality scores, GC content, adapter content, duplication levels, etc.

       2. Trimmomatic

             -- Trimmomatic is a flexible and efficient tool used to trim Illumina sequencing reads, removing adapters and low-quality sequences.
             -- Detects and removes adapter contamination.
             -- Applied to raw FASTQ files to clean up the reads prior to genome assembly or alignment.               

       3. SPAdes
           
             -- A versatile genome assembler designed primarily for Illumina sequencing data.
             -- Input: Trimmed paired and unpaired FASTQ reads.
             -- Output: Assembled genome in FASTA format, suitable for downstream analysis.

       4. PROKKA
              
             -- Provides fast and efficient annotation of de novo assembled prokaryotic genomes
             -- Generates a wide range of useful files with priliminary genome_assembly file and after filtering, the final_fasta file including .gff, .gbk, .faa, .fna, .ffn, .tbl, and .sqn, which are ready for visualization, editing, or submission to public databases like GenBank.

       5. BUSCO
          
            -- Used to evaluate the completeness of genome assembiles and the annotated gene products. 
            -- It works by comparing the given sequences against the dataset from orthoDB, where universal genes present in a single copies with lineage. 
            -- It provides output in on the basis of completness (single-copy, dublicated, fragmented or missing)
 
       6. QUAST
               
            -- Used to assess the quality of genome assemblies and provides stats about how well a genome constructed from the sequence.
            -- It provides output including the total number of contigs, largest contig length with N50 and GC content.

      7. BLAST
        
            -- NCBI BLAST tool is used to compare the assembled sequence against database to find similar sequences.
            -- It provides details such as % identity, alignment length, E-value and bit score.
            -- BLASTn with the final filtered_file helps to detect the contamination of contigs against known sequences from UniVec.

      8. SAM & BAM


             -- SAM/BAM files are used to assess assembly quality by aligning sequencing reads back to the assembled contigs
             -- BAM files provide coverage information, showing how well each region of the assembly is supported by reads.
             -- BlobTools then uses BAM-based coverage along with taxonomic BLAST results to identify and filter out potential contaminants.
         
# Results
       
         N50 graph      

                    ![N50 Plot](n50_plot.png)
