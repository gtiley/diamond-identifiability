import os

diamond = ["d1","d2","d3","d8","d9"]
length = [250,1000,4000]

for d in diamond:
    for l in length:
        for i in range(20):
            with open(f"cat_{d}_{l}_{i}.sh",'w') as out:
                out.write(f"""#!/bin/bash
#SBATCH --job-name=cat
#SBATCH --output=cat.log
#SBATCH --mail-user=nliu84@wisc.edu
#SBATCH --mail-type=FAIL
#SBATCH --time=24:00:00
#SBATCH --mem-per-cpu=1000M
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --partition=short
""")
                commands = f"""
cd {d}/phi2_1000_{l}/{i}/sequences
cat *.phy.treefile > 1000_{l}.iqtrees
mv 1000_{l}.iqtrees ../trees
cd ../../../..
"""
                out.write(commands)
            os.system(f"bash cat_{d}_{l}_{i}.sh")    
