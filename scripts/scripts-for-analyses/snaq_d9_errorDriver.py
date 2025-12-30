# run this in the directory of diamond
import os
import random

# Define arrays
diamond = "d9"
# maybe we want to create write script for each diamond
phi = "phi2"
nloci = 1000
length = [250,1000,4000]

# Iterate over the combinations
# no need to iterate over the root

for i in range(3):
    folder_path = f"snaqError/{diamond}/{phi}_{nloci}_{length[i]}"
    os.makedirs(folder_path, exist_ok=True)

    for l in range(20):  # Equivalent to Perl's (0..99)
        l_path = os.path.join(folder_path, str(l))
        os.makedirs(l_path, exist_ok=True)

        # Generate the Julia file
        julia_file = os.path.join(
            l_path, f"pn.{diamond}.{phi}.{nloci}.{length[i]}.{l}.jl"
        )
        with open("pn.true.jl.extra.template", "r") as template, open(julia_file, "w") as out_jl:
            r1 = random.randint(0, 100000000000)
            r2 = random.randint(0, 100000000000)
            r3 = random.randint(0, 100000000000)

            for line in template:
                line = line.strip()
                line = line.replace("__DIAMOND__", diamond)
                line = line.replace("__PHI__", phi)
                line = line.replace("__NLOCI__", str(nloci))
                line = line.replace("__LENGTH__", str(length[i]))
                line = line.replace("__I__", str(l))
                line = line.replace(f"#{diamond}", "")
                line = line.replace("__R1__", str(r1))
                line = line.replace("__R2__", str(r2))
                line = line.replace("__R3__", str(r3))
                if not line.startswith("#"):  # Skip commented lines
                    out_jl.write(f"{line}\n")

        # Generate the shell script
        shell_file = os.path.join(
            l_path, f"pn.{diamond}.{phi}.{nloci}.{length[i]}.{l}.sh"
        )
        with open(shell_file, "w") as out_sh:
            out_sh.write(f"""#!/bin/bash
#SBATCH --job-name={diamond}.{phi}.{nloci}.{length[i]}.{l}
#SBATCH --output={diamond}.{phi}.{nloci}.{length[i]}.{l}.log
#SBATCH --mail-user=nliu84@wisc.edu
#SBATCH --mail-type=FAIL
#SBATCH --time=24:00:00
#SBATCH --mem-per-cpu=1000M
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --partition=short
""")
            out_sh.write(f"cd {l_path}\n")
            # l_path = snaqError/{diamond}/{phi}_{nloci}_{length[i]}/l
            out_sh.write(f"julia pn.{diamond}.{phi}.{nloci}.{length[i]}.{l}.jl\n")
            out_sh.write("cd ../../../..")
        os.system(f"bash {shell_file}")
