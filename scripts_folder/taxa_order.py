import sys

input_file = sys.argv[1]
output_file = sys.argv[2]

with open(input_file) as f:
    lines = f.readlines()

# Extract taxa order
taxa_line = [l for l in lines if l.startswith("#taxaorder:")][0]
taxa = taxa_line.strip().split(":", 1)[1].split(",")

# Find the last partition line
for i in range(len(lines)-1, -1, -1):
    if not lines[i].startswith("#"):
        last_partition = list(map(int, lines[i].strip().split(",")))
        break

# Combine taxa with their cluster assignments
partition_dict = {}
for name, cluster_id in zip(taxa, last_partition):
    partition_dict.setdefault(cluster_id, []).append(name)

# Write to output file
with open(output_file, "w") as out:
    out.write(f"Total species (OTUs) in final partition: {len(partition_dict)}\n\n")
    for cluster, members in sorted(partition_dict.items()):
        out.write(f"Cluster {cluster} ({len(members)} specimens):\n")
        for member in members:
            out.write(f"  {member}\n")
        out.write("\n")
