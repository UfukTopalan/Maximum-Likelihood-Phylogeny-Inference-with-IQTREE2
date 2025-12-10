#!/bin/bash
#SBATCH --job-name=alignment
#SBATCH --account=project_2013890
#SBATCH --partition=small
#SBATCH --time=02:00:00
#SBATCH --ntasks=2
#SBATCH --mem-per-cpu=4000

data=$1

mafft --auto ${data}.fasta > ${data}_aligned.fasta
