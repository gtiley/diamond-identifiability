import os

# Set variables
diamond = "d3"
nloci = [250, 1000, 4000]
length = [250, 1000, 4000]

# Create the submit file name
submitfile = f"{diamond}.bpp.sh"

# Open the file for writing
with open(submitfile, 'w') as out1:
    # Write SLURM directives
    out1.write(f"#!/bin/bash\n")
    out1.write(f"#SBATCH --job-name={diamond}.bpp\n")
    out1.write(f"#SBATCH --output={diamond}.bpp.log\n")
    out1.write(f"#SBATCH --mail-user=<user_email>\n")  # Replace with actual email
    out1.write(f"#SBATCH --mail-type=FAIL\n")
    out1.write(f"#SBATCH --time=24:00:00\n")
    out1.write(f"#SBATCH --mem-per-cpu=1000M\n")
    out1.write(f"#SBATCH --nodes=1\n")
    out1.write(f"#SBATCH --ntasks=1\n")
    out1.write(f"#SBATCH --cpus-per-task=1\n")
    out1.write(f"#SBATCH --partition=short\n")
    # out1.write(f"cd {diamond}\n")

    # Loop through nloci and sequence length and create commands
    for i in range(3):
        for j in range(3):
            for p in range(1,4):
                for k in range(100):
                    ctlFile = f"{k}.ctl"
                    out1.write(f"../software/bpp/src/bpp --simulate phi{p}_{nloci[i]}_{length[j]}/{k}/{ctlFile}\n")

# Run the bash script (use 'sh' or 'bash' based on your preference)
os.system(f"bash {submitfile}")

# Exit the script
exit()