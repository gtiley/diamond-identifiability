import os
import re

nloci = ["250", "1000", "4000"]
length = ["250", "1000", "4000"]
phi = ["1", "2", "3"]

diamond = "d7"

if not os.path.exists("simulationResults"):
    os.mkdir("simulationResults")

os.mkdir(f"simulationResults/{diamond}")
for i in range(3):
    for j in range(3):
        for k in range(3):
            os.mkdir(f"simulationResults/{diamond}/phi{phi[i]}_{nloci[j]}_{length[k]}")
            for l in range(100):
                # make the directories for output
                os.mkdir(f"simulationResults/{diamond}/phi{phi[i]}_{nloci[j]}_{length[k]}/{l}")
                seqOutDir = f"simulationResults/{diamond}/phi{phi[i]}_{nloci[j]}_{length[k]}/{l}/sequences"
                os.mkdir(seqOutDir)
                treeOutDir = f"simulationResults/{diamond}/phi{phi[i]}_{nloci[j]}_{length[k]}/{l}/trees"
                os.mkdir(treeOutDir)
                
                # set variables as the files we want to read
                seq_file_path = f"{diamond}/phi{phi[i]}_{nloci[j]}_{length[k]}/{l}/{l}.seq"
                tree_file_path = f"{diamond}/phi{phi[i]}_{nloci[j]}_{length[k]}/{l}/{l}.trees"
                # process sequence
                with open(seq_file_path, 'r') as seq_file:
                    n = 0
                    for line in seq_file:
                        # Check for line with two numbers
                        match_numbers = re.match(r"(\d+)\s+(\d+)", line)
                        match_taxon_seq = re.match(r"(\S+)\^\S+\s+(.+)", line)
                        if match_numbers:
                            d1, d2 = match_numbers.groups()
                            n += 1
                            with open(f"{seqOutDir}/{n}.phy", 'w') as out_seq_file:
                                out_seq_file.write(f"{d1}  {d2}\n")
                            print(f"{seqOutDir}/{n}.phy created")
                        # Check for line with taxon and sequence    
                        elif match_taxon_seq:
                            taxon, sequence = match_taxon_seq.groups()
                            sequence = sequence.replace(" ", "")  # Remove spaces
                            with open(f"{seqOutDir}/{n}.phy", 'a') as out_seq_file:
                                out_seq_file.write(f"{taxon}  {sequence}\n")
                            print(f"{seqOutDir}/{n}.phy created")
                #process trees
                with open(tree_file_path, 'r') as tree_file, open(f"{treeOutDir}/{n}.trees", 'w') as out_tree_file:
                    for line in tree_file:
                        # Check for line with two numbers
                        match_tree = re.match(r"(.+\;)", line)
                        if match_tree:
                            tree_string = match_tree.group(1).strip()
                            # Remove "^" followed by any single word character
                            tree_string = re.sub(r"\^\w", "", tree_string)
                            out_tree_file.write(f"{tree_string}\n")
                print(f"{treeOutDir}/{n}.trees created")