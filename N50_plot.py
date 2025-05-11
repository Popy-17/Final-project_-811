import matplotlib.pyplot as plt
from Bio import SeqIO


fasta_file = "02_UNH_WGS001_final.fasta"
contig_lengths = [len(record.seq) for record in SeqIO.parse(fasta_file, "fasta")]
contig_lengths.sort(reverse=True)


total_length = sum(contig_lengths)
cumulative = 0
n50 = 0
for length in contig_lengths:
    cumulative += length
    if cumulative >= total_length / 2:
        n50 = length
        break

plt.figure(figsize=(10, 6))
plt.bar(range(len(contig_lengths)), contig_lengths, color='skyblue')
plt.axhline(y=n50, color='red', linestyle='--', label=f'N50 = {n50:,} bp')
plt.xlabel("Contig Index (sorted)")
plt.ylabel("Contig Length (bp)")
plt.title("Contig Length Distribution and N50")
plt.legend()
plt.tight_layout()
plt.savefig("n50_plot.png", dpi=300)
