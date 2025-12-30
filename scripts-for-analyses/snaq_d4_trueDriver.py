# run this in the directory of diamond
import os
import random

# Define arrays
diamond = "d4"
# maybe we want to create write script for each diamond
phi = ["phi1","phi2","phi3"]
nloci = [250,1000,4000]
length = 1000

# Iterate over the combinations
# no need to iterate over the root

for j in range(len(phi)):
    for k in range(len(nloci)):  # Equivalent to Perl's (0..scalar(@nloci)-1)
        folder_path = f"snaq/{diamond}/{phi[j]}_{nloci[k]}_{length}"
        os.makedirs(folder_path, exist_ok=True)

        for l in range(20):  # Equivalent to Perl's (0..99)
            l_path = os.path.join(folder_path, str(l))
            os.makedirs(l_path, exist_ok=True)

            # Generate the Julia file
            julia_file = os.path.join(
                l_path, f"pn.{diamond}.{phi[j]}.{nloci[k]}.{length}.{l}.jl"
            )
            with open("pn.true.jl.template", "r") as template, open(julia_file, "w") as out_jl:
                r1 = random.randint(0, 100000000000)
                r2 = random.randint(0, 100000000000)
                r3 = random.randint(0, 100000000000)

                for line in template:
                    line = line.strip()
                    line = line.replace("__DIAMOND__", diamond)
                    line = line.replace("__PHI__", phi[j])
                    line = line.replace("__NLOCI__", str(nloci[k]))
                    line = line.replace("__LENGTH__", str(length))
                    line = line.replace("__I__", str(l))
                    line = line.replace(f"#{diamond}", "")
                    line = line.replace("__R1__", str(r1))
                    line = line.replace("__R2__", str(r2))
                    line = line.replace("__R3__", str(r3))
                    if not line.startswith("#"):  # Skip commented lines
                        out_jl.write(f"{line}\n")

            # Generate the shell script
            shell_file = os.path.join(
                l_path, f"pn.{diamond}.{phi[j]}.{nloci[k]}.{length}.{l}.sh"
            )
            with open(shell_file, "w") as out_sh:
                out_sh.write(f"""#!/bin/bash
#SBATCH --job-name={diamond}.{phi[j]}.{nloci[k]}.{length}.{l}
#SBATCH --output={diamond}.{phi[j]}.{nloci[k]}.{length}.{l}.log
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
                # l_path = snaq/{diamond}/{phi[j]}_{nloci[k]}_{length}/l
                out_sh.write(f"julia pn.{diamond}.{phi[j]}.{nloci[k]}.{length}.{l}.jl\n")
                out_sh.write("cd ../../../..")
            os.system(f"bash {shell_file}")
