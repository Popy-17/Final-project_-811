# Final-project_-811

# Project Name: Bacterial Genome Assembly

    Group Members: Popy Rani Debi, Ramesh JayaKumar

# Background
    In this project, Illumina HiSeq 2500 paired-end sequencing data (250 bp) was utilized to generate raw sequence data. The dataset consists of **four FASTQ files**:
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

  
# Software tools

       1. FASTQC

             -- FASTQC is a standard tool used for assessing the quality of sequencing reads before proceeding with high-throughput analysis.
             -- It was used both before and after trimming to evaluate the quality of raw reads and trimmed reads.
             -- Provides summary reports with visual plots showing per-base quality scores, GC content, adapter content, duplication levels, etc.

       2. Trimmomatic

             -- Trimmomatic is a flexible and efficient tool used to trim Illumina sequencing reads, removing adapters and low-quality sequences.
             -- Detects and removes adapter contamination.
             -- Applied to raw FASTQ files to clean up the reads prior to genome assembly or alignment.               

       3. SPADES
           
             -- A versatile genome assembler designed primarily for Illumina sequencing data.
             -- Input: Trimmed paired and unpaired FASTQ reads.
             -- Output: Assembled genome in FASTA format, suitable for downstream analysis.
