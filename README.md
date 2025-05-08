# Final-project_-811
# Project Name: Bacterial Genome Assembly
    Group Members: Popy Rani Debi, Ramesh JayaKumar
# Background
     - We are using Illumina Hiseq 2500, paired-end, 250 bp sequencing reads.
     - There are two files per sample, the forward and reverse reads in FASTQ format.
     - The project's goal is to reconstruct the raw sequence data at chromosome-level resolution.

# Flowchart 
     ================================================================================
                          GENOME ASSEMBLY & ANNOTATION PIPELINE
================================================================================

  ● Raw Reads (FASTQ)
     │
     ├──[FASTQC]──→ Quality Report
     │
     └──[Trimmomatic]──→ Cleaned Reads (FASTQ)
              │
              └──[SPAdes]──→ Draft Genome (FASTA)
                      │
                      ├──[QUAST]──────→ Assembly Metrics
                      │
                      ├──[BUSCO]──────→ Completeness Report
                      │
                      └──[PROKKA]────→ Annotated Genome (GBK/FASTA)
                              │
                              ├──[BLASTn]─────────────┐
                              │  (Taxonomy)           │
                              │                       ↓
                              │             Taxonomic Assignment (TSV)
                              │
                              └──[BLAST+]────────────┐
                                 (Filtering)         │
                                                     ↓
                                           [BioBricks]→ Filtered Genome (FASTA)
                                                             │
                                                             └──[Comparative Genomics]
                                                                   (Orthology/Phylogeny)

================================================================================
KEY:
● = Input File   ──→ = Process Flow   [TOOL] = Analysis Step   ( ) = File Format
================================================================================

