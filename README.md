# Final-project_-811
# Project Name: Bacterial Genome Assembly
    Group Members: Popy Rani Debi, Ramesh JayaKumar
# Background
     - We are using Illumina Hiseq 2500, paired-end, 250 bp sequencing reads.
     - There are two files per sample, the forward and reverse reads in FASTQ format.
     - The project's goal is to reconstruct the raw sequence data at chromosome-level resolution.

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
                |  (Trimmomatic)             |
                +----------------------------+
                               |
                               v
                      +-------------------+
                      |     FASTQ         |
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
                      |    FASTA          |
                      +-------------------+
                               |
                               v
                +----------------------------+
                | Genome Annotation          |
                |     (PROKKA)               |
                +----------------------------+
                               |
                               v
                +----------------------------+                      +-----------------------+
                | Genome Assessment          |                      |  Comparative Genomics |
                |  (Genome Coverage, BWA)    +---------------------> |                       |
                +----------------------------+                      +-----------------------+
                               |
            +----------------------------------+
            |    Taxonomic Assignment (BLAST) |
            +----------------------------------+
                               |
                               v
                      +-------------------+
                      | Genome Contiguity  |
                      |     (QUAST)       |
                      +-------------------+
                               |
                               v
                +----------------------------+
                | Expected Gene Content      |
                |     (BUSCO)               |
                +----------------------------+
                               |
                               v
                +----------------------------+
                | Genome Filtering           |
                |     (BlobTools)            |
                +----------------------------+
                               |
                               v
                      +-------------------+
                      |    Filtered Genome|
                      +-------------------+

