diamond = "d3"
phi = "phi2"
nloci = 250
length = 250

submitfile = f"{diamond}.{phi}.{nloci}.{length}.iqtree.sh"

# Open the file for writing
with open(submitfile, 'w') as out1:
    # Write SLURM directives
    out1.write(f"#!/bin/bash\n")
    out1.write(f"#SBATCH --job-name={diamond}.iqtree\n")
    out1.write(f"#SBATCH --output={diamond}.iqtree.log\n")
    out1.write(f"#SBATCH --mail-user=<user_email>\n") 
    out1.write(f"#SBATCH --mail-type=FAIL\n")
    out1.write(f"#SBATCH --time=24:00:00\n")
    out1.write(f"#SBATCH --mem-per-cpu=1000M\n")
    out1.write(f"#SBATCH --nodes=1\n")
    out1.write(f"#SBATCH --ntasks=1\n")
    out1.write(f"#SBATCH --cpus-per-task=1\n")
    out1.write(f"#SBATCH --partition=short\n")

    for m in range(20):
        for n in range(1,nloci+1):
            out1.write(f"./../../iqtree-2.3.6-Linux-intel/bin/iqtree2 -s {phi}_{nloci}_{length}/{m}/sequences/{n}.phy -m GTR\n")