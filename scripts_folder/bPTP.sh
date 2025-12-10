#!/bin/bash
#SBATCH --job-name=bPTP
#SBATCH --account=project_2013890
#SBATCH --partition=small
#SBATCH --time=71:00:00
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=8000

module load python-data

python /scratch/project_2013890/bin/PTP/bin/bPTP.py \
  -t Museum1.fasta.treefile \
  -o bPTP/Museum \
  -s 12345 \
  -i 500000 \
  -b 0.1
