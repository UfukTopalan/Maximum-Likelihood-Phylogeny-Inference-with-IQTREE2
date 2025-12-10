#!/bin/bash
#SBATCH --job-name=ML
#SBATCH --account=project_2013890
#SBATCH --partition=small
#SBATCH --time=71:00:00
#SBATCH --ntasks=2
#SBATCH --mem-per-cpu=4000

data=$1

iqtree2 -s ${data} -m MFP -bb 1000 -alrt 1000
