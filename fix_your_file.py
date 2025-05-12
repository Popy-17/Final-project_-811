#!/home/share/anaconda/envs/genomics/bin/python3
from Bio import SeqIO
import argparse
import os
import sys

parser = argparse.ArgumentParser(description="Fixes a GenBank (GBK) file and writes corrected GBK to output.")

parser.add_argument(
    "-g", "--gbk",
    required=True,
    help="Path to the input GBK file (.gb or .gbk)",
    type=str
)

parser.add_argument(
    "-f", "--fasta",
    required=True,
    help="Path to the input fasta file",
    type=str
)

parser.add_argument(
    "-o", "--output",
    required=True,
    help="Path to the output file",
    type=str
)

args = parser.parse_args()

# Validation
if not os.path.isfile(args.fasta):
    parser.error(f"The file {args.fasta} does not exist.")

if not os.path.isfile(args.gbk):
    parser.error(f"The file {args.gbk} does not exist.")

#if not args.gbk.lower().endswith((".gb", ".gbk")):
#    parser.error("Input file must have a .gb or .gbk extension.")

# do the stuff
fsa_records = list(SeqIO.parse(args.fasta, "fasta"))
node_lengths = {}
for record in fsa_records:
    id = "_".join(record.id.split("_", 2)[:2])
    length = len(record.seq)
    node_lengths[id] = length

with open(args.gbk, "r") as f:
    lines = f.readlines()

with open(args.output, "w") as f:
    for line in lines:
        if line.startswith("LOCUS"):
            cleaned = line.strip().split()
            node = cleaned[1]
            name = "_".join(node.split("_", 2)[:2])
            length = node_lengths[name]
            new_locus_line = f"LOCUS       {name}             {length} bp    DNA     linear 11-MAY-2025\n"
            f.write(new_locus_line)
        else:
            f.write(line)
